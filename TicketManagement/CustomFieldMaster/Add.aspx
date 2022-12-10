<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MAT.WebApp.App.TicketManagement.CustomFieldMaster.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Create" CommandName="Insert"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" SkinID="ButtonBack" PostBackUrl="Index.aspx" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server" ID="upParent" UpdateMode="Conditional">
        <ContentTemplate>
            <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DataKeyNames="CustomFieldId" DefaultMode="Insert"
                ItemType="MAT.App.Scorecard.TicketManagement.CustomField.CustomFieldViewModel" InsertMethod="fvParent_InsertItem"
                OnItemCreated="fvParent_ItemCreated">
                <InsertItemTemplate>
                    <div class="m-portlet">
                        <div class="m-portlet__body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="FieldName" AssociatedControlID="FieldName"></MAT:Label>
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" ID="FieldName" Mode="Insert" DataField="FieldName" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Type" AssociatedControlID="FieldType"></MAT:Label>
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" ID="FieldType" Mode="Insert" DataField="FieldType" />
                                        </div>
                                    </div>                                    
                                    <div class="form-group m-form__group mat-form-group" runat="server" id="divSelections" visible="false">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Selections" AssociatedControlID="txtInputTags"></MAT:Label>
                                        <div class="col-sm-7">
                                            <Metronic:TextBox runat="server" ID="txtInputTags" CssClass="input-tags input" placeholder="Enter List..."></Metronic:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Description" AssociatedControlID="Description"></MAT:Label>
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" ID="Description" Mode="Insert" DataField="Description" />
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
