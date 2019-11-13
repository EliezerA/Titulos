<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WEB.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>  
    <title>Sistema de Emisión de Títulos Profesionales Digitales</title>
    <link href="css/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="css/fontawesome/all.min.css" rel="stylesheet" />
    <link href="css/general.css" rel="stylesheet" />
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-turquoise">
        <a id="mnuLogo" class="navbar-brand" href="#">STD</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">            
            <ul class="navbar-nav">
              <li class="nav-item mx-0 mx-sm-0 mx-md-0 mx-lg-1 mx-xl-1">
                    <a id="mnuInicio" class="nav-link" href="Default.aspx">Inicio</a>
                </li>
                <li class="nav-item">
                    <a id="mnuGenerarTitulos" class="nav-link" href="generarTitulos.aspx">Generar títulos</a>
                </li>
                <li class="nav-item">
                    <a id="mnuGestionLotes" class="nav-link" href="gestionTitulos.aspx">Gestión de lotes</a>
                </li>
            </ul>
             <ul class="navbar-nav ml-auto">
                <li class="nav-item">                        
                    <button id="btnLogin" type="button" class="btn btn-outline-light col-sm-12"><i class="fa fa-user-circle fa-lg" aria-hidden="true"></i> Iniciar sesión</button>
                </li>
             </ul>
        </div>
    </nav>

    <div class="container mt-3">
        <form id="FRM_LOGIN" runat="server">
            <asp:ScriptManager ID="SMindex" runat="server">
                <Services>
                    <asp:ServiceReference Path="~/ws/WS_ET_Usuario.asmx" />
                </Services>
            </asp:ScriptManager>
            <div class="modal fade" id="modalLogin" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header bg-dark">
                            <h5 class="modal-title text-white" id="exampleModalLongTitle">Iniciar sesión</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="row mt-3">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="addusuario"><i class="fa fa-user-circle"></i></span>
                                        </div>
                                        <input type="text" class="form-control" id="txtUsuario" maxlength="50" placeholder="Ingresa tu usuario" aria-label="Usuario" aria-describedby="addusuario"/>
                                        <div class="valid-feedback"><i class="fa fa-check-circle"></i></div>
                                        <div class="invalid-feedback">
                                            <i class="fa fa-exclamation-circle"></i> Usuario no válido.
                                        </div>
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="addpass"><i class="fa fa-lock"></i></span>
                                        </div>
                                        <input type="password" class="form-control" id="txtPass" maxlength="50" placeholder="Ingresa tu contraseña" aria-label="Contraseña" aria-describedby="addpass"/>
                                        <div class="valid-feedback"><i class="fa fa-check-circle"></i></div>
                                        <div class="invalid-feedback">
                                            <i class="fa fa-exclamation-circle"></i> Contraseña no válida.
                                        </div>
                                    </div>
                                </div>
                                <div id="alertas"></div>
                            </div>
                        </div>
                        <div class="modal-footer justify-content-between">
                            <button id="btnCerrar" type="button" class="btn btn-outline-danger col-5"><i class="fa fa-times-circle-o fa-lg" aria-hidden="true"></i> Cerrar</button>
                            <button id="btnIniciarSesion" type="button" class="btn btn-outline-success col-5"><i class="fa fa-sign-in fa-lg" aria-hidden="true"></i> Entrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <h1 class="font-weight-light text-center">Sistema de Emisión de Títulos Profesionales Digitales</h1>
        <hr/>
        <div class="row">
            <div class="col-12">
                <p></p>
            </div>
        </div> 
    </div>

    <footer class="footer text-muted text-center">
        <div class="container-fluid">
            <p>Instituto Tecnológico Superior del Sur de Guanajuato<br />Tel. 01(445) 4577468 ext 110<br />Todos los derechos reservados © Centro de Desarrollo de Software ITSUR</p>
        </div>
    </footer>

    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <script src="js/util.js"></script>
    <script src="Default.js"></script>
</body>
</html>
