<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTicketSummary.ascx.cs" Inherits="MAT.WebApp.App.TicketManagement.TicketSummary.UserControl.ucTicketSummary" %>

<div class="table-responsive">
    <asp:UpdatePanel ID="upSummary" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <Metronic:GridView runat="server" ID="gvTicket" ItemType="MAT.App.Scorecard.TicketManagement.Ticket.TicketViewModel" DataKeyNames="TicketId" SelectMethod="gvTicket_Get" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" AllowSorting="false">
                <Columns>
                    <MAT:TemplateField ItemStyle-Width="20px">
                        <ItemTemplate>
                            <div class="action-buttons">
                                <MAT:HyperLink runat="server" ID="hyperlink1" CssClass="blue" FrontIconCss="fa fa-search-plus bigger-130" FunctionAccessControlCode="View" NavigateUrl='<%# string.Format("~/TicketManagement/Ticket/View.aspx?id={0}&source=Summary", Item.TicketId) %>'></MAT:HyperLink>
                            </div>
                        </ItemTemplate>
                    </MAT:TemplateField>
                    <MAT:BoundField DataField="TicketNo" HeaderText="IssueNo" SortExpression="TicketNo" />
                    <MAT:TemplateField HeaderText="Subject"></MAT:TemplateField>
                    <MAT:BoundField DataField="CategoryDesc" HeaderText="Category" SortExpression="CategoryDesc" />
                    <MAT:TemplateField HeaderText="RelatedTo"></MAT:TemplateField>
                    <MAT:TemplateField HeaderText="CreatedOn"></MAT:TemplateField>
                    <MAT:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" DataFormatString="{0:dd/MM/yyyy}" />
                </Columns>
            </Metronic:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>