<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucEdit.ascx.cs" Inherits="MAT.WebApp.App.TicketManagement.UserControls.ucEdit" %>

<%@ Register Src="~/TicketManagement/Ticket/UserControls/ucTicketCategory.ascx" TagPrefix="UserControl" TagName="ucTicketCategory" %>
<%@ Register Src="~/TicketManagement/Ticket/UserControls/ucCustomFields.ascx" TagPrefix="UserControl" TagName="ucCustomFields" %>
<%@ Register Src="~/TicketManagement/Ticket/UserControls/ucMessage.ascx" TagPrefix="UserControl" TagName="ucMessage" %>
<%@ Register Src="~/TicketManagement/Ticket/UserControls/ucTicketResolution.ascx" TagPrefix="UserControl" TagName="ucTicketResolution" %>
<%@ Register Src="~/TicketManagement/Ticket/UserControls/ucTicketHistory.ascx" TagPrefix="UserControl" TagName="ucTicketHistory" %>
<%@ Register Src="~/TicketManagement/Ticket/UserControls/ucAttachment.ascx" TagPrefix="UserControl" TagName="ucAttachment" %>
<%@ Register Src="~/TicketManagement/ModalLookup/ucTicketAssignUser.ascx" TagPrefix="UserControl" TagName="ucTicketAssignUser" %>

<MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DataKeyNames="TicketId" DefaultMode="Edit"
    ItemType="MAT.App.Scorecard.TicketManagement.Ticket.TicketViewModel" OnPreRender="fvParent_PreRender" SelectMethod="fvParent_GetItem"
    UpdateMethod="fvParent_Update" OnDataBound="fvParent_DataBound">
    <EditItemTemplate>
        <div class="m-portlet">
            <div class="m-portlet__head">
                <div class="m-portlet__head-caption">
                    <div class="m-portlet__head-title">
                        <h3 class="m-portlet__head-text">
                            <MAT:Literal runat="server" Text="Assignment"></MAT:Literal>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="m-portlet__body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="AssignTo" AssociatedControlID="ucAssignTo" />
                            <div class="col-sm-7">
                                <UserControl:ucTicketAssignUser ID="ucAssignTo" runat="server" IsRequired="true" ScorecardKpiDetailId='<%# Item.ScorecardKpiDetailId %>' Value='<%# Item.AssignToUserId %>' />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="Status" AssociatedControlID="Status" />
                            <div class="col-sm-7">
                                <Metronic:DropDownList ID="Status" runat="server" DataTextField="Value" DataValueField="Key" SelectMethod="Status_Get" Text='<%# Convert.ToByte(Item.TicketStatus) %>' />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="m-portlet">
            <div class="m-portlet__body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="IssueNo" AssociatedControlID="TicketNo" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" ID="TicketNo" Mode="ReadOnly" DataField="TicketNo" />
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="Category" AssociatedControlID="Category" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" ID="Category" Mode="ReadOnly" DataField="CategoryDesc" />
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="Entity" AssociatedControlID="Entity" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" ID="Entity" Mode="ReadOnly" DataField="EntityDesc" />
                            </div>
                        </div>
                        <%--<div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="Status" AssociatedControlID="Status" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" ID="Status" Mode="ReadOnly" DataField="TicketStatus" />
                            </div>
                        </div>--%>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="Subject" AssociatedControlID="Subject" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="Edit" DataField="Subject" ID="Subject" Visible='<%# MAT.Helper.Convert.ToGuid(Eval("TicketOwnerUId")) == MAT.Context.Profile.UserId %>' />
                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Subject" Visible='<%# MAT.Helper.Convert.ToGuid(Eval("TicketOwnerUId")) != MAT.Context.Profile.UserId %>' />
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="Description" AssociatedControlID="Description" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="Edit" DataField="Description" ID="Description" Visible='<%# MAT.Helper.Convert.ToGuid(Eval("TicketOwnerUId")) == MAT.Context.Profile.UserId %>' />
                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Description" Visible='<%# MAT.Helper.Convert.ToGuid(Eval("TicketOwnerUId")) != MAT.Context.Profile.UserId %>' />
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="KPIRef" AssociatedControlID="KpiRef"></MAT:Label>
                            <div class="col-sm-7 col-form-value">
                                <Metronic:LinkButton runat="server" ID="KpiRef" SkinID="ButtonFreeLink" Text='<%# Item.KpiRef %>'
                                    CommandArgument='<%# Item.ScorecardKpiDetailId %>' OnClick="KpiRef_Click"></Metronic:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label ID="Label13" runat="server" SkinID="FormLabel" Text="IssueOwner" AssociatedControlID="TicketOwner" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="ReadOnly" ID="TicketOwner" DataField="TicketOwnerUserName" />
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label ID="Label8" runat="server" SkinID="FormLabel" Text="Priority" AssociatedControlID="Priority" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="Edit" DataField="Priority" ID="Priority" Visible='<%# MAT.Helper.Convert.ToGuid(Eval("TicketOwnerUId")) == MAT.Context.Profile.UserId %>' />
                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Priority" Visible='<%# MAT.Helper.Convert.ToGuid(Eval("TicketOwnerUId")) != MAT.Context.Profile.UserId %>' />
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label ID="Label9" runat="server" SkinID="FormLabel" Text="IncidentDate" AssociatedControlID="IncidentDate" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="Edit" DataField="IncidentDateTime" ID="IncidentDate" Visible='<%# MAT.Helper.Convert.ToGuid(Eval("TicketOwnerUId")) == MAT.Context.Profile.UserId %>' />
                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="IncidentDateTime" Visible='<%# MAT.Helper.Convert.ToGuid(Eval("TicketOwnerUId")) != MAT.Context.Profile.UserId %>' />
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label ID="Label10" runat="server" SkinID="FormLabel" Text="IncidentTime" AssociatedControlID="IncidentTime" />
                            <div class="col-sm-7">
                                <Metronic:TextBox SkinID="TimePicker" runat="server" ID="IncidentTime" Text='<%# Bind("IncidentDateTime", "{0:HH:mm}") %>' Mandatory="true" />
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label ID="Label11" runat="server" SkinID="FormLabel" Text="DueDate" AssociatedControlID="DueDate" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="Edit" DataField="DueDate" ID="DueDate" Visible='<%# MAT.Helper.Convert.ToGuid(Eval("TicketOwnerUId")) == MAT.Context.Profile.UserId %>' />
                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="DueDate" Visible='<%# MAT.Helper.Convert.ToGuid(Eval("TicketOwnerUId")) != MAT.Context.Profile.UserId %>' />
                            </div>
                        </div>
                        <%--<div class="form-group m-form__group mat-form-group">
                            <MAT:Label ID="Label12" runat="server" SkinID="FormLabel" Text="AssignedTo" AssociatedControlID="AssignedTo" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="AssignedToUsername" ID="AssignedTo" />
                            </div>
                        </div>--%>
                        <%--<div class="form-group m-form__group mat-form-group">
                            <MAT:Label ID="Label14" runat="server" SkinID="FormLabel" Text="AlternateAssignment" AssociatedControlID="AlternateAssignment" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="AlternateAssignmentUsername" ID="AlternateAssignment" />
                            </div>
                        </div>--%>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label ID="Label6" runat="server" SkinID="FormLabel" Text="CreatedBy" AssociatedControlID="CreatedBy" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="strCreatedBy" ID="CreatedBy" />
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label ID="Label7" runat="server" SkinID="FormLabel" Text="ModifiedBy" AssociatedControlID="ModifiedBy" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="strModifiedBy" ID="ModifiedBy" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">&nbsp;</div>
                    <div class="col-md-12">
                        <div class="m-portlet--tabs">
                            <div class="m-portlet__head">
                                <div class="m-portlet__head-tools">
                                    <ul class="nav nav-tabs m-tabs-line m-tabs-line--primary m-tabs-line--2x" role="tablist" id="myTabs">
                                        <li class="nav-item m-tabs__item">
                                            <a class="nav-link m-tabs__link active show" data-toggle="tab" href="#tpMessages" role="tab" aria-selected="true">
                                                <i class="red ace-icon fa fa-comments bigger-120"></i>
                                                <MAT:Label runat="server" Text="Messages" />
                                            </a>
                                        </li>
                                        <li class="nav-item m-tabs__item">
                                            <a class="nav-link m-tabs__link" data-toggle="tab" href="#tpTicketDetails" role="tab" aria-selected="false">
                                                <i class="blue ace-icon fa fa-ticket bigger-120"></i>
                                                <MAT:Label runat="server" Text="IssueDetails" />
                                            </a>
                                        </li>
                                        <li class="nav-item m-tabs__item">
                                            <a class="nav-link m-tabs__link" data-toggle="tab" href="#tpResolution" role="tab" aria-selected="false">
                                                <i class="green ace-icon fa fa-puzzle-piece bigger-120"></i>
                                                <MAT:Label runat="server" Text="Resolution" />
                                            </a>
                                        </li>
                                        <li class="nav-item m-tabs__item">
                                            <a class="nav-link m-tabs__link" data-toggle="tab" href="#tpActivityLog" role="tab" aria-selected="false">
                                                <i class="orange ace-icon fa fa-history bigger-120"></i>
                                                <MAT:Label runat="server" Text="ActivityLog" />
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="m-portlet__body">
                                <div class="tab-content">
                                    <div class="tab-pane active show" id="tpMessages" role="tabpanel">
                                        <div class="m-portlet">
                                            <div class="m-portlet__head">
                                                <div class="m-portlet__head-caption">
                                                    <div class="m-portlet__head-title">
                                                        <h3 class="m-portlet__head-text">
                                                            <MAT:Literal runat="server" Text="Messages"></MAT:Literal>
                                                        </h3>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="m-portlet__body">
                                                <UserControl:ucMessage ID="ucMessage" runat="server" TicketId='<%# Eval("TicketId") %>' ReadOnly="false" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tpTicketDetails" role="tabpanel">
                                        <div class="m-portlet">
                                            <div class="m-portlet__head">
                                                <div class="m-portlet__head-caption">
                                                    <div class="m-portlet__head-title">
                                                        <h3 class="m-portlet__head-text">
                                                            <MAT:Literal runat="server" Text="Issue Details"></MAT:Literal>
                                                        </h3>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="m-portlet__body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <UserControl:ucCustomFields ID="ucCustomFields" runat="server" FormMode="Edit"
                                                            TicketId='<%# Item.TicketId %>' TicketOwnerUId='<%# Item.TicketOwnerUId %>'
                                                            TicketCategoryCId='<%# Item.TicketCategoryCId %>'
                                                            TicketModel='<%# Item %>' />
                                                    </div>
                                                    <div class="col-md-12">
                                                        <UserControl:ucAttachment runat="server" ID="ucAttachment" Mode="Edit" Title="Attachments"
                                                            DataSet='<%# Item.AttachmentData %>' />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tpResolution" role="tabpanel">
                                        <div class="m-portlet">
                                            <div class="m-portlet__head">
                                                <div class="m-portlet__head-caption">
                                                    <div class="m-portlet__head-title">
                                                        <h3 class="m-portlet__head-text">
                                                            <MAT:Literal runat="server" Text="Resolution"></MAT:Literal>
                                                        </h3>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="m-portlet__body">
                                                <UserControl:ucTicketResolution ID="ucTicketResolution" runat="server" TicketId='<%# Eval("TicketId") %>' ReadOnly="false" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tpActivityLog" role="tabpanel">
                                        <div class="m-portlet">
                                            <div class="m-portlet__head">
                                                <div class="m-portlet__head-caption">
                                                    <div class="m-portlet__head-title">
                                                        <h3 class="m-portlet__head-text">
                                                            <MAT:Literal runat="server" Text="ActivityLog"></MAT:Literal>
                                                        </h3>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="m-portlet__body">
                                                <UserControl:ucTicketHistory ID="ucTicketHistory" runat="server" TicketId='<%# Eval("TicketId") %>' />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </EditItemTemplate>
</MAT:FormView>
