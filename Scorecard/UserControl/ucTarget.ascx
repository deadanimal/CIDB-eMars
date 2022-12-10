<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTarget.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.UserControl.ucTarget" %>

<div class="pull-right">
    <Metronic:LinkButton runat="server" ID="btnAction" SkinID="ButtonFreeText" OnClick="btnAction_Click"
        FunctionAccessControlCode="Create" CausesValidation="false"></Metronic:LinkButton>
</div>

<asp:UpdatePanel runat="server" ID="upGv">
    <ContentTemplate>
        <Metronic:GridView runat="server" ID="gvTarget" SkinID="Custom" OnDataBound="gvTarget_DataBound"
            ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.TargetViewModel">
            <Columns>
                <MAT:BoundField DataField="Year" HeaderText="Year"></MAT:BoundField>
                <MAT:TemplateField HeaderText="YearlyTarget">
                    <ItemTemplate>
                        <%# Item.YearlyTarget.HasValue ? decimal.Round(Item.YearlyTarget.Value, 1).ToString() : "-" %>
                    </ItemTemplate>
                </MAT:TemplateField>
                <MAT:TemplateField HeaderText="QuarterlyTarget">
                    <ItemTemplate>
                        <%# CombineLoS(Item.QuarterOneTarget, Item.QuarterTwoTarget, Item.QuarterThreeTarget, Item.QuarterFourTarget) %>
                    </ItemTemplate>
                </MAT:TemplateField>
                <MAT:TemplateField HeaderText="MonthlyTarget">
                    <ItemTemplate>
                        <%# CombineLoS(Item.JanTarget, Item.FebTarget, Item.MarTarget, Item.AprTarget, Item.MarTarget, Item.JunTarget, 
    Item.JulTarget, Item.AugTarget, Item.SepTarget, Item.OctTarget, Item.NovTarget, Item.DecTarget) %>
                    </ItemTemplate>
                </MAT:TemplateField>
            </Columns>
        </Metronic:GridView>
    </ContentTemplate>
</asp:UpdatePanel>

<div class="modal fade" id="modalForm" runat="server" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <asp:UpdatePanel runat="server" ID="upForm">
            <ContentTemplate>
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="smaller lighter blue no-margin">Target</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DefaultMode="Edit"
                            UpdateMethod="fvParent_UpdateItem" SelectMethod="fvParent_SelectItem" OnPreRender="fvParent_PreRender">                            
                            <EditItemTemplate>
                                <div runat="server" visible='<%# ScorecardFrequency == MAT.App.Scorecard.Enumerate.ScorecardFrequency.Yearly %>'>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Font-Bold="true" Text="Frequency" AssociatedControlID="Yearly"></MAT:Label>
                                        <div class="col-sm-8">
                                            <MAT:Label runat="server" ID="Yearly" SkinID="FormValue" Text="Yearly"></MAT:Label>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Target" AssociatedControlID="rptYearly"></MAT:Label>
                                        <div class="col-sm-8" style="display: inherit">
                                            <asp:Repeater runat="server" ID="rptYearly" ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.TargetViewModel">
                                                <ItemTemplate>
                                                    <asp:HiddenField runat="server" ID="hfYear" Value='<%# Item.Year %>' />
                                                    <Metronic:TextBox runat="server" ID="YearlyTarget" Text='<%# Item.YearlyTarget %>'></Metronic:TextBox>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>
                                <div runat="server" visible='<%# ScorecardFrequency == MAT.App.Scorecard.Enumerate.ScorecardFrequency.Quarterly %>'>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Font-Bold="true" Text="Frequency" AssociatedControlID="Quarterly"></MAT:Label>
                                        <div class="col-sm-8">
                                            <MAT:Label runat="server" ID="Quarterly" SkinID="FormValue" Text="Quarterly"></MAT:Label>
                                        </div>
                                    </div>
                                    <asp:Repeater runat="server" ID="rptQuarterly" ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.TargetViewModel">
                                        <ItemTemplate>
                                            <asp:HiddenField runat="server" ID="hfYear" Value='<%# Item.Year %>' />
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" SkinID="FormLabel" Text="Year" AssociatedControlID="Year"></MAT:Label>
                                                <div class="col-sm-8">
                                                    <MAT:Label runat="server" ID="Year" SkinID="FormValue" Text='<%# Item.Year %>'></MAT:Label>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" SkinID="FormLabel" Text="Target" AssociatedControlID="QuarterOneTarget"></MAT:Label>
                                                <div class="col-sm-8" style="display: inherit;">
                                                    <Metronic:TextBox runat="server" ID="QuarterOneTarget"
                                                        Text='<%# Item.QuarterOneTarget %>' Style="max-width: 25%;"></Metronic:TextBox>
                                                    <Metronic:TextBox runat="server" ID="QuarterTwoTarget"
                                                        Text='<%# Item.QuarterTwoTarget %>' Style="max-width: 25%;"></Metronic:TextBox>
                                                    <Metronic:TextBox runat="server" ID="QuarterThreeTarget" 
                                                        Text='<%# Item.QuarterThreeTarget %>' Style="max-width: 25%;"></Metronic:TextBox>
                                                    <Metronic:TextBox runat="server" ID="QuarterFourTarget" 
                                                        Text='<%# Item.QuarterFourTarget %>' Style="max-width: 25%;"></Metronic:TextBox>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <div runat="server" visible='<%# ScorecardFrequency == MAT.App.Scorecard.Enumerate.ScorecardFrequency.Monthly %>'>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Font-Bold="true" Text="Frequency" AssociatedControlID="Monthly"></MAT:Label>
                                        <div class="col-sm-8">
                                            <MAT:Label runat="server" ID="Monthly" SkinID="FormValue" Text="Monthly"></MAT:Label>
                                        </div>
                                    </div>
                                    <asp:Repeater runat="server" ID="rptMonthly" ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.TargetViewModel">
                                        <ItemTemplate>
                                            <asp:HiddenField runat="server" ID="hfYear" Value='<%# Item.Year %>' />
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" SkinID="FormLabel" Text="Year" AssociatedControlID="Year"></MAT:Label>
                                                <div class="col-sm-8">
                                                    <MAT:Label runat="server" ID="Year" SkinID="FormValue" Text='<%# Item.Year %>'></MAT:Label>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" SkinID="FormLabel" Text="Target" AssociatedControlID="JanTarget"></MAT:Label>
                                                <div class="col-sm-8" style="display: inherit;">
                                                    <Metronic:TextBox runat="server" ID="JanTarget"
                                                        Text='<%# Item.JanTarget %>' Style="max-width: 16%;"></Metronic:TextBox>
                                                    <Metronic:TextBox runat="server" ID="FebTarget"
                                                        Text='<%# Item.FebTarget %>' Style="max-width: 16%;"></Metronic:TextBox>
                                                    <Metronic:TextBox runat="server" ID="MarTarget"
                                                        Text='<%# Item.MarTarget %>' Style="max-width: 16%;"></Metronic:TextBox>
                                                    <Metronic:TextBox runat="server" ID="AprTarget" 
                                                        Text='<%# Item.AprTarget %>' Style="max-width: 16%;"></Metronic:TextBox>
                                                    <Metronic:TextBox runat="server" ID="MayTarget" 
                                                        Text='<%# Item.MayTarget %>' Style="max-width: 16%;"></Metronic:TextBox>
                                                    <Metronic:TextBox runat="server" ID="JunTarget" 
                                                        Text='<%# Item.JunTarget %>' Style="max-width: 16%;"></Metronic:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" CssClass="col-sm-4">&nbsp;</MAT:Label>
                                                <div class="col-sm-8" style="display: inherit;">
                                                    <Metronic:TextBox runat="server" ID="JulTarget" 
                                                        Text='<%# Item.JulTarget %>' Style="max-width: 16%;"></Metronic:TextBox>
                                                    <Metronic:TextBox runat="server" ID="AugTarget" 
                                                        Text='<%# Item.AugTarget %>' Style="max-width: 16%;"></Metronic:TextBox>
                                                    <Metronic:TextBox runat="server" ID="SepTarget" 
                                                        Text='<%# Item.SepTarget %>' Style="max-width: 16%;"></Metronic:TextBox>
                                                    <Metronic:TextBox runat="server" ID="OctTarget" 
                                                        Text='<%# Item.OctTarget %>' Style="max-width: 16%;"></Metronic:TextBox>
                                                    <Metronic:TextBox runat="server" ID="NovTarget" 
                                                        Text='<%# Item.NovTarget %>' Style="max-width: 16%;"></Metronic:TextBox>
                                                    <Metronic:TextBox runat="server" ID="DecTarget" 
                                                        Text='<%# Item.DecTarget %>' Style="max-width: 16%;"></Metronic:TextBox>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </EditItemTemplate>
                        </MAT:FormView>
                    </div>
                    <div class="modal-footer">
                        <div class="pull-right">
                            <Metronic:LinkButton runat="server" ID="btnSave" SkinID="ButtonSave" CausesValidation="false" OnClick="btnSave_Click"></Metronic:LinkButton>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
