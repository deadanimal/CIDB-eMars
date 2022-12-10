<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MAT.WebApp.App.Administration.General.ExportCurrencyRate.Edit" %>

<%@ Register Src="~/Administration/General/UserControl/ucCurrencyConversionRate.ascx" TagPrefix="MAT" TagName="ucCurrencyConversionRate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Edit" CommandName="Update"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" OnClick="btnBack_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="CurrencyRateId" ItemType="MAT.App.General.CurrencyRate.CurrencyRateViewModel"
        SelectMethod="fvParent_GetItem" UpdateMethod="fvParent_UpdateItem" DefaultMode="Edit">
        <EditItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" CssClass="col-sm-4 control-label no-padding-right" AssociatedControlID="BaseCurrency"
                                    Text="BaseCurrency" SkinID="FormLabel" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="BaseCurrencyId" ID="BaseCurrency" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="EffectiveDate" AssociatedControlID="effectiveDate" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="EffectiveDate" ID="effectiveDate" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- Currency Conversion Rate Grid View & Modal Pop Up--%>
            <MAT:ucCurrencyConversionRate runat="server" ID="ucCurrencyConversionRate" CurrentMode="Edit" CurrencyRateID='<%# Eval("CurrencyRateId") %>'
                BaseCurrencyID='<%# Eval("BaseCurrencyId") %>' DataSet='<%# Bind("CurrencyConversionRateList") %>' />
            <%-- Data Information --%>
            <MAT:DataInformation runat="server" ID="ucDataInformation" TableName="[CurrencyRate]" PrimaryKeyName="[CurrencyRateId]"
                PrimaryKeyValue="<%# Item.CurrencyRateId %>" />
        </EditItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
