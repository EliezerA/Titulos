<%@ Page Title="" Language="C#" MasterPageFile="~/MPAutenticado.Master" AutoEventWireup="true" CodeBehind="FrmHome.aspx.cs" Inherits="WEB.FrmHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphEstilos" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContenido" runat="server">
    <h1 class="font-weight-light text-center">¡Bienvenido(a) <%= Session["nombre"].ToString() %>!</h1>
    <hr/>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <p></p>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
