<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTicketCategory.ascx.cs" Inherits="MAT.WebApp.App.TicketManagement.Ticket.UserControls.ucTicketCategory" %>

<asp:UpdatePanel runat="server" ID="upParent" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:DataList runat="server" ID="dlTicketCategory" Width="100%" OnItemCreated="dlTicketCategory_ItemCreated">
            <ItemTemplate>
                <Metronic:DropDownList runat="server" ID="ddlTicketCategory" DataValueField="Key" DataTextField="Value" OnSelectedIndexChanged="ddlTicketCategory_SelectedIndexChanged" AutoPostBack="true" Text='<%# Eval("CodeMasterId") %>' Mandatory="true"></Metronic:DropDownList>
                <asp:HiddenField runat="server" ID="hfSeqNo" Value='<%# Eval("SeqNo") %>' />
            </ItemTemplate>
        </asp:DataList>
    </ContentTemplate>
</asp:UpdatePanel>
