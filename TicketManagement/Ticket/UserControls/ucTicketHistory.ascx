<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTicketHistory.ascx.cs" Inherits="MAT.WebApp.App.TicketManagement.Ticket.UserControls.ucTicketHistory" %>

<div class="table-responsive">
    <Metronic:GridView runat="server" ID="gvList" ItemType="MAT.App.Scorecard.TicketManagement.Ticket.TicketEventLogViewModel" SelectMethod="gvList_Get">
        <Columns>
            <MAT:BoundField DataField="CreatedDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy HH:mm}"></MAT:BoundField>
            <MAT:BoundField DataField="Remark" HeaderText="Activity"></MAT:BoundField>
            <MAT:BoundField DataField="CreatedByName" HeaderText="User"></MAT:BoundField>
        </Columns>
    </Metronic:GridView>
</div>