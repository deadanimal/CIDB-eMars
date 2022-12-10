<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucInitiativeDetail.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.UserControl.ucInitiativeDetail" %>

<%@ Register Src="~/Scorecard/UserControl/ucWeight.ascx" TagPrefix="UserControl" TagName="ucWeight" %>
<%@ Register Src="~/Scorecard/PerformanceScorecard/UserControl/ucUpdateScorecardKpi.ascx" TagPrefix="UserControl" TagName="ucUpdateScorecardKpi" %>

<asp:UpdatePanel runat="server" ID="upFv" UpdateMode="Conditional">
    <ContentTemplate>
        <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false"
            OnPreRender="fvParent_PreRender" DefaultMode="Edit"
            SelectMethod="fvParent_SelectItem" DeleteMethod="fvParent_DeleteItem"
            InsertMethod="fvParent_InsertItem" UpdateMethod="fvParent_UpdateItem"
            ItemType="MAT.App.Scorecard.Scorecard.Shared.InitiativeViewModel">
            <InsertItemTemplate>
                <div class="m-portlet">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <h3 class="m-portlet__head-text">
                                    <MAT:Literal runat="server" Text="Add Initiative"></MAT:Literal>
                                </h3>
                            </div>
                        </div>
                        <div class="m-portlet__head-tools">
                            <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave"
                                CommandName="Insert" ValidationGroup="Initiative"></Metronic:FormViewButton>
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
                                                    <MAT:Label runat="server" Text="Type" SkinID="FormLabel" AssociatedControlID="Type"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="Type" SkinID="FormValue"></MAT:Label>
                                                        <asp:HiddenField runat="server" ID="TypeId" />
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="StartDate" SkinID="FormLabel" AssociatedControlID="StartDate"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:TextBox runat="server" ID="StartDate" SkinID="DatePicker" Mandatory="true"
                                                            Text='<%# BindItem.EffectiveDate %>' ValidationGroup="Initiative"></Metronic:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group" runat="server" id="divCode" visible="false">
                                                    <MAT:Label runat="server" Text="Code" SkinID="FormLabel" AssociatedControlID="Code"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:TextBox runat="server" ID="Code" Text='<%# BindItem.Code %>'
                                                            ValidationGroup="Initiative"></Metronic:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Name" SkinID="FormLabel" AssociatedControlID="Name"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:TextBox runat="server" ID="Name" Text='<%# BindItem.Name %>' MaxLength="4000" Mandatory="true"
                                                            ValidationGroup="Initiative"></Metronic:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Description" SkinID="FormLabel" AssociatedControlID="Description"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:TextBox runat="server" ID="Description" Text='<%# BindItem.Description %>'
                                                            MaxLength="500" ValidationGroup="Initiative"></Metronic:TextBox>
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
                                                    <MAT:Label runat="server" Text="Sponsor" SkinID="FormLabel" AssociatedControlID="Sponsor"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:DropDownList runat="server" ID="Sponsor" DataTextField="Value" DataValueField="Key" SelectMethod="User_Get"
                                                            Mandatory="true" ValidationGroup="Initiative">
                                                        </Metronic:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Owner" SkinID="FormLabel" AssociatedControlID="Owner"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:DropDownList runat="server" ID="Owner" DataTextField="Value" DataValueField="Key" SelectMethod="User_Get"
                                                            Mandatory="true" ValidationGroup="Initiative">
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
                            <h3 class="m-section__heading">Weight</h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Applicable" SkinID="FormLabel" AssociatedControlID="Applicable"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:CheckBox runat="server" ID="Applicable" Checked="false"
                                                            OnCheckedChanged="Applicable_CheckedChanged" AutoPostBack="true" />
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
                            <h3 class="m-section__heading">Others</h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="PerformanceScore" SkinID="FormLabel" AssociatedControlID="PerformanceScore"></MAT:Label>
                                                    <div class="col-md-8">
                                                        <Metronic:DropDownList runat="server" ID="PerformanceScore" DataTextField="Value" DataValueField="Key"
                                                            SelectMethod="CalculationType_Get" ValidationGroup="Initiative">
                                                        </Metronic:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="PerformanceIndicator" SkinID="FormLabel" AssociatedControlID="PerformanceIndicator"></MAT:Label>
                                                    <div class="col-md-8">
                                                        <Metronic:DropDownList runat="server" ID="PerformanceIndicator" DataTextField="Value"
                                                            DataValueField="Key" SelectMethod="ScoreType_Get" ValidationGroup="Initiative">
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
                </div>
            </InsertItemTemplate>
            <EditItemTemplate>
                <div class="m-portlet">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <h3 class="m-portlet__head-text">
                                    <MAT:Literal runat="server" Text="Edit Initiative"></MAT:Literal>
                                </h3>
                            </div>
                        </div>
                        <div class="m-portlet__head-tools">
                            <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave" ValidationGroup="Initiative"
                                CommandName="Update" Visible='<%# !Item.ReadOnly %>'></Metronic:FormViewButton>
                            <Metronic:FormViewButton runat="server" ID="btnDelete" SkinID="ButtonDelete" CausesValidation="false"
                                CommandName="Delete" Visible='<%# !Item.ReadOnly %>'></Metronic:FormViewButton>
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
                                                    <MAT:Label runat="server" Text="Type" SkinID="FormLabel" AssociatedControlID="Type"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="Type" SkinID="FormValue"
                                                            Text='<%# GetScorecardInitiativeStructName(Item.ScorecardInitiativeStructId.Value) %>'></MAT:Label>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="StartDate" SkinID="FormLabel" AssociatedControlID="StartDate"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="StartDate" SkinID="FormValue" Text='<%# Item.EffectiveDate.ToShortDateString() %>'
                                                            Visible='<%# Item.ReadOnly %>'></MAT:Label>
                                                        <Metronic:TextBox runat="server" ID="StartDate_Edit" SkinID="DatePicker" Text='<%# Item.EffectiveDate.ToShortDateString() %>'
                                                            Visible='<%# !Item.ReadOnly %>' Mandatory="true" ValidationGroup="Initiative">
                                                        </Metronic:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group" runat="server" visible='<%# Item.CodeFactoryType != MAT.App.Scorecard.Enumerate.CodeFactoryType.None %>'>
                                                    <MAT:Label runat="server" Text="Code" SkinID="FormLabel" AssociatedControlID="Code"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="Code" SkinID="FormValue" Text='<%# Item.Code %>'
                                                            Visible='<%# Item.ReadOnly %>'></MAT:Label>
                                                        <div class="pull-right" runat="server" visible='<%# Item.ReadOnly && Item.CodeFactoryType == MAT.App.Scorecard.Enumerate.CodeFactoryType.Manual %>'>
                                                            <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiCode"
                                                                ScorecardKpiId='<%# Item.ScorecardKpiId %>' FieldType="KpiCode" OldValue='<%# Item.Code %>'
                                                                OnSaved="ucUpdateScorecardKpi_Saved" CausesValidation="false" />
                                                        </div>
                                                        <Metronic:TextBox runat="server" ID="Code_Edit" Text='<%# Item.Code %>'
                                                            Enabled='<%# Item.CodeFactoryType != MAT.App.Scorecard.Enumerate.CodeFactoryType.Auto %>'
                                                            Visible='<%# !Item.ReadOnly %>' ValidationGroup="Initiative"></Metronic:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Name" SkinID="FormLabel" AssociatedControlID="Name"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="Name" SkinID="FormValue" Text='<%# Item.Name %>' Visible='<%# Item.ReadOnly %>'></MAT:Label>
                                                        <div class="pull-right" runat="server" visible='<%# Item.ReadOnly %>'>
                                                            <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiName"
                                                                ScorecardKpiId='<%# Item.ScorecardKpiId %>' FieldType="Name" OldValue='<%# Item.Name %>'
                                                                OnSaved="ucUpdateScorecardKpi_Saved" CausesValidation="false" />
                                                        </div>
                                                        <Metronic:TextBox runat="server" ID="Name_Edit" Text='<%# Item.Name %>' Visible='<%# !Item.ReadOnly %>'
                                                            Mandatory="true" ValidationGroup="Initiative"></Metronic:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Description" SkinID="FormLabel" AssociatedControlID="Description"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="Description" SkinID="FormValue" Text='<%# Item.Description %>' Visible='<%# Item.ReadOnly %>'></MAT:Label>
                                                        <div class="pull-right" runat="server" visible='<%# Item.ReadOnly %>'>
                                                            <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiDescription" ScorecardKpiId='<%# Item.ScorecardKpiId %>'
                                                                FieldType="Description" OldValue='<%# Item.Description %>' OnSaved="ucUpdateScorecardKpi_Saved" CausesValidation="false" />
                                                        </div>
                                                        <Metronic:TextBox runat="server" ID="Description_Edit" Text='<%# Item.Description %>' Visible='<%# !Item.ReadOnly %>'
                                                            ValidationGroup="Initiative"></Metronic:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-gorup m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Status" SkinID="FormLabel" AssociatedControlID="Status"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="Status" SkinID="FormValue" Text='<%# (MAT.App.Scorecard.Enumerate.KpiStatus)Item.KpiStatus %>'
                                                            Visible='<%# Item.ReadOnly %>'></MAT:Label>
                                                        <div class="pull-right" runat="server" visible='<%# Item.ReadOnly %>'>
                                                            <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiStatus" ScorecardKpiId='<%# Item.ScorecardKpiId %>'
                                                                FieldType="KpiStatus" OldValue='<%# Item.KpiStatus %>' OnSaved="ucUpdateScorecardKpi_Saved" CausesValidation="false" />
                                                        </div>
                                                        <Metronic:DropDownList runat="server" ID="Status_Edit" DataTextField="Value" DataValueField="Key" SelectMethod="Status_Get"
                                                            Text='<%# Item.KpiStatus %>' Visible='<%# !Item.ReadOnly %>' Mandatory="true" ValidationGroup="Initiative">
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
                            <h3 class="m-section__heading">Responsible</h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Sponsor" SkinID="FormLabel" AssociatedControlID="Sponsor"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="Sponsor" SkinID="FormValue" Text='<%# GetDisplayName(Item.SponsorUId) %>' Visible='<%# Item.ReadOnly %>'></MAT:Label>
                                                        <div class="pull-right" runat="server" visible='<%# Item.ReadOnly %>'>
                                                            <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiSponsor" ScorecardKpiId='<%# Item.ScorecardKpiId %>'
                                                                FieldType="InitiativeSponsor" OldValue='<%# Item.SponsorUId %>' OnSaved="ucUpdateScorecardKpi_Saved" CausesValidation="false" />
                                                        </div>
                                                        <Metronic:DropDownList runat="server" ID="Sponsor_Edit" DataTextField="Value" DataValueField="Key" SelectMethod="User_Get"
                                                            Text='<%# Item.SponsorUId %>' Visible='<%# !Item.ReadOnly %>' Mandatory="true" ValidationGroup="Initiative">
                                                        </Metronic:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Owner" SkinID="FormLabel" AssociatedControlID="Owner"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="Owner" SkinID="FormValue" Text='<%# GetDisplayName(Item.OwnerUId) %>' Visible='<%# Item.ReadOnly %>'></MAT:Label>
                                                        <div class="pull-right" runat="server" visible='<%# Item.ReadOnly %>'>
                                                            <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiOwner" ScorecardKpiId='<%# Item.ScorecardKpiId %>'
                                                                FieldType="InitiativeOwner" OldValue='<%# Item.OwnerUId %>' OnSaved="ucUpdateScorecardKpi_Saved" CausesValidation="false" />
                                                        </div>
                                                        <Metronic:DropDownList runat="server" ID="Owner_Edit" DataTextField="Value" DataValueField="Key" SelectMethod="User_Get"
                                                            Text='<%# Item.OwnerUId %>' Visible='<%# !Item.ReadOnly %>' Mandatory="true" ValidationGroup="Initiative">
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
                            <h3 class="m-section__heading">Weight</h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <div class="pull-right" runat="server" visible='<%# Item.ReadOnly && Item.WeightList.Count > 0 %>'>
                                            <UserControl:ucUpdateScorecardKpi runat="server" ID="ucUpdateScorecardKpiWeight" ScorecardKpiId='<%# Item.ScorecardKpiId %>'
                                                FieldType="Weight" ScorecardFrequency='<%# ScorecardFrequency %>' ScorecardKpiWeightDetailsList='<%# Item.WeightList %>'
                                                ScorecardStartDate='<%# Item.ScorecardStartDate %>' ScorecardEndDate='<%# Item.ScorecardEndDate %>'
                                                ScorecardStatus='<%# Item.ScorecardStatus %>' OnSaved="ucUpdateScorecardKpiWeight_Saved" CausesValidation="false" />
                                        </div>
                                        <div class="row" runat="server">
                                            <div class="col-md-6">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Applicable" SkinID="FormLabel" AssociatedControlID="Applicable"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:CheckBox runat="server" ID="Applicable" Checked='<%# Item.WeightList.Count > 0 %>'
                                                            OnCheckedChanged="Applicable_CheckedChanged" AutoPostBack="true" Visible='<%# !Item.ReadOnly %>' />
                                                        <MAT:Label runat="server" SkinID="FormValue" Text='<%# Item.WeightList.Count > 0 ? "Yes" : "No" %>'
                                                            Visible='<%# Item.ReadOnly %>'></MAT:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <UserControl:ucWeight runat="server" ID="ucWeight" ScorecardKpiId='<%# ScorecardKpiId %>' ScorecardId='<%# ScorecardId %>'
                                            ScorecardFrequency='<%# ScorecardFrequency %>' Visible='<%# Item.WeightList.Count > 0 %>' ReadOnly='<%# Item.ReadOnly %>'
                                            WeightList='<%# Item.WeightList %>' FormViewMode="Edit" />
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
                                            <div class="col-md-6">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="PerformanceScore" SkinID="FormLabel" AssociatedControlID="PerformanceScore"></MAT:Label>
                                                    <div class="col-md-8">
                                                        <MAT:Label runat="server" ID="PerformanceScore" SkinID="FormValue" Visible='<%# Item.ReadOnly %>'
                                                            Text='<%# (MAT.App.Scorecard.Enumerate.CalculationType)Item.CalculationType %>'></MAT:Label>
                                                        <Metronic:DropDownList runat="server" ID="PerformanceScore_Edit" DataTextField="Value" DataValueField="Key" SelectMethod="CalculationType_Get"
                                                            Text='<%# Item.CalculationType %>' Visible='<%# !Item.ReadOnly %>' ValidationGroup="Initiative">
                                                        </Metronic:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="PerformanceIndicator" SkinID="FormLabel" AssociatedControlID="PerformanceIndicator"></MAT:Label>
                                                    <div class="col-md-8">
                                                        <MAT:Label runat="server" ID="PerformanceIndicator" SkinID="FormValue" Visible='<%# Item.ReadOnly %>'
                                                            Text='<%# (MAT.App.Scorecard.Enumerate.ScoreType)Item.ScoreType %>'></MAT:Label>
                                                        <Metronic:DropDownList runat="server" ID="PerformanceIndicator_Edit" DataTextField="Value" DataValueField="Key" SelectMethod="ScoreType_Get"
                                                            Text='<%# Item.ScoreType %>' Visible='<%# !Item.ReadOnly %>' ValidationGroup="Initiative">
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
                </div>
            </EditItemTemplate>
            <ItemTemplate>
                <div class="m-portlet">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <h3 class="m-portlet__head-text">
                                    <MAT:Literal runat="server" Text="Initiative"></MAT:Literal>
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
                                                    <MAT:Label runat="server" Text="Type" SkinID="FormLabel" AssociatedControlID="Type"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="Type" SkinID="FormValue" Text='<%# GetScorecardInitiativeStructName(Item.ScorecardInitiativeStructId.Value) %>'></MAT:Label>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="StartDate" SkinID="FormLabel" AssociatedControlID="StartDate"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="StartDate" SkinID="FormValue" Text='<%# Item.EffectiveDate.ToShortDateString() %>'></MAT:Label>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group" runat="server"
                                                    visible='<%# Item.CodeFactoryType != MAT.App.Scorecard.Enumerate.CodeFactoryType.None %>'>
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
                                                    <MAT:Label runat="server" Text="Description" SkinID="FormLabel" AssociatedControlID="Description"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="Description" SkinID="FormValue" Text='<%# Item.Description %>'></MAT:Label>
                                                    </div>
                                                </div>
                                                <div class="form-gorup m-form__group mat-form-group">
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
                                                    <MAT:Label runat="server" Text="Sponsor" SkinID="FormLabel" AssociatedControlID="Sponsor"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="Sponsor" SkinID="FormValue" Text='<%# GetDisplayName(Item.SponsorUId) %>'></MAT:Label>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="Owner" SkinID="FormLabel" AssociatedControlID="Owner"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <MAT:Label runat="server" ID="Owner" SkinID="FormValue" Text='<%# GetDisplayName(Item.OwnerUId) %>'></MAT:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="m-section">
                            <h3 class="m-section__heading">Weight</h3>
                            <div class="m-section__content">
                                <div class="m-demo">
                                    <div class="m-demo__preview">
                                        <UserControl:ucWeight runat="server" ID="ucWeight" ScorecardKpiId='<%# ScorecardKpiId %>'
                                            ScorecardFrequency='<%# ScorecardFrequency %>' WeightList='<%# Item.WeightList %>' ReadOnly="true" />
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
                                            <div class="col-md-6">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="PerformanceScore" SkinID="FormLabel" AssociatedControlID="PerformanceScore"></MAT:Label>
                                                    <div class="col-md-8">
                                                        <MAT:Label runat="server" ID="PerformanceScore" SkinID="FormValue" Text='<%# (MAT.App.Scorecard.Enumerate.CalculationType)Item.CalculationType %>'></MAT:Label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" Text="PerformanceIndicator" SkinID="FormLabel" AssociatedControlID="PerformanceIndicator"></MAT:Label>
                                                    <div class="col-md-8">
                                                        <MAT:Label runat="server" ID="PerformanceIndicator" SkinID="FormValue" Text='<%# (MAT.App.Scorecard.Enumerate.ScoreType)Item.ScoreType %>'></MAT:Label>
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
            </ItemTemplate>
            <EmptyDataTemplate>
                There is nothing to see here.
            </EmptyDataTemplate>
        </MAT:FormView>

    </ContentTemplate>
</asp:UpdatePanel>
