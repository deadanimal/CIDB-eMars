<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucWeight.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.UserControl.ucWeight" %>

<div class="pull-right">
    <Metronic:LinkButton runat="server" ID="btnAction" SkinID="ButtonFreeText" OnClick="btnAction_Click"
        FunctionAccessControlCode="Create" CausesValidation="false"></Metronic:LinkButton>
</div>

<asp:UpdatePanel runat="server" ID="upGv">
    <ContentTemplate>
        <Metronic:GridView runat="server" ID="gvWeight" SkinID="Custom" OnDataBound="gvWeight_DataBound"
            ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.WeightViewModel">
            <Columns>
                <MAT:BoundField DataField="Year" HeaderText="Year"></MAT:BoundField>
                <MAT:TemplateField HeaderText="YearlyWeight">
                    <ItemTemplate>
                        <%# Item.YearlyWeight.HasValue ? decimal.Round(Item.YearlyWeight.Value, 1).ToString() : "-" %>
                    </ItemTemplate>
                </MAT:TemplateField>
                <MAT:TemplateField HeaderText="QuarterlyWeight">
                    <ItemTemplate>
                        <%# CombineLoS(Item.QuarterOneWeight, Item.QuarterTwoWeight, Item.QuarterThreeWeight, Item.QuarterFourWeight) %>
                    </ItemTemplate>
                </MAT:TemplateField>
                <MAT:TemplateField HeaderText="MonthlyWeight">
                    <ItemTemplate>
                        <%# CombineLoS(Item.JanWeight, Item.FebWeight, Item.MarWeight, Item.AprWeight, Item.MarWeight, Item.JunWeight, 
    Item.JulWeight, Item.AugWeight, Item.SepWeight, Item.OctWeight, Item.NovWeight, Item.DecWeight) %>
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
                        <h3 class="smaller lighter blue no-margin">Weight</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DefaultMode="Edit"
                            UpdateMethod="fvParent_UpdateItem" SelectMethod="fvParent_SelectItem" OnPreRender="fvParent_PreRender">                            
                            <EditItemTemplate>
                                <div runat="server" visible='<%# ScorecardFrequency == MAT.App.Scorecard.Enumerate.ScorecardFrequency.Yearly ||
                                        ScorecardFrequency == MAT.App.Scorecard.Enumerate.ScorecardFrequency.Quarterly ||
                                        ScorecardFrequency == MAT.App.Scorecard.Enumerate.ScorecardFrequency.Monthly %>'>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Font-Bold="true" Text="Frequency" AssociatedControlID="Yearly"></MAT:Label>
                                        <div class="col-sm-8">
                                            <MAT:Label runat="server" ID="Yearly" SkinID="FormValue" Text="Yearly"></MAT:Label>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Weightage" AssociatedControlID="rptYearly"></MAT:Label>
                                        <div class="col-sm-8" style="display: inherit">
                                            <asp:Repeater runat="server" ID="rptYearly" ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.WeightViewModel">
                                                <ItemTemplate>
                                                    <asp:HiddenField runat="server" ID="hfYear" Value='<%# Item.Year %>' />
                                                    <Metronic:TextBox runat="server" ID="YearlyWeight" Text='<%# Item.YearlyWeight %>' placeholder='<%# Item.Year %>'></Metronic:TextBox>
                                                    <asp:RegularExpressionValidator runat="server" ID="revYearlyWeight" ControlToValidate="YearlyWeight"
                                                        ValidationExpression="(^(\+|\-)(0|([1-9][0-9]*))(\.[0-9]{1})?$)|(^(0{0,1}|([1-9][0-9]*))(\.[0-9]{1})?$)"
                                                        SetFocusOnError="true" ErrorMessage="Decimal with 1 decimal point only." Display="Dynamic"></asp:RegularExpressionValidator>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>
                                <div runat="server" visible='<%# ScorecardFrequency == MAT.App.Scorecard.Enumerate.ScorecardFrequency.Quarterly ||
                                        ScorecardFrequency == MAT.App.Scorecard.Enumerate.ScorecardFrequency.Monthly %>'>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Font-Bold="true" Text="Frequency" AssociatedControlID="Quarterly"></MAT:Label>
                                        <div class="col-sm-8">
                                            <MAT:Label runat="server" ID="Quarterly" SkinID="FormValue" Text="Quarterly"></MAT:Label>
                                        </div>
                                    </div>
                                    <asp:Repeater runat="server" ID="rptQuarterly" ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.WeightViewModel">
                                        <ItemTemplate>
                                            <asp:HiddenField runat="server" ID="hfYear" Value='<%# Item.Year %>' />
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" SkinID="FormLabel" Text="Year" AssociatedControlID="Year"></MAT:Label>
                                                <div class="col-sm-8">
                                                    <MAT:Label runat="server" ID="Year" SkinID="FormValue" Text='<%# Item.Year %>'></MAT:Label>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" SkinID="FormLabel" Text="Weightage" AssociatedControlID="QuarterOneWeight"></MAT:Label>
                                                <div class="col-sm-8" style="display: inherit;">
                                                    <Metronic:TextBox runat="server" ID="QuarterOneWeight" Text='<%# Item.QuarterOneWeight %>' placeholder="Q1"></Metronic:TextBox>
                                                    <asp:RegularExpressionValidator runat="server" ID="revQuarterOneWeight" ControlToValidate="QuarterOneWeight"
                                                        ValidationExpression="(^(\+|\-)(0|([1-9][0-9]*))(\.[0-9]{1})?$)|(^(0{0,1}|([1-9][0-9]*))(\.[0-9]{1})?$)"
                                                        SetFocusOnError="true" ErrorMessage="Decimal with 1 decimal point only." Display="Dynamic"></asp:RegularExpressionValidator>
                                                    <Metronic:TextBox runat="server" ID="QuarterTwoWeight" Text='<%# Item.QuarterTwoWeight %>' placeholder="Q2"></Metronic:TextBox>
                                                    <asp:RegularExpressionValidator runat="server" ID="revQuarterTwoWeight" ControlToValidate="QuarterTwoWeight"
                                                        ValidationExpression="(^(\+|\-)(0|([1-9][0-9]*))(\.[0-9]{1})?$)|(^(0{0,1}|([1-9][0-9]*))(\.[0-9]{1})?$)"
                                                        SetFocusOnError="true" ErrorMessage="Decimal with 1 decimal point only." Display="Dynamic"></asp:RegularExpressionValidator>
                                                    <Metronic:TextBox runat="server" ID="QuarterThreeWeight" Text='<%# Item.QuarterThreeWeight %>' placeholder="Q3"></Metronic:TextBox>
                                                    <asp:RegularExpressionValidator runat="server" ID="revQuarterThreeWeight" ControlToValidate="QuarterThreeWeight"
                                                        ValidationExpression="(^(\+|\-)(0|([1-9][0-9]*))(\.[0-9]{1})?$)|(^(0{0,1}|([1-9][0-9]*))(\.[0-9]{1})?$)"
                                                        SetFocusOnError="true" ErrorMessage="Decimal with 1 decimal point only." Display="Dynamic"></asp:RegularExpressionValidator>
                                                    <Metronic:TextBox runat="server" ID="QuarterFourWeight" Text='<%# Item.QuarterFourWeight %>' placeholder="Q4"></Metronic:TextBox>
                                                    <asp:RegularExpressionValidator runat="server" ID="revQuarterFourWeight" ControlToValidate="QuarterFourWeight"
                                                        ValidationExpression="(^(\+|\-)(0|([1-9][0-9]*))(\.[0-9]{1})?$)|(^(0{0,1}|([1-9][0-9]*))(\.[0-9]{1})?$)"
                                                        SetFocusOnError="true" ErrorMessage="Decimal with 1 decimal point only." Display="Dynamic"></asp:RegularExpressionValidator>
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
                                    <asp:Repeater runat="server" ID="rptMonthly" ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.WeightViewModel">
                                        <ItemTemplate>
                                            <asp:HiddenField runat="server" ID="hfYear" Value='<%# Item.Year %>' />
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" SkinID="FormLabel" Text="Year" AssociatedControlID="Year"></MAT:Label>
                                                <div class="col-sm-8">
                                                    <MAT:Label runat="server" ID="Year" SkinID="FormValue" Text='<%# Item.Year %>'></MAT:Label>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" SkinID="FormLabel" Text="Weightage" AssociatedControlID="JanWeight"></MAT:Label>
                                                <div class="col-sm-8" style="display: inherit;">
                                                    <Metronic:TextBox runat="server" ID="JanWeight" Text='<%# Item.JanWeight %>' placeholder="Jan"></Metronic:TextBox>
                                                    <asp:RegularExpressionValidator runat="server" ID="revJanWeight" ControlToValidate="JanWeight"
                                                        ValidationExpression="(^(\+|\-)(0|([1-9][0-9]*))(\.[0-9]{1})?$)|(^(0{0,1}|([1-9][0-9]*))(\.[0-9]{1})?$)"
                                                        SetFocusOnError="true" ErrorMessage="Decimal with 1 decimal point only." Display="Dynamic"></asp:RegularExpressionValidator>
                                                    <Metronic:TextBox runat="server" ID="FebWeight" Text='<%# Item.FebWeight %>' placeholder="Feb"></Metronic:TextBox>
                                                    <asp:RegularExpressionValidator runat="server" ID="revFebWeight" ControlToValidate="FebWeight"
                                                        ValidationExpression="(^(\+|\-)(0|([1-9][0-9]*))(\.[0-9]{1})?$)|(^(0{0,1}|([1-9][0-9]*))(\.[0-9]{1})?$)"
                                                        SetFocusOnError="true" ErrorMessage="Decimal with 1 decimal point only." Display="Dynamic"></asp:RegularExpressionValidator>
                                                    <Metronic:TextBox runat="server" ID="MarWeight" Text='<%# Item.MarWeight %>' placeholder="Mar"></Metronic:TextBox>
                                                    <asp:RegularExpressionValidator runat="server" ID="revMarWeight" ControlToValidate="MarWeight"
                                                        ValidationExpression="(^(\+|\-)(0|([1-9][0-9]*))(\.[0-9]{1})?$)|(^(0{0,1}|([1-9][0-9]*))(\.[0-9]{1})?$)"
                                                        SetFocusOnError="true" ErrorMessage="Decimal with 1 decimal point only." Display="Dynamic"></asp:RegularExpressionValidator>
                                                    <Metronic:TextBox runat="server" ID="AprWeight" Text='<%# Item.AprWeight %>' placeholder="Apr"></Metronic:TextBox>
                                                    <asp:RegularExpressionValidator runat="server" ID="revAprWeight" ControlToValidate="AprWeight"
                                                        ValidationExpression="(^(\+|\-)(0|([1-9][0-9]*))(\.[0-9]{1})?$)|(^(0{0,1}|([1-9][0-9]*))(\.[0-9]{1})?$)"
                                                        SetFocusOnError="true" ErrorMessage="Decimal with 1 decimal point only." Display="Dynamic"></asp:RegularExpressionValidator>
                                                    <Metronic:TextBox runat="server" ID="MayWeight" Text='<%# Item.MayWeight %>' placeholder="May"></Metronic:TextBox>
                                                    <asp:RegularExpressionValidator runat="server" ID="revMayWeight" ControlToValidate="MayWeight"
                                                        ValidationExpression="(^(\+|\-)(0|([1-9][0-9]*))(\.[0-9]{1})?$)|(^(0{0,1}|([1-9][0-9]*))(\.[0-9]{1})?$)"
                                                        SetFocusOnError="true" ErrorMessage="Decimal with 1 decimal point only." Display="Dynamic"></asp:RegularExpressionValidator>
                                                    <Metronic:TextBox runat="server" ID="JunWeight" Text='<%# Item.JunWeight %>' placeholder="Jun"></Metronic:TextBox>
                                                    <asp:RegularExpressionValidator runat="server" ID="revJunWeight" ControlToValidate="JunWeight"
                                                        ValidationExpression="(^(\+|\-)(0|([1-9][0-9]*))(\.[0-9]{1})?$)|(^(0{0,1}|([1-9][0-9]*))(\.[0-9]{1})?$)"
                                                        SetFocusOnError="true" ErrorMessage="Decimal with 1 decimal point only." Display="Dynamic"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" CssClass="col-sm-4">&nbsp;</MAT:Label>
                                                <div class="col-sm-8" style="display: inherit;">
                                                    <Metronic:TextBox runat="server" ID="JulWeight" Text='<%# Item.JulWeight %>' placeholder="Jul"></Metronic:TextBox>
                                                    <asp:RegularExpressionValidator runat="server" ID="revJulWeight" ControlToValidate="JulWeight"
                                                        ValidationExpression="(^(\+|\-)(0|([1-9][0-9]*))(\.[0-9]{1})?$)|(^(0{0,1}|([1-9][0-9]*))(\.[0-9]{1})?$)"
                                                        SetFocusOnError="true" ErrorMessage="Decimal with 1 decimal point only." Display="Dynamic"></asp:RegularExpressionValidator>
                                                    <Metronic:TextBox runat="server" ID="AugWeight" Text='<%# Item.AugWeight %>' placeholder="Aug"></Metronic:TextBox>
                                                    <asp:RegularExpressionValidator runat="server" ID="revAugWeight" ControlToValidate="AugWeight"
                                                        ValidationExpression="(^(\+|\-)(0|([1-9][0-9]*))(\.[0-9]{1})?$)|(^(0{0,1}|([1-9][0-9]*))(\.[0-9]{1})?$)"
                                                        SetFocusOnError="true" ErrorMessage="Decimal with 1 decimal point only." Display="Dynamic"></asp:RegularExpressionValidator>
                                                    <Metronic:TextBox runat="server" ID="SepWeight" Text='<%# Item.SepWeight %>' placeholder="Sep"></Metronic:TextBox>
                                                    <asp:RegularExpressionValidator runat="server" ID="revSepWeight" ControlToValidate="SepWeight"
                                                        ValidationExpression="(^(\+|\-)(0|([1-9][0-9]*))(\.[0-9]{1})?$)|(^(0{0,1}|([1-9][0-9]*))(\.[0-9]{1})?$)"
                                                        SetFocusOnError="true" ErrorMessage="Decimal with 1 decimal point only." Display="Dynamic"></asp:RegularExpressionValidator>
                                                    <Metronic:TextBox runat="server" ID="OctWeight" Text='<%# Item.OctWeight %>' placeholder="Oct"></Metronic:TextBox>
                                                    <asp:RegularExpressionValidator runat="server" ID="revOctWeight" ControlToValidate="OctWeight"
                                                        ValidationExpression="(^(\+|\-)(0|([1-9][0-9]*))(\.[0-9]{1})?$)|(^(0{0,1}|([1-9][0-9]*))(\.[0-9]{1})?$)"
                                                        SetFocusOnError="true" ErrorMessage="Decimal with 1 decimal point only." Display="Dynamic"></asp:RegularExpressionValidator>
                                                    <Metronic:TextBox runat="server" ID="NovWeight" Text='<%# Item.NovWeight %>' placeholder="Nov"></Metronic:TextBox>
                                                    <asp:RegularExpressionValidator runat="server" ID="revNovWeight" ControlToValidate="NovWeight"
                                                        ValidationExpression="(^(\+|\-)(0|([1-9][0-9]*))(\.[0-9]{1})?$)|(^(0{0,1}|([1-9][0-9]*))(\.[0-9]{1})?$)"
                                                        SetFocusOnError="true" ErrorMessage="Decimal with 1 decimal point only." Display="Dynamic"></asp:RegularExpressionValidator>
                                                    <Metronic:TextBox runat="server" ID="DecWeight" Text='<%# Item.DecWeight %>' placeholder="Dec"></Metronic:TextBox>
                                                    <asp:RegularExpressionValidator runat="server" ID="revDecWeight" ControlToValidate="DecWeight"
                                                        ValidationExpression="(^(\+|\-)(0|([1-9][0-9]*))(\.[0-9]{1})?$)|(^(0{0,1}|([1-9][0-9]*))(\.[0-9]{1})?$)"
                                                        SetFocusOnError="true" ErrorMessage="Decimal with 1 decimal point only." Display="Dynamic"></asp:RegularExpressionValidator>
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
