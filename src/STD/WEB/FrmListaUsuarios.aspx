<%@ Page Title="" Language="C#" MasterPageFile="~/MPBasica.Master" AutoEventWireup="true" CodeBehind="FrmListaUsuarios.aspx.cs" Inherits="WEB.FrmListaUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphEstilosBasica" runat="server">
    <link href="css/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <link href="css/datatables/responsive.bootstrap4.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContenidoBasica" runat="server">
    <h1 id="titulo" class="font-weight-light text-center">Catálogo de usuarios</h1>
    <hr />
    <div class="form-row mb-3 ml-2">
        <button id="btnAgregar" type="button" class="btn btn-success mx-auto"><i class="fa fa-plus-circle fa-lg" aria-hidden="true"></i> Agregar</button>
    </div>
    <table id="tablaUsuarios" class="table table-sm table-striped table-bordered table-hover text-center" style="width:100%;" cellspacing="0">
    </table>

    <div class="modal fade" id="modalFrmView" tabindex="-1" role="dialog" aria-labelledby="MCTFrmView" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="titleFrmView">Datos de usuario</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid mt-3">
                        <div class="form-group row border border-primary rounded">
                            <label for="txtNombre" class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 col-form-label">Nombre:</label>
                            <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
                                <input type="text" readonly class="form-control-plaintext" id="txtNombre" value="">
                            </div>
                        </div>
                        <div class="form-group row border border-primary rounded">
                            <label for="txtUsuario" class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 col-form-label">Usuario:</label>
                            <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
                                <input type="text" readonly class="form-control-plaintext" id="txtUsuario" value="">
                            </div>
                        </div>
                        <div class="form-group row border border-primary rounded">
                            <label for="txtEmail" class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 col-form-label">E-mail:</label>
                            <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
                                <input type="text" readonly class="form-control-plaintext" id="txtEmail" value="">
                            </div>
                        </div>
                        <div class="form-group row border border-primary rounded">
                            <label for="txtTipo" class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 col-form-label">Rol:</label>
                            <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
                                <input type="text" readonly class="form-control-plaintext" id="txtTipo" value="">
                            </div>
                        </div>
                        <div class="form-group row border border-primary rounded">
                            <label for="txtActivo" class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 col-form-label">Activo:</label>
                            <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
                                <input type="text" readonly class="form-control-plaintext" id="txtActivo" value="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button id="btnCerrar" type="button" class="btn btn-outline-danger col-12"><i class="fa fa-times-circle-o fa-lg" aria-hidden="true"></i> Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScriptsBasica" runat="server">
    <script src="js/datatables/jquery.dataTables.min.js"></script>
    <script src="js/datatables/dataTables.bootstrap4.min.js"></script>
    <script src="js/datatables/dataTables.responsive.min.js"></script>
    <script src="js/datatables/responsive.bootstrap4.min.js"></script>
    <script type="text/javascript">
        var usuario = '<%= Session["usuario"].ToString() %>';
        var rol = '<%= Session["tipoUsuario"].ToString() %>';
    </script>
    <script src="FrmListaUsuarios.js"></script>
</asp:Content>
