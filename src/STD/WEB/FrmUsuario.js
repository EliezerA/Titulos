$(document).ready(function () {
    configurarUI();
});

function configurarUI() {
    cargarDatos();
    $('#btnVolver').click(volverPagina);
    $('#btnAceptar').click(aceptarFrm);
    $('#collapsePass').collapse({
        toggle: true
    });
    $('#collapsePass').on('hidden.bs.collapse', function () {
        $('#txtPassword').val(null);
        $('#txtPassword2').val(null);
    });
    $("input, select, textarea").change(function () {
        modified = true;
    });
}

function volverPagina() {
    if (modified) {
        jConfirm('Puede haber cambios sin guardar, ¿Desea cambiar de la página actual de todas formas?', null, function (result) {
            if (result) {
                bloquearPantalla();
                modified = false;
                $('#contenedor').load('FrmListaUsuarios.aspx', null, function () { desbloquearPantalla(); });
            }
        });
    } else {
        bloquearPantalla();
        modified = false;
        $('#contenedor').load('FrmListaUsuarios.aspx', null, function () { desbloquearPantalla(); });
    }
}

function cargarDatos() {
    if (id != 0) {
        bloquearPantalla();
        WEB.ws.WS_ET_Usuario.getOne(id, llenarCampos, onError);
    }
}

function llenarCampos(result) {
    if (result == "NO_SESSION") { cerrarSesion(); return; }

    if (result) {
        var objUsuario = JSON.parse(result);
        $('#txtNombre').val(objUsuario.Nombre);
        $('#txtApellido1').val(objUsuario.Apellido1);
        $('#txtApellido2').val(objUsuario.Apellido2);
        $('#txtUsuario').val(objUsuario.Username);
        $('#txtEmail').val(objUsuario.Email);
        $('#cboTipo').val(objUsuario.Tipo);
        if (objUsuario.Estado == 0) {
            $('#chkActivo').removeAttr('checked');
        }
    }

    desbloquearPantalla();
}

function aceptarFrm() {
    if (validar()) {
        bloquearPantalla();
        var objUsuario = varciarControlesAModelo();
        var jsonUsuario = JSON.stringify(objUsuario);

        if (id != 0) {
            WEB.ws.WS_ET_Usuario.update(jsonUsuario, onUpdateSuccess, onError);
        } else if (id == 0) {
            WEB.ws.WS_ET_Usuario.insert(jsonUsuario, onSaveSuccess, onError);
        }
    }
}

function varciarControlesAModelo() {
    var objUsuario = new Object();

    if (id != 0) { objUsuario.ID = id; }
    objUsuario.Nombre = $('#txtNombre').val().trim();
    objUsuario.Apellido1 = $('#txtApellido1').val().trim();
    objUsuario.Apellido2 = $('#txtApellido2').val().trim();
    objUsuario.Username = $('#txtUsuario').val().trim();

    if ($('#chkPassword:checked').val() || id == 0) {
        objUsuario.Password = $('#txtPassword').val().trim();
    } else {
        objUsuario.Password = null;
    }

    objUsuario.Email = $('#txtEmail').val().trim();
    objUsuario.Tipo = $('#cboTipo').val().trim();

    if (id != 0) {
        if ($('#chkActivo:checked').val()) {
            objUsuario.Estado = 1;
        } else {
            objUsuario.Estado = 0;
        }
    }

    return objUsuario;
}

function onError(result) {
    if (result == "NO_SESSION") { cerrarSesion(); return; }

    desbloquearPantalla();
    jError('Error: No se ha podido realizar la operación', $('#titulo').text());
}

function onUpdateSuccess(result) {
    if (result == "NO_SESSION") { cerrarSesion(); return; }

    desbloquearPantalla();
    if (eval(result) == true) {
        jSuccess('El usuario se ha actualizado correctamente.', $('#titulo').text(), function () {
            bloquearPantalla();
            modified = false;
            $("#contenedor").load("FrmListaUsuarios.aspx", null, function () { desbloquearPantalla(); });
        });
    } else {
        jError('Error: No se ha podido realizar la operación. Ya existe un usuario con el mismo rol.', $('#titulo').text());
    }
}

function onSaveSuccess(result) {
    if (result == "NO_SESSION") { cerrarSesion(); return; }

    desbloquearPantalla();
    if (eval(result) == true) {
        jSuccess('El usuario se ha agregado correctamente.', $('#titulo').text(), function () {
            bloquearPantalla();
            modified = false;
            $("#contenedor").load("FrmListaUsuarios.aspx", null, function () { desbloquearPantalla(); });
        });
    } else {
        jError('Error: No se ha podido realizar la operación. Ya existe un usuario con el mismo rol.', $('#titulo').text());
    }
}

function validar() {
    valReset();

    var novalidos = 0;
    try {
        novalidos += valLong('#txtNombre', 1, 50);
        novalidos += valLong('#txtApellido1', 1, 50);
        novalidos += valLong('#txtApellido2', 0, 50);
        novalidos += valLong('#txtUsuario', 5, 50);

        if ($('#chkPassword:checked').val() || id == 0) {
            novalidos += valLong('#txtPassword', 5, 50);
            novalidos += valLong('#txtPassword2', 5, 50);
        } 
        
        novalidos += valLong('#txtEmail', 5, 100);

        $('select').each(
            function () {
                if ($(this).prop('selectedIndex') == 0) {
                    $(this).addClass('is-invalid');
                    novalidos++;
                } else {
                    $(this).addClass('is-valid');
                }
            }
        );

        if (novalidos > 0) {
            mostrarAlerta('Resuelva los inconvenientes para continuar.', 'alert-danger', 8000);
            $($(".form-control.is-invalid")[0]).focus();
            return false;
        }
    } catch (e) {
        return 0;
    }

    if ($('#chkPassword:checked').val() || id == 0) {
        return validarPassword();
    } else {
        return true;
    }
    
}

function validarPassword() {
    $('#txtPassword').removeClass('is-valid').removeClass('is-invalid');
    $('#txtPassword2').removeClass('is-valid').removeClass('is-invalid');

    if ($('#txtPassword').val().trim() == $('#txtPassword2').val().trim()) {
        $('#txtPassword').addClass('is-valid');
        $('#txtPassword2').addClass('is-valid');
        return true;
    } else {
        $('#txtPassword').addClass('is-invalid');
        $('#txtPassword2').addClass('is-invalid');
        mostrarAlerta('Las contraseñas deben de coincidir.', 'alert-warning', 8000);
        return false;
    }
}

function mostrarAlerta(message, tipo, milimetros) {
    $('.alert').alert('close');
    $('#alertas').html('<div class="alert ' + tipo + '" role="alert">' + message + '</div>');
    desvanecerAlertas(milimetros);
}

function desvanecerAlertas(milisegundos) {
    setTimeout(function () {
        $(".alert").fadeOut(1000);
    }, milisegundos);
}