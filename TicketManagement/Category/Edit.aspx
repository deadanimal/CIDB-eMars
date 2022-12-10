<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MAT.WebApp.App.TicketManagement.Category.Edit" %>

<%@ Register Src="~/Administration/UserControl/ucDataInformation.ascx" TagPrefix="UserControl" TagName="ucDataInformation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Edit" CommandName="Update"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" CausesValidation="false" SkinID="ButtonBack"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server" ID="upForm" UpdateMode="Conditional">
        <ContentTemplate>
            <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DataKeyNames="CodeMasterId" DefaultMode="Edit" ItemType="MAT.App.Scorecard.TicketManagement.TicketCategory.TicketCategoryViewModel"
                SelectMethod="fvParent_GetItem" UpdateMethod="fvParent_UpdateItem" OnItemCreated="fvParent_ItemCreated">
                <EditItemTemplate>
                    <div class="m-portlet">
                        <div class="m-portlet__body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Code" AssociatedControlID="Code" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" ID="Code" Mode="Edit" DataField="Code" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" ID="Name" Mode="Edit" DataField="Desc" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Parent" AssociatedControlID="ParentCodeMasterId" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" ID="ParentCodeMasterId" Mode="Insert" DataField="ParentCodeMasterId" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="DefineCustomField" AssociatedControlID="DefineCustomField" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" ID="DefineCustomField" Mode="Insert" DataField="DefineCustomField" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <p></p>
                    <asp:Panel ID="pnlCustomFieldSelection" runat="server" Visible='<%# Convert.ToBoolean(Eval("DefineCustomField")) %>'>
                        <h4 class="header smaller blue no-margin-top">
                            <MAT:Literal runat="server" Text="CustomFieldInfo"></MAT:Literal>
                        </h4>
                        <p></p>
                        <Metronic:GridView ID="gvCustomFields" runat="server" ItemType="MAT.App.Scorecard.TicketManagement.CustomField.CustomFieldSetupViewModel"
                            DataKeyNames="CustomFieldId" SelectMethod="gvCustomFields_Get" AutoGenerateColumns="false" AllowPaging="false" AllowSorting="true" SkinID="Custom">
                            <Columns>
                                <MAT:TemplateField HeaderText="Display" HeaderStyle-Width="25px">
                                    <ItemTemplate>
                                        <label>
                                            <MAT:CheckBox ID="cbView" runat="server" Checked='<%# Eval("View") %>' CheckBoxCssClass="ace" />
                                            <span class="lbl"></span>
                                        </label>
                                    </ItemTemplate>
                                </MAT:TemplateField>
                                <MAT:BoundField DataField="FieldName" HeaderText="Name" />
                                <MAT:EnumBoundField DataField="FieldType" HeaderText="FieldType" EnumName="MAT.App.TicketManagement.CustomField.FieldType"></MAT:EnumBoundField>
                                <MAT:TemplateField HeaderText="Mandatory" HeaderStyle-Width="50px">
                                    <ItemTemplate>
                                        <label>
                                            <MAT:CheckBox ID="cbIsMandatory" runat="server" Checked='<%# Eval("IsMandatory") %>' CheckBoxCssClass="ace" />
                                            <span class="lbl"></span>
                                        </label>
                                    </ItemTemplate>
                                </MAT:TemplateField>
                                <MAT:TemplateField HeaderText="SeqNo">
                                    <ItemTemplate>
                                        <asp:TextBox ID="tbSeqNo" runat="server" SkinID="DefaultTextBox" Text='<%# Eval("SeqNo") %>' />
                                    </ItemTemplate>
                                </MAT:TemplateField>
                            </Columns>
                        </Metronic:GridView>
                    </asp:Panel>
                <UserControl:ucDataInformation runat="server" id="ucDataInformation" TableName="CodeMaster" PrimaryKeyName="CodeMasterId" PrimaryKeyValue='<%# Eval("CodeMasterId") %>' />
                </EditItemTemplate>
            </MAT:FormView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
