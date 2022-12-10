<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucKpiDetail.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.UserControl.ucKpiDetail" %>

<%@ Register Src="~/Scorecard/UserControl/ucWeight.ascx" TagPrefix="UserControl" TagName="ucWeight" %>
<%@ Register Src="~/Scorecard/UserControl/ucTarget.ascx" TagPrefix="UserControl" TagName="ucTarget" %>
<%@ Register Src="~/Scorecard/PerformanceScorecard/UserControl/ucUpdateScorecardKpi.ascx" TagPrefix="UserControl" TagName="ucUpdateScorecardKpi" %>

<asp:UpdatePanel runat="server" ID="upfv" UpdateMode="Conditional">
    <ContentTemplate>
        <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false"
            OnPreRender="fvParent_PreRender" DefaultMode="Edit"
            SelectMethod="fvParent_SelectItem" DeleteMethod="fvParent_DeleteItem"
            InsertMethod="fvParent_InsertItem" UpdateMethod="fvParent_UpdateItem"
            ItemType="MAT.App.Scorecard.Scorecard.Shared.KpiViewModel">
            <InsertItemTemplate>
                <div class="m-portlet">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <h3 class="m-portlet__head-text">Add KPI</h3>
                            </div>
                        </div>
                        <div class="m-portlet__head-tools">
                            <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave" CommandName="Insert" ValidationGroup="Kpi"></Metronic:FormViewButton>
                        </div>
                    </div>
                    <div class="m-portlet__body">
                        <div class="m-section">
                            <h3 class="m-section__heading">Info
                            </h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="StartDate" SkinID="FormLabel" AssociatedControlID="EffectiveDate"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:TextBox runat="server" ID="EffectiveDate" SkinID="DatePicker" Text='<%# BindItem.EffectiveDate %>'></Metronic:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group" runat="server" id="divCode" visible="false">
                                                    <MAT:Label runat="server" Text="Code" SkinID="FormLabel" AssociatedControlID="Code"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:TextBox runat="server" ID="Code" Text='<%# BindItem.Code %>'></Metronic:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Name" SkinID="FormLabel" AssociatedControlID="Name"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:TextBox runat="server" ID="Name" Text='<%# BindItem.Name %>' MaxLength="4000" Mandatory="true" ValidationGroup="Kpi"></Metronic:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="ReportTitle" SkinID="FormLabel" AssociatedControlID="ReportTitle"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:TextBox runat="server" ID="ReportTitle" Text='<%# BindItem.ReportTitle %>' MaxLengt="50"></Metronic:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Description" SkinID="FormLabel" AssociatedControlID="Description"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:TextBox runat="server" ID="Description" Text='<%# BindItem.Description %>' MaxLength="500"></Metronic:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="m-section">
                            <h3 class="m-section__heading">Responsible</h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="KpiLeader" SkinID="FormLabel" AssociatedControlID="KpiLeader"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:DropDownList runat="server" ID="KpiLeader" DataTextField="Value" DataValueField="Key"
                                                            SelectMethod="Entity_Get" Text='<%# BindItem.KpiLeaderEId %>' Mandatory="true" ValidationGroup="Kpi">
                                                        </Metronic:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Owner" SkinID="FormLabel" AssociatedControlID="Owner"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:DropDownList runat="server" ID="Owner" DataTextField="Value" DataValueField="Key"
                                                            SelectMethod="User_Get" Text='<%# BindItem.OwnerUId %>' Mandatory="true" ValidationGroup="Kpi">
                                                        </Metronic:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="OIC" SkinID="FormLabel" AssociatedControlID="OIC"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:DropDownList runat="server" ID="OIC" DataTextField="Value" DataValueField="Key"
                                                            SelectMethod="User_Get" Text='<%# BindItem.OICUId %>' Mandatory="true" ValidationGroup="Kpi">
                                                        </Metronic:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="PMO" SkinID="FormLabel" AssociatedControlID="PMO"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:DropDownList runat="server" ID="PMO" DataTextField="Value" DataValueField="Key"
                                                            SelectMethod="User_Get" Text='<%# BindItem.PMOUId %>' Mandatory="true" ValidationGroup="Kpi">
                                                        </Metronic:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="m-section">
                            <h3 class="m-section__heading">Others</h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Unit" SkinID="FormLabel" AssociatedControlID="Unit"></MAT:Label>
                                                    <div class="col-md-8">
                                                        <Metronic:DropDownList runat="server" ID="Unit" DataValueField="Key" DataTextField="Value"
                                                            SelectMethod="Unit_Get" Text='<%# BindItem.Unit %>'>
                                                        </Metronic:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="PerformanceScore" SkinID="FormLabel" AssociatedControlID="PerformanceScore"></MAT:Label>
                                                    <div class="col-md-8">
                                                        <Metronic:DropDownList runat="server" ID="PerformanceScore" DataValueField="Key" DataTextField="Value"
                                                            SelectMethod="CalculationType_Get" Text='<%# BindItem.CalculationType %>'>
                                                        </Metronic:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="PerformanceIndicator" SkinID="FormLabel" AssociatedControlID="PerformanceIndicator"></MAT:Label>
                                                    <div class="col-md-8">
                                                        <Metronic:DropDownList runat="server" ID="PerformanceIndicator" DataValueField="Key" DataTextField="Value"
                                                            SelectMethod="ScoreType_Get" Text='<%# BindItem.ScoreType %>'>
                                                        </Metronic:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="m-section">
                            <h3 class="m-section__heading">Weight %</h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Applicable" SkinID="FormLabel" AssociatedControlID="WeightApplicable"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:CheckBox runat="server" ID="WeightApplicable" Checked="false"
                                                            OnCheckedChanged="WeightApplicable_CheckedChanged" AutoPostBack="true" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <UserControl:ucWeight runat="server" ID="ucWeight" ScorecardFrequency='<%# ScorecardFrequency %>'
                                            ScorecardId='<%# ScorecardId %>' FormViewMode="Insert" Visible="false" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="m-section">
                            <h3 class="m-section__heading">Target</h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Applicable" SkinID="FormLabel" AssociatedControlID="TargetApplicable"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:CheckBox runat="server" ID="TargetApplicable" Checked="false"
                                                            OnCheckedChanged="TargetApplicable_CheckedChanged" AutoPostBack="true" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <UserControl:ucTarget runat="server" ID="ucTarget" ScorecardFrequency='<%# ScorecardFrequency %>'
                                            ScorecardId='<%# ScorecardId %>' FormViewMode="Insert" Visible="false" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </InsertItemTemplate>
            <EditItemTemplate>
                <div class="m-portlet">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <h3 class="m-portlet__head-text">
                                    <MAT:Literal runat="server" Text="Edit KPI"></MAT:Literal>
                                </h3>
                            </div>
                        </div>
                        <div class="m-portlet__head-tools">
                            <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave" CommandName="Update" ValidationGroup="Kpi"></Metronic:FormViewButton>
                            <Metronic:FormViewButton runat="server" ID="btnDelete" SkinID="ButtonDelete" CommandName="Delete" CausesValidation="false"></Metronic:FormViewButton>
                        </div>
                    </div>
                    <div class="m-portlet__body">
                        <div class="m-section">
                            <h3 class="m-section__heading">Info
                            </h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="StartDate" SkinID="FormLabel" AssociatedControlID="EffectiveDate"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <div runat="server" visible='<%# Item.ReadOnly %>'>
                                                            <MAT:Label runat="server" ID="EffectiveDate" SkinID="FormValue" Text='<%# Item.EffectiveDate.ToShortDateString() %>'></MAT:Label>
                                                            <div class="pull-right" runat="server" visible='<%# !Item.HasSubmission %>'>
                                                                <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiStartDate" ScorecardKpiId='<%# Item.ScorecardKpiId %>'
                                                                    FieldType="StartDate" OldValue='<%# Item.EffectiveDate.ToShortDateString() %>' OnSaved="ucUpdateScorecardKpi_Saved" />
                                                            </div>
                                                        </div>
                                                        <div runat="server" visible='<%# !Item.ReadOnly %>'>
                                                            <Metronic:TextBox runat="server" ID="EffectiveDate_Edit" SkinID="DatePicker" Text='<%# Item.EffectiveDate.ToShortDateString() %>'
                                                                Mandatory="true" ValidationGroup="Kpi"></Metronic:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group" runat="server" id="divCode">
                                                    <MAT:Label runat="server" Text="Code" SkinID="FormLabel" AssociatedControlID="Code"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <div runat="server" visible='<%# Item.ReadOnly %>'>
                                                            <MAT:Label runat="server" ID="Code" SkinID="FormValue" Text='<%# Item.Code %>' Visible='<%# Item.ReadOnly %>'></MAT:Label>
                                                            <div class="pull-right" runat="server" visible='<%# this.CodeFactoryType == MAT.App.Scorecard.Enumerate.CodeFactoryType.Manual %>'>
                                                                <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiCode" ScorecardKpiId='<%# Item.ScorecardKpiId %>'
                                                                    FieldType="KpiCode" OldValue='<%# Item.Code %>' OnSaved="ucUpdateScorecardKpi_Saved" />
                                                            </div>
                                                        </div>
                                                        <div runat="server" visible='<%# !Item.ReadOnly %>'>
                                                            <Metronic:TextBox runat="server" ID="Code_Edit" Text='<%# BindItem.Code %>' ValidationGroup="Kpi"></Metronic:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Name" SkinID="FormLabel" AssociatedControlID="Name"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <div runat="server" visible='<%# Item.ReadOnly %>'>
                                                            <MAT:Label runat="server" ID="Name" SkinID="FormValue" Text='<%# Item.Name %>'></MAT:Label>
                                                            <div class="pull-right">
                                                                <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiName" ScorecardKpiId='<%# Item.ScorecardKpiId %>'
                                                                    FieldType="Name" OldValue='<%# Item.Name %>' OnSaved="ucUpdateScorecardKpi_Saved" />
                                                            </div>
                                                        </div>
                                                        <div runat="server" visible='<%# !Item.ReadOnly %>'>
                                                            <Metronic:TextBox runat="server" ID="Name_Edit" Text='<%# BindItem.Name %>' Mandatory="true" ValidationGroup="Kpi"></Metronic:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="ReportTitle" SkinID="FormLabel" AssociatedControlID="ReportTitle"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <div runat="server" visible='<%# Item.ReadOnly %>'>
                                                            <MAT:Label runat="server" ID="ReportTitle" SkinID="FormValue" Text='<%# Item.ReportTitle %>'></MAT:Label>
                                                            <div class="pull-right">
                                                                <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiReportTitle" ScorecardKpiId='<%# Item.ScorecardKpiId %>'
                                                                    FieldType="KpiReportTitle" OldValue='<%# Item.ReportTitle %>' OnSaved="ucUpdateScorecardKpi_Saved" />
                                                            </div>
                                                        </div>
                                                        <div runat="server" visible='<%# !Item.ReadOnly %>'>
                                                            <Metronic:TextBox runat="server" ID="ReportTitle_Edit" Text='<%# BindItem.ReportTitle %>' ValidationGroup="Kpi"></Metronic:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Description" SkinID="FormLabel" AssociatedControlID="Description"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <div runat="server" visible='<%# Item.ReadOnly %>'>
                                                            <MAT:Label runat="server" ID="Description" SkinID="FormValue" Text='<%# Item.Description %>'></MAT:Label>
                                                            <div class="pull-right">
                                                                <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiDescription" ScorecardKpiId='<%# Item.ScorecardKpiId %>'
                                                                    FieldType="Description" OldValue='<%# Item.Description %>' OnSaved="ucUpdateScorecardKpi_Saved" />
                                                            </div>
                                                        </div>
                                                        <div runat="server" visible='<%# !Item.ReadOnly %>'>
                                                            <Metronic:TextBox runat="server" ID="Description_Edit" Text='<%# BindItem.Description %>' ValidationGroup="Kpi"></Metronic:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Status" SkinID="FormLabel" AssociatedControlID="Status"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <div runat="server" visible='<%# Item.ReadOnly %>'>
                                                            <MAT:Label runat="server" ID="Status" SkinID="FormValue" Text='<%# (MAT.App.Scorecard.Enumerate.KpiStatus)Item.KpiStatus %>'></MAT:Label>
                                                            <div class="pull-right">
                                                                <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiSStatus" ScorecardKpiId='<%# Item.ScorecardKpiId %>'
                                                                    FieldType="KpiStatus" OldValue='<%# Item.KpiStatus %>' OnSaved="ucUpdateScorecardKpi_Saved" />
                                                            </div>
                                                        </div>
                                                        <div runat="server" visible='<%# !Item.ReadOnly %>'>
                                                            <Metronic:DropDownList runat="server" ID="Stats_Edit" DataValueField="Key" DataTextField="Value"
                                                                SelectMethod="Status_Get" Text='<%# BindItem.KpiStatus %>'>
                                                            </Metronic:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="m-section">
                            <h3 class="m-section__heading">Responsible</h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="KpiLeader" SkinID="FormLabel" AssociatedControlID="KpiLeader"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <div runat="server" visible='<%# Item.ReadOnly %>'>
                                                            <MAT:Label runat="server" ID="KpiLeader" SkinID="FormValue" Text='<%# GetEntityDisplayName(Item.KpiLeaderEId) %>'></MAT:Label>
                                                            <div class="pull-right">
                                                                <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiLeader" ScorecardKpiId='<%# Item.ScorecardKpiId %>'
                                                                    FieldType="KpiLeader" OldValue='<%# Item.KpiLeaderEId %>' OnSaved="ucUpdateScorecardKpi_Saved" />
                                                            </div>
                                                        </div>
                                                        <div runat="server" visible='<%# !Item.ReadOnly %>'>
                                                            <Metronic:DropDownList runat="server" ID="KpiLeader_Edit" DataTextField="Value" DataValueField="Key"
                                                                SelectMethod="Entity_Get" Text='<%# BindItem.KpiLeaderEId %>'>
                                                            </Metronic:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Owner" SkinID="FormLabel" AssociatedControlID="Owner"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <div runat="server" visible='<%# Item.ReadOnly %>'>
                                                            <MAT:Label runat="server" ID="Owner" SkinID="FormValue" Text='<%# GetDisplayName(Item.OwnerUId) %>'></MAT:Label>
                                                            <div class="pull-right">
                                                                <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiOwner" ScorecardKpiId='<%# Item.ScorecardKpiId %>'
                                                                    FieldType="KpiOwner" OldValue='<%# Item.OwnerUId %>' OnSaved="ucUpdateScorecardKpi_Saved" />
                                                            </div>
                                                        </div>
                                                        <div runat="server" visible='<%# !Item.ReadOnly %>'>
                                                            <Metronic:DropDownList runat="server" ID="Owner_Edit" DataTextField="Value" DataValueField="Key"
                                                                SelectMethod="User_Get" Text='<%# BindItem.OwnerUId %>'>
                                                            </Metronic:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="OIC" SkinID="FormLabel" AssociatedControlID="OIC"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <div runat="server" visible='<%# Item.ReadOnly %>'>
                                                            <MAT:Label runat="server" ID="OIC" SkinID="FormValue" Text='<%# GetDisplayName(Item.OICUId) %>'></MAT:Label>
                                                            <div class="pull-right">
                                                                <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiOIC" ScorecardKpiId='<%# Item.ScorecardKpiId %>'
                                                                    FieldType="KpiOic" OldValue='<%# Item.OICUId %>' OnSaved="ucUpdateScorecardKpi_Saved" />
                                                            </div>
                                                        </div>
                                                        <div runat="server" visible='<%# !Item.ReadOnly %>'>
                                                            <Metronic:DropDownList runat="server" ID="OIC_Edit" DataTextField="Value" DataValueField="Key"
                                                                SelectMethod="User_Get" Text='<%# BindItem.OICUId %>'>
                                                            </Metronic:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="PMO" SkinID="FormLabel" AssociatedControlID="PMO"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <div runat="server" visible='<%# Item.ReadOnly %>'>
                                                            <MAT:Label runat="server" ID="PMO" SkinID="FormValue" Text='<%# GetDisplayName(Item.PMOUId) %>'></MAT:Label>
                                                            <div class="pull-right">
                                                                <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiPMO" ScorecardKpiId='<%# Item.ScorecardKpiId %>'
                                                                    FieldType="KpiPmo" OldValue='<%# Item.PMOUId %>' OnSaved="ucUpdateScorecardKpi_Saved" />
                                                            </div>
                                                        </div>
                                                        <div runat="server" visible='<%# !Item.ReadOnly %>'>
                                                            <Metronic:DropDownList runat="server" ID="PMO_Edit" DataTextField="Value" DataValueField="Key"
                                                                SelectMethod="User_Get" Text='<%# BindItem.PMOUId %>'>
                                                            </Metronic:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="m-section">
                            <h3 class="m-section__heading">Others</h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Unit" SkinID="FormLabel" AssociatedControlID="Unit"></MAT:Label>
                                                    <div class="col-md-8">
                                                        <div runat="server" visible='<%# Item.ReadOnly %>'>
                                                            <MAT:Label runat="server" ID="Unit" SkinID="FormValue" Text='<%# Item.Unit.HasValue ? 
                                                            ((MAT.App.Scorecard.Enumerate.ScorecardUnit)Item.Unit.Value).ToString() : string.Empty %>'></MAT:Label>
                                                        </div>
                                                        <div runat="server" visible='<%# !Item.ReadOnly %>'>
                                                            <Metronic:DropDownList runat="server" ID="Unit_Edit" DataTextField="Value" DataValueField="Key"
                                                                SelectMethod="Unit_Get" Text='<%# BindItem.Unit %>'>
                                                            </Metronic:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="PerformanceScore" SkinID="FormLabel" AssociatedControlID="PerformanceScore"></MAT:Label>
                                                    <div class="col-md-8">
                                                        <div runat="server" visible='<%# Item.ReadOnly %>'>
                                                            <MAT:Label runat="server" ID="PerformanceScore" SkinID="FormValue" Text='<%# Item.CalculationType.HasValue ? 
                                                        ((MAT.App.Scorecard.Enumerate.CalculationType)Item.CalculationType.Value).ToString() : string.Empty %>'></MAT:Label>
                                                        </div>
                                                        <div runat="server" visible='<%# !Item.ReadOnly %>'>
                                                            <Metronic:DropDownList runat="server" ID="PerformanceScore_Edit" DataTextField="Value" DataValueField="Key"
                                                                SelectMethod="CalculationType_Get" Text='<%# BindItem.CalculationType %>'>
                                                            </Metronic:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="PerformanceIndicator" SkinID="FormLabel" AssociatedControlID="PerformanceIndicator"></MAT:Label>
                                                    <div class="col-md-8">
                                                        <div runat="server" visible='<%# Item.ReadOnly %>'>
                                                            <MAT:Label runat="server" ID="PerformanceIndicator" SkinID="FormValue" Text='<%# Item.ScoreType.HasValue ? 
                                                        ((MAT.App.Scorecard.Enumerate.ScoreType)Item.ScoreType.Value).ToString() : string.Empty %>'></MAT:Label>
                                                        </div>
                                                        <div runat="server" visible='<%# !Item.ReadOnly %>'>
                                                            <Metronic:DropDownList runat="server" ID="PerformanceIndicator_Edit" DataTextField="Value" DataValueField="Key"
                                                                SelectMethod="ScoreType_Get" Text='<%# BindItem.ScoreType %>'>
                                                            </Metronic:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="m-section">
                            <h3 class="m-section__heading">Weight %</h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <div class="pull-right" runat="server" visible='<%# Item.ReadOnly %>'>
                                            <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiWeight" ScorecardKpiId='<%# Item.ScorecardKpiId %>'
                                                FieldType="Weight" ScorecardKpiWeightDetailsList='<%# Item.WeightList %>' ScorecardFrequency='<%# ScorecardFrequency %>'
                                                ScorecardStartDate='<%# Item.ScorecardStartDate %>' ScorecardEndDate='<%# Item.ScorecardEndDate %>' KpiStartDate='<%# Item.KpiStartDate %>'
                                                ScorecardStatus='<%# Item.ScorecardStatus %>' OnSaved="ucUpdateScorecardKpiWeight_Saved" />
                                        </div>
                                        <div class="row" runat="server">
                                            <div class="col-md-6">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Applicable" SkinID="FormLabel" AssociatedControlID="WeightApplicable"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:CheckBox runat="server" ID="WeightApplicable" Checked='<%# Item.WeightList.Count > 0 %>'
                                                            OnCheckedChanged="WeightApplicable_CheckedChanged" AutoPostBack="true" Visible='<%# !Item.ReadOnly %>' />
                                                        <MAT:Label runat="server" SkinID="FormValue" Text='<%# Item.WeightList.Count > 0 ? "Yes" : "No" %>'
                                                            Visible='<%# Item.ReadOnly %>'></MAT:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <UserControl:ucWeight runat="server" ID="ucWeight" ScorecardKpiId='<%# ScorecardKpiId %>' ScorecardId='<%# ScorecardId %>'
                                            ScorecardFrequency='<%# ScorecardFrequency %>' Visible='<%# Item.WeightList.Count > 0 %>'
                                            ReadOnly='<%# Item.ReadOnly %>' WeightList='<%# Item.WeightList %>' FormViewMode="Edit" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="m-section">
                            <h3 class="m-section__heading">Target</h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <div class="pull-right" runat="server" visible='<%# Item.ReadOnly %>'>
                                            <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiTarget" ScorecardKpiId='<%# Item.ScorecardKpiId %>'
                                                FieldType="Target" ScorecardKpiTargetDetailsList='<%# Item.TargetList %>' ScorecardFrequency='<%# ScorecardFrequency %>'
                                                ScorecardStartDate='<%# Item.ScorecardStartDate %>' ScorecardEndDate='<%# Item.ScorecardEndDate %>' KpiStartDate='<%# Item.KpiStartDate %>'
                                                ScorecardStatus='<%# Item.ScorecardStatus %>' OnSaved="ucUpdateScorecardKpiTarget_Saved" />
                                        </div>
                                        <div class="row" runat="server">
                                            <div class="col-md-6">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Applicable" SkinID="FormLabel" AssociatedControlID="TargetApplicable"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:CheckBox runat="server" ID="TargetApplicable" Checked='<%# Item.TargetList.Count > 0 %>'
                                                            OnCheckedChanged="TargetApplicable_CheckedChanged" AutoPostBack="true" Visible='<%# !Item.ReadOnly %>' />
                                                        <MAT:Label runat="server" SkinID="FormValue" Text='<%# Item.TargetList.Count > 0 ? "Yes" : "No" %>'
                                                            Visible='<%# Item.ReadOnly %>'></MAT:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <UserControl:ucTarget runat="server" ID="ucTarget" ScorecardKpiId='<%# ScorecardKpiId %>' ScorecardId='<%# ScorecardId %>'
                                            ScorecardFrequency='<%# ScorecardFrequency %>' Visible='<%# Item.TargetList.Count > 0 %>' ReadOnly='<%# Item.ReadOnly %>'
                                            TargetList='<%# Item.TargetList %>' FormViewMode="Edit" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </EditItemTemplate>
            <ItemTemplate>
                <div class="m-portlet">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <h3 class="m-portlet__head-text">
                                    <MAT:Literal runat="server" Text="KPI"></MAT:Literal>
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="m-portlet__body">
                        <div class="m-section">
                            <h3 class="m-section__heading">Info
                            </h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="StartDate" SkinID="FormLabel" AssociatedControlID="EffectiveDate"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="EffectiveDate" SkinID="FormValue" Text='<%# Item.EffectiveDate.ToShortDateString() %>'></MAT:Label>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Code" SkinID="FormLabel" AssociatedControlID="Code"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="Code" SkinID="FormValue" Text='<%# Item.Code %>'></MAT:Label>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Name" SkinID="FormLabel" AssociatedControlID="Name"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="Name" SkinID="FormValue" Text='<%# Item.Name %>'></MAT:Label>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="ReportTitle" SkinID="FormLabel" AssociatedControlID="ReportTitle"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="ReportTitle" SkinID="FormValue" Text='<%# Item.ReportTitle %>'></MAT:Label>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Description" SkinID="FormLabel" AssociatedControlID="Description"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="Description" SkinID="FormValue" Text='<%# Item.Description %>'></MAT:Label>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Status" SkinID="FormLabel" AssociatedControlID="Status"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="Status" SkinID="FormValue" Text='<%# (MAT.App.Scorecard.Enumerate.KpiStatus)Item.KpiStatus %>'></MAT:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="m-section">
                            <h3 class="m-section__heading">Responsible</h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="KpiLeader" SkinID="FormLabel" AssociatedControlID="KpiLeader"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="KpiLeader" SkinID="FormValue" Text='<%# GetEntityDisplayName(Item.KpiLeaderEId) %>'></MAT:Label>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Owner" SkinID="FormLabel" AssociatedControlID="Owner"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="Owner" SkinID="FormValue" Text='<%# GetDisplayName(Item.OwnerUId) %>'></MAT:Label>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="OIC" SkinID="FormLabel" AssociatedControlID="OIC"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="OIC" SkinID="FormValue" Text='<%# GetDisplayName(Item.OICUId) %>'></MAT:Label>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="PMO" SkinID="FormLabel" AssociatedControlID="PMO"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="PMO" SkinID="FormValue" Text='<%# GetDisplayName(Item.PMOUId) %>'></MAT:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="m-section">
                            <h3 class="m-section__heading">Others</h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Unit" SkinID="FormLabel" AssociatedControlID="Unit"></MAT:Label>
                                                    <div class="col-md-8">
                                                        <MAT:Label runat="server" ID="Unit" SkinID="FormValue" Text='<%# Item.Unit.HasValue ? ((MAT.App.Scorecard.Enumerate.ScorecardUnit)Item.Unit.Value).ToString() : string.Empty %>'></MAT:Label>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="PerformanceScore" SkinID="FormLabel" AssociatedControlID="PerformanceScore"></MAT:Label>
                                                    <div class="col-md-8">
                                                        <MAT:Label runat="server" ID="PerformanceScore" SkinID="FormValue" Text='<%# Item.CalculationType.HasValue ? ((MAT.App.Scorecard.Enumerate.CalculationType)Item.CalculationType.Value).ToString() : string.Empty %>'></MAT:Label>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="PerformanceIndicator" SkinID="FormLabel" AssociatedControlID="PerformanceIndicator"></MAT:Label>
                                                    <div class="col-md-8">
                                                        <MAT:Label runat="server" ID="PerformanceIndicator" SkinID="FormValue" Text='<%# Item.ScoreType.HasValue ? ((MAT.App.Scorecard.Enumerate.ScoreType)Item.ScoreType.Value).ToString() : string.Empty %>'></MAT:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="m-section">
                            <h3 class="m-section__heading">Weight %</h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <UserControl:ucWeight runat="server" ID="ucWeight" ScorecardKpiId='<%# ScorecardKpiId %>' WeightList='<%# Item.WeightList %>' ScorecardFrequency='<%# ScorecardFrequency %>' ReadOnly="true" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="m-section">
                            <h3 class="m-section__heading">Target</h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <UserControl:ucTarget runat="server" ID="ucTarget" ScorecardKpiId='<%# ScorecardKpiId %>' TargetList='<%# Item.TargetList %>' ScorecardFrequency='<%# ScorecardFrequency %>' ReadOnly="true" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </MAT:FormView>
    </ContentTemplate>
</asp:UpdatePanel>
