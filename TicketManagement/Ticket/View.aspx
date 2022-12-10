<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.TicketManagement.Ticket.View" %>

<%@ Register Src="~/TicketManagement/UserControls/ucView.ascx" TagPrefix="UserControl" TagName="ucView" %>
<%@ Register Src="~/TicketManagement/ModalLookup/ucTicketAssignUser.ascx" TagPrefix="UserControl" TagName="ucTicketAssignUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton runat="server" ID="btnEdit" SkinID="ButtonEdit" FunctionAccessControlCode="Edit" CausesValidation="false" OnClick="btnEdit_Click"></Metronic:LinkButton>
    <Metronic:LinkButton runat="server" ID="btnBack" CausesValidation="false" SkinID="ButtonBack" OnClick="btnBack_Click"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <UserControl:ucView runat="server" ID="ucView" />
    <asp:HiddenField ID="TabIndex" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
    <script type="text/javascript">
        function setTabIndex(value) {
            $('#<%= TabIndex.ClientID %>').val(value);
        }

        $('#myTabs a').click(function (e) {
            e.preventDefault();
            setTabIndex($(this).attr('href'));
        })

        // set startup tab
        $('#myTabs a[href="<%= TabIndex.Value %>"]').tab('show');
    </script>
</asp:Content>
