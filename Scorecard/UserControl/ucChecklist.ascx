<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucChecklist.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.UserControl.ucChecklist" %>

<div class="pull-right">
    <Metronic:LinkButton runat="server" ID="btnAdd" SkinID="ButtonAddIcon" FunctionAccessControlCode="Create"
        CausesValidation="false" OnClick="btnAdd_Click" ShowLoader="false"></Metronic:LinkButton>
</div>
<asp:UpdatePanel runat="server" ID="upGridView">
    <ContentTemplate>
        <Metronic:GridView runat="server" ID="gvChecklist" SkinID="Custom" SelectMethod="gvChecklist_Get"
            OnDataBound="gvChecklist_DataBound" OnRowCommand="gvChecklist_RowCommand"
            ItemType="MAT.App.Scorecard.Scorecard.Shared.ChecklistViewModel">
            <Columns>
                <MAT:TemplateField ItemStyle-Width="45px">
                    <ItemTemplate>
                        <div class="action-buttons">
                            <Metronic:LinkButton runat="server" ID="btnSelect" CommandName="Select" FunctionAccessControlCode="Edit" SkinID="ButtonViewIcon"
                                CausesValidation="false" CommandArgument='<%# Item.ScorecardCheckListId %>'></Metronic:LinkButton>
                        </div>
                    </ItemTemplate>
                </MAT:TemplateField>
                <MAT:BoundField DataField="Name" HeaderText="Checklist" HeaderStyle-Width="80%"></MAT:BoundField>
                <MAT:TemplateField HeaderStyle-Width="20%" HeaderText="Mandatory">
                    <ItemTemplate>
                        <%# Eval("IsRequired").ToString() == "True" ? "Yes" : "No" %>
                    </ItemTemplate>
                </MAT:TemplateField>
                <MAT:TemplateField ItemStyle-Width="45px">
                    <ItemTemplate>
                        <div class="action-buttons">
                            <Metronic:LinkButton runat="server" ID="btnDelete" CommandName="Remove" FunctionAccessControlCode="Edit" SkinID="ButtonDeleteIcon"
                                OnClientClick="sweetConfirm(this, true);return false;" CausesValidation="false" CommandArgument='<%# Item.ScorecardCheckListId %>'></Metronic:LinkButton>
                        </div>
                    </ItemTemplate>
                </MAT:TemplateField>
            </Columns>
        </Metronic:GridView>
    </ContentTemplate>
</asp:UpdatePanel>

<div class="modal fade" id="modalForm" runat="server" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <asp:UpdatePanel runat="server" ID="upForm">
            <ContentTemplate>

                <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DefaultMode="Insert"
                    SelectMethod="fvParent_SelectItem" UpdateMethod="fvParent_UpdateItem" InsertMethod="fvParent_InsertItem"
                    ItemType="MAT.App.Scorecard.Scorecard.Shared.ChecklistViewModel" OnDataBound="fvParent_DataBound">
                    <InsertItemTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="smaller lighter blue no-margin">Add Checklist</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Checklist" AssociatedControlID="Checklist"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="Checklist" Text='<%# BindItem.Name %>' Mandatory="true"></Metronic:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Mandatory" AssociatedControlID="IsRequired"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:CheckBox runat="server" ID="IsRequired" Checked='<%# BindItem.IsRequired %>' />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="pull-right">
                                    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave" CommandName="Insert"></Metronic:FormViewButton>
                                </div>
                            </div>
                        </div>
                    </InsertItemTemplate>
                    <EditItemTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="smaller lighter blue no-margin">Edit Checklist</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Checklist" AssociatedControlID="Checklist"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="Checklist" Text='<%# BindItem.Name %>' Mandatory="true"></Metronic:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Mandatory" AssociatedControlID="IsRequired"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:CheckBox runat="server" ID="IsRequired" Checked='<%# BindItem.IsRequired %>' />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="pull-right">
                                    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonFreeText" Text="Update" CommandName="Update"></Metronic:FormViewButton>
                                </div>
                            </div>
                        </div>
                    </EditItemTemplate>
                </MAT:FormView>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
