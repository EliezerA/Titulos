<%@ Page Title="" Language="C#" MasterPageFile="~/MPBasica.Master" AutoEventWireup="true" CodeBehind="modificarLote.aspx.cs" Inherits="WEB.Formulario_web14" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphEstilosBasica" runat="server">
    <link href="css/datatables/jquery.datatables.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitulo" runat="server">
    <div class="container mt-3">
        <h1 id="titulo" class="font-weight-light text-center">Consultar lote de títulos electrónicos</h1>
        <hr />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenidoBasica" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-5">
                <div class="form-inline">
                    <label class="col-sm-6 d-inline text-right" for="txtID">ID</label>
                    <span id="txtID" class="col-sm-4">1</span>
                </div>
                <div class="form-inline">
                    <label class="col-sm-6 d-inline text-right" for="txtFechaC">Fecha de creación</label>
                    <span id="txtFechaC" class="col-sm-6">2017/06/30</span>
                </div>
                <div class="form-inline">
                    <label class="col-sm-6 d-inline text-right" for="txtEstatus">Estatus</label>
                    <span id="txtEstatus" class="col-sm-6">Enviado</span>
                </div>
                <div class="form-inline">
                    <label class="col-sm-6 d-inline text-right" for="sel1">Responsable de firma</label>
                    <select class="form-control col-sm-6" id="sel1" name="sel1">
                        <option>Eliezer ABonce MArtinez</option>
                        <option>aaddssddaa sajnsdsadkajs saldksalksdd</option>
                    </select>
                </div>
            </div>
            <div class="col-sm-5">
                <div class="form-inline">
                    <label class="col-sm-6 d-inline text-right" for="txtNumFolio">Numero de folio</label>
                    <span id="txtNumFolio" class="col-sm-6">569</span>
                </div>
                <div class="form-inline">
                    <label class="col-sm-6 d-inline text-right" for="txtFechaE">Fecha de envío</label>
                    <span id="txtFechaE" class="col-sm-6">2019/15/06</span>
                </div>

            </div>
            <div class="col-sm-2">
                <button id="btnVolver" type="button" class="btn btn-volver d-block col-sm-12"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i>  Volver</button>
            </div>
        </div>
    </div>
    <div class="container">
        <table id="tabla1" class="display" style="width: 100%">
        </table>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="cancelarModal" tabindex="-1" role="dialog" aria-labelledby="cancelarModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #f3caca; color: #524444">
                    <h5 class="modal-title" id="exampleModalLabel">Cancelación de título</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-7">
                                <div class="form-inline">
                                    <label class="col-sm-4 d-inline" for="txtNoControlM">NoControl</label>
                                    <span id="txtNoControlM" class="col-sm-8">i14120221</span>
                                </div>
                                <div class="form-inline">
                                    <label class="col-sm-4 d-inline" for="txtAlumnoM">Alumno</label>
                                    <span id="txtAlumnoM" class="col-sm-8">Eliezer ABonce MArtinez</span>
                                </div>
                                <div class="form-inline">
                                    <label class="col-sm-4 d-inline" for="txtCarreraM">Carrera</label>
                                    <span id="txtCarreraM" class="col-sm-8">Ing. Informatica</span>
                                </div>
                                <div class="form-inline">
                                    <label class="col-sm-4 d-inline" for="txtEgresoM">Egresó</label>
                                    <span id="txtEgresoM" class="col-sm-8">AGO-DIC 2019</span>
                                </div>
                            </div>
                            <div class="col-sm-5">
                                <div class="form-inline">
                                    <label class="col-sm-4 d-inline" for="txtFolioControlM">Folio Control</label>
                                    <span id="txtFolioControlM" class="col-sm-8">JGJHG5765763</span>
                                </div>
                                <div class="form-inline">
                                    <label class="col-sm-4 d-inline" for="txtPromedioM">Promedio</label>
                                    <span id="txtPromedioM" class="col-sm-8">89</span>
                                </div>

                            </div>

                        </div>
                        <div class="row">
                            <label class="col-sm-12" for="selMotivoM">Motivo de cancelación</label>
                            <select class="form-control col-sm-12" id="selMotivoM" name="selMotivoM">
                                <option>CAUSE IMPUTABLE AL PROFESIONISTA</option>
                                <option>.............</option>
                            </select>
                        </div>
                        <div class="row">
                            <label class="col-sm-12">¿Está seguro que desea continuar con la cancelacion del trámite de este título?</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="container-fluid text-right">
                        <div class="row d-inline">
                            <button type="button" class="btn col-sm-3 btn-volver" data-dismiss="modal" >No</button>
                            <button type="button" class="btn col-sm-3" style="background-color: #ff6666; color: white">Si, continuar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphScriptsBasica" runat="server">
    <script src="js/datatables/datatables.min.js"></script>
    <script type="text/javascript">
        //datos de ejemplo
        var dataSet = [
            ["S14120221", "Eliezer ABonce mArtinez", "Ing. Sistema Comp.", "2022", "ENE-JUN", 85, "SLKLKCJLKsD", "Satisfactorio", ""],
            ["I14202210", "Perez Perez Juan", "Ing. Gastronosma", "2019", "ENE-JUN", 98, "AGFSG762876287", "Cancelado", ""],
            ["w12012123", "Chave Chavez", "Ing. Informatica", "2020", "AGO-DIC", 98, "HJGJ57657656757", "Archivo invalido", ""]
        ];
        $(document).ready(function () {
            $('#tabla1').DataTable({
                data: dataSet,
                columns: [
                    { title: "NoControl" },
                    { title: "Alumno" },
                    { title: "Carrera" },
                    { title: "Año Egreso" },
                    { title: "Periodo Egreso" },
                    { title: "Promedio" },
                    { title: "Folio Control" },
                    { title: "Estatus" },
                    { title: " " },
                ],
                'columnDefs': [
                {
                    'targets': [8],
                    'orderable': false
                }],
                "scrollCollapse": true,
                "paging": false,
                "order": [[0, "asc"]],
                "info": false,
                "searching": false,
                "createdRow": function (row, data, dataIndex) {
                    if (data[7] == 'Archivo invalido') {
                        $(row).find('td:eq(7)').css('color', '#6f612b');
                        $(row).find('td:eq(7)').css('background-color', '#fff1bb');
                        $(row).find('td:eq(8)').html(
       '<button type="button" class="btn btn-cancelar" data-toggle="modal" data-target="#cancelarModal"><i class="fa fa-times-circle fa-lg" aria-hidden="true"></i></button>\
        <button type="button" class="btn btn-eliminar"><i class="fa fa-trash fa-lg" aria-hidden="true"></i></button>\
                            ');
                    } else if (data[7] == 'Cancelado') {
                        $(row).find('td:eq(7)').css('color', '#694040');
                        $(row).find('td:eq(7)').css('background-color', '#ffd6d6');
                        $(row).find('td:eq(8)').html(
       '<button type="button" class="btn btn-eliminar"><i class="fa fa-trash fa-lg" aria-hidden="true"></i></button>\
                            ');
                    } else {
                        $(row).find('td:eq(8)').html(
      '<button type="button" class="btn btn-cancelar" data-toggle="modal" data-target="#cancelarModal"><i class="fa fa-times-circle fa-lg" aria-hidden="true"></i></button>\
       <button type="button" class="btn btn-eliminar"><i class="fa fa-trash fa-lg" aria-hidden="true"></i></button>\
                            ');
                    }

                }
            });

            $("#btnVolver").on("click", function (e) {
                location.replace("gestionTitulos.aspx");

            });
            if ($('#txtEstatus').text() == 'Procesado') {
                $('#txtEstatus').css('color', '#2f3e3a');
                $('#txtEstatus').css('background-color', '#c0ffed');
            } else if ($('#txtEstatus').text() == 'Enviado') {
                $('#txtEstatus').css('color', '#4d8596');
                $('#txtEstatus').css('background-color', '#b6eeff');
            }
        });
    </script>
</asp:Content>
