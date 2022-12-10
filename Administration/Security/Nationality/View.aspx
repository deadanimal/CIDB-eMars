<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.Administration.Security.Nationality.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton ID="btnEdit" runat="server" SkinID="ButtonEdit" FunctionAccessControlCode="Edit" OnClick="btnEdit_Click"></Metronic:LinkButton>
    <Metronic:FormViewButton ID="btnDelete" runat="server" SkinID="ButtonDelete" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Delete" CommandName="Delete" CausesValidation="false"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" CausesValidation="false" OnClick="btnBack_Click"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:CodeMasterView ID="ucCodeMasterView" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
