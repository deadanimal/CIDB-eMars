<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucWorkflowSequenceAssignmentCondition.ascx.cs" Inherits="MAT.WebApp.App.Workflow.Sequence.UserControl.ucWorkflowSequenceAssignmentCondition" %>
<%@ Register Src="~/Workflow/Sequence/UserControl/ucWorkflowDynamicControl.ascx" TagName="WorkflowDynamicControl" TagPrefix="UserControl" %>
<%@ Register Src="~/Administration/UserControl/ucDynamicMultiSelection.ascx" TagName="DynamicMultiSelection" TagPrefix="UserControl" %>


<div class="m-accordion m-accordion--default m-accordion--toggle-arrow" id="m_accordion_1" role="tablist">
    <!--begin::Item-->
    <div class="m-accordion__item">
        <div class="m-accordion__item-head" role="tab" id="m_accordion_1_item_1_head" data-toggle="collapse" href="#m_accordion_1_item_1_body" aria-expanded="true">
            <span class="m-accordion__item-icon">
                <i class="la la-filter"></i>
            </span>
            <span class="m-accordion__item-title">
                <MAT:Label runat="server" Text="Condition"></MAT:Label>
            </span>
            <span class="m-accordion__item-mode"></span>
        </div>
        <div class="m-accordion__item-body collapse show" id="m_accordion_1_item_1_body" role="tabpanel" aria-labelledby="m_accordion_1_item_1_head" data-parent="#m_accordion_1" style="">
            <div class="m-accordion__item-content">
                <div class="table-responsive">
                    <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="gvCondition"
                        OnAddClick="SearchPanel_AddClick" ShowKeywordSearch="false" ShowFilterButton="false" EncloseRowDiv="false">
                    </Metronic:SearchPanel>
                    <Metronic:GridView ID="gvCondition" runat="server" ItemType="MAT.App.Workflow.Sequence.Assignment.Condition.WorkflowSequenceAssignmentConditionViewModel"
                        DataKeyNames="WorkflowSequenceAssignmentConditionId" SelectMethod="gvCondition_GetData" OnRowCommand="gvCondition_RowCommand">
                        <Columns>
                            <MAT:TemplateField ItemStyle-Width="20px">
                                <ItemTemplate>
                                    <div class="action-buttons">
                                        <MAT:LinkButton ID="lbSelect" runat="server" CssClass="blue" FrontIconCss="ace-icon fa fa-search-plus bigger-130" CausesValidation="false"
                                            FunctionAccessControlCode="Edit" CommandName="MySelect" CommandArgument='<%# Eval("WorkflowSequenceAssignmentConditionId") %>'></MAT:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </MAT:TemplateField>
                            <MAT:BoundField DataField="ConditionStr" HeaderText="Condition" SortExpression="ConditionStr" />
                        </Columns>
                    </Metronic:GridView>
                </div>
            </div>
        </div>
    </div>
</div>

<%--Add/Edit/View--%>
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
                <MAT:FormView ID="fvCondition" runat="server" RenderOuterTable="false" DataKeyNames="WorkflowSequenceAssignmentConditionId"
                    DefaultMode="Insert" ItemType="MAT.App.Workflow.Sequence.Assignment.Condition.WorkflowSequenceAssignmentConditionViewModel"
                    SelectMethod="fvCondition_SelectItem" InsertMethod="fvCondition_InsertItem" UpdateMethod="fvCondition_UpdateItem"
                    DeleteMethod="fvCondition_DeleteItem" OnItemCreated="fvCondition_ItemCreated" OnItemInserting="fvCondition_ItemInserting"
                    OnItemUpdating="fvCondition_ItemUpdating">
                    <InsertItemTemplate>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label runat="server" SkinID="FormLabel" Text="Condition" AssociatedControlID="WorkflowConditionType" />
                                    <div class="col-sm-7">
                                        <Metronic:DropDownList ID="WorkflowConditionType" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="WorkflowConditionType_Get"
                                            ValidationGroup="Condition" Text='<%# Bind("WorkflowConditionTypeId") %>' AutoPostBack="true" Mandatory="true"
                                            OnSelectedIndexChanged="WorkflowConditionType_SelectedIndexChanged">
                                        </Metronic:DropDownList>
                                        <asp:DynamicControl runat="server" Mode="Insert" DataField="ComparisonType" ID="ComparisonType" ValidationGroup="Condition" />
                                        <div class="input-group col-xs-12" runat="server" id="divTextBox">
                                            <UserControl:WorkflowDynamicControl ID="ucWorkflowDynamicControl1" runat="server" ValidationGroup="Condition" />
                                            <span class="input-group-addon" runat="server" id="spanRange">
                                                <asp:Literal ID="lblRange" runat="server"></asp:Literal></span>
                                            <UserControl:WorkflowDynamicControl ID="ucWorkflowDynamicControl2" runat="server" ValidationGroup="Condition" />
                                        </div>
                                        <UserControl:DynamicMultiSelection ID="ucDynamicMultiSelection" runat="server" OnInit="ucDynamicMultiSelection_Init" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group mat-form-group">
                                    <div class="col-sm-12">
                                        <div class="pull-right">
                                            <Metronic:LinkButton ID="btnSave" runat="server" SkinID="ButtonSave" CommandName="Insert" ValidationGroup="Condition" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </InsertItemTemplate>
                    <EditItemTemplate>
                        <div class="m-portlet">
                            <div class="m-portlet__body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Condition" AssociatedControlID="WorkflowConditionType" />
                                            <div class="col-sm-7">
                                                <Metronic:DropDownList ID="WorkflowConditionType" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="WorkflowConditionType_Get"
                                                    ValidationGroup="Condition" Text='<%# Bind("WorkflowConditionTypeId") %>' AutoPostBack="true"
                                                    OnSelectedIndexChanged="WorkflowConditionType_SelectedIndexChanged" Mandatory="true">
                                                </Metronic:DropDownList>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvWorkflowConditionType" CssClass="DDControl DDValidator help-block"
                                                    ControlToValidate="WorkflowConditionType" Display="Dynamic" ValidationGroup="Condition" />
                                                <asp:DynamicControl runat="server" Mode="Edit" DataField="ComparisonType" ID="ComparisonType" ValidationGroup="Condition" />
                                                <div class="input-group col-xs-12" runat="server" id="divTextBox">
                                                    <UserControl:WorkflowDynamicControl ID="ucWorkflowDynamicControl1" runat="server" ValidationGroup="Condition"
                                                        WorkflowDataType='<%# WorkflowConditionTypeValue.WorkflowDataType %>' Value='<%# Eval("CompareValue1") %>' />
                                                    <span class="input-group-addon" runat="server" id="spanRange">
                                                        <asp:Literal ID="lblRange" runat="server"></asp:Literal></span>
                                                    <UserControl:WorkflowDynamicControl ID="ucWorkflowDynamicControl2" LinkButtonrunat="server" ValidationGroup="Condition"
                                                        WorkflowDataType='<%# WorkflowConditionTypeValue.WorkflowDataType %>' Value='<%# Eval("CompareValue2") %>' />
                                                </div>
                                                <UserControl:DynamicMultiSelection ID="ucDynamicMultiSelection" runat="server" Sql='<%# WorkflowConditionTypeValue.SelectionQuery %>'
                                                    SelectedItems='<%# Eval("MultiSelectionList") %>' OnInit="ucDynamicMultiSelection_Init" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <div class="col-sm-12">
                                                <div class="pull-right">
                                                    <Metronic:LinkButton ID="btnSave" runat="server" SkinID="ButtonSave" CommandName="Update" ValidationGroup="Condition" />
                                                    <Metronic:LinkButton ID="btnDelete" runat="server" SkinID="ButtonDelete" CommandName="Delete" ValidationGroup="Condition" CausesValidation="false"
                                                        OnClientClick="return confirm('Are you sure?');" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <div class="m-portlet">
                            <div class="m-portlet__body">
                                <div class="row">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Condition" AssociatedControlID="WorkflowConditionType" />
                                        <div class="col-sm-7">
                                            <asp:Label ID="WorkflowConditionType" runat="server" Text='<%# Eval("WorkflowConditionTypeName") %>' SkinID="FormValue"></asp:Label>
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="ComparisonType" ID="ComparisonType" ValidationGroup="Condition" />
                                            <div class="input-group col-xs-12" runat="server" id="divTextBox">
                                                <UserControl:WorkflowDynamicControl ID="ucWorkflowDynamicControl1" runat="server" ValidationGroup="Condition"
                                                    WorkflowDataType='<%# WorkflowConditionTypeValue.WorkflowDataType %>' Value='<%# Eval("CompareValue1") %>' />
                                                <span class="input-group-addon" runat="server" id="spanRange">
                                                    <asp:Literal ID="lblRange" runat="server"></asp:Literal></span>
                                                <UserControl:WorkflowDynamicControl ID="ucWorkflowDynamicControl2" runat="server" ValidationGroup="Condition"
                                                    WorkflowDataType='<%# WorkflowConditionTypeValue.WorkflowDataType %>' Value='<%# Eval("CompareValue2") %>' />
                                            </div>
                                            <UserControl:DynamicMultiSelection ID="ucDynamicMultiSelection" runat="server" Sql='<%# WorkflowConditionTypeValue.SelectionQuery %>'
                                                SelectedItems='<%# Eval("MultiSelectionList") %>' OnInit="ucDynamicMultiSelection_Init" />
                                        </div>
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
