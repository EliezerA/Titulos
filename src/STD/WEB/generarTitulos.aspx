<%@ Page Title="" Language="C#" MasterPageFile="~/MPBasica.Master" AutoEventWireup="true" CodeBehind="generarTitulos.aspx.cs" Inherits="WEB.Formulario_web1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphEstilosBasica" runat="server">
    <link href="css/datatables/jquery.datatables.min.css" rel="stylesheet" />
    <link href="css/datatables/datatables.checkboxes.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitulo" runat="server">
    <div class="container mt-3">
        <h1 id="titulo" class="font-weight-light text-center">Generar títulos electrónicos</h1>
        <hr />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenidoBasica" runat="server">
    <div class="container">
    <div class="row">
        <div class="col-sm-6">
            <button id="btnMarcarT" type="button" class="btn col-sm-5 d-block btn-recargar"><i class="fa fa-check-square fa-lg i-white" aria-hidden="true"></i> Marcar todos</button>
            <button id="btnDesMarcarT" type="button" class="btn col-sm-5 d-block btn-cancelar"><i class="fa fa-square fa-lg i-white" aria-hidden="true"></i> Desmarcar todos</button>
        </div>
        <div class="col-sm-6">
            <button id="btnGenerar" type="button" class="btn btn-primario col-sm-5 d-block"><i class="fa fa-check-circle fa-lg i-black" aria-hidden="true"></i> Generar</button>
        </div>
    </div>
        </div>
    <div class="container">
        <table id="tabla1" class="display" style="width: 100%">
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphScriptsBasica" runat="server">
    <script src="js/datatables/select.datatables.min.js"></script>
    <script src="js/datatables/dataTables.checkboxes.min.js"></script>
    <script type="text/javascript">
        //datos de ejemplo
        var dataSet = [
            ["", "I14120221", "Eliezer Abonce Martinez", "Ing. Informatica", "2020", "ENE-JUN", "80", ""],
            ["", "I14120222", "Aliezer Ebonce Fartinez", "Ing. Informatica", "2020", "ENE-JUN", "80", ""],
            ["", "I14120223", "Fliezer Tbonce Lartinez", "Ing. Informatica", "2020", "ENE-JUN", "80", ""],
        ];
        $(document).ready(function () {
            var checkbox = '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"/><i class="far fa-square fa-lg i-white i-checkbox" aria-hidden="true"/></div>';
            let tabla1 =  $('#tabla1').DataTable({
                data: dataSet,
                columns: [
                    { title: " " },
                    { title: "No. Control" },
                    { title: "Alumno" },
                    { title: "Carrera" },
                    { title: "Ano Egreso" },
                    { title: "Periodo Egreso" },
                    { title: "Promedio" },
                    { title: "Estatus" }
                ],
                'columnDefs': [
                   {
                       'targets': 0,
                       'checkboxes': {
                           'selectRow': true,
                           'selectAllRender': checkbox,
                           'selectCallback': function (nodes, selected) {
                               if (selected) {
                                   $('i', nodes).addClass("fa fa-check-square").removeClass("far fa-square");
                               } else {
                                   $('i', nodes).addClass("far fa-square").removeClass("fa fa-check-square");
                               }
                           },
                           'selectAllCallback': function (nodes, selected) {
                               if (selected) {
                                   $('i', nodes).addClass("fa fa-check-square").removeClass("far fa-square");
                               } else {
                                   $('i', nodes).addClass("far fa-square").removeClass("fa fa-check-square");
                               }
                           },
                        },
                       'render': function (data, type, row, meta) {
                           if (type === 'display') {
                               data = checkbox ;
                           }

                           return data;
                       },
                   }
                ],
                
                'select': {
                    'style': 'multi'
                },
                "scrollCollapse": true,
                "paging": false,
                "order": [[1, "asc"]],
                "info": false,
                "language": {
                    "search": "Buscar: "
                }

            });

            //botones
            $("#btnMarcarT").on("click", function (e) {
                tabla1.rows().select();

            });
            $("#btnDesMarcarT").on("click", function (e) {
                tabla1.rows().deselect();

            });
            $("#btnGenerar").on("click", function (e) {
                location.replace("gestionTitulos.aspx");

            });
            $('.dataTables_filter input').addClass('form-control');
 
        });

    </script>
</asp:Content>
