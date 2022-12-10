<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.TicketManagement.Category.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton runat="server" ID="btnAdd" SkinID="ButtonAdd" FunctionAccessControlCode="Create" CausesValidation="false" PostBackUrl="Add.aspx"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server" ID="upList" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="row">
                <div class="col-xs-12">
                    <div class="form-horizontal">
                        <asp:TreeView runat="server" ID="TreeView1" ShowLines="true" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"></asp:TreeView>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
