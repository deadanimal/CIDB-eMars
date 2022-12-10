<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.TicketManagement.CustomFieldMaster.View" %>

<%@ Register Src="~/Administration/UserControl/ucDataInformation.ascx" TagPrefix="MAT" TagName="ucDataInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton runat="server" ID="btnEdit" SkinID="ButtonEdit" FunctionAccessControlCode="Edit"></Metronic:LinkButton>
    <Metronic:FormViewButton runat="server" ID="btnDelete" SkinID="ButtonDelete" FunctionAccessControlCode="Delete" AssociatedFormViewId="fvParent" CommandName="Delete" CausesValidation="false"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" CausesValidation="false" SkinID="ButtonBack" PostBackUrl="Index.aspx"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DataKeyNames="CustomFieldId" DefaultMode="ReadOnly"
        ItemType="MAT.App.Scorecard.TicketManagement.CustomField.CustomFieldViewModel" SelectMethod="fvParent_GetItem" DeleteMethod="fvParent_DeleteItem">
        <ItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="FieldName" AssociatedControlID="FieldName"></MAT:Label>
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" ID="FieldName" Mode="ReadOnly" DataField="FieldName" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="FieldType" AssociatedControlID="FieldType"></MAT:Label>
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" ID="FieldType" Mode="ReadOnly" DataField="FieldType" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group" runat="server" visible='<%# Convert.ToInt32(Eval("FieldType")) == (int)MAT.App.Scorecard.TicketManagement.CustomField.FieldType.List %>'>
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Selections"></MAT:Label>
                                <div class="col-sm-7">
                                    <Metronic:TextBox runat="server" CssClass="input-tags" ID="txtInputTags" Text='<%# Eval("Selections") %>' ReadOnly="true"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Description" AssociatedControlID="Description"></MAT:Label>
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" ID="Description" Mode="ReadOnly" DataField="Description" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <MAT:ucDataInformation runat="server" id="ucDataInformation" TableName="CustomField" PrimaryKeyName="CustomFieldId" PrimaryKeyValue='<%# Eval("CustomFieldId") %>' />
        </ItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
