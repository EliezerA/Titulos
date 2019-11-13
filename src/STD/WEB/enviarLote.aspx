<%@ Page Title="" Language="C#" MasterPageFile="~/MPBasica.Master" AutoEventWireup="true" CodeBehind="enviarLote.aspx.cs" Inherits="WEB.Formulario_web12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphEstilosBasica" runat="server">
    <link href="css/datatables/jquery.datatables.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitulo" runat="server">
    <div class="container mt-3">
        <h1 id="titulo" class="font-weight-light text-center">Confirmar envío de lotes de títulos electrónicos</h1>
        <hr />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenidoBasica" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-7">
                <div class="form-inline">
                    <label class="col-sm-4 d-inline text-right" for="txtID">ID</label>
                    <span id="txtID" class="col-sm-4">1</span>
                </div>
                <div class="form-inline">
                    <label class="col-sm-4 d-inline text-right" for="txtFechaC">Fecha de creación</label>
                    <span id="txtFechaC" class="col-sm-8">2017/06/30</span>
                </div>
                <div class="form-inline">
                    <label class="col-sm-4 d-inline text-right" for="sel1">Responsable de firma</label>
                    <select class="form-control col-sm-5" id="sel1" name="sel1">
                        <option>Eliezer ABonce MArtinez</option>
                        <option>aaddssddaa sajnsdsadkajs saldksalksdd</option>
                    </select>
                </div>
            </div>
            <div class="col-sm-5">
                <button id="btnEnviar" type="button" class="btn btn-primario d-block col-sm-6"><i class="fa fa-arrow-alt-circle-up fa-lg" aria-hidden="true"></i>  Enviar lote</button>
                <button id="btnVolver" type="button" class="btn btn-volver d-block col-sm-6"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i>  Volver</button>
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
            ["S14120221", "Eliezer ABonce mArtinez", "Ing. Sistema Comp.", "2022", "ENE-JUN", 85],
            ["I14202210", "Perez Perez Juan", "Ing. Gastronosma", "2019", "ENE-JUN", 98],
            ["w12012123", "Chave Chavez", "Ing. Informatica", "2020", "AGO-DIC", 98]
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
                    { title: "Promedio" }
                ],
                "scrollCollapse": true,
                "paging": false,
                "order": [[0, "asc"]],
                "info": false,
                "searching": false
            });
            $("#btnVolver").on("click", function (e) {
                location.replace("gestionTitulos.aspx");

            });
            $("#btnEnviar").on("click", function (e) {
                location.replace("gestionTitulos.aspx");

            });
        });
    </script>
</asp:Content>
