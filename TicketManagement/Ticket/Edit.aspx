<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MAT.WebApp.App.TicketManagement.Ticket.Edit" %>

<%@ Register Src="~/TicketManagement/UserControls/ucEdit.ascx" TagPrefix="UserControl" TagName="ucEdit" %>
<%@ Register Src="~/TicketManagement/ModalLookup/ucTicketAssignUser.ascx" TagPrefix="UserControl" TagName="ucTicketAssignUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave" FunctionAccessControlCode="Edit" AssociatedFormViewId="fvParent" CommandName="Update"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" CausesValidation="false" SkinID="ButtonBack" OnClick="btnBack_Click"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <UserControl:ucEdit runat="server" ID="ucEdit" />
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
