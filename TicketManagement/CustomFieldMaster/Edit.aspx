<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MAT.WebApp.App.TicketManagement.CustomFieldMaster.Edit" %>

<%@ Register Src="~/Administration/UserControl/ucDataInformation.ascx" TagPrefix="MAT" TagName="ucDataInformation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Edit" CommandName="Update"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" CausesValidation="false" SkinID="ButtonBack"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server" ID="upParent" UpdateMode="Conditional">
        <ContentTemplate>
            <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DataKeyNames="CustomFieldId" DefaultMode="Edit"
                ItemType="MAT.App.Scorecard.TicketManagement.CustomField.CustomFieldViewModel" SelectMethod="fvParent_GetItem"
                UpdateMethod="fvParent_UpdateItem" OnItemCreated="fvParent_ItemCreated">
                <EditItemTemplate>
                    <div class="m-portlet">
                        <div class="m-portlet__body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="FieldName" AssociatedControlID="FieldName"></MAT:Label>
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" ID="FieldName" Mode="Edit" DataField="FieldName" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Type" AssociatedControlID="FieldType"></MAT:Label>
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" ID="FieldType" Mode="Edit" DataField="FieldType" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group" runat="server" id="divSelections" visible='<%# Convert.ToInt32(Eval("FieldType")) == (int)MAT.App.Scorecard.TicketManagement.CustomField.FieldType.List %>'>
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Selections"></MAT:Label>
                                        <div class="col-sm-7">
                                            <Metronic:TextBox runat="server" ID="txtInputTags" CssClass="input-tags" placeholder="Enter List..." Text='<%# Eval("Selections") %>'></Metronic:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Description" AssociatedControlID="Description"></MAT:Label>
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" ID="Description" Mode="Edit" DataField="Description" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <MAT:ucDataInformation runat="server" id="ucDataInformation" TableName="CustomField" PrimaryKeyName="CustomFieldId" PrimaryKeyValue='<%# Eval("CustomFieldId") %>' />
                </EditItemTemplate>
            </MAT:FormView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
