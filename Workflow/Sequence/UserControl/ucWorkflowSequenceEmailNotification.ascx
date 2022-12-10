<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucWorkflowSequenceEmailNotification.ascx.cs" Inherits="MAT.WebApp.App.Workflow.Sequence.UserControl.ucWorkflowSequenceEmailNotification" %>

<div class="table-responsive">
    <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="gvEmailNotification" OnAddClick="SearchPanel_AddClick"
        ShowKeywordSearch="false" ShowFilterButton="false" EncloseRowDiv="false">
    </Metronic:SearchPanel>
    <Metronic:GridView ID="gvEmailNotification" runat="server" ItemType="MAT.App.Workflow.Sequence.EmailNotification.WorkflowSequenceEmailNotificationViewModel"
        DataKeyNames="WorkflowSequenceEmailNotificationId" SelectMethod="gvEmailNotification_GetData" OnRowCommand="gvEmailNotification_RowCommand">
        <Columns>
            <MAT:TemplateField ItemStyle-Width="20px">
                <ItemTemplate>
                    <div class="action-buttons">
                        <MAT:LinkButton ID="lbSelect" runat="server" CssClass="blue" FrontIconCss="ace-icon fa fa-search-plus bigger-130" CausesValidation="false"
                            FunctionAccessControlCode="Edit" CommandName="MySelect" CommandArgument='<%# Eval("WorkflowSequenceEmailNotificationId") %>'></MAT:LinkButton>
                    </div>
                </ItemTemplate>
            </MAT:TemplateField>
            <MAT:BoundField DataField="WorkflowRecipientTypeName" HeaderText="Recipient" SortExpression="WorkflowRecipientTypeName" />
            <MAT:BoundField DataField="EmailTemplateName" HeaderText="EmailTemplate" SortExpression="EmailTemplateName" />
            <MAT:EnumBoundField DataField="WorkflowEventType" HeaderText="SendingEvent" SortExpression="WorkflowEventType" EnumName="MAT.App.Workflow.WorflowEventType" />
            <MAT:EnumBoundField DataField="WorkflowInstanceDetailStatus" HeaderText="OnStatus" SortExpression="WorkflowInstanceDetailStatus" EnumName="MAT.App.Workflow.Instance.WorkflowInstanceDetailStatus" />
        </Columns>
    </Metronic:GridView>
</div>

<div class="modal fade" id="modalform" runat="server" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    <MAT:Literal ID="lblTitle" runat="server" />
                </h5>
                <button type="button" class="close" runat="server" id="btnCancel" onserverclick="btnCancel_ServerClick" causesvalidation="false">&times;</button>
            </div>
            <div class="modal-body">
                <MAT:FormView ID="fvEmailNotification" runat="server" RenderOuterTable="false" DataKeyNames="WorkflowSequenceEmailNotificationId"
                    ItemType="MAT.App.Workflow.Sequence.EmailNotification.WorkflowSequenceEmailNotificationViewModel" SelectMethod="fvEmailNotification_SelectItem"
                    InsertMethod="fvEmailNotification_InsertItem" UpdateMethod="fvEmailNotification_UpdateItem"
                    DeleteMethod="fvEmailNotification_DeleteItem" OnDataBound="fvEmailNotification_DataBound"
                    OnItemCreated="fvEmailNotification_ItemCreated">
                    <InsertItemTemplate>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label runat="server" SkinID="FormLabel" Text="Recipient" AssociatedControlID="WorkflowRecipientType" />
                                    <div class="col-sm-7">
                                        <Metronic:DropDownList ID="WorkflowRecipientType" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="WorkflowRecipientType_Get"
                                            ValidationGroup="EmailNotification" Text='<%# Bind("WorkflowRecipientTypeId") %>' Mandatory="true">
                                        </Metronic:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label runat="server" SkinID="FormLabel" Text="EmailTemplate" AssociatedControlID="EmailTemplate" />
                                    <div class="col-sm-7">
                                        <asp:DynamicControl runat="server" Mode="Insert" DataField="EmailTemplateId" ID="EmailTemplate" ValidationGroup="EmailNotification" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label runat="server" SkinID="FormLabel" Text="SendingEvent" AssociatedControlID="WorkflowEventType" />
                                    <div class="col-sm-7">
                                        <asp:DynamicControl runat="server" Mode="Insert" DataField="WorkflowEventType" ID="WorkflowEventType" ValidationGroup="EmailNotification" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group mat-form-group" runat="server" id="divWorkflowInstanceDetailStatus">
                                    <MAT:Label runat="server" SkinID="FormLabel" Text="OnStatus" AssociatedControlID="WorkflowInstanceDetailStatus" />
                                    <div class="col-sm-7">
                                        <asp:DynamicControl runat="server" Mode="Insert" DataField="WorkflowInstanceDetailStatus" ID="WorkflowInstanceDetailStatus" ValidationGroup="EmailNotification" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group mat-form-group">
                                    <div class="col-sm-12">
                                        <div class="pull-right">
                                            <Metronic:LinkButton ID="btnSave" runat="server" SkinID="ButtonSave" CommandName="Insert" ValidationGroup="EmailNotification" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </InsertItemTemplate>
                    <EditItemTemplate>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label runat="server" SkinID="FormLabel" Text="Recipient" AssociatedControlID="WorkflowRecipientType" />
                                    <div class="col-sm-7">
                                        <Metronic:DropDownList ID="WorkflowRecipientType" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="WorkflowRecipientType_Get"
                                            ValidationGroup="EmailNotification" Text='<%# Bind("WorkflowRecipientTypeId") %>' Mandatory="true">
                                        </Metronic:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label runat="server" SkinID="FormLabel" Text="EmailTemplate" AssociatedControlID="EmailTemplate" />
                                    <div class="col-sm-7">
                                        <asp:DynamicControl runat="server" Mode="Edit" DataField="EmailTemplateId" ID="EmailTemplate" ValidationGroup="EmailNotification" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label runat="server" SkinID="FormLabel" Text="SendingEvent" AssociatedControlID="WorkflowEventType" />
                                    <div class="col-sm-7">
                                        <asp:DynamicControl runat="server" Mode="Edit" DataField="WorkflowEventType" ID="WorkflowEventType" ValidationGroup="EmailNotification" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group mat-form-group" runat="server" id="divWorkflowInstanceDetailStatus">
                                    <MAT:Label runat="server" SkinID="FormLabel" Text="OnStatus" AssociatedControlID="WorkflowInstanceDetailStatus" />
                                    <div class="col-sm-7">
                                        <asp:DynamicControl runat="server" Mode="Edit" DataField="WorkflowInstanceDetailStatus" ID="WorkflowInstanceDetailStatus" ValidationGroup="EmailNotification" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group mat-form-group">
                                    <div class="col-sm-12">
                                        <div class="pull-right">
                                            <Metronic:LinkButton ID="btnSave" runat="server" SkinID="ButtonSave" CommandName="Update" ValidationGroup="EmailNotification" />
                                            <Metronic:LinkButton ID="btnDelete" runat="server" SkinID="ButtonDelete" CommandName="Delete" ValidationGroup="EmailNotification" CausesValidation="false"
                                                OnClientClick="return confirm('Are you sure?');" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label runat="server" SkinID="FormLabel" Text="Recipient" AssociatedControlID="WorkflowRecipientType" />
                                    <div class="col-sm-7">
                                        <asp:Label ID="WorkflowRecipientType" runat="server" Text='<%# Eval("WorkflowRecipientTypeName") %>' SkinID="FormValue"></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label runat="server" SkinID="FormLabel" Text="EmailTemplate" AssociatedControlID="EmailTemplate" />
                                    <div class="col-sm-7">
                                        <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="EmailTemplateId" ID="EmailTemplate" ValidationGroup="EmailNotification" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label runat="server" SkinID="FormLabel" Text="SendingEvent" AssociatedControlID="WorkflowEventType" />
                                    <div class="col-sm-7">
                                        <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="WorkflowEventType" ID="WorkflowEventType" ValidationGroup="EmailNotification" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group mat-form-group" runat="server" id="divWorkflowInstanceDetailStatus">
                                    <MAT:Label runat="server" SkinID="FormLabel" Text="OnStatus" AssociatedControlID="WorkflowInstanceDetailStatus" />
                                    <div class="col-sm-7">
                                        <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="WorkflowInstanceDetailStatus" ID="WorkflowInstanceDetailStatus" ValidationGroup="EmailNotification" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </MAT:FormView>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
