$(document).ready(function () {
    configurarUI();
});

var tabla;

function configurarUI() {
    cargarGrid();
    $('#btnAgregar').click(onInsert);
    $('#btnCerrar').click(cerrarModal);
    $('#modalFrmView').on('hidden.bs.modal', function (e) {
        $('#txtNombre').val(null);
        $('#txtUsuario').val(null);
        $('#txtEmail').val(null);
        $('#txtTipo').val(null);
        $('#txtActivo').val(null);
    })
}

function cerrarModal() {
    $('#modalFrmView').modal('hide');
    $('#txtNombre').val(null);
    $('#txtUsuario').val(null);
    $('#txtEmail').val(null);
    $('#txtTipo').val(null);
    $('#txtActivo').val(null);
}

function cargarGrid() {
    bloquearPantalla();
    WEB.ws.WS_ET_Usuario.getAll(cargarInfo, onError);
}

function cargarInfo(result) {
    if (result == "NO_SESSION") { cerrarSesion(); return; }

    var dataSet = JSON.parse(result);

    try {
        var idTabla = "#tablaUsuarios";
        tabla = $(idTabla).dataTable({
            data: dataSet,
            columns:
                [
                    {
                        title: 'Nombre', data: null, render: function (data, type, row) {
                            return data.Nombre + ' ' + data.Apellido1 + ' ' + data.Apellido2;
                        }
                    },
                    { title: 'Usuario', data: 'Username', render: $.fn.dataTable.render.text() },
                    { title: 'Rol', data: 'Tipo', render: $.fn.dataTable.render.text() },
                    {
                        title: 'Activo', data: null, render: function (data, type, row) {
                            if (data.Estado == 1) { return 'Si'; }
                            else { return 'No'; }
                        }
                    },
                    {
                        title: '', data: null, render: function (data, type, row) {
                            return '<div class="row justify-content-center">' +
                                '<button type="button" class="btn btn-outline-success" onclick="onRowCommand(\'view\', ' + data.ID + ')" title="Ver información"><i class="fa fa-info-circle fa-lg" aria-hidden="true"></i></button>' +
                                '<button type="button" class="btn btn-outline-primary" onclick="onRowCommand(\'update\',' + data.ID + ')" title="Editar"><i class="fa fa-pencil-alt fa-lg" aria-hidden="true"></i></button>' +
                                '<button type="button" class="btn btn-outline-danger" onclick="onRowCommand(\'delete\',\'' + data.ID + '\',\'' + data.Username + '\',\'' + data.Tipo + '\')" title="Eliminar"><i class="fa fa-trash fa-lg" aria-hidden="true"></i></button>' +
                                '</div>';
                        }
                    }
                ],
            fixedColumns: true,
            "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                $('td:eq(3)', nRow).addClass(aData.Estado == 1 ? 'table-success' : 'table-danger');
            },
            "fnInitComplete": function (oSettings, json) {
                /*Configuración de los filtros individuales*/
                var fila = $(this).children("thead").children("tr").clone();
                var pie = $("<tfoot/>").append(fila).css("display", "table-header-group");
                $(this).children("thead").after(pie);
                $(fila).children().each(function () {
                    $(this).prop("class", null);
                });

                $(fila).children("th").each(function () {
                    var title = $(this).text().toLowerCase();
                    $(this).html('<input type="text" class="filtro form-control input-sm" style="width:90%;" placeholder="Buscar ' + title + '" />');
                });
                //Quitar filtro en la ultima columna (la de operaciones)
                $(fila).children("th:last").html('');

                //Activa el filtrado
                tabla.api().columns().eq(0).each(function (colIdx) {
                    $(idTabla + ' tfoot th:eq(' + colIdx + ') input').on('keyup change', function () {
                        tabla.api().column(colIdx).search(this.value).draw();
                    });

                    $('input', tabla.api().column(colIdx).footer()).on('click', function (e) {
                        e.stopPropagation();
                    });
                });
            },
            'aoColumnDefs': [{ 'bSortable': false, 'aTargets': [4] }],
            'order': [[0, 'asc']],
            'language': { 'url': 'js/datatables/jquery.dataTables_i18n.spanish.json' },
            'responsive': true,
            "destroy": true
        });

        $('#tablaUsuarios thead').addClass('bg-turquoise text-white');
    } catch (e) {

    } finally {
        desbloquearPantalla();
    }
}

function onRowCommand(command, id, info, tipo) {
    if (command == 'view') {
        onView(id);
    } else if (command == 'update') {
        onUpdate(id);
    } else if (command == 'delete') {
        if (usuario == info && rol == tipo) {
            jError('El usuario con sesión actual no puede ser eliminado por sí mismo.', $('#titulo').text());
        } else {
            jConfirm('El usuario <b>' + info + '</b> será eliminado.<br />¿Deseas continuar?', $('#titulo').text(), function (result) {
                if (result) {
                    onDelete(id);
                }
            });
        }
    }
}

function onError(result) {
    if (result == "NO_SESSION") { cerrarSesion(); return; }

    desbloquearPantalla();
    jError('Error: No se ha podido realizar la operación.', $('#titulo').text());
}

function onView(id) {
    WEB.ws.WS_ET_Usuario.getOne(id, onViewSuccess, onError);
}

function onInsert() {
    bloquearPantalla();
    $('#contenedor').load('FrmUsuario.aspx', null, function () { desbloquearPantalla(); });
}

function onUpdate(id) {
    bloquearPantalla();
    $('#contenedor').load('FrmUsuario.aspx', { "id": id }, function () { desbloquearPantalla(); });
}

function onDelete(id) {
    WEB.ws.WS_ET_Usuario.delete(id, onDeleteSuccess, onError);
}

function onViewSuccess(result) {
    if (result == "NO_SESSION") { cerrarSesion(); return; }

    if (result) {
        var objUsuario = JSON.parse(result);
        $('#modalFrmView').modal({
            show: true,
            keyboard: false,
            backdrop: 'static'
        });

        $('#txtNombre').val(objUsuario.Nombre + " " + objUsuario.Apellido1 + " " + objUsuario.Apellido2);
        $('#txtUsuario').val(objUsuario.Username);
        $('#txtEmail').val(objUsuario.Email);
        $('#txtTipo').val(objUsuario.Tipo);
        $('#txtActivo').val(function () {
            if (objUsuario.Estado == 1) {
                return 'Si'
            } else {
                return 'No'
            }
        });
    }
}

function onDeleteSuccess(result) {
    if (result == "NO_SESSION") { cerrarSesion(); return; }

    if (eval(result) == true) {
        jSuccess('El usuario se ha eliminado correctamente.', $('#titulo').text(), function () {
            recargarGrid();
        });
    } else {
        jError('Error: No se ha podido realizar la operación.<br>El usuario con sesión actual no puede ser eliminado por sí mismo <br>o puede tener un grupo asignado.', $('#titulo').text());
    }
}

function recargarGrid() {
    bloquearPantalla();
    tabla.fnClearTable();
    WEB.ws.WS_ET_Usuario.getAll(OnSuccessCallReload, onError);
}

function OnSuccessCallReload(result) {
    if (result == "NO_SESSION") { cerrarSesion(); return; }

    try {
        tabla.fnAddData(JSON.parse(result));
    } catch (e) {
        
    } finally {
        desbloquearPantalla();
    }   
}