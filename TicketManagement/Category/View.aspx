<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.TicketManagement.Category.View" %>

<%@ Register Src="~/Administration/UserControl/ucDataInformation.ascx" TagPrefix="MAT" TagName="ucDataInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton runat="server" ID="btnEdit" SkinID="ButtonEdit" FunctionAccessControlCode="Edit"></Metronic:LinkButton>
    <Metronic:FormViewButton runat="server" ID="btnDelete" SkinID="ButtonDelete" FunctionAccessControlCode="Delete" AssociatedFormViewId="fvParent" CommandName="Delete" CausesValidation="false"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" CausesValidation="false" SkinID="ButtonBack" PostBackUrl="Index.aspx"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DataKeyNames="CodeMasterId" DefaultMode="ReadOnly"
        ItemType="MAT.App.Scorecard.TicketManagement.TicketCategory.TicketCategoryViewModel" SelectMethod="fvParent_GetItem" DeleteMethod="fvParent_DeleteItem">
        <ItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Code" AssociatedControlID="Code"></MAT:Label>
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" ID="Code" Mode="ReadOnly" DataField="Code" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Desc"></MAT:Label>
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" ID="Desc" Mode="ReadOnly" DataField="Desc" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Parent" AssociatedControlID="ParentCode"></MAT:Label>
                                <div class="col-sm-7">
                                    <asp:Literal runat="server" ID="ParentCode" Text='<%# Item.ParentCode + " " + Item.ParentName %>'></asp:Literal>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="DefineCustomField" AssociatedControlID="DefineCustomField"></MAT:Label>
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" ID="DefineCustomField" Mode="ReadOnly" DataField="DefineCustomField" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Panel runat="server" ID="pnlCustomFieldSelection" Visible='<%# Convert.ToBoolean(Eval("DefineCustomField")) %>'>
                <h4 class="header smaller blue no-margin-top">
                    <MAT:Literal runat="server" Text="CustomFieldInfo"></MAT:Literal>
                </h4>
                <p></p>
                <Metronic:GridView runat="server" ID="gvCustomFields" ItemType="MAT.App.Scorecard.TicketManagement.CustomField.CustomFieldSetupViewModel"
                    SelectMethod="gvCustomFields_Get" AutoGenerateColumns="false" AllowPaging="false" SkinID="Custom" AllowSorting="false">
                    <Columns>
                        <MAT:BoundField DataField="FieldName" HeaderText="Name"></MAT:BoundField>
                        <MAT:EnumBoundField DataField="FieldType" HeaderText="Type" EnumName="MAT.App.Scorecard.TicketManagement.CustomField.FieldType"></MAT:EnumBoundField>
                        <MAT:TemplateField HeaderText="Mandatory">
                            <ItemTemplate>
                                <MAT:CheckBox runat="server" ID="cbIsMandatory" Checked='<%# Eval("IsMandatory") %>' Enabled="false" />
                            </ItemTemplate>
                        </MAT:TemplateField>
                        <MAT:BoundField DataField="SeqNo" HeaderText="SeqNo"></MAT:BoundField>
                    </Columns>
                </Metronic:GridView>
            </asp:Panel>
            <MAT:ucDataInformation runat="server" id="ucDataInformation" TableName="CodeMaster" PrimaryKeyName="CodeMasterId" PrimaryKeyValue='<%# Eval("CodeMasterId") %>' />
        </ItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
