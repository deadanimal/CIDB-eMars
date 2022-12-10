<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.KPIProgress.ProgressPendingApproval.Edit" %>

<%@ Register Src="~/Scorecard/KPIProgress/UserControl/ucScorecardDetails.ascx" TagPrefix="UserControl" TagName="ucScorecardDetails" %>
<%@ Register Src="~/Scorecard/UserControl/ucAttachment.ascx" TagPrefix="UserControl" TagName="ucAttachment" %>
<%@ Register Src="~/Workflow/UserControl/ucWorkflowAction.ascx" TagPrefix="UserControl" TagName="ucWorkflowAction" %>
<%@ Register Src="~/Workflow/UserControl/ucWorkflowInstanceHistory.ascx" TagPrefix="UserControl" TagName="ucWorkflowInstanceHistory" %>
<%@ Register Src="~/Administration/UserControl/ucDataInformation.ascx" TagPrefix="UserControl" TagName="ucDataInformation" %>
<%@ Register Src="~/Scorecard/KPIProgress/UserControl/ProgressBar.ascx" TagPrefix="UserControl" TagName="ProgressBar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave" AssociatedFormViewId="fvParent" CommandName="Update" CausesValidation="false"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" CausesValidation="false" SkinID="ButtonBack" PostBackUrl="Index.aspx"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" SelectMethod="fvParent_SelectItem" DefaultMode="Edit" UpdateMethod="fvParent_UpdateItem"
        ItemType="MAT.App.Scorecard.Scorecard.KpiProgress.ProgressSubmission.KpiProgressSubmissionDetailViewModel" OnDataBound="fvParent_DataBound">
        <EditItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="SubKpi" AssociatedControlID="SubKpiCodeName"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" SkinID="FormValue" ID="SubKpiCodeName"
                                        Text='<%# (string.IsNullOrEmpty(Item.ScorecardKpiCode) ? string.Empty : 
                                                    (Item.ScorecardKpiCode + " " )) + Item.ScorecardKpiName %>'></MAT:Label>
                                    <UserControl:ucScorecardDetails runat="server" ID="ucScorecardDetails" ScorecardKpiId='<%# Item.ScorecardKpiId %>'
                                        ScorecardFrequency='<%# Item.ScorecardFrequency %>' CausesValidation="false" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="EffectiveDate" AssociatedControlID="EffectiveDate"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" SkinID="FormValue" ID="EffectiveDate" Text='<%# Item.EffectiveDate.ToShortDateString() %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Description" AssociatedControlID="Description"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" SkinID="FormValue" ID="Description" Text='<%# Item.Description %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Status" AssociatedControlID="Status"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" SkinID="FormValue" ID="Status" 
                                        Text='<%# (MAT.App.Scorecard.Enumerate.ScorecardKpiDetailStatus)Item.ScorecardKpiDetailStatus %>'></MAT:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <UserControl:ProgressBar runat="server" ID="ProgressBar" kpiProgressSubmissionDetail='<%# kpiProgressSubmissionDetail %>' />

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Period" AssociatedControlID="Period"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="Period" SkinID="FormValue" Text='<%# Item.Period + " " + Item.StartDate.Year.ToString() %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Target" AssociatedControlID="Target"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="Target" SkinID="FormValue" Text='<%# Item.Target ?? 0 %>'></MAT:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Progress" AssociatedControlID="Progress"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Progress" Text='<%# BindItem.Actual %>'
                                        OnTextChanged="Progress_TextChanged" AutoPostBack="true" Mandatory="true" ValidationGroup="SaveProgress"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Performance" AssociatedControlID="Performance"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" SkinID="FormValue" ID="Performance" Style="font-weight: bold;"></MAT:Label>
                                    <a href="#" style="font-size: 18px;">
                                        <i class="ace-icon fa fa-info-circle" data-toggle="modal" data-target="#modalpanel"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="m-accordion m-accordion--default" id="m_accordion_1" role="tablist">
                                <div class="m-accordion__item">
                                    <div class="m-accordion__item-head collapsed" role="tab" id="m_accordion_1_item_1_head" data-toggle="collapse" href="#m_accordion_1_item_1_body" aria-expanded="false">
                                        <span class="m-accordion__item-title">Previous Progress Report</span>
                                    </div>
                                    <div class="m-accordion__item-body collapse" id="m_accordion_1_item_1_body" role="tabpanel" aria-labelledby="m_accordion_1_item_1_head" data-parent="#m_accordion_1" style="">
                                        <div class="m-accordion__item-content">
                                            <asp:Repeater runat="server" ID="rpt" SelectMethod="rpt_GetData">
                                                <ItemTemplate>
                                                    <asp:HiddenField runat="server" ID="scorecardKpiId" Value='<%# Eval("ScorecardKpiId") %>' />
                                                    <asp:HiddenField runat="server" ID="scorecardKpiDetailId" Value='<%# Eval("ScorecardKpiDetailId") %>' />
                                                    <Metronic:LinkButton runat="server" ID="lnkbtn" Text='<%# Eval("ReportName") %>' SkinID="ButtonFreeLink" OnClick="lnkbtn_Click" CausesValidation="false"></Metronic:LinkButton><br />
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="m-portlet">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <h3 class="m-portlet__head-text">
                                <MAT:Literal runat="server" Text="Current Progress Report"></MAT:Literal>
                            </h3>
                        </div>
                    </div>
                    <div class="m-portlet__head-tools">
                        <Metronic:LinkButton runat="server" ID="btnPreview" SkinID="ButtonFreeText" Text="Preview" OnClick="btnPreview_Click" CausesValidation="false"></Metronic:LinkButton>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <asp:DynamicControl runat="server" ID="Note" DataField="Note" Mode="Edit" OnDataBinding="Note_DataBinding" />
                </div>
            </div>

            <div class="tabbable">
                <ul class="nav nav-tabs" role="tablist" id="myTabs">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#Document">Evidences
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#Checklist">Checklist
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#Issue">Issue
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#ActivityLog">Activity Log
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="Document" role="tabpanel">
                        <UserControl:ucAttachment runat="server" ID="ucAttachment" Mode="Edit" Title="Evidences" DataSet='<%# Item.Attachments %>' />
                    </div>
                    <div class="tab-pane" id="Checklist" role="tabpanel">
                        <div class="m-portlet">
                            <div class="m-portlet__body">
                                <div class="row">
                                    <asp:Repeater runat="server" ID="rptKpiChecklist" SelectMethod="rptKpiChecklist_GetData"
                                        ItemType="MAT.App.Scorecard.Scorecard.KpiProgress.ProgressSubmission.KpiChecklistViewModel">
                                        <ItemTemplate>
                                            <div class="col-md-12">
                                                <asp:HiddenField runat="server" ID="hfChecklistId" Value='<%# Item.ScorecardCheckListId %>' />
                                                <asp:HiddenField runat="server" ID="hfIsRequired" Value='<%# Item.IsRequired %>' />
                                                <Metronic:CheckBox runat="server" ID="Checkbox" Text='<%# Item.Name %>' Checked='<%# Item.Checked %>' />
                                                <MAT:Label runat="server" Text="Mandatory" ForeColor="Red"
                                                    Visible='<%# Item.IsRequired %>' Font-Size="X-Small"></MAT:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="Issue" role="tabpanel">
                        <div class="m-portlet">
                            <div class="m-portlet__head">
                                <div class="m-portlet__head-tools">
                                    <Metronic:LinkButton runat="server" ID="btnAddIssue" SkinID="ButtonAdd" OnClick="btnAddIssue_Click" CausesValidation="false"></Metronic:LinkButton>
                                </div>
                            </div>
                            <div class="m-portlet__body">
                                <Metronic:GridView runat="server" ID="gvIssue_Tab" SkinID="Custom" SelectMethod="gvIssue_GetDate"
                                    ItemType="MAT.App.Scorecard.TicketManagement.Ticket.TicketViewModel" OnRowCommand="gvIssue_Tab_RowCommand">
                                    <Columns>
                                        <MAT:TemplateField ItemStyle-Width="20px">
                                            <ItemTemplate>
                                                <Metronic:LinkButton runat="server" ID="btnView" SkinID="ButtonViewIcon" FunctionAccessControlCode="View" CommandName="Select"
                                                    CommandArgument='<%# Item.TicketId %>' CausesValidation="false"></Metronic:LinkButton>
                                            </ItemTemplate>
                                        </MAT:TemplateField>
                                        <MAT:TemplateField HeaderText="IssueNumber" SortExpression="TicketNo">
                                            <ItemTemplate>
                                                <i runat="server" visible='<%# Item.Priority == MAT.App.Scorecard.TicketManagement.Ticket.TicketPriority.High %>' class="ace-icon red fa fa-exclamation bigger-110 icon-only tooltop-error" data-rel="tooltip" data-original-title="High Priority"></i>
                                                <%# Item.TicketNo %>
                                                <i runat="server" visible='<%# Item.AttachmentCount > 0 %>' class="ace-icon blue fa fa-paperclip bigger-110 icon-only"></i>
                                            </ItemTemplate>
                                        </MAT:TemplateField>
                                        <MAT:BoundField HeaderText="KPIRef" DataField="KpiRef"></MAT:BoundField>
                                        <MAT:BoundField HeaderText="IncidentDateTime" DataField="IncidentDateTime"></MAT:BoundField>
                                        <MAT:BoundField HeaderText="Entity" DataField="EntityDesc"></MAT:BoundField>
                                        <MAT:BoundField HeaderText="Status" DataField="TicketStatus"></MAT:BoundField>
                                        <MAT:BoundField HeaderText="IssueOwner" DataField="TicketOwnerUserName"></MAT:BoundField>
                                        <MAT:TemplateField HeaderText="AssignedTo" SortExpression="AssignedToUsername">
                                            <ItemTemplate>
                                                <%# Item.AssignedToUsername %>
                                                <i runat="server" visible='<%# Item.ViewDate.HasValue %>' class="ace-icon fa fa-eye blue bigger-110 icon-only" data-rel="tooltip" data-original-title='<%# Item.ViewDate %>'></i>
                                            </ItemTemplate>
                                        </MAT:TemplateField>
                                        <MAT:BoundField HeaderText="DueDate" DataField="DueDate" DataFormatString="{0:dd/MM/yyyy}"></MAT:BoundField>
                                    </Columns>
                                </Metronic:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="ActivityLog" role="tabpanel">
                        <UserControl:ucWorkflowInstanceHistory runat="server" ID="ucWorkflowInstanceHistory" OwnerId='<%# Item.ScorecardKpiDetailId %>' />
                    </div>
                </div>
            </div>

            <UserControl:ucWorkflowAction runat="server" ID="ucWorkflowAction" WorkflowInstanceDetailId='<%# Item.WorkflowInstanceDetailId %>'
                OnPreAction="ucWorkflowAction_PreAction" OnPostAction="ucWorkflowAction_PostAction"
                Visible='<%# (MAT.App.Workflow.Instance.WorkflowInstanceDetailStatus)Item.WorkflowInstanceDetailStatus == 
                            MAT.App.Workflow.Instance.WorkflowInstanceDetailStatus.Pending %>'
                OnSuccess="ucWorkflowAction_Success" ValidationGroup="SubmitWorkflow" />
        </EditItemTemplate>
    </MAT:FormView>

    <asp:HiddenField ID="TabIndex" runat="server" />

    <UserControl:ucDataInformation runat="server" ID="ucDataInformation" />

    <div class="modal fade" id="modalpanel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="smaller lighter blue no-margin">Performance Calculation
                    </h3>
                    <button id="btnModalClose" type="button" class="close" aria-hidden="true" data-dismiss="modal">×</button>
                </div>
                <div class="modal-body">
                    <ul>
                        <li>Performance = Progress / Target
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
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

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</asp:Content>
