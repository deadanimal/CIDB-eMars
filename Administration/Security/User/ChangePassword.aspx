<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="MAT.WebApp.App.Administration.Security.User.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave" CausesValidation="true" AssociatedFormViewId="fvParent" CommandName="Insert"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" SkinID="ButtonBack" CausesValidation="false" OnClick="btnBack_Click"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView runat="server" ID="fvParent" DefaultMode="Insert" InsertMethod="fvParent_InsertItem"
        ItemType="MAT.App.Security.User.ChangePasswordViewModel" RenderOuterTable="false">
        <InsertItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <span class="m-portlet__head-icon m--hide">
                                <i class="la la-gear"></i>
                            </span>
                            <h3 class="m-portlet__head-text">
                                <MAT:Literal runat="server" Text="ChangePassword"></MAT:Literal>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="NewPassword" AssociatedControlID="NewPassword"></MAT:Label>
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" ID="NewPassword" Mode="Insert" DataField="NewPassword" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="ConfirmPassword" AssociatedControlID="ConfirmNewPassword"></MAT:Label>
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" ID="ConfirmNewPassword" Mode="Insert" DataField="ConfirmNewPassword" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </InsertItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
