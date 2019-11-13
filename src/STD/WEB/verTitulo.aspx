<%@ Page Title="" Language="C#" MasterPageFile="~/MPBasica.Master" AutoEventWireup="true" CodeBehind="verTitulo.aspx.cs" Inherits="WEB.Formulario_web2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphEstilosBasica" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphTitulo" runat="server">
    <div class="container mt-3">
        <h1 id="titulo" class="font-weight-light text-center">Ver título electrónico</h1>
        <hr />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenidoBasica" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <button id="btnAbrirT" type="button" class="btn col-sm-12 d-block btn-recargar"><i class="fas fa-angle-double-down fa-lg i-white" aria-hidden="true"></i> Abrir todos</button>
                <button id="btnCerrarT" type="button" class="btn col-sm-12 d-block btn-cancelar"><i class="fas fa-angle-double-up fa-lg i-white" aria-hidden="true"></i> Cerrar todos</button>
            </div>
            <div class="col-sm-6">
                <div class="form-inline">
                    <label class="col-sm-4 d-inline text-right">Folio Control</label>
                    <span id="txtFolioControl" class="col-sm-8">aaaaaaaaa</span>
                </div>
                <div class="form-inline">
                    <label class="col-sm-4 d-inline text-right">Versión</label>
                    <span id="txtVersion" class="col-sm-8">1.0</span>
                </div>
            </div>

            <div class="col-sm-3">
                <button id="btnVolver" type="button" class="btn btn-volver col-sm-12 d-block"><i class="fa fa-check fa-lg i-black" aria-hidden="true"></i> Volver</button>
            </div>
        </div>
    </div>

    <div class="container" id="accordion1">

        <div class="card">
            <div class="card-header" data-toggle="collapse" data-target="#collapse1">
                <a class="card-link">Responsables
                </a>
            </div>
            <div id="collapse1" class="collapse">
                <div class="card-body">
                    <div id="accordion2">

                        <div class="card" data-toggle="collapse" data-target="#collapseOne">
                            <div class="card-header" >
                                <a class="card-link" data-toggle="collapse" >Eliezer Abonce MArtinez
                                </a>
                            </div>
                            <div id="collapseOne" class="collapse">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-inline">
                                                <label class="col-sm-4 d-inline text-right">Nombre</label>
                                                <span id="txtResNombre" class="col-sm-4">Eliezer</span>
                                            </div>
                                            <div class="form-inline">
                                                <label class="col-sm-4 d-inline text-right">Primer Apellido</label>
                                                <span id="txtResPrimerA" class="col-sm-8">Abonce</span>
                                            </div>
                                            <div class="form-inline">
                                                <label class="col-sm-4 d-inline text-right">Segundo Apellido</label>
                                                <span id="txtFechaaC" class="col-sm-8">Martinez</span>
                                            </div>
                                            <div class="form-inline">
                                                <label class="col-sm-4 d-inline text-right">CURP</label>
                                                <span id="txtResCURP" class="col-sm-8">AEMM830225HDFLCG04</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">

                                            <div class="form-inline">
                                                <label class="col-sm-4 d-inline text-right">Cargo</label>
                                                <span id="txtResCargo" class="col-sm-8">SUBDIRECTOR</span>
                                            </div>
                                            <div class="form-inline">
                                                <label class="col-sm-4 d-inline text-right">Abreviatura o titulo</label>
                                                <span id="txtResAbrTit" class="col-sm-8">Dr.</span>
                                            </div>
                                            <div class="form-inline">
                                                <label class="col-sm-4 d-inline text-right">Sello</label>
                                                <span id="txtResSello" class="col-sm-8">Martinez</span>
                                            </div>
                                            <div class="form-inline">
                                                <label class="col-sm-4 d-inline text-right">Certificado</label>
                                                <span id="txtResCert" class="col-sm-8">Martinez</span>
                                            </div>
                                            <div class="form-inline">
                                                <label class="col-sm-4 d-inline text-right">No. Certificado</label>
                                                <span id="txtResCertNo" class="col-sm-8"></span>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-header" data-toggle="collapse" data-target="#collapseTwo">
                                <a class="collapsed card-link" data-toggle="collapse" >Eliezer ABonce MArtinez
                                </a>
                            </div>
                            <div id="collapseTwo" class="collapse">
                                  <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-inline">
                                                <label class="col-sm-4 d-inline text-right">Nombre</label>
                                                <span id="txtResNombre" class="col-sm-4">Eliezer</span>
                                            </div>
                                            <div class="form-inline">
                                                <label class="col-sm-4 d-inline text-right">Primer Apellido</label>
                                                <span id="txtResPrimerA" class="col-sm-8">Abonce</span>
                                            </div>
                                            <div class="form-inline">
                                                <label class="col-sm-4 d-inline text-right">Segundo Apellido</label>
                                                <span id="txtFechaaC" class="col-sm-8">Martinez</span>
                                            </div>
                                            <div class="form-inline">
                                                <label class="col-sm-4 d-inline text-right">CURP</label>
                                                <span id="txtResCURP" class="col-sm-8">Martinez</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">

                                            <div class="form-inline">
                                                <label class="col-sm-4 d-inline text-right">Cargo</label>
                                                <span id="txtResCargo" class="col-sm-8">Martinez</span>
                                            </div>
                                            <div class="form-inline">
                                                <label class="col-sm-4 d-inline text-right">Abreviatura o titulo</label>
                                                <span id="txtResAbrTit" class="col-sm-8">Martinez</span>
                                            </div>
                                            <div class="form-inline">
                                                <label class="col-sm-4 d-inline text-right">Sello</label>
                                                <span id="txtResSello" class="col-sm-8">Martinez</span>
                                            </div>
                                            <div class="form-inline">
                                                <label class="col-sm-4 d-inline text-right">Certificado</label>
                                                <span id="txtResCert" class="col-sm-8">Martinez</span>
                                            </div>
                                            <div class="form-inline">
                                                <label class="col-sm-4 d-inline text-right">No. Certificado</label>
                                                <span id="txtResCertNo" class="col-sm-8"></span>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header" data-toggle="collapse" data-target="#collapse2">
                <a class="collapsed card-link">Institucion
                </a>
            </div>
            <div id="collapse2" class="collapse">
                <div class="card-body">
                    <div class="form-inline">
                        <label class="col-sm-4 d-inline text-right">CVE Institucion</label>
                        <span id="txtCveInstitucion" class="col-sm-8">070047</span>
                    </div>
                    <div class="form-inline">
                        <label class="col-sm-4 d-inline text-right">Nombre</label>
                        <span id="txtnombreInstitucion" class="col-sm-8">INSTITUTO TECNOLÓGICO DE COMITÁN (I.T.A. NO. 31 DE COMITAN, CHIS.)</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header" data-toggle="collapse" data-target="#collapse3">
                <a class="collapsed card-link">Carrera
                </a>
            </div>
            <div id="collapse3" class="collapse">
                <div class="card-body">

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">CVE carrera</label>
                                <span id="txtCveCarrera" class="col-sm-8">521312</span>
                            </div>
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Nombre</label>
                                <span id="txtNombreCarrera" class="col-sm-8">LICENCIATURA EN INGENIERÍA EN SISTEMAS COMPUTACIONALES</span>
                            </div>
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Fecha inicio</label>
                                <span id="txtFechaInicio" class="col-sm-8">AAAA-MM-DD</span>
                            </div>
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Fecha terminacion</label>
                                <span id="txtFechaTerminacion" class="col-sm-8">AAAA-MM-DD</span>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Autorizacion reconocimiento</label>
                                <span id="txtAutorizacionReconocimiento" class="col-sm-8">RVOE FEDERAL</span>
                            </div>
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">No. RVOE</label>
                                <span id="txtNumeroRvoe" class="col-sm-8">aaaaaaaaaaa</span>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header" data-toggle="collapse" data-target="#collapse4">
                <a class="collapsed card-link">Profesionista
                </a>
            </div>
            <div id="collapse4" class="collapse">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">CURP</label>
                                <span id="txtCurp" class="col-sm-8">AEMM830225HDFLCG04</span>
                            </div>
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Nombre</label>
                                <span id="txtNombre" class="col-sm-8">MARIANA</span>
                            </div>
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Primer Apellido</label>
                                <span id="txtPrimerApellido" class="col-sm-8">ALONSO</span>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Segundo Apellido</label>
                                <span id="txtSegundoApellido" class="col-sm-8">JIMENEZ</span>
                            </div>
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Correo Electrónico</label>
                                <span id="txtCorreoElectronico" class="col-sm-8">a.mar.sanorbac_jimenez@hotmail.com</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header" data-toggle="collapse" data-target="#collapse5">
                <a class="collapsed card-link">Expedicion
                </a>
            </div>
            <div id="collapse5" class="collapse">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Fecha expedición</label>
                                <span id="txtFechaExpedicion" class="col-sm-8">2013-12-04</span>
                            </div>
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Modalidad titulación</label>
                                <span id="txtModalidadTitulacion" class="col-sm-8">POR TESIS</span>
                            </div>
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Fecha examen profesional</label>
                                <span id="txtFechaExamenProfesional" class="col-sm-8">2009-08-05</span>
                            </div>
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Fecha exención examen profesional</label>
                                <span id="txtFechaExencionExamenProfesional" class="col-sm-8"></span>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Cumplio servicio social</label>
                                <span id="txtCumplioServicioSocial" class="col-sm-8">1</span>
                            </div>
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Fundamento legal servicio social</label>
                                <span id="txtFundamentoLegalServicioSocial" class="col-sm-8">ART. 52 LRART. 5 CONST</span>
                            </div>
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Entidad federativa</label>
                                <span id="txtEntidadFederativa" class="col-sm-8">CIUDAD DE MÉXICO</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header" data-toggle="collapse" data-target="#collapse6">
                <a class="collapsed card-link">Antecedente
                </a>
            </div>
            <div id="collapse6" class="collapse">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Institucion procedencia</label>
                                <span id="txtInstitucionProcedencia" class="col-sm-8">ESCUELA SECUNDARIA TECNICA 47, MÉXICO, D. F.</span>
                            </div>
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Tipo estudio antecedente</label>
                                <span id="txtTipoEstudioAntecedente" class="col-sm-8">SECUNDARIA</span>
                            </div>                            
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Entidad federativa</label>
                                <span id="txtEntidadFederativa" class="col-sm-8">CIUDAD DE MÉXICO</span>
                            </div>
                        </div>
                        <div class="col-sm-6">

                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Fecha Inicio</label>
                                <span id="txtFechaInico" class="col-sm-8">2003-01-01</span>
                            </div>
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">Fecha Terminación</label>
                                <span id="txtFechaTerminacion" class="col-sm-8">2003-01-01</span>
                            </div>
                            <div class="form-inline">
                                <label class="col-sm-4 d-inline text-right">No. cedula</label>
                                <span id="txtNoCedula" class="col-sm-8">32</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header" data-toggle="collapse" data-target="#collapse7">
                <a class="collapsed card-link">Autenticación
                </a>
            </div>
            <div id="collapse7" class="collapse">
                <div class="card-body">
                    <div class="form-inline">
                        <label class="col-sm-4 d-inline text-right">Autenticación</label>
                        <span id="txtAutenticacion" class="col-sm-8"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphScriptsBasica" runat="server">

    <script>
        $(document).ready(function () {
            $("#btnVolver").on("click", function (e) {
                location.replace("consultarLote.aspx");
            });
            $("#btnAbrirT").on("click", function (e) {
                $('#accordion1 > .card > .collapse').collapse('show');
            });
            $("#btnCerrarT").on("click", function (e) {
                $('#accordion1 > .card > .collapse').collapse('hide');
            });

            $.ajax({
                type: "GET",
                url: "Ejemplo.xml",
                dataType: "xml",
                success: function (xml) {
                    if ($(xml).find("TituloElectronico").attr("folioControl")) {
                        $("#txtFolioControl").html($(xml).find("TituloElectronico").attr("folioControl"));
                    }
                    if ($(xml).find("TituloElectronico").attr("version")) {
                        $("#txtVersion").html($(xml).find("TituloElectronico").attr("version"));
                    }
                    if ($(xml).find("FirmaResponsables")) {
                        $(xml).find('FirmaResponsable').each(function () {
                            alert(this);
                        });
                    }  


                }


            });


           
        });

    </script>
</asp:Content>
