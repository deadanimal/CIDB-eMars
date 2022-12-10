<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MAT.WebApp.App.TicketManagement.Category.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Create" CommandName="Insert"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" SkinID="ButtonBack" CausesValidation="false" PostBackUrl="Index.aspx"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server" ID="upForm" UpdateMode="Conditional">
        <ContentTemplate>
            <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DataKeyNames="CodeMasterId" DefaultMode="Insert"
                ItemType="MAT.App.Scorecard.TicketManagement.TicketCategory.TicketCategoryViewModel" InsertMethod="fvParent_InsertItem"
                OnItemCreated="fvParent_ItemCreated">
                <InsertItemTemplate>
                    <div class="m-portlet">
                        <div class="m-portlet__body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Code" AssociatedControlID="Code"></MAT:Label>
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" ID="Code" Mode="Insert" DataField="Code" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name"></MAT:Label>
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" ID="Name" Mode="Insert" DataField="Desc" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Parent" AssociatedControlID="ParentCodeMasterId"></MAT:Label>
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" ID="ParentCodeMasterId" Mode="Insert" DataField="ParentCodeMasterId" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="DefineCustomField" AssociatedControlID="DefineCustomField"></MAT:Label>
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" ID="DefineCustomField" Mode="Insert" DataField="DefineCustomField" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:Panel ID="pnlCustomFieldSelection" runat="server" Visible="false">
                        <h4 class="header smaller blue no-margin-top">
                            <MAT:Literal runat="server" Text="CustomFieldInfo"></MAT:Literal>
                        </h4>
                        <p></p>
                        <Metronic:GridView ID="gvCustomFields" runat="server" ItemType="MAT.App.Scorecard.TicketManagement.CustomField.CustomFieldSetupViewModel" DataKeyNames="CustomFieldId"
                            SelectMethod="gvCustomFields_Get" AutoGenerateColumns="false" AllowPaging="false" AllowSorting="true" SkinID="Custom">
                            <Columns>
                                <asp:TemplateField HeaderText="Display" HeaderStyle-Width="20px">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbView" runat="server" Checked="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <MAT:BoundField DataField="FieldName" HeaderText="Name" />
                                <MAT:EnumBoundField DataField="FieldType" HeaderText="Type" EnumName="MAT.App.TicketManagement.CustomField.FieldType"></MAT:EnumBoundField>
                                <MAT:TemplateField HeaderText="Mandatory">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbIsMandatory" runat="server" Checked="false" />
                                    </ItemTemplate>
                                </MAT:TemplateField>
                                <MAT:TemplateField HeaderText="SeqNo">
                                    <ItemTemplate>
                                        <asp:TextBox ID="tbSeqNo" runat="server" SkinID="DefaultTextBox" />
                                    </ItemTemplate>
                                </MAT:TemplateField>
                            </Columns>
                        </Metronic:GridView>
                    </asp:Panel>
                </InsertItemTemplate>
            </MAT:FormView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
