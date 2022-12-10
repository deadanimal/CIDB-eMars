<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MAT.WebApp.App.Default" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <%-- Company Dashboard --%>
    <div id="companyDashboard" runat="server">
        <h4 class="header smaller blue no-margin-top">
            <MAT:Label runat="server">Company</MAT:Label></h4>
        
    </div>
    <%-- Personal Dashboard --%>
    <div class="col-xs-12" style="height: 15px;"></div>
    <%--add extra vertical space--%>
    <div id="personalDashboard" runat="server">
        <h4 class="header smaller blue no-margin-top">
            <MAT:Label runat="server">Personal</MAT:Label></h4>
        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
