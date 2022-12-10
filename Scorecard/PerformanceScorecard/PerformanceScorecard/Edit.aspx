<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.PerformanceScorecard.PerformanceScorecard.Edit" %>

<%@ Register Src="~/WebControls/ColorPicker.ascx" TagPrefix="UserControl" TagName="ColorPicker" %>
<%@ Register Src="~/Workflow/UserControl/ucWorkflowInstanceHistory.ascx" TagPrefix="UserControl" TagName="ucWorkflowInstanceHistory" %>
<%@ Register Src="~/Scorecard/PerformanceScorecard/UserControl/ucUpdateScorecardKpi.ascx" TagPrefix="UserControl" TagName="ucUpdateScorecardKpi" %>
<%@ Register Src="~/Scorecard/PerformanceScorecard/UserControl/ucActivityLog.ascx" TagPrefix="UserControl" TagName="ucActivityLog" %>
<%@ Register Src="~/Administration/UserControl/ucDataInformation.ascx" TagPrefix="UserControl" TagName="ucDataInformation" %>
<%@ Register Src="~/Scorecard/UserControl/ucInitiativeStruct.ascx" TagPrefix="UserControl" TagName="ucInitiativeStruct" %>
<%@ Register Src="~/Scorecard/UserControl/ucPerformanceIndicator.ascx" TagPrefix="UserControl" TagName="ucPerformanceIndicator" %>
<%@ Register Src="~/Scorecard/UserControl/ucChecklist.ascx" TagPrefix="UserControl" TagName="ucChecklist" %>
<%@ Register Src="~/Scorecard/UserControl/ucSchedule.ascx" TagPrefix="UserControl" TagName="ucSchedule" %>
<%@ Register Src="~/Scorecard/UserControl/ucInitiativeDetail.ascx" TagPrefix="UserControl" TagName="ucInitiativeDetail" %>
<%@ Register Src="~/Scorecard/UserControl/ucKpiDetail.ascx" TagPrefix="UserControl" TagName="ucKpiDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .rbl table {
            display: inline;
        }

        .rbl tbody {
            display: inline;
        }

        .rbl tr {
            display: inline;
        }

        .rbl td {
            display: inline;
        }
        /*@media only screen and (min-width: 576px) {*/
        .jstree-anchor {
            white-space: nowrap;
            width: 100%;
            overflow: hidden;
            text-overflow: ellipsis;
            display: inline-block;
        }
        /*}*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Edit" CommandName="Update" ValidationGroup="SaveFormView" />
    <Metronic:LinkButton runat="server" ID="btnBack" SkinID="ButtonBack" OnClick="btnBack_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DefaultMode="Edit" SelectMethod="fvParent_SelectItem" UpdateMethod="fvParent_UpdateItem" ItemType="MAT.App.Scorecard.Scorecard.Shared.ScorecardViewModel">
        <EditItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Code" AssociatedControlID="Code"></MAT:Label>
                                <div class="col-sm-8">
                                    <div runat="server" visible='<%# Item.Status != (byte)MAT.App.Scorecard.Enumerate.ScorecardStatus.Draft %>'>
                                        <MAT:Label runat="server" SkinID="FormValue" Text='<%# Item.Code %>'></MAT:Label>
                                    </div>
                                    <div runat="server" visible='<%# Item.Status == (byte)MAT.App.Scorecard.Enumerate.ScorecardStatus.Draft %>'>
                                        <Metronic:TextBox runat="server" ID="Code" Text='<%# BindItem.Code %>'></Metronic:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name"></MAT:Label>
                                <div class="col-sm-8">
                                    <div runat="server" visible='<%# Item.Status == (byte)MAT.App.Scorecard.Enumerate.ScorecardStatus.Confirmed %>'>
                                        <MAT:Label runat="server" SkinID="FormValue" Text='<%# Item.Name %>'></MAT:Label>
                                    </div>
                                    <div runat="server" visible='<%# Item.Status == (byte)MAT.App.Scorecard.Enumerate.ScorecardStatus.Draft 
                                            || Item.Status == (byte)MAT.App.Scorecard.Enumerate.ScorecardStatus.Reopened
                                            || Item.Status == (byte)MAT.App.Scorecard.Enumerate.ScorecardStatus.Rework %>'>
                                        <Metronic:TextBox runat="server" ID="Name" Text='<%# BindItem.Name %>' MaxLength="200" Mandatory="true" ValidationGroup="SaveFormView"></Metronic:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Frequency" AssociatedControlID="ddlFrequency"></MAT:Label>
                                <div class="col-sm-8">
                                    <div runat="server" visible='<%# Item.Status != (byte)MAT.App.Scorecard.Enumerate.ScorecardStatus.Draft %>'>
                                        <MAT:Label runat="server" SkinID="FormValue" Text='<%# (MAT.App.Scorecard.Enumerate.ScorecardFrequency)Item.Frequency %>'></MAT:Label>
                                    </div>
                                    <div runat="server" visible='<%# Item.Status == (byte)MAT.App.Scorecard.Enumerate.ScorecardStatus.Draft %>'>
                                        <Metronic:DropDownList runat="server" ID="ddlFrequency" SelectMethod="Frequency_Get" DataTextField="Value" DataValueField="Key" Text='<%# Item.Frequency %>' Mandatory="true" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Period" AssociatedControlID="StartDate"></MAT:Label>
                                <div class="col-sm-8">
                                    <div runat="server" visible='<%# Item.Status != (byte)MAT.App.Scorecard.Enumerate.ScorecardStatus.Draft %>'>
                                        <MAT:Label runat="server" SkinID="FormValue" Text='<%# Item.StartDate.ToShortDateString() %>'></MAT:Label>
                                        <span class="col-form-value" style="padding-left: 10px; padding-right: 10px;">To</span>
                                        <MAT:Label runat="server" SkinID="FormValue" Text='<%# Item.EndDate.ToShortDateString() %>'></MAT:Label>
                                    </div>
                                    <div runat="server" class="input-daterange input-group" visible='<%# Item.Status == (byte)MAT.App.Scorecard.Enumerate.ScorecardStatus.Draft %>'>
                                        <Metronic:TextBox runat="server" ID="StartDate" SkinID="DatePicker" Text='<%# Item.StartDate.ToShortDateString() %>' Mandatory="true" AutoPostBack="true" OnTextChanged="StartDate_TextChanged" />
                                        <div class="input-group-append">
                                            <span class="input-group-text">
                                                <i class="la la-ellipsis-h"></i>
                                            </span>
                                        </div>
                                        <Metronic:TextBox runat="server" ID="EndDate" SkinID="DatePicker" Text='<%# Item.EndDate.ToShortDateString() %>' Mandatory="true" AutoPostBack="true" OnTextChanged="EndDate_TextChanged" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Status" AssociatedControlID="Status"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="Status" SkinID="FormValue" Text='<%# (MAT.App.Scorecard.Enumerate.ScorecardStatus)Item.Status %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Objective" AssociatedControlID="Objective"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Objective" TextMode="MultiLine" Text='<%# BindItem.Objectives %>' ValidationGroup="SaveFormView"></Metronic:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="tabbable">
                <ul class="nav nav-tabs" role="tablist" id="myTabs">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#tabs-Settings">Settings                      
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#tabs-PerformanceIndicator">Key Performance Indicator
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#tabs-ActivityLog">Activity Log
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active show" id="tabs-Settings" role="tabpanel">
                        <div class="m-portlet">
                            <div class="m-portlet__body">
                                <div class="m-section">
                                    <h3 class="m-section__heading">Initiative Structure</h3>
                                    <div class="m-section__content">
                                        <div class="m-demo">
                                            <div class="m-demo__preview">
                                                <UserControl:ucInitiativeStruct runat="server" ID="ucInitiativeStruct" ReadOnly="false" ScorecardId='<%# Item.ScorecardId %>' />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="m-section">
                                    <h3 class="m-section__heading">Performance Indicator</h3>
                                    <div class="m-section__content">
                                        <div class="m-demo">
                                            <div class="m-demo__preview">
                                                <UserControl:ucPerformanceIndicator runat="server" ID="ucPerformanceIndicator" ReadOnly="false" ScorecardId='<%# Item.ScorecardId %>' />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="m-section">
                                    <h3 class="m-section__heading">KPI Coding Standard</h3>
                                    <div class="m-section__content">
                                        <div class="m-demo__perview">
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <MAT:Label runat="server" SkinID="FormLabel" Text="CodingStandard" AssociatedControlID="KPICodingStandard"></MAT:Label>
                                                        <div class="col-sm-8">
                                                            <Metronic:DropDownList runat="server" ID="KPICodingStandard" SelectMethod="CodingStandard_Get" DataTextField="Value" DataValueField="Key"
                                                                CausesValidation="false" AutoPostBack="true" OnSelectedIndexChanged="KPICodingStandard_SelectedIndexChanged"
                                                                Text='<%# Item.CodeFactoryType %>'>
                                                            </Metronic:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group m-form__group mat-form-group" runat="server" id="KpiCS" visible="false">
                                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Prefix" AssociatedControlID="KpiCSPrefix"></MAT:Label>
                                                        <div class="col-sm-8">
                                                            <Metronic:TextBox runat="server" ID="KpiCSPrefix" Text='<%# BindItem.RunningNoPrefix %>'></Metronic:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="m-section">
                                    <h3 class="m-section__heading">KPI Checklist</h3>
                                    <div class="m-section__content">
                                        <div class="m-demo">
                                            <div class="m-demo__preview">
                                                <UserControl:ucChecklist runat="server" ID="ucKpiChecklist" ReadOnly="false" ScorecardId='<%# Item.ScorecardId %>'
                                                    ChecklistType='<%# MAT.App.Scorecard.Enumerate.ChecklistType.KpiProgress %>' ValidationGroup="KpiChecklist" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="m-section">
                                    <h3 class="m-section__heading">Number of Evidences</h3>
                                    <div class="m-section__content">
                                        <div class="m-demo__perview">
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Value" AssociatedControlID="NoOfEvidences"></MAT:Label>
                                                        <div class="col-sm-8">
                                                            <Metronic:TextBox runat="server" ID="NoOfEvidences" Text='<%# BindItem.NoOfEvidences %>'></Metronic:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="m-section">
                                    <h3 class="m-section__heading">Change Request Checklist</h3>
                                    <div class="m-section__content">
                                        <div class="m-demo">
                                            <div class="m-demo__preview">
                                                <UserControl:ucChecklist runat="server" ID="ucChangeRequestChecklist" ReadOnly="false" ScorecardId='<%# Item.ScorecardId %>'
                                                    ChecklistType='<%# MAT.App.Scorecard.Enumerate.ChecklistType.ScorecardChangeRequest %>' ValidationGroup="ChangeRequestChecklist" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <UserControl:ucSchedule runat="server" ID="ucSchedule" ReadOnly="false"
                                    ScorecardId='<%# Item.ScorecardId %>' ScorecardFrequency='<%# ScorecardFrequency %>' />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tabs-PerformanceIndicator" role="tabpanel">
                        <div class="m-portlet">
                            <div class="m-portlet__head">
                                <div class="m-portlet__head-tools">
                                    <Metronic:LinkButton runat="server" ID="btnAddInitiative" SkinID="ButtonFreeText" Text="AddInitiative"
                                        OnClick="btnAddInitiative_Click" CausesValidation="false"></Metronic:LinkButton>
                                    <Metronic:LinkButton runat="server" ID="btnAddKpi" SkinID="ButtonFreeText" Text="AddKpi"
                                        OnClick="btnAddKpi_Click" CausesValidation="false" Visible="false"></Metronic:LinkButton>
                                </div>
                            </div>
                            <div class="m-portlet__body">
                                <div class="row">
                                    <div class="col-md-3 col-xs-12">
                                        <div class="my-4">
                                            <asp:UpdatePanel runat="server" ID="upTree">
                                                <ContentTemplate>
                                                    <div id="jstree_data"></div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <asp:TextBox ID="selected_kpi" runat="server" Style="visibility: hidden" />
                                        </div>
                                    </div>
                                    <div class="col-md-9 col-xs-12">
                                        <UserControl:ucInitiativeDetail runat="server" ID="ucInitiativeDetail" Visible="false" OnChanged="ucInitiativeDetail_Changed" />
                                        <UserControl:ucKpiDetail runat="server" ID="ucKpiDetail" Visible="false" OnChanged="ucKpiDetail_Changed" OnDeleted="ucKpiDetail_Deleted" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tabs-ActivityLog" role="tabpanel">
                        <UserControl:ucActivityLog runat="server" ID="ucActivityLog" ScorecardId='<%# Item.ScorecardId %>' />
                        <UserControl:ucWorkflowInstanceHistory runat="server" ID="ucWorkflowInstanceHistory" OwnerId='<%# Item.ScorecardId %>' />
                    </div>
                </div>
            </div>
            <UserControl:ucDataInformation runat="server" ID="ucDataInformation" TableName="Scorecard" PrimaryKeyName="ScorecardId" PrimaryKeyValue='<%# Item.ScorecardId %>' />
        </EditItemTemplate>
    </MAT:FormView>
    <asp:LinkButton ID="lnkPostback" runat="server" OnClick="lnkPostback_Click" Style="visibility: hidden" CausesValidation="false">For Tree List</asp:LinkButton>
    <asp:HiddenField ID="TabIndex" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
    <script type="text/javascript">

        // <%= ClientScript.GetPostBackClientHyperlink(lnkPostback,"test") %>

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
