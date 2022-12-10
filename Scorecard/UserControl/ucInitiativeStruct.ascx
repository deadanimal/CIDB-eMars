<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucInitiativeStruct.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.UserControl.ucInitiativeStruct" %>

<div class="pull-right">
    <Metronic:LinkButton runat="server" ID="btnAdd" SkinID="ButtonAddIcon" FunctionAccessControlCode="Create"
        CausesValidation="false" OnClick="btnAdd_Click" ShowLoader="false"></Metronic:LinkButton>
</div>
<asp:UpdatePanel runat="server" ID="upGrid">
    <ContentTemplate>
        <Metronic:GridView runat="server" ID="gvInitiativeStruct" SelectMethod="gvInitiativeStruct_Get" SkinID="Custom" OnDataBound="gvInitiativeStruct_DataBound"
            ItemType="MAT.App.Scorecard.Scorecard.Shared.InitiativeStructViewModel" OnRowCommand="gvInitiativeStruct_RowCommand">
            <Columns>
                <MAT:TemplateField ItemStyle-Width="45px">
                    <ItemTemplate>
                        <div class="action-buttons">
                            <Metronic:LinkButton runat="server" ID="btnSelect" CommandName="Select" FunctionAccessControlCode="Edit" SkinID="ButtonViewIcon"
                                CausesValidation="false" CommandArgument='<%# Item.ScorecardInitiativeStructId %>'></Metronic:LinkButton>
                        </div>
                    </ItemTemplate>
                </MAT:TemplateField>
                <MAT:BoundField HeaderText="Name" DataField="Name"></MAT:BoundField>
                <MAT:BoundField HeaderText="Level" DataField="Level"></MAT:BoundField>
                <MAT:TemplateField HeaderText="CreatedBy">
                    <ItemTemplate>
                        <%# DisplayName(Item.CreatedUId) %>
                    </ItemTemplate>
                </MAT:TemplateField>
                <MAT:BoundField HeaderText="CreatedOn" DataField="CreatedOn" DataFormatString="{0:dd/MM/yyyy}"></MAT:BoundField>
                <MAT:TemplateField ItemStyle-Width="45px">
                    <ItemTemplate>
                        <div class="action-buttons">
                            <Metronic:LinkButton runat="server" ID="btnDelete" CommandName="Remove" FunctionAccessControlCode="Edit" SkinID="ButtonDeleteIcon"
                                OnClientClick="sweetConfirm(this, true);return false;" CausesValidation="false" CommandArgument='<%# Item.ScorecardInitiativeStructId %>'></Metronic:LinkButton>
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
                    InsertMethod="fvParent_InsertItem" UpdateMethod="fvParent_UpdateItem" SelectMethod="fvParent_SelectItem"
                    ItemType="MAT.App.Scorecard.Scorecard.Shared.InitiativeStructViewModel">
                    <InsertItemTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="smaller lighter blue no-margin">Add Initiative Structure</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="Name" Text='<%# BindItem.Name %>' Mandatory="true"
                                                    ValidationGroup="InitiativeStructure"></Metronic:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Level" AssociatedControlID="Level"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="Level" Text='<%# BindItem.Level %>' TextMode="Number"
                                                    Mandatory="true" ValidationGroup="InitiativeStructure"></Metronic:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="CodingStandard" AssociatedControlID="CodingStandard"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:DropDownList runat="server" ID="CodingStandard" SelectMethod="CodingStandard_Get"
                                                    DataTextField="Value" DataValueField="Key" AutoPostBack="true"
                                                    OnSelectedIndexChanged="CodingStandard_SelectedIndexChanged" Mandatory="true"
                                                    ValidationGroup="InitiativeStructure">
                                                </Metronic:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group" runat="server" id="divPrefix" visible="false">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Prefix" AssociatedControlID="Prefix"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="Prefix" Text='<%# BindItem.RunningNoPrefix %>' Mandatory="true"
                                                    ValidationGroup="InitiativeStructure"></Metronic:TextBox>
                                                <asp:HiddenField runat="server" ID="NextRunningNo" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="pull-right">
                                    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave"
                                        ValidationGroup="InitiativeStructure" CommandName="Insert"></Metronic:FormViewButton>
                                </div>
                            </div>
                        </div>
                    </InsertItemTemplate>
                    <EditItemTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="smaller lighter blue no-margin">Edit Initiative Structure</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="Name" Text='<%# BindItem.Name %>' Mandatory="true"
                                                    ValidationGroup="InitiativeStructure"></Metronic:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Level" AssociatedControlID="Level"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="Level" Text='<%# BindItem.Level %>' TextMode="Number" Mandatory="true"
                                                    ValidationGroup="InitiativeStructure"></Metronic:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="CodingStandard" AssociatedControlID="CodingStandard"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:DropDownList runat="server" ID="CodingStandard" SelectMethod="CodingStandard_Get" Text='<%# Item.CodeFactoryType %>'
                                                    OnSelectedIndexChanged="CodingStandard_SelectedIndexChanged" AutoPostBack="true"
                                                    DataTextField="Value" DataValueField="Key" Mandatory="true" ValidationGroup="InitiativeStructure">
                                                </Metronic:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group" runat="server" id="divPrefix"
                                            visible='<%# Item.CodeFactoryType == (byte)MAT.App.Scorecard.Enumerate.CodeFactoryType.Auto %>'>
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Prefix" AssociatedControlID="Prefix"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="Prefix" Text='<%# BindItem.RunningNoPrefix %>' Mandatory="true"
                                                    ValidationGroup="InitiativeStructure"></Metronic:TextBox>
                                                <asp:HiddenField runat="server" ID="NextRunningNo" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="pull-right">
                                    <Metronic:FormViewButton runat="server" ID="btnUpdate" SkinID="ButtonFreeText" Text="Update"
                                        CommandName="Update" ValidationGroup="InitiativeStructure"></Metronic:FormViewButton>
                                </div>
                            </div>
                        </div>
                    </EditItemTemplate>
                </MAT:FormView>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
