<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.PerformanceScorecard.ChangeHistory.View" %>

<%@ Register Src="~/Workflow/UserControl/ucWorkflowInstanceHistory.ascx" TagName="WorkflowInstanceHistory" TagPrefix="UserControl" %>
<%@ Register Src="~/Administration/UserControl/ucDataInformation.ascx" TagPrefix="UserControl" TagName="ucDataInformation" %>
<%@ Register Src="~/Scorecard/UserControl/ucAttachment.ascx" TagPrefix="UserControl" TagName="ucAttachment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton runat="server" ID="btnBack" SkinID="ButtonBack" PostBackUrl="Index.aspx" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView runat="server" ID="fvChangeRequest" RenderOuterTable="false" DataKeyNames="KpiChangeRequestId"
        DefaultMode="ReadOnly" SelectMethod="fvChangeRequest_GetItem"
        ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.ChangeRequest.ChangeRequestViewModel">        
        <ItemTemplate>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group m-form__group mat-form-group">
                        <label class="col-sm-3 col-form-label"><%: MAT.Resources.GlobalResource.Scorecard %></label>
                        <div class="col-sm-9">
                            <MAT:Label runat="server" ID="Scorecard" SkinID="FormValue" Text='<%# Item.ScorecardCodeName %>'></MAT:Label>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <label class="col-sm-3 col-form-label"><%: MAT.Resources.GlobalResource.ChangeTo %></label>
                        <div class="col-sm-9">
                            <MAT:Label runat="server" ID="ChangeTo" SkinID="FormValue" Text='<%# Item.ChangeTo %>'></MAT:Label>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <label class="col-sm-3 col-form-label"><%: MAT.Resources.GlobalResource.Name %></label>
                        <div class="col-sm-9">
                            <MAT:Label runat="server" ID="OldName" SkinID="FormValue" Text='<%# Item.OldName %>'></MAT:Label>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <label class="col-sm-3 col-form-label"><%: MAT.Resources.GlobalResource.Description %></label>
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
                                <label class="col-sm-3 col-form-label"><%: MAT.Resources.GlobalResource.Name %></label>
                                <div class="col-sm-9">
                                    <MAT:Label runat="server" ID="txtName_ChangeRequest" SkinID="FormValue" Text='<%# Item.Name %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <label class="col-sm-3 col-form-label"><%: MAT.Resources.GlobalResource.Description %></label>
                                <div class="col-sm-9">
                                    <MAT:Label runat="server" ID="txtDescription_ChangeRequest" SkinID="FormValue" Text='<%# Item.Description %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <label class="col-sm-3 col-form-label"><%: MAT.Resources.GlobalResource.Status %></label>
                                <div class="col-sm-9">
                                    <MAT:Label runat="server" ID="Status_ChangeRequest" SkinID="FormValue" Text='<%# Item.KpiStatus.HasValue ? (MAT.App.Scorecard.Enumerate.KpiStatus)Item.KpiStatus : MAT.App.Scorecard.Enumerate.KpiStatus.Active %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <label class="col-sm-3 col-form-label">Weightage %</label>
                                <div class="col-sm-9">
                                    <asp:Repeater ID="rptWeightage" runat="server" SelectMethod="rptWeightages_Get">
                                        <ItemTemplate>
                                            <div class="row">
                                                <div class="col-md-5">
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <Metronic:DropDownList runat="server" ID="ddlKpiPeriodWeightage_ChangeRequest" DataValueField="Key" DataTextField="Value" SelectMethod="ddlKpiPeriodWeightage_Get" Text='<%# Eval("ScorecardKpiWeightId") %>'
                                                            Enabled="false">
                                                        </Metronic:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-5">
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <Metronic:TextBox runat="server" ID="txtWeightage_ChangeRequest" Text='<%# Eval("Weight") %>' ReadOnly="true"></Metronic:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <div id="divTarget" runat="server" visible='<%# Eval("ScorecardKpiType") != null && (MAT.App.Scorecard.Enumerate.ScorecardKpiType)((byte)Eval("ScorecardKpiType")) == MAT.App.Scorecard.Enumerate.ScorecardKpiType.KPI ? true : false  %>'>
                                <div class="form-group m-form__group mat-form-group">
                                    <label class="col-sm-3 col-form-label">Target</label>
                                    <div class="col-sm-9">
                                        <asp:Repeater ID="rptTarget" runat="server" SelectMethod="rptTargets_Get">
                                            <ItemTemplate>
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <div class="form-group m-form__group mat-form-group">
                                                            <Metronic:DropDownList runat="server" ID="ddlKpiPeriodTarget_ChangeRequest" DataValueField="Key" DataTextField="Value"
                                                                SelectMethod="ddlKpiPeriodTarget_Get" Text='<%# Eval("ScorecardKpiDetailId") %>' Enabled="false">
                                                            </Metronic:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <div class="form-group m-form__group mat-form-group">
                                                            <Metronic:TextBox runat="server" ID="txtTarget_ChangeRequest" Text='<%# Eval("Target") %>' ReadOnly="true"></Metronic:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <label class="col-sm-3 col-form-label">Change Date</label>
                                <div class="col-sm-9">
                                    <MAT:Label runat="server" ID="txtChangeDate_ChangeRequest" SkinID="FormValue" Text='<%# Item.EffectiveDate.ToShortDateString() %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <label class="col-sm-3 col-form-label">Change Remark</label>
                                <div class="col-sm-9">
                                    <MAT:Label runat="server" ID="txtChangeRemark_ChangeRequest" SkinID="FormValue" Text='<%# Item.Remarks %>'></MAT:Label>
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
            <UserControl:ucAttachment runat="server" ID="ucAttachment" Mode="ReadOnly" DataSet='<%# Item.Attachments %>' />
            <UserControl:WorkflowInstanceHistory runat="server" ID="ucWorkflowInstanceHistory" OwnerId='<%# Item.KpiChangeRequestId %>' />
            <p></p>
            <UserControl:ucDataInformation runat="server" ID="ucDataInformation" TableName="KpiChangeRequest" PrimaryKeyName="KpiChangeRequestId" PrimaryKeyValue='<%# Item.KpiChangeRequestId %>' />
        </ItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
