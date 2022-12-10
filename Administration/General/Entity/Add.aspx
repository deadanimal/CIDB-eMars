<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MAT.WebApp.App.Administration.General.Entity.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Create" CommandName="Insert"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" PostBackUrl="Index.aspx" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="EntityId" DefaultMode="Insert"
        ItemType="MAT.App.General.Entity.EntityViewModel" InsertMethod="fvParent_InsertItem">
        <InsertItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <h3 class="m-portlet__head-text">
                                <MAT:Literal runat="server" Text="General"></MAT:Literal>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label13" runat="server" SkinID="FormLabel" Text="EntityCode" AssociatedControlID="Code" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Code" ID="Code" />
                                </div>
                            </div>
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label2" runat="server" SkinID="FormLabel" Text="EntityName" AssociatedControlID="Name" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Name" ID="Name" />
                                </div>
                            </div>
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label1" runat="server" SkinID="FormLabel" Text="CompanyRegistrationNo" AssociatedControlID="CompanyRegistrationNo" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="CompanyRegistrationNo" ID="CompanyRegistrationNo" />
                                </div>
                            </div>
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label3" runat="server" SkinID="FormLabel" Text="Logo" AssociatedControlID="avtLogo" />
                                <div class="col-sm-8 col-xs-12">
                                    <MATAce:Avatar ID="avtLogo" runat="server" DestinationPath="Upload" Title="UploadImage" ImagePath='<%# Bind("LogoPath") %>' />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label4" runat="server" SkinID="FormLabel" Text="Address" AssociatedControlID="Address1" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Address1" ID="Address1" />
                                </div>
                            </div>
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label5" runat="server" SkinID="FormLabel" AssociatedControlID="Address2" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Address2" ID="Address2" />
                                </div>
                            </div>
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label6" runat="server" SkinID="FormLabel" AssociatedControlID="Address3" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Address3" ID="Address3" />
                                </div>
                            </div>
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label7" runat="server" SkinID="FormLabel" Text="Postcode" AssociatedControlID="Postcode" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Postcode" ID="Postcode" />
                                </div>
                            </div>
                            <MAT:CountryState runat="server" ID="CountryState" CurrentMode="Insert" AreaMasterId='<%# Bind("AreaMasterId") %>' />
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label12" runat="server" SkinID="FormLabel" Text="City" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="CityName" ID="CityName" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="m-portlet">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <h3 class="m-portlet__head-text">
                                <MAT:Literal runat="server" Text="Contact"></MAT:Literal>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label8" runat="server" SkinID="FormLabel" Text="BusinessPhoneNo" AssociatedControlID="Phone" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Phone" ID="Phone" />
                                </div>
                            </div>
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label9" runat="server" SkinID="FormLabel" Text="FaxNo" AssociatedControlID="Fax" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Fax" ID="Fax" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label10" runat="server" SkinID="FormLabel" Text="ContactPerson" AssociatedControlID="DisplayName" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="DisplayName" ID="DisplayName" />
                                </div>
                            </div>
                            <div class="m-form__group mat-form-group">
                                 <MAT:Label ID="Label11" runat="server" SkinID="FormLabel" Text="Position" AssociatedControlID="Position" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Position" ID="Position" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </InsertItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>

