<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MAT.WebApp.App.Home" %>

<%@ Register Src="~/TicketManagement/TicketSummary/UserControl/ucTicketSummary.ascx" TagPrefix="UserControl" TagName="ucTicketSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#messages">
                <i class="red ace-icon fa fa-exclamation-triangle bigger-120"></i>
                <MAT:Label runat="server" Text="Overdue" />
                <span class="badge badge-danger">
                    <asp:Label ID="lblOverdueTicket" runat="server" /></span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#ticketdetails">
                <i class="orange ace-icon fa fa-folder-open bigger-120"></i>
                <MAT:Label runat="server" Text="Assigned" />
                <span class="badge badge-warning">
                    <asp:Label ID="lblOpenTicket" runat="server" /></span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#resolution">
                <i class="blue ace-icon fa fa-refresh bigger-120"></i>
                <MAT:Label runat="server" Text="Review" />
                <span class="badge badge-info">
                    <asp:Label ID="lblReOpenTicket" runat="server" /></span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#completed">
                <i class="green ace-icon fa fa-check bigger-120"></i>
                <MAT:Label runat="server" Text="Completed" />
                <span class="badge badge-success">
                    <asp:Label ID="lblCompleted" runat="server" /></span>
            </a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="messages" role="tabpanel">
            <UserControl:ucTicketSummary ID="ucTicketSummaryOverdue" runat="server" TicketStatus="Overdue" />
        </div>
        <div class="tab-pane" id="ticketdetails" role="tabpanel">
            <UserControl:ucTicketSummary ID="ucTicketSummaryOpen" runat="server" TicketStatus="Open" />
        </div>
        <div class="tab-pane" id="resolution" role="tabpanel">
            <UserControl:ucTicketSummary ID="ucTicketSummaryReopen" runat="server" TicketStatus="Reopened" />
        </div>
        <div class="tab-pane" id="completed" role="tabpanel">
            <UserControl:ucTicketSummary ID="ucTicketSummaryCompleted" runat="server" TicketStatus="Completed" />
        </div>
    </div>--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
