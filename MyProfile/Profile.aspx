<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="MAT.WebApp.App.MyProfile.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" AssociatedFormViewId="fvParent" CommandName="Update"></Metronic:FormViewButton>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="employeeId" DefaultMode="Edit" ItemType="MAT.App.Security.User.MyProfileViewModel"
        SelectMethod="fvParent_GetItem" UpdateMethod="fvParent_UpdateItem">
        <EditItemTemplate>
            <div class="col-xs-12">
                <div class="row form-horizontal" role="form">
                    <div class="col-sm-6 col-xs-12">
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label ID="Label1" runat="server" SkinID="FormLabel" Text="Name" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Name" ID="dc_Name" />
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label ID="Label2" runat="server" SkinID="FormLabel" Text="Department" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Department" ID="dc_Deparments" />
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label ID="Label3" runat="server" SkinID="FormLabel" Text="Email" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Email" ID="dc_Email" />
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label ID="Label5" runat="server" SkinID="FormLabel" Text="MobilePhone" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="MobilePhone" ID="dc_MobilePhone" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-xs-12">
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label ID="Label7" runat="server" SkinID="FormLabel" Text="ProfileImage" AssociatedControlID="avtProfileImage" />
                            <div class="col-sm-7">
                                <Metronic:Avatar ID="avtProfileImage" runat="server" DestinationPath="Upload\ProfileImage" Title="UploadLogo"
                                    ImagePath='<%# BindItem.ProfileImagePath %>' />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </EditItemTemplate>
    </MAT:FormView>
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
