<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MAT.WebApp.App.Administration.General.OrganizationalHierarchy.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" AssociatedFormViewId="FormView1" FunctionAccessControlCode="Create" CommandName="Insert"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" OnClick="btnBack_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upParent" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <MAT:FormView ID="FormView1" runat="server" RenderOuterTable="false" DefaultMode="Insert" InsertMethod="FormView1_InsertItem"
                ItemType="MAT.App.General.OrganizationalHierarchy.OrganizationalHierarchyViewModel">
                <InsertItemTemplate>
                    <div class="m-portlet">
                        <div class="m-portlet__body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label1" runat="server" SkinID="FormLabel" AssociatedControlID="ParentEntityId" Text="ParentEntity" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Insert" DataField="ParentEntityId" ID="ParentEntityId" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label2" runat="server" SkinID="FormLabel" AssociatedControlID="EntityType" Text="EntityType" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Insert" DataField="EntityType" ID="EntityType" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label9" runat="server" SkinID="FormLabel" AssociatedControlID="Code" Text="Code" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Insert" DataField="Code" ID="Code" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label10" runat="server" SkinID="FormLabel" AssociatedControlID="Name" Text="Name" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Insert" DataField="Name" ID="Name" />
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
                                        <MAT:Label ID="Label4" runat="server" SkinID="FormLabel" AssociatedControlID="Address" Text="Address" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Insert" DataField="EntityAddress1" ID="Address" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label3" runat="server" SkinID="FormLabel" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Insert" DataField="EntityAddress2" ID="DynamicControl1" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label11" runat="server" SkinID="FormLabel" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Insert" DataField="EntityAddress3" ID="DynamicControl2" />
                                        </div>
                                    </div>
                                    <MAT:CountryState ID="CountryState1" runat="server" CurrentMode="Insert" AreaMasterId="<%# BindItem.EntityAreaMasterId %>" />
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label8" runat="server" SkinID="FormLabel" AssociatedControlID="City" Text="City" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Insert" DataField="EntityCityName" ID="City" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label5" runat="server" SkinID="FormLabel" AssociatedControlID="PostCode" Text="PostCode" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Insert" DataField="EntityPostcode" ID="PostCode" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label12" runat="server" SkinID="FormLabel" AssociatedControlID="Phone" Text="Phone" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Insert" DataField="Phone" ID="Phone" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label13" runat="server" SkinID="FormLabel" AssociatedControlID="Fax" Text="Fax" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Insert" DataField="Fax" ID="Fax" />
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
