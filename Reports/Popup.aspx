<%@ Page Title="" Language="C#" MasterPageFile="~/PopupSite.Master" AutoEventWireup="true" CodeBehind="Popup.aspx.cs" Inherits="MAT.WebApp.App.Reports.Popup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <webopt:BundleReference runat="server" path="~/reportStyle" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div id="divReports" runat="server"></div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
