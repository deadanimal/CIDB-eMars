<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Administration.OrganizationalHierarchy.Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton ID="btnUpdate" runat="server" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Edit" CommandName="Update"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" SkinID="ButtonBack" OnClick="btnBack_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DefaultMode="Edit" SelectMethod="fvParent_SelectItem" UpdateMethod="fvParent_UpdateItem"
        ItemType="MAT.App.Scorecard.Scorecard.General.OrganizationalHierarchyViewModel" DataKeyNames="EntityId">
        <EditItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="ParentEntityId" Text="ParentEntity" />
                                <div class="col-sm-8">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="ParentEntityId" ID="ParentEntityId" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="EntityType" Text="EntityType" />
                                <div class="col-sm-8">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="EntityTypeCId" ID="EntityType" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="Code" Text="Code" />
                                <div class="col-sm-8">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="Code" ID="Code" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="Name" Text="Name" />
                                <div class="col-sm-8">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="Name" ID="Name" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <span class="m-portlet__head-icon m--hide">
                                <i class="la la-gear"></i>
                            </span>
                            <h3 class="m-portlet__head-text">
                                <MAT:Literal runat="server" Text="BusinessAddress"></MAT:Literal></h4>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="StreetAddress" Text="StreetAddress" />
                                <div class="col-sm-8">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="EntityAddress1" ID="StreetAddress" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" />
                                <div class="col-sm-8">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="EntityAddress2" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" />
                                <div class="col-sm-8">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="EntityAddress3" />
                                </div>
                            </div>
                            <MAT:CountryState ID="CountryState1" runat="server" CurrentMode="Edit" AreaMasterId="<%# BindItem.EntityAreaMasterId %>" />
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="City" Text="City" />
                                <div class="col-sm-8">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="EntityCityName" ID="City" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="PostCode" Text="PostCode" />
                                <div class="col-sm-8">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="EntityPostcode" ID="PostCode" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="Phone" Text="Phone" />
                                <div class="col-sm-8">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="Phone" ID="Phone" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="Fax" Text="Fax" />
                                <div class="col-sm-8">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="Fax" ID="Fax" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <MAT:DataInformation ID="ucDataInformation" runat="server" TableName="Entity" PrimaryKeyName="EntityID" PrimaryKeyValue='<%# Eval("EntityId") %>' />
        </EditItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
