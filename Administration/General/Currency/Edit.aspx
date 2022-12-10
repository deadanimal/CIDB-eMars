<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MAT.WebApp.App.Administration.General.Currency.Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Edit" CommandName="Update"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" OnClick="btnBack_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="CurrencyId" DefaultMode="Edit" ItemType="MAT.App.General.Currency.CurrencyViewModel"
        UpdateMethod="fvParent_UpdateItem" SelectMethod="fvParent_GetItem">
        <EditItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="CurrencyCode" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="CurrencyCode" ID="Code" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="CurrencyName" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="CurrencyName" ID="Name" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </EditItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
