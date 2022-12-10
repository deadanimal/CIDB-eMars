<%@ Page Async="true" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="MAT.WebApp.App.MyProfile.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton ID="btnSave" runat="server" SkinID="ButtonFreeText" Text="ChangePassword" OnClick="btnSave_Click"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-portlet">
        <div class="m-portlet__body">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group m-form__group mat-form-group" runat="server" id="divOldPassword">
                        <MAT:Label ID="Label2" runat="server" SkinID="FormLabel" Text="OldPassword" AssociatedControlID="OldPassword" />
                        <div class="col-sm-7">
                            <Metronic:TextBox runat="server" ID="OldPassword" TextMode="Password" Mandatory="true" />
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label ID="Label1" runat="server" SkinID="FormLabel" Text="NewPassword" AssociatedControlID="NewPassword" />
                        <div class="col-sm-7">
                            <Metronic:TextBox runat="server" ID="NewPassword" TextMode="Password" Mandatory="true" />
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label ID="Label3" runat="server" SkinID="FormLabel" Text="ConfirmNewPassword" AssociatedControlID="ConfirmNewPassword" />
                        <div class="col-sm-7">
                            <Metronic:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" Mandatory="true" />
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <div class="col-sm-offset-5 col-sm-7">
                            <%: PasswordPolicyMessage %>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                </div>
            </div>
        </div>
    </div>
     
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
