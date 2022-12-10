<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.Administration.General.Entity.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton ID="btnEdit" runat="server" SkinID="ButtonEdit" FunctionAccessControlCode="Edit" NavigateUrl="Edit.aspx"></Metronic:LinkButton>
    <Metronic:FormViewButton ID="btnDelete" runat="server" SkinID="ButtonDelete" FunctionAccessControlCode="Delete" AssociatedFormViewId="fvParent" CommandName="Delete" CausesValidation="false"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="HyperLink1" runat="server" SkinID="ButtonBack" NavigateUrl="Index.aspx" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="EntityId" DefaultMode="ReadOnly"
        ItemType="MAT.App.General.Entity.EntityViewModel" SelectMethod="fvParent_GetItem" DeleteMethod="fvParent_DeleteItem">
        <ItemTemplate>
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
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Code" ID="Code" />
                                </div>
                            </div>
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label2" runat="server" SkinID="FormLabel" Text="EntityName" AssociatedControlID="Name" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Name" ID="Name" />
                                </div>
                            </div>
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label1" runat="server" SkinID="FormLabel" Text="CompanyRegistrationNo" AssociatedControlID="CompanyRegistrationNo" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="CompanyRegistrationNo" ID="CompanyRegistrationNo" />
                                </div>
                            </div>
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label3" runat="server" SkinID="FormLabel" Text="Logo" AssociatedControlID="avtLogo" />
                                <div class="col-sm-8 col-xs-12">
                                    <MATAce:Avatar ID="avtLogo" runat="server" ReadOnly="true" DestinationPath="Upload" Title="UploadLogo" ImagePath='<%# Eval("LogoPath") %>' />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label4" runat="server" SkinID="FormLabel" Text="Address" AssociatedControlID="Address1" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Address1" ID="Address1" />
                                </div>
                            </div>
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label5" runat="server" SkinID="FormLabel" AssociatedControlID="Address2" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Address2" ID="Address2" />
                                </div>
                            </div>
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label6" runat="server" SkinID="FormLabel" AssociatedControlID="Address3" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Address3" ID="Address3" />
                                </div>
                            </div>
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label7" runat="server" SkinID="FormLabel" Text="Postcode" AssociatedControlID="Postcode" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Postcode" ID="Postcode" />
                                </div>
                            </div>
                            <MAT:CountryState ID="CountryState" runat="server" CurrentMode="ReadOnly" AreaMasterId='<%# Eval("AreaMasterId") %>' />
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label12" runat="server" SkinID="FormLabel" Text="City" AssociatedControlID="CityName" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="CityName" ID="CityName" />
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
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Phone" ID="Phone" />
                                </div>
                            </div>
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label9" runat="server" SkinID="FormLabel" Text="FaxNo" AssociatedControlID="Fax" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Fax" ID="Fax" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label10" runat="server" SkinID="FormLabel" Text="ContactPerson" AssociatedControlID="DisplayName" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="DisplayName" ID="DisplayName" />
                                </div>
                            </div>
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label11" runat="server" SkinID="FormLabel" Text="Position" AssociatedControlID="Position" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Position" ID="Position" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <MAT:DataInformation runat="server" TableName="Entity" PrimaryKeyName="EntityID" PrimaryKeyValue='<%# Eval("EntityID") %>' />
        </ItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
