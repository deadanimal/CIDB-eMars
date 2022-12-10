<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Administration.OrganizationalHierarchy.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Create" CommandName="Insert"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" OnClick="btnBack_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DefaultMode="Insert"
                InsertMethod="fvParent_InsertItem" ItemType="MAT.App.Scorecard.Scorecard.General.OrganizationalHierarchyViewModel">
                <InsertItemTemplate>
                    <div class="m-portlet">
                        <div class="m-portlet__body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="ParentEntityId" Text="ParentEntity"></MAT:Label>
                                        <div class="col-sm-8">
                                            <asp:DynamicControl runat="server" ID="ParentEntityId" Mode="Insert" DataField="ParentEntityId" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="EntityType" Text="EntityType"></MAT:Label>
                                        <div class="col-sm-8">
                                            <asp:DynamicControl runat="server" ID="EntityType" Mode="Insert" DataField="EntityTypeCId" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="Code" Text="Code"></MAT:Label>
                                        <div class="col-sm-8">
                                            <asp:DynamicControl runat="server" ID="Code" Mode="Insert" DataField="Code" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="Name" Text="Name"></MAT:Label>
                                        <div class="col-sm-8">
                                            <asp:DynamicControl runat="server" ID="Name" Mode="Insert" DataField="Name" />
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
                                        <MAT:Literal runat="server" Text="BusinessAddress"></MAT:Literal>
                                    </h3>
                                </div>
                            </div>
                        </div>
                        <div class="m-portlet__body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="Address" Text="Address"></MAT:Label>
                                        <div class="col-sm-8">
                                            <asp:DynamicControl runat="server" ID="Address" Mode="Insert" DataField="EntityAddress1" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel"></MAT:Label>
                                        <div class="col-sm-8">
                                            <asp:DynamicControl runat="server" Mode="Insert" DataField="EntityAddress2" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel"></MAT:Label>
                                        <div class="col-sm-8">
                                            <asp:DynamicControl runat="server" Mode="Insert" DataField="EntityAddress3" />
                                        </div>
                                    </div>
                                    <MAT:CountryState runat="server" ID="CountryState" CurrentMode="Insert" AreaMasterId="<%# BindItem.EntityAreaMasterId %>" />
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="City" Text="City"></MAT:Label>
                                        <div class="col-sm-8">
                                            <asp:DynamicControl runat="server" ID="City" Mode="Insert" DataField="EntityCityName" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="PostCode" Text="PostCode"></MAT:Label>
                                        <div class="col-sm-8">
                                            <asp:DynamicControl runat="server" ID="PostCode" Mode="Insert" DataField="EntityPostCode" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="Phone" Text="Phone"></MAT:Label>
                                        <div class="col-sm-8">
                                            <asp:DynamicControl runat="server" ID="Phone" Mode="Insert" DataField="Phone" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="Fax" Text="Fax"></MAT:Label>
                                        <div class="col-sm-8">
                                            <asp:DynamicControl runat="server" ID="Fax" Mode="Insert" DataField="Fax" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </InsertItemTemplate>
            </MAT:FormView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
