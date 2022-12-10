<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Administration.General.AreaMaster.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton ID="btnAdd" runat="server" SkinID="ButtonAdd" OnClick="btnAdd_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-portlet">
        <div class="m-portlet__body">
            <div class="row">
                <asp:TreeView ID="TreeView1" runat="server" ShowLines="true" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"></asp:TreeView>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
