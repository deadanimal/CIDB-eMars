<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucScorecardDetails.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.KPIProgress.UserControl.ucScorecardDetails" %>

<%@ Register Src="~/Scorecard/UserControl/ucWeight.ascx" TagPrefix="UserControl" TagName="ucWeight" %>
<%@ Register Src="~/Scorecard/UserControl/ucTarget.ascx" TagPrefix="UserControl" TagName="ucTarget" %>

<%--<div style="padding-top: calc(0.65rem + 1px); line-height: 1.25; text-align: center; display: inline-block;">--%>
<button type="button" class="btn btn-link" data-toggle="modal" data-target='<%= "#" + modalForm.ClientID %>'>
    Details
</button>
<%--<Metronic:LinkButton runat="server" SkinID="ButtonFreeLink" ID="btnDetails" Text="Details" OnClick="btnDetails_Click"></Metronic:LinkButton>--%>
<%--</div>--%>

<div class="modal fade" id="modalForm" runat="server" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="smaller lighter blue no-margin">
                    <MAT:Literal runat="server" Text="KPI Detail"></MAT:Literal>
                </h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="m-scrollable mCustomScrollbar _mCS_4 mCS-autoHide" data-scrollbar-shown="true" data-scrollable="true" data-max-height="400" style="max-height: 400px; height: 400px; position: relative; overflow: visible;">
                    <div id="mCSB_4" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" style="max-height: none;" tabindex="0">
                        <div id="mCSB_4_container" class="mCSB_container" style="position: relative; top: 0px; left: 0px;" dir="ltr">
                            <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DefaultMode="ReadOnly" SelectMethod="fvParent_SelectItem"
                                ItemType="MAT.App.Scorecard.Scorecard.KpiProgress.ProgressSubmission.ScorecardDetailsViewModel">
                                <ItemTemplate>
                                    <div class="m-portlet">
                                        <div class="m-portlet__body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Scorecard" AssociatedControlID="Scorecard"></MAT:Label>
                                                        <div class="col-sm-8">
                                                            <MAT:Label runat="server" ID="Scorecard" SkinID="FormValue"
                                                                Text='<%# (string.IsNullOrEmpty(Item.ScorecardCode) ? string.Empty : (Item.ScorecardCode + " " )) + Item.ScorecardName %>'></MAT:Label>
                                                        </div>
                                                    </div>

                                                    <asp:Repeater runat="server" ID="rpt" DataSource='<%# Item.Parents %>' ItemType="MAT.App.Scorecard.Scorecard.KpiProgress.ProgressSubmission.Parent">
                                                        <ItemTemplate>
                                                            <div class="form-group m-form__group mat-form-group">
                                                                <MAT:Label runat="server" SkinID="FormLabel" Text='<%# string.IsNullOrEmpty(Item.Label) ? "KPI" : Item.Label %>' AssociatedControlID="CodeName"></MAT:Label>
                                                                <div class="col-sm-8">
                                                                    <MAT:Label runat="server" ID="CodeName" SkinID="FormValue"
                                                                        Text='<%# (string.IsNullOrEmpty(Item.Code) ? string.Empty : (Item.Code + " " )) + Item.Name %>'></MAT:Label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:Repeater>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="m-portlet" runat="server" visible='<%# Item.ScorecardKpiType == MAT.App.Scorecard.Enumerate.ScorecardKpiType.Initiative %>'>
                                        <div class="m-portlet__body">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Sponsor" AssociatedControlID="Sponsor"></MAT:Label>
                                                        <div class="col-sm-8">
                                                            <MAT:Label runat="server" ID="Sponsor" SkinID="FormValue" Text='<%# Item.SponsorName %>'></MAT:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <MAT:Label runat="server" SkinID="FormLabel" Text="PerformanceIndicator" AssociatedControlID="ScoreType"></MAT:Label>
                                                        <div class="col-sm-8">
                                                            <MAT:Label runat="server" ID="ScoreType" SkinID="FormValue" Text='<%# Item.ScoreType %>'></MAT:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Owner"></MAT:Label>
                                                        <div class="col-sm-8">
                                                            <Metronic:TextBox runat="server" ReadOnly="true" Text='<%# Item.OwnerName %>'></Metronic:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <MAT:Label runat="server" SkinID="FormLabel" Text="PerformanceScore"></MAT:Label>
                                                        <div class="col-sm-8">
                                                            <Metronic:TextBox runat="server" ReadOnly="true" Text='<%# Item.CalculationType %>'></Metronic:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="m-portlet" runat="server" visible='<%# Item.ScorecardKpiType == MAT.App.Scorecard.Enumerate.ScorecardKpiType.KPI %>'>
                                        <div class="m-portlet__body">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <MAT:Label runat="server" SkinID="FormLabel" Text="KpiLeader" AssociatedControlID="KpiLeaders"></MAT:Label>
                                                        <div class="col-sm-8">
                                                            <MAT:Label runat="server" ID="KpiLeaders" SkinID="FormValue" Text='<%# Item.KpiLeadersName %>'></MAT:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Owner" AssociatedControlID="Owner"></MAT:Label>
                                                        <div class="col-sm-8">
                                                            <MAT:Label runat="server" ID="Owner" SkinID="FormValue" ReadOnly="true" Text='<%# Item.OwnerName %>'></MAT:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Unit" AssociatedControlID="Unit"></MAT:Label>
                                                        <div class="col-sm-8">
                                                            <MAT:Label runat="server" ID="Unit" SkinID="FormValue" Text='<%# Item.Unit.HasValue ? MAT.Helper.EnumHelper.GetText("MAT.App.Scorecard.Enumerate.ScorecardUnit", Item.Unit.Value) : string.Empty %>'></MAT:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <MAT:Label runat="server" SkinID="FormLabel" Text="PerformanceIndicator" AssociatedControlID="ScoreTypeKPI"></MAT:Label>
                                                        <div class="col-sm-8">
                                                            <MAT:Label runat="server" ID="ScoreTypeKPI" SkinID="FormValue" Text='<%# Item.ScoreType %>'></MAT:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <MAT:Label runat="server" SkinID="FormLabel" Text="PMO" AssociatedControlID="PMO"></MAT:Label>
                                                        <div class="col-sm-8">
                                                            <MAT:Label runat="server" ID="PMO" SkinID="FormValue" Text='<%# Item.PmoName %>'></MAT:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <MAT:Label runat="server" SkinID="FormLabel" Text="OIC" AssociatedControlID="OIC"></MAT:Label>
                                                        <div class="col-sm-8">
                                                            <MAT:Label runat="server" ID="OIC" SkinID="FormValue" Text='<%# Item.OicName %>'></MAT:Label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <MAT:Label runat="server" SkinID="FormLabel" Text="PerformanceScore" AssociatedControlID="CalculationType"></MAT:Label>
                                                        <div class="col-sm-8">
                                                            <MAT:Label runat="server" ID="CalculationType" SkinID="FormValue" Text='<%# Item.CalculationType %>'></MAT:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <UserControl:ucWeight runat="server" ID="ucWeight" ScorecardKpiId='<%# ScorecardKpiId %>'
                                        ScorecardFrequency='<%# ScorecardFrequency %>' ReadOnly="true" WeightList='<%# Item.WeightDetails %>' />
                                    <UserControl:ucTarget runat="server" ID="ucTarget" ScorecardKpiId='<%# ScorecardKpiId %>'
                                        ScorecardFrequency='<%# ScorecardFrequency %>' ReadOnly="true" TargetList='<%# Item.TargetDetails %>' />
                                </ItemTemplate>
                            </MAT:FormView>
                        </div>
                    </div>
                    <div id="mCSB_4_scrollbar_vertical" class="mCSB_scrollTools mCSB_4_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical" style="display: block;">
                        <div class="mCSB_draggerContainer">
                            <div id="mCSB_4_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 50px; top: 0px; display: block; height: 57px; max-height: 180px;">
                                <div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
                            </div>
                            <div class="mCSB_draggerRail"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

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
</style>
