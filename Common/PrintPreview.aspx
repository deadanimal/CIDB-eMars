<%@ Page Title="" Language="C#" MasterPageFile="~/PopupSite.Master" AutoEventWireup="true" CodeBehind="PrintPreview.aspx.cs" Inherits="MAT.WebApp.App.Common.PrintPreview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Metronic:GridView ID="GridView1" runat="server" SkinID="pagelessGridView" AutoGenerateColumns="true" AllowPaging="false"
        CssClass="table table-striped table-bordered table-hover dataTable">
    </Metronic:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
