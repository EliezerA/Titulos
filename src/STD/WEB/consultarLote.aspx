<%@ Page Title="" Language="C#" MasterPageFile="~/MPBasica.Master" AutoEventWireup="true" CodeBehind="consultarLote.aspx.cs" Inherits="WEB.Formulario_web13" %>

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
                    <span id="txtEstatus" class="col-sm-6">Procesado</span>
                </div>
                <div class="form-inline">
                    <label class="col-sm-6 d-inline text-right" for="txtRespon">Responsable de firma</label>
                    <span id="txtRespon" class="col-sm-6">Eliezer Abonce MArtinez</span>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-inline">
                    <label class="col-sm-6 d-inline text-right" for="txtNumFolio">Numero de folio</label>
                    <span id="txtNumFolio" class="col-sm-6">569</span>
                </div>
                <div class="form-inline">
                    <label class="col-sm-6 d-inline text-right" for="txtFechaE">Fecha de envío</label>
                    <span id="txtFechaE" class="col-sm-6">2019/15/06</span>
                </div>

            </div>
            <div class="col-sm-3">
                <button id="btnVolver" type="button" class="btn btn-volver d-block col-sm-8"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i>  Volver</button>
            </div>
        </div>
    </div>
    <div class="container">
        <table id="tabla1" class="display" style="width: 100%">
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphScriptsBasica" runat="server">
    <script src="js/datatables/datatables.min.js"></script>
    <script type="text/javascript">
        //datos de ejemplo
        var dataSet = [
            ["S14120221", "Eliezer ABonce mArtinez", "Ing. Sistema Comp.", "2022", "ENE-JUN", 85, "SLKLKCJLKsD", "Satisfactorio", ""],
            ["I14202210", "Perez Perez Juan", "Ing. Gastronosma", "2019", "ENE-JUN", 98, "AGFSG762876287", "Satisfactorio", ""],
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
                        $(row).find('td:eq(7)').css('color', '#694040');
                        $(row).find('td:eq(7)').css('background-color', '#ffd6d6');
                    }
                    $(row).find('td:eq(8)').html(
                           '<button type="button" class="btn btn-descargar"><i class="fa fa-file fa-lg" aria-hidden="true"></i></button>\
                            ');
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
            $('button[class*="descargar"]').on("click", function (e) {
                location.replace("verTitulo.aspx");
            });
        });
    </script>
</asp:Content>
