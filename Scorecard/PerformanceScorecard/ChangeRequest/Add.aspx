<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="Add.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.PerformanceScorecard.ChangeRequest.Add" %>

<%@ Register TagPrefix="UserControl" TagName="WorkflowSubmission" Src="~/Workflow/UserControl/ucWorkflowSubmission.ascx" %>
<%@ Register Src="~/Scorecard/UserControl/ucAttachment.ascx" TagPrefix="UserControl" TagName="ucAttachment" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <UserControl:WorkflowSubmission ID="ucWorkflowSubmission" runat="server" OnSubmitClick="ucWorkflowSubmission_SubmitClick" CausesValidation="true"
        OnWorkflowInitialising="ucWorkflowSubmission_WorkflowInitialising" OnWorkflowInitiated="ucWorkflowSubmission_WorkflowInitiated" />
    <Metronic:LinkButton runat="server" ID="btnCancel" SkinID="ButtonFreeText" Text="Cancel" PostBackUrl="Index.aspx" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="form-group m-form__group mat-form-group">
                <MAT:Label runat="server" CssClass="col-sm-3 col-form-label" Text="Scorecard" AssociatedControlID="ddlScorecard_CodeName"></MAT:Label>
                <div class="col-sm-9">
                    <Metronic:DropDownList runat="server" ID="ddlScorecard_CodeName" Mandatory="true" DataValueField="Key" DataTextField="Value" 
                        SelectMethod="ddlScorecardCodeName_Get" AutoPostBack="true" OnSelectedIndexChanged="ddlScorecard_CodeName_SelectedIndexChanged">
                    </Metronic:DropDownList>
                </div>
            </div>
            <div class="form-group m-form__group mat-form-group">
                <MAT:Label runat="server" CssClass="col-sm-3 col-form-label" Text="Change To" AssociatedControlID="ddlChangeTo_ChangeRequest"></MAT:Label>
                <div class="col-sm-9">
                    <Metronic:DropDownList runat="server" ID="ddlChangeTo_ChangeRequest" Mandatory="true" DataValueField="Key" DataTextField="Value"
                        SelectMethod="ddlChangeTo_Get" AutoPostBack="true" OnSelectedIndexChanged="ddlChangeTo_ChangeRequest_SelectedIndexChanged">
                    </Metronic:DropDownList>
                </div>
            </div>
            <div class="form-group m-form__group mat-form-group">
                <MAT:Label runat="server" CssClass="col-sm-3 col-form-label" Text="Name" AssociatedControlID="ddlScorecardkpi_CodeName"></MAT:Label>
                <div class="col-sm-9">
                    <Metronic:DropDownList runat="server" ID="ddlScorecardKpi_CodeName" Mandatory="true" DataValueField="Key" DataTextField="Value"
                        SelectMethod="ddlScorecardKpiCodeName_Get" AutoPostBack="true" OnSelectedIndexChanged="ddlScorecardKpi_CodeName_SelectedIndexChanged"
                        OnDataBound="ddlScorecardKpi_CodeName_DataBound">
                    </Metronic:DropDownList>
                </div>
            </div>
            <div class="form-group m-form__group mat-form-group">
                <MAT:Label runat="server" CssClass="col-sm-3 col-form-label" Text="Description" AssociatedControlID="txtDescription"></MAT:Label>
                <div class="col-sm-9">
                    <Metronic:TextBox runat="server" ID="txtDescription" TextMode="MultiLine" Rows="3" ReadOnly="true"></Metronic:TextBox>
                </div>
            </div>
            <p></p>
        </div>
    </div>
    <asp:UpdatePanel runat="server" ID="upFv" UpdateMode="Conditional">
        <ContentTemplate>
            <MAT:FormView runat="server" ID="fvChangeRequest" RenderOuterTable="false" DataKeyNames="ScorecardKpiId" DefaultMode="Insert"
                ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.ChangeRequest.ChangeRequestViewModel"
                InsertMethod="fvChangeRequest_InsertItem"
                OnItemInserting="fvChangeRequest_ItemInserting"
                UpdateMethod="fvChangeRequest_UpdateItem"
                OnItemUpdating="fvChangeRequest_ItemUpdating">
                <InsertItemTemplate>
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
                                        <div class="col-sm-4 col-form-label">
                                            <Metronic:CheckBox runat="server" ID="cbName_ChangeRequest" Text="Name" AutoPostBack="true" OnCheckedChanged="cbName_ChangeRequest_CheckedChanged" />
                                        </div>
                                        <div class="col-sm-8">
                                            <Metronic:TextBox runat="server" ID="txtName_ChangeRequest" placeholder="Enter New Name" Text="<%# BindItem.Name %>"></Metronic:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <div class="col-sm-4 col-form-label">
                                            <Metronic:CheckBox runat="server" ID="cbDescription_ChangeRequest" Text="Description" AutoPostBack="true" OnCheckedChanged="cbDescription_ChangeRequest_CheckedChanged" />
                                        </div>
                                        <div class="col-sm-8">
                                            <Metronic:TextBox runat="server" ID="txtDescription_ChangeRequest" placeholder="Enter New Description" TextMode="MultiLine" Rows="3" Text="<%# BindItem.Description %>"></Metronic:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <div class="col-sm-4 col-form-label">
                                            <Metronic:CheckBox runat="server" ID="cbStatus_ChangeRequest" Text="Status" AutoPostBack="true" OnCheckedChanged="cbStatus_ChangeRequest_CheckedChanged" />
                                        </div>
                                        <div class="col-sm-8">
                                            <Metronic:DropDownList runat="server" ID="ddlStatus_ChangeRequest" DataValueField="Key" DataTextField="Value" SelectMethod="ddlStatus_Get" Text="<%# BindItem.KpiStatus %>">
                                            </Metronic:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <div class="col-sm-12 ">
                                            <div class="pull-right">
                                                <Metronic:LinkButton ID="btnAddWeightage" runat="server" SkinID="ButtonFreeText" Text="Add Weightage" OnClick="btnAddWeightage_Click" CausesValidation="false" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <div class="col-sm-4 col-form-label">
                                            <Metronic:CheckBox runat="server" ID="cbWeightage_ChangeRequest" Text="Weightage %" AutoPostBack="true" OnCheckedChanged="cbWeightage_ChangeRequest_CheckedChanged" />
                                        </div>
                                        <div class="col-sm-8">
                                            <asp:Repeater ID="rptWeightage" runat="server" SelectMethod="rptWeightages_Get" OnItemCommand="rptWeightage_ItemCommand" OnPreRender="rptWeightage_PreRender">
                                                <ItemTemplate>
                                                    <div class="row">
                                                        <div class="col-md-5">
                                                            <div class="form-group m-form__group mat-form-group">
                                                                <Metronic:DropDownList runat="server" ID="ddlKpiPeriodWeightage_ChangeRequest" DataValueField="Key" DataTextField="Value" SelectMethod="ddlKpiPeriodWeightage_Get"
                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlKpiPeriodWeightage_ChangeRequest_SelectedIndexChanged" Text='<%# Eval("ScorecardKpiWeightId") %>'
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
                                    <div id="divTarget" runat="server">
                                        <div class="form-group m-form__group mat-form-group">
                                            <div class="col-sm-12">
                                                <div class="pull-right">
                                                    <Metronic:LinkButton ID="btnAddTarget" runat="server" SkinID="ButtonFreeText" Text="Add Target" OnClick="btnAddTarget_Click" CausesValidation="false" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <div class="col-sm-4 col-form-label">
                                                <Metronic:CheckBox runat="server" ID="cbTarget_ChangeRequest" Text="Target" AutoPostBack="true" OnCheckedChanged="cbTarget_ChangeRequest_CheckedChanged" />
                                            </div>
                                            <div class="col-sm-8">
                                                <asp:Repeater ID="rptTarget" runat="server" SelectMethod="rptTargets_Get" OnItemCommand="rptTarget_ItemCommand" OnPreRender="rptTarget_PreRender">
                                                    <ItemTemplate>
                                                        <div class="row">
                                                            <div class="col-md-5">
                                                                <div class="form-group m-form__group mat-form-group">
                                                                    <Metronic:DropDownList runat="server" ID="ddlKpiPeriodTarget_ChangeRequest" DataValueField="Key" DataTextField="Value" SelectMethod="ddlKpiPeriodTarget_Get" AutoPostBack="true" OnSelectedIndexChanged="ddlKpiPeriodTarget_ChangeRequest_SelectedIndexChanged" Text='<%# Eval("ScorecardKpiDetailId") %>'
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
                                        <MAT:Label runat="server" Text="Change Date" CssClass="col-sm-4 col-form-label"></MAT:Label>
                                        <div class="col-sm-8">
                                            <Metronic:TextBox runat="server" ID="txtChangeDate_ChangeRequest" SkinID="DatePicker" Mandatory="true" OnTextChanged="txtChangeDate_ChangeRequest_TextChanged" AutoPostBack="true"
                                                Text="<%# BindItem.EffectiveDate %>"></Metronic:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" Text="Change Remark" CssClass="col-sm-4 col-form-label"></MAT:Label>
                                        <div class="col-sm-8">
                                            <Metronic:TextBox runat="server" ID="txtChangeRemark_ChangeRequest" TextMode="MultiLine" Rows="3" Mandatory="true" Text='<%# BindItem.Remarks %>'></Metronic:TextBox>
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
                                                        <Metronic:CheckBox ID="chkScorecardCheckList" runat="server" AccessKey='<%# Eval("Key") %>' Text='<%# Eval("Value") %>'></Metronic:CheckBox>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <UserControl:ucAttachment runat="server" ID="ucAttachment" Mode="Insert" />
                </InsertItemTemplate>
            </MAT:FormView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
