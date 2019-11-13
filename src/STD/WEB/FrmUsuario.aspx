<%@ Page Title="" Language="C#" MasterPageFile="~/MPBasica.Master" AutoEventWireup="true" CodeBehind="FrmUsuario.aspx.cs" Inherits="WEB.FrmUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphEstilosBasica" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphTitulo" runat="server">
    <div class="container mt-3">
        <h1 id="titulo" class="font-weight-light text-center">Formulario de Usuario</h1>
        <hr />
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContenidoBasica" runat="server">

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12" id="alertas"></div>
            <div class="form-group col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                <label for="txtNombre">Nombre(s):</label>
                <input type="text" id="txtNombre" class="form-control" placeholder="Longitud máxima de 50 caracteres" maxlength="50">
                <div class="valid-feedback text-center"><i class="fa fa-check-circle"></i>Campo válido.</div>
                <div class="invalid-feedback text-center"><i class="fa fa-exclamation-circle"></i>Nombre no válido.</div>
            </div>
            <div class="form-group col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">
                <label for="txtApellido1">Apellido paterno:</label>
                <input type="text" id="txtApellido1" class="form-control" placeholder="Longitud máxima de 50 caracteres" maxlength="50">
                <div class="valid-feedback text-center"><i class="fa fa-check-circle"></i>Campo válido.</div>
                <div class="invalid-feedback text-center"><i class="fa fa-exclamation-circle"></i>Apellido no válido.</div>
            </div>
            <div class="form-group col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">
                <label for="txtApellido2">Apellido materno:</label>
                <input type="text" id="txtApellido2" class="form-control" placeholder="Longitud máxima de 50 caracteres" maxlength="50">
                <div class="valid-feedback text-center"><i class="fa fa-check-circle"></i>Campo válido.</div>
                <div class="invalid-feedback text-center"><i class="fa fa-exclamation-circle"></i>Apellido no válido.</div>
            </div>
            <div class="form-group col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                <label for="txtUsuario">Usuario:</label>
                <input type="text" id="txtUsuario" <% if (Request["id"] != null) { Response.Write("readonly"); } %> class="form-control" placeholder="Longitud máxima de 50 caracteres" maxlength="50">
                <div class="valid-feedback text-center"><i class="fa fa-check-circle"></i>Campo válido.</div>
                <div class="invalid-feedback text-center"><i class="fa fa-exclamation-circle"></i>Usuario no válido.</div>
            </div>
            <%
                string campoPassword = "";
                if (Request["id"] == null)
                {
                    campoPassword = "<div class=\"form-group col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4\">" +
                                        "<label for=\"txtPassword\">Contraseña:</label>" +
                                        "<input type=\"password\" id=\"txtPassword\" class=\"form-control\" placeholder=\"Longitud máxima de 50 caracteres\" maxlength=\"50\">" +
                                        "<div class=\"valid-feedback text-center\"><i class=\"fa fa-check-circle\"></i> Campo válido.</div>" +
                                        "<div class=\"invalid-feedback text-center\"><i class=\"fa fa-exclamation-circle\"></i> Contraseña no válida.</div>" +
                                    "</div>" +
                                    "<div class=\"form-group col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4\">" +
                                        "<label for=\"txtPassword2\">Confirmar contraseña:</label>" +
                                        "<input type=\"password\" id=\"txtPassword2\" class=\"form-control\" placeholder=\"Longitud máxima de 50 caracteres\" maxlength=\"50\">" +
                                        "<div class=\"valid-feedback text-center\"><i class=\"fa fa-check-circle\"></i> Campo válido.</div>" +
                                        "<div class=\"invalid-feedback text-center\"><i class=\"fa fa-exclamation-circle\"></i> Contraseña no válida.</div>" +
                                    "</div>";
                    Response.Write(campoPassword);
                }
            %>
            <div class="form-group col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">
                <label for="txtEmail">E-mail:</label>
                <input type="email" id="txtEmail" class="form-control" placeholder="Longitud máxima de 100 caracteres" maxlength="100">
                <div class="valid-feedback text-center"><i class="fa fa-check-circle"></i>Campo válido.</div>
                <div class="invalid-feedback text-center"><i class="fa fa-exclamation-circle"></i>E-mail no válido.</div>
            </div>
            <div class="form-group col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">
                <label for="cboTipo">Tipo de usuario:</label>
                <select id="cboTipo" class="form-control">
                    <option class="font-weight-bold" selected>Selecciona una opción</option>
                    <option>Administrador</option>
                    <option>Entrevistador</option>
                </select>
                <div class="valid-feedback text-center"><i class="fa fa-check-circle"></i>Opción válida.</div>
                <div class="invalid-feedback text-center"><i class="fa fa-exclamation-circle"></i>Opción no válida.</div>
            </div>
            <%
                string campoActivo = "";
                if (Request["id"] != null)
                {
                    campoActivo = "<div class=\"form-check col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4 mb-3 align-self-center text-center\">" +
                                    "<input class=\"form-check-input\" type=\"checkbox\" id=\"chkActivo\" checked>" +
                                    "<label class=\"form-check-label\" for=\"chkActivo\">Activo</label>" +
                                    "</div>";
                    Response.Write(campoActivo);

                    campoPassword = "<div class=\"col-12\">" +
                                        "<div id=\"accordion\">" +
                                            "<div class=\"card\">" +
                                                "<div class=\"card-header\" id=\"headingPass\">" +
                                                    "<div class=\"form-check\">" +
                                                        "<input type=\"checkbox\" class=\"form-check-input\" id=\"chkPassword\" data-toggle=\"collapse\" data-target=\"#collapsePass\" aria-controls=\"collapsePass\">" +
                                                        "<label class=\"form-check-label\" for=\"chkPassword\">Cambiar contraseña</label>" +
                                                    "</div>" +
                                                "</div>" +
                                                "<div id=\"collapsePass\" class=\"collapse show\" aria-labelledby=\"headingPass\" data-parent=\"#accordion\">" +
                                                    "<div class=\"card-body\">" +
                                                        "<div class=\"row\">" +
                                                            "<div class=\"form-group col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6\">" +
                                                                "<label for=\"txtPassword\">Nueva contraseña:</label>" +
                                                                "<input type=\"password\" id=\"txtPassword\" class=\"form-control\" placeholder=\"Máximo 50 caracteres\" maxlength=\"50\">" +
                                                                "<div class=\"valid-feedback text-center\"><i class=\"fa fa-check-circle\"></i> Campo válido.</div>" +
                                                                "<div class=\"invalid-feedback text-center\"><i class=\"fa fa-exclamation-circle\"></i> Contraseña no válida.</div>" +
                                                            "</div>" +
                                                            "<div class=\"form-group col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6\">" +
                                                                "<label for=\"txtPassword2\">Confirmar nueva contraseña:</label>" +
                                                                "<input type=\"password\" id=\"txtPassword2\" class=\"form-control\" placeholder=\"Máximo 50 caracteres\" maxlength=\"50\">" +
                                                                "<div class=\"valid-feedback text-center\"><i class=\"fa fa-check-circle\"></i> Campo válido.</div>" +
                                                                "<div class=\"invalid-feedback text-center\"><i class=\"fa fa-exclamation-circle\"></i> Contraseña no válida.</div>" +
                                                            "</div>" +
                                                        "</div>" +
                                                    "</div>" +
                                                "</div>" +
                                            "</div>" +
                                        "</div>" +
                                    "</div>";
                    Response.Write(campoPassword);
                }
            %>
        </div>
        <hr />
        <div class="row justify-content-around">
            <button id="btnVolver" type="button" class="btn btn-outline-secondary col-12 col-sm-12 col-md-5 col-lg-4 col-xl-4"><i class="fa fa-arrow-circle-o-left fa-lg" aria-hidden="true"></i>Volver</button>
            <button id="btnAceptar" type="button" class="btn btn-outline-success col-12 col-sm-12 col-md-5 col-lg-4 col-xl-4 mt-2 mt-sm-2 mt-md-0 mt-lg-0 mt-xl-0"><i class="fa fa-check-circle-o fa-lg" aria-hidden="true"></i>Aceptar</button>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScriptsBasica" runat="server">
    <script type="text/javascript">
        var id = parseInt('<%= Request["id"] != null ? Request["id"] : "0" %>');
    </script>
</asp:Content>
