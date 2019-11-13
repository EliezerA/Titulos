<%@ Page Title="" Language="C#" MasterPageFile="~/MPBasica.Master" AutoEventWireup="true" CodeBehind="gestionTitulos.aspx.cs" Inherits="WEB.Formulario_web11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphEstilosBasica" runat="server">
    <link href="css/datatables/jquery.datatables.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitulo" runat="server">
    <div class="container mt-3">
        <h1 id="titulo" class="font-weight-light text-center">Gestión de lotes de títulos electrónicos</h1>
        <hr />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenidoBasica" runat="server">
    <div class="container d-flex justify-content-around">
        <button id="btnCrear" type="button" class="btn btn-primario col-sm-2"><i class="fa fa-plus-circle fa-lg" aria-hidden="true"></i>  Crear lote</button>
        <button id="btnVerificar" type="button" class="btn btn-descargar col-sm-3"><i class="fa fa-search fa-lg" aria-hidden="true"></i>  Verificar estatus alumno</button>

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
            ["1", " ", "2019/07/06", " ", "2020", "Pendiente", ""],
            ["2", "1000", "2019/02/06", "2019/07/06", "2019", "Enviado", ""],
            ["3", "56", "2019/07/07", "2019/07/06", "2020", "Procesado", ""],
        ];
        $(document).ready(function () {
            $('#tabla1').DataTable({
                data: dataSet,
                columns: [
                    { title: "ID" },
                    { title: "Folio" },
                    { title: "Archivos" },
                    { title: "Fecha Creacion" },
                    { title: "Fecha Envio" },
                    { title: "Estatus" },
                    { title: " " }
                ],
                "scrollCollapse": true,
                "paging": false,
                "order": [[1, "asc"]],
                "info": false,
                "searching": false,
                'columnDefs': [
                    { 
                        'targets': [6], 
                        'orderable': false
                    }],
                "createdRow": function (row, data, dataIndex) {
                    if (data[5] == 'Enviado') {
                        $(row).find('td:eq(5)').css('color', '#4d8596');
                        $(row).find('td:eq(5)').css('background-color', '#b6eeff');
                        $(row).find('td:eq(6)').html(
                           '<button type="button" class="btn btn-consultar"><i class="fa fa-folder fa-lg" aria-hidden="true"></i></button>\
                            <button type="button" class="btn btn-modificar"><i class="fa fa-pen fa-lg" aria-hidden="true"></i></button>\
                            <button type="button" class="btn btn-recargar"><i class="fa fa-sync fa-lg" aria-hidden="true"></i></button>\
                            <button type="button" class="btn btn-descargar"><i class="fa fa-download fa-lg" aria-hidden="true"></i></button>'
                            );
                    } else if (data[5] == 'Procesado') {
                        $(row).find('td:eq(5)').css('color', '#266553');
                        $(row).find('td:eq(5)').css('background-color', '#bdfcea');
                        $(row).find('td:eq(6)').html(
                            '<button type="button" class="btn btn-consultar"><i class="fa fa-folder fa-lg" aria-hidden="true"></i></button>\
                             <button type="button" class="btn btn-descargar"><i class="fa fa-download fa-lg" aria-hidden="true"></i></button>'
                            );
                    } else if (data[5] == 'Pendiente') {
                        $(row).find('td:eq(6)').html(
                           '<button type="button" class="btn btn-consultar"><i class="fa fa-folder fa-lg" aria-hidden="true"></i></button>\
                            <button type="button" class="btn btn-modificar"><i class="fa fa-pen fa-lg" aria-hidden="true"></i></button>\
                            <button type="button" class="btn btn-descargar"><i class="fa fa-download fa-lg" aria-hidden="true"></i></button>\
                            <button type="button" class="btn btn-eliminar"><i class="fa fa-trash fa-lg" aria-hidden="true"></i></button>\
                            <button type="button" class="btn btn-primario" ><i class="fa fa-arrow-alt-circle-up fa-lg" aria-hidden="true"></i></button>\
                            '
                            );
                    }
                }
            });

            $("#btnCrear").on("click", function (e) {
                location.replace("generarTitulos.aspx");
            });
            $('button[class*="consultar"]').on("click", function (e) {
                location.replace("consultarLote.aspx");
            });
            $('button[class*="modificar"]').on("click", function (e) {
                location.replace("modificarLote.aspx");
            });
            $('td button[class*="btn-primario"]').on("click", function (e) {
                location.replace("enviarLote.aspx");
            });
        });
    </script>
</asp:Content>
