<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.TicketManagement.Ticket.Index" %>

<%@ Register Src="~/TicketManagement/ModalLookup/ucEntity.ascx" TagPrefix="MAT" TagName="ucEntity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server" ID="upGridView" UpdateMode="Conditional">
        <ContentTemplate>
            <Metronic:SearchPanel runat="server" ID="SearchPanel" AssociatedGridViewId="gvTicket" AddNavigateUrl="Add.aspx">
                <SearchTemplate>
                    <div class="m-portlet">
                        <div class="m-portlet__body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="View" AssociatedControlID="View"></MAT:Label>
                                        <div class="col-sm-7">
                                            <Metronic:DropDownList runat="server" ID="View" DataValueField="Key" DataTextField="Value" SelectMethod="View_Get"></Metronic:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="IssueNumber" AssociatedControlID="TicketNumber"></MAT:Label>
                                        <div class="col-sm-7">
                                            <Metronic:TextBox runat="server" ID="TicketNumber"></Metronic:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Category" AssociatedControlID="TicketCategoryCId"></MAT:Label>
                                        <div class="col-sm-7">
                                            <Metronic:DropDownList runat="server" ID="TicketCategoryCId" DataValueField="Key" DataTextField="Value" SelectMethod="TicketCategory_Get"></Metronic:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Entity" AssociatedControlID="Entity"></MAT:Label>
                                        <div class="col-sm-7">
                                            <Metronic:TextBox runat="server" ID="Entity"></Metronic:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Status" AssociatedControlID="TicketStatus"></MAT:Label>
                                        <div class="col-sm-7">
                                            <Metronic:DropDownList runat="server" ID="TicketStatus" DataValueField="Key" DataTextField="Value" SelectMethod="TicketStatus_Get"></Metronic:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="IssueOwner" AssociatedControlID="txtTicketOwner"></MAT:Label>
                                        <div class="col-sm-7">
                                            <Metronic:TextBox runat="server" ID="txtTicketOwner"></Metronic:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="AssignTo" AssociatedControlID="txtAssignedTo"></MAT:Label>
                                        <div class="col-sm-7">
                                            <Metronic:TextBox runat="server" ID="txtAssignedTo"></Metronic:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="IncidentDate" AssociatedControlID="txtIncidentDateFrom"></MAT:Label>
                                        <div class="col-sm-7">
                                            <div class="input-daterange input-group">
                                                <Metronic:TextBox runat="server" ID="txtIncidentDateFrom" CssClass="input-sm form-control"></Metronic:TextBox>
                                                <span class="input-group-addon">
                                                    <i class="fa fa-long-arrow-right"></i>
                                                </span>
                                                <Metronic:TextBox runat="server" ID="txtIncidentDateTo" CssClass="input-sm form-control"></Metronic:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="DueDate" AssociatedControlID="DueDate"></MAT:Label>
                                        <div class="col-sm-7">
                                            <Metronic:TextBox runat="server" ID="DueDate" SkinID="DatePicker"></Metronic:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Schedule" AssociatedControlID="TicketSchedule"></MAT:Label>
                                        <div class="col-sm-7">
                                            <Metronic:DropDownList runat="server" ID="TicketSchedule" DataValueField="Key" DataTextField="Value" SelectMethod="TicketSchedule_Get"></Metronic:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <div class="col-sm-12">
                                            <div class="pull-right">
                                                <Metronic:LinkButton ID="btnSearch" runat="server" SkinID="ButtonSearch" OnClick="btnSearch_Click"></Metronic:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </SearchTemplate>
            </Metronic:SearchPanel>
            <div class="table-responsive">
                <Metronic:GridView runat="server" ID="gvTicket" ItemType="MAT.App.Scorecard.TicketManagement.Ticket.TicketViewModel" DataKeyNames="TicketId"
                    SelectMethod="gvTicket_Get" AutoGenerateColumns="false" OnRowDataBound="gvTicket_RowDataBound">
                    <Columns>
                        <MAT:TemplateField ItemStyle-Width="20px">
                            <ItemTemplate>
                                <MAT:HyperLink runat="server" ID="Hyperlink1" CssClass="blue" FrontIconCss="ace-icon fa fa-search-plus bigger-130"
                                    FunctionAccessControlCode="View" NavigateUrl='<%# string.Format("View.aspx?id={0}", Item.TicketId) %>'></MAT:HyperLink>
                            </ItemTemplate>
                        </MAT:TemplateField>
                        <MAT:TemplateField HeaderText="IssueNumber" SortExpression="TicketNo">
                            <ItemTemplate>
                                <i runat="server" visible='<%# Item.Priority == MAT.App.Scorecard.TicketManagement.Ticket.TicketPriority.Low %>' class="ace-icon red fa fa-exclamation bigger-110 icon-only tooltop-error" data-rel="tooltip" data-original-title="High Priority"></i>
                                <%# Item.TicketNo %>
                                <i runat="server" visible='<%# Item.AttachmentCount > 0 %>' class="ace-icon blue fa fa-paperclip bigger-110 icon-only"></i>
                            </ItemTemplate>
                        </MAT:TemplateField>
                        <MAT:BoundField DataField="CategoryDesc" HeaderText="Category" SortExpression="CategoryDesc" />
                        <MAT:BoundField DataField="IncidentDateTime" HeaderText="IncidentDateTime" SortExpression="IncidentDateTime" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
                        <MAT:TemplateField HeaderText="KPIRef">
                            <ItemTemplate>
                                <%# DisplayKpiCodeName(Item.ScorecardKpiDetailId) %>
                            </ItemTemplate>
                        </MAT:TemplateField>
                        <MAT:BoundField DataField="TicketStatus" HeaderText="Status" SortExpression="TicketStatus" />
                        <MAT:BoundField DataField="TicketOwnerUserName" HeaderText="IssueOwner" SortExpression="TicketOwnerUserName" />
                        <MAT:TemplateField HeaderText="AssignedTo" SortExpression="AssignedToUsername">
                            <ItemTemplate>
                                <%# Item.AssignedToUsername %>
                                <i runat="server" visible='<%# Item.ViewDate.HasValue %>' class="ace-icon fa fa-eye blue bigger-110 icon-only" data-rel="tooltip" data-original-title='<%# Item.ViewDate %>'></i>
                            </ItemTemplate>
                        </MAT:TemplateField>
                        <%--<MAT:BoundField DataField="AlternateAssignmentUserName" HeaderText="AlternateAssignment" SortExpression="AlternateAssignmentUserName" />--%>
                        <MAT:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" DataFormatString="{0:dd/MM/yyyy}" />
                    </Columns>
                </Metronic:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
