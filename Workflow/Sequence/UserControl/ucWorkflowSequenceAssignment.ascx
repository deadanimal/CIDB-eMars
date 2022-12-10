<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucWorkflowSequenceAssignment.ascx.cs" Inherits="MAT.WebApp.App.Workflow.Sequence.UserControl.ucWorkflowSequenceAssignment" %>

<%@ Register Src="~/Administration/UserControl/ucDynamicMultiSelection.ascx" TagName="DynamicMultiSelection" TagPrefix="UserControl" %>
<%@ Register Src="~/Workflow/Sequence/UserControl/ucWorkflowSequenceAssignmentCondition.ascx" TagName="WorkflowSequenceAssignmentCondition" TagPrefix="UserControl" %>
<div class="table-responsive">
    <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="gvWorkflowSequenceAssignment"
        OnAddClick="SearchPanel_AddClick" ShowKeywordSearch="false" ShowFilterButton="false" EncloseRowDiv="false">
    </Metronic:SearchPanel>
    <Metronic:GridView ID="gvWorkflowSequenceAssignment" runat="server" ItemType="MAT.App.Workflow.Sequence.Assignment.WorkflowSequenceAssignmentViewModel" DataKeyNames="WorkflowSequenceAssignmentId"
        SelectMethod="gvWorkflowSequenceAssignment_GetData" OnRowCommand="gvWorkflowSequenceAssignment_RowCommand">
        <Columns>
            <MAT:TemplateField ItemStyle-Width="20px">
                <ItemTemplate>
                    <div class="action-buttons">
                        <MAT:LinkButton ID="lbSelect" runat="server" CssClass="blue" FrontIconCss="ace-icon fa fa-search-plus bigger-130" CausesValidation="false"
                            FunctionAccessControlCode="Edit" CommandName="MySelect" CommandArgument='<%# Eval("WorkflowSequenceAssignmentId") %>'></MAT:LinkButton>
                    </div>
                </ItemTemplate>
            </MAT:TemplateField>
            <MAT:BoundField DataField="WorkflowAssignmentTypeName" HeaderText="AssignmentType" SortExpression="WorkflowAssignmentTypeName" />
            <MAT:BoundField DataField="MultiSelectionStr" HeaderText="AssignedTo" SortExpression="MultiSelectionStr" />
            <MAT:BoundField DataField="MinApprovalRequired" HeaderText="MinApprovalRequired" SortExpression="MinApprovalRequired" />
            <asp:TemplateField HeaderText="Conditions" SortExpression="ConditionsStr">
                <ItemTemplate>
                    <%# Eval("ConditionsStr").ToString().Replace(Environment.NewLine, "<br/>") %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </Metronic:GridView>
</div>

<div class="m-portlet__head">
    <div class="m-portlet__head-caption">
        <div class="m-portlet__head-title">
            <span class="m-portlet__head-icon m--hide">
                <i class="la la-gear"></i>
            </span>
            <h3 class="m-portlet__head-text">
                <MAT:Label ID="lblTitle" runat="server"></MAT:Label>
            </h3>
        </div>
    </div>
</div>
<div class="m-portlet__body" runat="server" id="divForm" style="display: none;">
    <MAT:FormView ID="fvWorkflowSequenceAssignment" runat="server" RenderOuterTable="false" DataKeyNames="WorkflowSequenceAssignmentId"
        ItemType="MAT.App.Workflow.Sequence.Assignment.WorkflowSequenceAssignmentViewModel" SelectMethod="fvWorkflowSequenceAssignment_SelectItem"
        InsertMethod="fvWorkflowSequenceAssignment_InsertItem" UpdateMethod="fvWorkflowSequenceAssignment_UpdateItem"
        DeleteMethod="fvWorkflowSequenceAssignment_DeleteItem">
        <InsertItemTemplate>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="AssignmentType" AssociatedControlID="WorkflowAssignmentType" />
                        <div class="col-sm-7">
                            <Metronic:DropDownList ID="WorkflowAssignmentType" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="WorkflowAssignmentType_Get"
                                ValidationGroup="Assignment" Text='<%# Bind("WorkflowAssignmentTypeId") %>' AutoPostBack="true"
                                OnSelectedIndexChanged="WorkflowAssignmentType_SelectedIndexChanged" Mandatory="true">
                            </Metronic:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvWorkflowAssignmentType" CssClass="DDControl DDValidator help-block"
                                ControlToValidate="WorkflowAssignmentType" Display="Dynamic" ValidationGroup="Assignment" />
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group" runat="server" id="divAssignment" visible="false">
                        <MAT:Label ID="lblAssignment" runat="server" SkinID="FormLabel" Text="UserBased" AssociatedControlID="ucDynamicMultiSelection" />
                        <div class="col-sm-7">
                            <UserControl:DynamicMultiSelection ID="ucDynamicMultiSelection" runat="server" SelectedItems='<%# Bind("MultiSelectionList") %>'
                                IsRequired="true" ValidationGroup="Assignment" />
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group m-form__group mat-form-group" runat="server" id="divMinApprovalRequired" visible="false">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="MinApprovalRequired" AssociatedControlID="MinApprovalRequired" />
                        <div class="col-sm-7">
                            <asp:DynamicControl runat="server" Mode="Insert" DataField="MinApprovalRequired" ID="MinApprovalRequired" ValidationGroup="Assignment" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <UserControl:WorkflowSequenceAssignmentCondition ID="ucWorkflowSequenceAssignmentCondition" runat="server" WorkflowType='<%# WorkflowType %>'
                        Value='<%# Bind("Conditions") %>' />
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group m-form__group mat-form-group">
                        <div class="col-sm-12">
                            <div class="pull-right">
                                <Metronic:LinkButton ID="btnSave" runat="server" SkinID="ButtonSave" CommandName="Insert" ValidationGroup="Assignment" />
                                <Metronic:LinkButton ID="btnCancel" runat="server" SkinID="ButtonCancel" CausesValidation="false" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </InsertItemTemplate>
        <EditItemTemplate>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="AssignmentType" AssociatedControlID="WorkflowAssignmentType" />
                        <div class="col-sm-7">
                            <Metronic:DropDownList ID="WorkflowAssignmentType" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="WorkflowAssignmentType_Get"
                                ValidationGroup="Assignment" Text='<%# Bind("WorkflowAssignmentTypeId") %>' AutoPostBack="true"
                                OnSelectedIndexChanged="WorkflowAssignmentType_SelectedIndexChanged" Mandatory="true">
                            </Metronic:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvWorkflowAssignmentType" CssClass="DDControl DDValidator help-block"
                                ControlToValidate="WorkflowAssignmentType" Display="Dynamic" ValidationGroup="Assignment" />
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group" runat="server" id="divAssignment" visible="false">
                        <MAT:Label ID="lblAssignment" runat="server" SkinID="FormLabel" Text="UserBased" AssociatedControlID="ucDynamicMultiSelection" />
                        <div class="col-sm-7">
                            <UserControl:DynamicMultiSelection ID="ucDynamicMultiSelection" runat="server" Sql='<%# WorkflowAssignmentTypeValue.SelectionQuery %>'
                                SelectedItems='<%# Bind("MultiSelectionList") %>' IsRequired="true" ValidationGroup="Assignment" />
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group m-form__group mat-form-group" runat="server" id="divMinApprovalRequired" visible="false">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="MinApprovalRequired" AssociatedControlID="MinApprovalRequired" />
                        <div class="col-sm-7">
                            <asp:DynamicControl runat="server" Mode="Edit" DataField="MinApprovalRequired" ID="MinApprovalRequired" ValidationGroup="Assignment" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <UserControl:WorkflowSequenceAssignmentCondition ID="ucWorkflowSequenceAssignmentCondition" runat="server" WorkflowType='<%# WorkflowType %>'
                        Value='<%# Bind("Conditions") %>' />
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group m-form__group mat-form-group">
                        <div class="col-sm-12">
                            <div class="pull-right">
                                <Metronic:LinkButton ID="btnSave" runat="server" SkinID="ButtonSave" CommandName="Update" ValidationGroup="Assignment" />
                                <Metronic:LinkButton ID="btnDelete" runat="server" SkinID="ButtonDelete" CommandName="Delete" CausesValidation="false"
                                    OnClientClick="return confirm('Are you sure?');" />
                                <Metronic:LinkButton ID="btnCancel" runat="server" SkinID="ButtonCancel" CausesValidation="false" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </EditItemTemplate>
        <ItemTemplate>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="AssignmentType" AssociatedControlID="WorkflowAssignmentType" />
                        <div class="col-sm-7">
                            <asp:Literal ID="WorkflowAssignmentType" runat="server" Text='<%# Eval("WorkflowAssignmentTypeName") %>'></asp:Literal>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group" runat="server" id="divAssignment" visible="false">
                        <MAT:Label ID="lblAssignment" runat="server" SkinID="FormLabel" Text="UserBased" AssociatedControlID="ucDynamicMultiSelection" />
                        <div class="col-sm-7">
                            <UserControl:DynamicMultiSelection ID="ucDynamicMultiSelection" runat="server" Sql='<%# WorkflowAssignmentTypeValue.SelectionQuery %>'
                                SelectedItems='<%# Bind("MultiSelectionList") %>' />
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group m-form__group mat-form-group" runat="server" id="divMinApprovalRequired" visible="false">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="MinApprovalRequired" AssociatedControlID="MinApprovalRequired" />
                        <div class="col-sm-7">
                            <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="MinApprovalRequired" ID="MinApprovalRequired" ValidationGroup="Assignment" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <UserControl:WorkflowSequenceAssignmentCondition ID="ucWorkflowSequenceAssignmentCondition" runat="server" WorkflowType='<%# WorkflowType %>'
                        Value='<%# Eval("Conditions") %>' ReadOnly="true" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group m-form__group mat-form-group">
                        <div class="col-sm-12">
                            <div class="pull-right">
                                <Metronic:LinkButton ID="btnCancel" runat="server" SkinID="ButtonCancel" CausesValidation="false" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </MAT:FormView>
</div>
