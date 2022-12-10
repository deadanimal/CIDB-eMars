<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.PerformanceScorecard.ChangeRequestPendingApproval.Edit" %>

<%@ Register Src="~/Workflow/UserControl/ucWorkflowAction.ascx" TagName="WorkflowAction" TagPrefix="UserControl" %>
<%@ Register Src="~/Workflow/UserControl/ucWorkflowInstanceHistory.ascx" TagName="WorkflowInstanceHistory" TagPrefix="UserControl" %>
<%@ Register Src="~/Administration/UserControl/ucDataInformation.ascx" TagPrefix="UserControl" TagName="ucDataInformation" %>
<%@ Register Src="~/Scorecard/UserControl/ucAttachment.ascx" TagPrefix="UserControl" TagName="ucAttachment" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave" AssociatedFormViewId="fvChangeRequestApproval" CommandName="Update" ValidationGroup="UpdateChangeRequest"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" CausesValidation="false" SkinID="ButtonBack" PostBackUrl="Index.aspx"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView runat="server" ID="fvChangeRequestApproval" RenderOuterTable="false" DataKeyNames="WorkflowInstanceDetailId" DefaultMode="Edit"
        UpdateMethod="fvChangeRequest_UpdateItem" OnItemUpdating="fvChangeRequestApproval_ItemUpdating" OnDataBound="fvChangeRequestApproval_DataBound"
        SelectMethod="fvChangeRequestApproval_GetItem" ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.ChangeRequest.ChangeRequestViewModel">
        <EditItemTemplate>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" CssClass="col-sm-3 col-form-label" Text="Scorecard" AssociatedControlID="Scorecard"></MAT:Label>
                        <div class="col-sm-9">
                            <MAT:Label runat="server" ID="Scorecard" SkinID="FormValue" Text='<%# Item.ScorecardCodeName %>'></MAT:Label>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" CssClass="col-sm-3 col-form-label" Text="Change To" AssociatedControlID="ChangeTo"></MAT:Label>
                        <div class="col-sm-9">
                            <MAT:Label runat="server" ID="ChangeTo" SkinID="FormValue" Text='<%# Item.ChangeTo %>'></MAT:Label>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" CssClass="col-sm-3 col-form-label" Text="Name" AssociatedControlID="Name"></MAT:Label>
                        <div class="col-sm-9">
                            <MAT:Label runat="server" ID="Name" SkinID="FormValue" Text='<%# Item.OldName %>'></MAT:Label>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" CssClass="col-sm-3 col-form-label" Text="Description" AssociatedControlID="Description"></MAT:Label>
                        <div class="col-sm-9">
                            <MAT:Label runat="server" ID="Description" SkinID="FormValue" Text='<%# Item.OldDescription %>'></MAT:Label>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" CssClass="col-sm-3 col-form-label" Text="Status" AssociatedControlID="Status"></MAT:Label>
                        <div class="col-sm-9">
                            <MAT:Label runat="server" ID="Status" SkinID="FormValue" Text='<%# (MAT.App.Scorecard.Enumerate.KpiChangeRequestStatus)Item.KpiChangeRequestStatus %>'></MAT:Label>
                        </div>
                    </div>
                </div>
            </div>
            <p></p>
            <div class="m-portlet">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <h3 class="m-portlet__head-text">
                                <MAT:Literal runat="server" Text="Change Required"></MAT:Literal>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group m-form__group mat-form-group">
                                <div class="col-sm-4">
                                    <Metronic:CheckBox runat="server" ID="cbName_ChangeRequest" Text="Name" AutoPostBack="true" OnCheckedChanged="cbName_ChangeRequest_CheckedChanged" />
                                </div>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtName_ChangeRequest" placeholder="Enter New Name" Text='<%# Bind("Name") %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <div class="col-sm-4">
                                    <Metronic:CheckBox runat="server" ID="cbDescription_ChangeRequest" Text="Description" AutoPostBack="true" OnCheckedChanged="cbDescription_ChangeRequest_CheckedChanged" />
                                </div>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtDescription_ChangeRequest" placeholder="Enter New Description" TextMode="MultiLine" Rows="3" Text='<%# Bind("Description") %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <div class="col-sm-4">
                                    <Metronic:CheckBox runat="server" ID="cbStatus_ChangeRequest" Text="Status" AutoPostBack="true" OnCheckedChanged="cbStatus_ChangeRequest_CheckedChanged" />
                                </div>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="ddlStatus_ChangeRequest" DataValueField="Key" DataTextField="Value" SelectMethod="ddlStatus_Get" Text='<%# Bind("KpiStatus") %>'>
                                    </Metronic:DropDownList>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <div class="col-sm-12">
                                    <div class="pull-right">
                                        <Metronic:LinkButton ID="btnAddWeightage" runat="server" SkinID="ButtonFreeText" Text="Add Weightage" OnClick="btnAddWeightage_Click" CausesValidation="false" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <div class="col-sm-4">
                                    <Metronic:CheckBox runat="server" ID="cbWeightage_ChangeRequest" Text="Weightage %" AutoPostBack="true" OnCheckedChanged="cbWeightage_ChangeRequest_CheckedChanged" />
                                </div>
                                <div class="col-sm-8">
                                    <asp:Repeater ID="rptWeightage" runat="server" SelectMethod="rptWeightages_Get" OnItemCommand="rptWeightage_ItemCommand" OnPreRender="rptWeightage_PreRender">
                                        <ItemTemplate>
                                            <div class="row">
                                                <div class="col-md-5">
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <Metronic:DropDownList runat="server" ID="ddlKpiPeriodWeightage_ChangeRequest" DataValueField="Key" DataTextField="Value" SelectMethod="ddlKpiPeriodWeightage_Get" AutoPostBack="true"
                                                            OnSelectedIndexChanged="ddlKpiPeriodWeightage_ChangeRequest_SelectedIndexChanged" Text='<%# Eval("ScorecardKpiWeightId") %>'
                                                            Enabled='<%# new Guid(Eval("ScorecardKpiWeightId").ToString()) == Guid.Empty %>'>
                                                        </Metronic:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-5">
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <Metronic:TextBox runat="server" ID="txtWeightage_ChangeRequest" Mandatory="true" Text='<%# Eval("Weight") %>'></Metronic:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <asp:LinkButton ID="btnDelete" Text="Delete" runat="server" CommandName="Delete"
                                                            CommandArgument='<%# Eval("ScorecardKpiWeightId") %>' CausesValidation="false" />
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <div id="divTarget" runat="server" visible='<%# Eval("ScorecardKpiType") != null && (MAT.App.Scorecard.Enumerate.ScorecardKpiType)((byte)Eval("ScorecardKpiType")) == MAT.App.Scorecard.Enumerate.ScorecardKpiType.KPI ? true : false  %>'>
                                <div class="form-group m-form__group mat-form-group">
                                    <div class="col-sm-12">
                                        <div class="pull-right">
                                            <Metronic:LinkButton ID="btnAddTarget" runat="server" SkinID="ButtonFreeText" Text="Add Target" OnClick="btnAddTarget_Click" CausesValidation="false" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group m-form__group mat-form-group">
                                    <div class="col-sm-4">
                                        <Metronic:CheckBox runat="server" ID="cbTarget_ChangeRequest" Text="Target" AutoPostBack="true" OnCheckedChanged="cbTarget_ChangeRequest_CheckedChanged" />
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:Repeater ID="rptTarget" runat="server" SelectMethod="rptTargets_Get" OnItemCommand="rptTarget_ItemCommand" OnPreRender="rptTarget_PreRender">
                                            <ItemTemplate>
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <div class="form-group m-form__group mat-form-group">
                                                            <Metronic:DropDownList runat="server" ID="ddlKpiPeriodTarget_ChangeRequest" DataValueField="Key" DataTextField="Value"
                                                                SelectMethod="ddlKpiPeriodTarget_Get" AutoPostBack="true"
                                                                OnSelectedIndexChanged="ddlKpiPeriodTarget_ChangeRequest_SelectedIndexChanged" Text='<%# Eval("ScorecardKpiDetailId") %>'
                                                                Enabled='<%# new Guid(Eval("ScorecardKpiDetailId").ToString()) == Guid.Empty %>'>
                                                            </Metronic:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <div class="form-group m-form__group mat-form-group">
                                                            <Metronic:TextBox runat="server" ID="txtTarget_ChangeRequest" Mandatory="true" Text='<%# Eval("Target") %>'></Metronic:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="form-group m-form__group mat-form-group">
                                                            <asp:LinkButton ID="btnDelete" Text="Delete" runat="server" CommandName="Delete"
                                                                CommandArgument='<%# Eval("ScorecardKpiDetailId") %>' CausesValidation="false" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <div class="col-sm-4">
                                    <MAT:Label runat="server" Text="Change Date"></MAT:Label>
                                </div>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtChangeDate_ChangeRequest" SkinID="DatePicker" Mandatory="true" Text='<%# Bind("EffectiveDate", "{0:dd/MM/yyyy}") %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <div class="col-sm-4">
                                    <MAT:Label runat="server" Text="Change Remark"></MAT:Label>
                                </div>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtChangeRemark_ChangeRequest" TextMode="MultiLine" Rows="3" Mandatory="true" Text='<%# Bind("Remarks") %>'></Metronic:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <UserControl:ucAttachment runat="server" ID="ucAttachment" Mode="Edit" DataSet='<%# Item.Attachments %>' />
            <UserControl:WorkflowAction ID="ucWorkflowAction" runat="server" WorkflowInstanceDetailId='<%# Eval("WorkflowInstanceDetailId") %>'
                OnPreAction="ucWorkflowAction_PreAction" OnPostAction="ucWorkflowAction_PostAction" OnSuccess="ucWorkflowAction_Success" ValidationGroup="WorkflowAction"
                Visible='<%# Convert.ToInt32(Eval("WorkflowInstanceDetailStatus")) == (int)MAT.App.Workflow.Instance.WorkflowInstanceDetailStatus.Pending %>' />
            <div class="m-portlet--tabs">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-tools">
                        <ul class="nav nav-tabs m-tabs-line m-tabs-line--primary m-tabs-line--2x" role="tablist" id="myTabs">
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link active show" data-toggle="tab" href="#tpChangeRequestChecklist" role="tab" aria-selected="true">
                                    <MAT:Label ID="Label1" runat="server" Text="Change Request Checklist"></MAT:Label>
                                </a>
                            </li>
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#tpActivityLog" role="tab" aria-selected="false">
                                    <MAT:Label ID="Label2" runat="server" Text="ActivityLog"></MAT:Label>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <div class="tab-content">
                        <div class="tab-pane active show" id="tpChangeRequestChecklist" role="tabpanel">
                            <div class="m-portlet">
                                <div class="m-portlet__head">
                                    <div class="m-portlet__head-caption">
                                        <div class="m-portlet__head-title">
                                            <h3 class="m-portlet__head-text">
                                                <MAT:Literal runat="server" Text="Change Request Checklist"></MAT:Literal>
                                            </h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="m-portlet__body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group m-form__group mat-form-group">
                                                <div class="col-sm-4">
                                                    <MAT:Label runat="server" Text="KPI Checklist" />
                                                </div>
                                                <div class="col-sm-8">
                                                    <div class="m-checkbox-list">
                                                        <asp:Repeater ID="rptScorecardCheckList" runat="server" SelectMethod="ScorecardCheckList_Get">
                                                            <ItemTemplate>
                                                                <Metronic:CheckBox ID="chkScorecardCheckList" runat="server" AccessKey='<%# Eval("Key") %>' Text='<%# Eval("Value") %>' Checked="true" Enabled="false"></Metronic:CheckBox>
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
                                    <UserControl:WorkflowInstanceHistory ID="ucWorkflowInstanceHistory" runat="server" OwnerId='<%# Eval("KpiChangeRequestId") %>' />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <UserControl:ucDataInformation runat="server" ID="ucDataInformation" TableName="KpiChangeRequest" PrimaryKeyName="KpiChangeRequestId" PrimaryKeyValue='<%# Item.KpiChangeRequestId %>' />
        </EditItemTemplate>
    </MAT:FormView>
    <asp:HiddenField ID="TabIndex" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
    <%--use to keep tab index--%>
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
