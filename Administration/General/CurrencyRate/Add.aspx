<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MAT.WebApp.App.Administration.General.CurrencyRate.Add" %>

<%@ Register Src="~/Administration/General/CurrencyRate/UserControl/ucCurrencyConversionRate.ascx" TagPrefix="MAT" TagName="ucCurrencyConversionRate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Create" CommandName="Insert"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" CausesValidation="false" OnClick="btnBack_Click"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upParent" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="CurrencyRateId" DefaultMode="Insert" InsertMethod="fvParent_InsertItem"
                ItemType="MAT.App.General.CurrencyRate.CurrencyRateViewModel" OnItemCreated="fvParent_ItemCreated">
                <InsertItemTemplate>
                    <div class="m-portlet">
                        <div class="m-portlet__body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" CssClass="col-sm-4 control-label no-padding-right" AssociatedControlID="BaseCurrency" Text="BaseCurrency" SkinID="FormLabel" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Insert" DataField="BaseCurrencyId" ID="BaseCurrency" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="EffectiveDate" AssociatedControlID="dc_effectiveDate" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Insert" DataField="EffectiveDate" ID="dc_effectiveDate" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- Currency Conversion Rate Grid View & Modal Pop Up--%>
                    <MAT:ucCurrencyConversionRate runat="server" ID="ucCurrencyConversionRate" CurrentMode="Edit" DataSet='<%# Bind("CurrencyConversionRateList") %>' Visible="false" />
                </InsertItemTemplate>
            </MAT:FormView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
