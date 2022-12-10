<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucUpdateScorecardKpi.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.PerformanceScorecard.UserControl.ucUpdateScorecardKpi" %>

<Metronic:LinkButton runat="server" ID="btnUpdate" SkinID="ButtonFreeLink" Text="Update" OnClick="btnUpdate_Click"
    Style="align-self: center; text-align: center; padding-top: calc(0.65rem + 1px);" CausesValidation="false"></Metronic:LinkButton>

<div class="modal fade" id="modalFormDate" runat="server" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg" role="document">
        <asp:UpdatePanel runat="server" ID="upFormDate">
            <ContentTemplate>
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="smaller lighter blue no-margin">
                            <MAT:Literal runat="server" Text="Update"></MAT:Literal>
                        </h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="m-portlet">
                            <div class="m-portlet__body">
                                <div class="row">
                                    <div class="col-md-12">                                        
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="EffectiveDate" AssociatedControlID="DateEffectiveDate"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="DateEffectiveDate" SkinID="DatePicker" Mandatory="true"></Metronic:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="OldValue" AssociatedControlID="OldValueDate"></MAT:Label>
                                            <div class="col-sm-8">
                                                <MAT:Label runat="server" ID="OldValueDate" SkinID="FormValue"></MAT:Label>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="NewValue" AssociatedControlID="NewValueDate"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="NewValueDate" SkinID="DatePicker"></Metronic:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="pull-right">
                            <Metronic:LinkButton runat="server" ID="btnSaveDate" SkinID="ButtonSave" OnClick="btnSaveDate_Click" CausesValidation="false"></Metronic:LinkButton>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>

<div class="modal fade" id="modalFormText" runat="server" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg" role="document">
        <asp:UpdatePanel runat="server" ID="upFormText">
            <ContentTemplate>
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="smaller lighter blue no-margin">
                            <MAT:Literal runat="server" Text="Update"></MAT:Literal>
                        </h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="m-portlet">
                            <div class="m-portlet__body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="EffectiveDate" AssociatedControlID="TextEffectiveDate"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="TextEffectiveDate" SkinID="DatePicker" Mandatory="true"></Metronic:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="OldValue" AssociatedControlID="OldValueTB"></MAT:Label>
                                            <div class="col-sm-8">
                                                <MAT:Label runat="server" ID="OldValueTB" SkinID="FormValue"></MAT:Label>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="NewValue" AssociatedControlID="NewValueTB"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="NewValueTB"></Metronic:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="pull-right">
                            <Metronic:LinkButton runat="server" ID="btnSaveTB" SkinID="ButtonSave" OnClick="btnSaveTB_Click" CausesValidation="false"></Metronic:LinkButton>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>

<div class="modal fade" id="modalFormDD" runat="server" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg" role="document">
        <asp:UpdatePanel runat="server" ID="upFormDropdown">
            <ContentTemplate>
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="smaller lighter blue no-margin">
                            <MAT:Literal runat="server" Text="Update"></MAT:Literal>
                        </h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="m-portlet">
                            <div class="m-portlet__body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="EffectiveDate" AssociatedControlID="DropdownEffectiveDate"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="DropdownEffectiveDate" SkinID="DatePicker" Mandatory="true"></Metronic:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="OldValue" AssociatedControlID="OldValueDD"></MAT:Label>
                                            <div class="col-sm-8">
                                                <MAT:Label runat="server" ID="OldValueDD" SkinID="FormValue"></MAT:Label>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="NewValue" AssociatedControlID="NewValueDD"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:DropDownList runat="server" ID="NewValueDD" DataValueField="Key" DataTextField="Value"></Metronic:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="pull-right">
                            <Metronic:LinkButton runat="server" ID="btnSaveDD" SkinID="ButtonSave" OnClick="btnSaveDD_Click" CausesValidation="false"></Metronic:LinkButton>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>

<div class="modal fade" id="modalFormWeight" runat="server" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg" role="document">
        <asp:UpdatePanel runat="server" ID="upFormWeight">
            <ContentTemplate>
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="smaller lighter blue no-margin">
                            <MAT:Literal runat="server" Text="Weight"></MAT:Literal>
                        </h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="m-portlet">
                            <div class="m-portlet__body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div runat="server" id="YearlyWeight" visible="false">
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" SkinID="FormLabel" Font-Bold="true" Text="Frequency" AssociatedControlID="YearlyW"></MAT:Label>
                                                <div class="col-sm-8">
                                                    <MAT:Label runat="server" ID="YearlyW" SkinID="FormValue" Text="Yearly"></MAT:Label>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" SkinID="FormLabel" Text="Weightage" AssociatedControlID="rptYearlyWeight"></MAT:Label>
                                                <div class="col-sm-8" style="display: inherit">
                                                    <asp:Repeater runat="server" ID="rptYearlyWeight"
                                                        ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.WeightViewModel">
                                                        <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="hfYear" Value='<%# Item.Year %>' />
                                                            <Metronic:TextBox runat="server" ID="YearlyWeight" Text='<%# Item.YearlyWeight %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 12, DateTime.DaysInMonth(Item.Year, 12)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revYearlyWeight" ControlToValidate="YearlyWeight"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$"
                                                                SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic"></asp:RegularExpressionValidator>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                        <div runat="server" id="QuarterlyWeight" visible="false">
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" SkinID="FormLabel" Font-Bold="true" Text="Frequency" AssociatedControlID="Quarterly"></MAT:Label>
                                                <div class="col-sm-8">
                                                    <MAT:Label runat="server" ID="Quarterly" SkinID="FormValue" Text="Quarterly"></MAT:Label>
                                                </div>
                                            </div>
                                            <asp:Repeater runat="server" ID="rptQuarterlyWeight" ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.WeightViewModel">
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
                                                            <Metronic:TextBox runat="server" ID="QuarterOneWeight" Text='<%# Item.QuarterOneWeight %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revQuarterOneWeight" ControlToValidate="QuarterOneWeight"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic"></asp:RegularExpressionValidator>
                                                            <Metronic:TextBox runat="server" ID="QuarterTwoWeight" Text='<%# Item.QuarterTwoWeight %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revQuarterTwoWeight" ControlToValidate="QuarterTwoWeight"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic"></asp:RegularExpressionValidator>
                                                            <Metronic:TextBox runat="server" ID="QuarterThreeWeight" Text='<%# Item.QuarterThreeWeight %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revQuarterThreeWeight" ControlToValidate="QuarterThreeWeight"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic"></asp:RegularExpressionValidator>
                                                            <Metronic:TextBox runat="server" ID="QuarterFourWeight" Text='<%# Item.QuarterFourWeight %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revQuarterFourWeight" ControlToValidate="QuarterFourWeight"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic"></asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <div runat="server" id="MonthlyWeight" visible="false">
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" SkinID="FormLabel" Font-Bold="true" Text="Frequency" AssociatedControlID="Monthly"></MAT:Label>
                                                <div class="col-sm-8">
                                                    <MAT:Label runat="server" ID="Monthly" SkinID="FormValue" Text="Monthly"></MAT:Label>
                                                </div>
                                            </div>
                                            <asp:Repeater runat="server" ID="rptMonthlyWeight"
                                                ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.WeightViewModel">
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
                                                            <Metronic:TextBox runat="server" ID="JanWeight" Text='<%# Item.JanWeight %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 1, DateTime.DaysInMonth(Item.Year, 1)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revJanWeight" ControlToValidate="JanWeight"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="FebWeight" Text='<%# Item.FebWeight %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 2, DateTime.DaysInMonth(Item.Year, 2)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revFebWeight" ControlToValidate="FebWeight"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="MarWeight" Text='<%# Item.MarWeight %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 3, DateTime.DaysInMonth(Item.Year, 3)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revMarWeight" ControlToValidate="MarWeight"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="AprWeight" Text='<%# Item.AprWeight %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 4, DateTime.DaysInMonth(Item.Year, 4)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revAprWeight" ControlToValidate="AprWeight"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="MayWeight" Text='<%# Item.MayWeight %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 5, DateTime.DaysInMonth(Item.Year, 5)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revMayWeight" ControlToValidate="MayWeight"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="JunWeight" Text='<%# Item.JunWeight %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 6, DateTime.DaysInMonth(Item.Year, 6)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revJunWeight" ControlToValidate="JunWeight"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <MAT:Label runat="server" CssClass="col-sm-4">&nbsp;</MAT:Label>
                                                        <div class="col-sm-8" style="display: inherit;">
                                                            <Metronic:TextBox runat="server" ID="JulWeight" Text='<%# Item.JulWeight %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 7, DateTime.DaysInMonth(Item.Year, 7)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revJulWeight" ControlToValidate="JulWeight"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="AugWeight" Text='<%# Item.AugWeight %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 8, DateTime.DaysInMonth(Item.Year, 8)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revAugWeight" ControlToValidate="AugWeight"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="SepWeight" Text='<%# Item.SepWeight %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 9, DateTime.DaysInMonth(Item.Year, 9)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revSepWeight" ControlToValidate="SepWeight"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="OctWeight" Text='<%# Item.OctWeight %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 10, DateTime.DaysInMonth(Item.Year, 10)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revOctWeight" ControlToValidate="OctWeight"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="NovWeight" Text='<%# Item.NovWeight %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 11, DateTime.DaysInMonth(Item.Year, 11)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revNovWeight" ControlToValidate="NovWeight"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="DecWeight" Text='<%# Item.DecWeight %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 12, DateTime.DaysInMonth(Item.Year, 12)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revDecWeight" ControlToValidate="DecWeight"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="pull-right">
                            <Metronic:LinkButton runat="server" ID="btnSaveWeight" SkinID="ButtonFreeText" Text="Save" OnClick="btnSaveWeight_Click" CausesValidation="false"></Metronic:LinkButton>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>

<div class="modal fade" id="modalFormTarget" runat="server" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg" role="document">
        <asp:UpdatePanel runat="server" ID="upFormTarget">
            <ContentTemplate>
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="smaller lighter blue no-margin">
                            <MAT:Literal runat="server" Text="Target"></MAT:Literal>
                        </h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="m-portlet">
                            <div class="m-portlet__body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div runat="server" id="YearlyTarget" visible="false">
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" SkinID="FormLabel" Font-Bold="true" Text="Frequency" AssociatedControlID="YearlyT"></MAT:Label>
                                                <div class="col-sm-8">
                                                    <MAT:Label runat="server" ID="YearlyT" SkinID="FormValue" Text="Yearly"></MAT:Label>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" SkinID="FormLabel" Text="Target" AssociatedControlID="rptYearly"></MAT:Label>
                                                <div class="col-sm-8" style="display: inherit">
                                                    <asp:Repeater runat="server" ID="rptYearly" ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.TargetViewModel">
                                                        <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="hfYear" Value='<%# Item.Year %>' />
                                                            <Metronic:TextBox runat="server" ID="YearlyTarget" Text='<%# Item.YearlyTarget %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 12, DateTime.DaysInMonth(Item.Year, 12)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revYearlyTarget" ControlToValidate="YearlyTarget"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                        <div runat="server" id="QuarterlyTarget" visible="false">
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" SkinID="FormLabel" Font-Bold="true" Text="Frequency" AssociatedControlID="QuarterlyT"></MAT:Label>
                                                <div class="col-sm-8">
                                                    <MAT:Label runat="server" ID="QuarterlyT" SkinID="FormValue" Text="Quarterly"></MAT:Label>
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
                                                            <Metronic:TextBox runat="server" ID="QuarterOneTarget" Text='<%# Item.QuarterOneTarget %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 3, DateTime.DaysInMonth(Item.Year, 3)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revQuarterOneTarget" ControlToValidate="QuarterOneTarget"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="QuarterTwoTarget" Text='<%# Item.QuarterTwoTarget %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 6, DateTime.DaysInMonth(Item.Year, 6)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revQuarterTwoTarget" ControlToValidate="QuarterTwoTarget"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="QuarterThreeTarget" Text='<%# Item.QuarterThreeTarget %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 9, DateTime.DaysInMonth(Item.Year, 9)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revQuarterThreeTarget" ControlToValidate="QuarterThreeTarget"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="QuarterFourTarget" Text='<%# Item.QuarterFourTarget %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 12, DateTime.DaysInMonth(Item.Year, 12)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revQuarterFourTarget" ControlToValidate="QuarterFourTarget"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <div runat="server" id="MonthlyTarget" visible="false">
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" SkinID="FormLabel" Font-Bold="true" Text="Frequency" AssociatedControlID="MonthlyT"></MAT:Label>
                                                <div class="col-sm-8">
                                                    <MAT:Label runat="server" ID="MonthlyT" SkinID="FormValue" Text="Monthly"></MAT:Label>
                                                </div>
                                            </div>
                                            <asp:Repeater runat="server" ID="rptMonthly"
                                                ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.PerformanceScorecard.TargetViewModel">
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
                                                            <Metronic:TextBox runat="server" ID="JanTarget" Text='<%# Item.JanTarget %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 1, DateTime.DaysInMonth(Item.Year, 1)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revJanTarget" ControlToValidate="JanTarget"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="FebTarget" Text='<%# Item.FebTarget %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 2, DateTime.DaysInMonth(Item.Year, 2)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revFebTarget" ControlToValidate="FebTarget"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="MarTarget" Text='<%# Item.MarTarget %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 3, DateTime.DaysInMonth(Item.Year, 3)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revMarTarget" ControlToValidate="MarTarget"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="AprTarget" Text='<%# Item.AprTarget %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 4, DateTime.DaysInMonth(Item.Year, 4)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revAprTarget" ControlToValidate="AprTarget"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="MayTarget" Text='<%# Item.MayTarget %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 5, DateTime.DaysInMonth(Item.Year, 5)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revMayTarget" ControlToValidate="MayTarget"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="JunTarget" Text='<%# Item.JunTarget %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 6, DateTime.DaysInMonth(Item.Year, 6)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revJunTarget" ControlToValidate="JunTarget"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group m-form__group mat-form-group">
                                                        <MAT:Label runat="server" CssClass="col-sm-4">&nbsp;</MAT:Label>
                                                        <div class="col-sm-8" style="display: inherit;">
                                                            <Metronic:TextBox runat="server" ID="JulTarget" Text='<%# Item.JulTarget %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 7, DateTime.DaysInMonth(Item.Year, 7)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revJulTarget" ControlToValidate="JulTarget"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">

                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="AugTarget" Text='<%# Item.AugTarget %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 8, DateTime.DaysInMonth(Item.Year, 8)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revAugTarget" ControlToValidate="AugTarget"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="SepTarget" Text='<%# Item.SepTarget %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 9, DateTime.DaysInMonth(Item.Year, 9)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revSepTarget" ControlToValidate="SepTarget"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="OctTarget" Text='<%# Item.OctTarget %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 10, DateTime.DaysInMonth(Item.Year, 10)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revOctTarget" ControlToValidate="OctTarget"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="NovTarget" Text='<%# Item.NovTarget %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 11, DateTime.DaysInMonth(Item.Year, 11)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revNovTarget" ControlToValidate="NovTarget"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>

                                                            <Metronic:TextBox runat="server" ID="DecTarget" Text='<%# Item.DecTarget %>'
                                                                ReadOnly='<%# new DateTime(Item.Year, 12, DateTime.DaysInMonth(Item.Year, 12)) <= DateTime.Now %>'></Metronic:TextBox>
                                                            <asp:RegularExpressionValidator runat="server" ID="revDecTarget" ControlToValidate="DecTarget"
                                                                ValidationExpression="^(\d{0,9}\.)?\d{1,2}?$" SetFocusOnError="true" ErrorMessage="Decimal only" Display="Dynamic">
                                                            </asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="pull-right">
                            <Metronic:LinkButton runat="server" ID="btnSaveTarget" SkinID="ButtonFreeText" Text="Save" OnClick="btnSaveTarget_Click" CausesValidation="false"></Metronic:LinkButton>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
