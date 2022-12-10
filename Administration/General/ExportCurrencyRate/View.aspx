<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.Administration.General.ExportCurrencyRate.View" %>

<%@ Register Src="~/Administration/General/UserControl/ucCurrencyConversionRate.ascx" TagPrefix="MAT" TagName="ucCurrencyConversionRate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton ID="btnEdit" runat="server" SkinID="ButtonEdit" FunctionAccessControlCode="Edit" OnClick="btnEdit_Click"></Metronic:LinkButton>
    <Metronic:FormViewButton ID="btnDelete" runat="server" SkinID="ButtonDelete" FunctionAccessControlCode="Delete" AssociatedFormViewId="fvParent" CommandName="Delete" CausesValidation="false"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" OnClick="btnBack_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="CurrencyRateId" DefaultMode="ReadOnly" SelectMethod="fvParent_GetItem"
        ItemType="MAT.App.General.CurrencyRate.CurrencyRateViewModel" DeleteMethod="fvParent_DeleteItem">
        <ItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="BaseCurrency" AssociatedControlID="baseCurrency" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="BaseCurrencyId" ID="baseCurrency" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="EffectiveDate" AssociatedControlID="effectiveDate" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="EffectiveDate" ID="effectiveDate" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- Currency Conversion Rate Grid View & Modal Pop Up--%>
            <MAT:ucCurrencyConversionRate runat="server" ID="ucCurrencyConversionRate" CurrencyRateID="<%# Item.CurrencyRateId %>"
                CurrentMode="ReadOnly" BaseCurrencyID="<%# Item.BaseCurrencyId %>" DataSet='<%# Bind("CurrencyConversionRateList") %>' />
            <%-- Data Information --%>
            <MAT:DataInformation runat="server" ID="ucDataInformation" TableName="[CurrencyRate]" PrimaryKeyName="[CurrencyRateId]"
                PrimaryKeyValue="<%# Item.CurrencyRateId %>" />
        </ItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
