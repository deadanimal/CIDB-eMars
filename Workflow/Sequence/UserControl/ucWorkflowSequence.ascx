<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucWorkflowSequence.ascx.cs" Inherits="MAT.WebApp.App.Workflow.Sequence.UserControl.ucWorkflowSequence" %>

<div class="m-portlet__head">
    <div class="m-portlet__head-caption">
        <div class="m-portlet__head-title">
            <span class="m-portlet__head-icon m--hide">
                <i class="la la-gear"></i>
            </span>
            <h3 class="m-portlet__head-text">
                <MAT:Literal runat="server" Text="Sequences"></MAT:Literal>
            </h3>
        </div>
    </div>
</div>
<div class="m-portlet__body">
    <div class="row">
        <div class="table-responsive">
            <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="gvWorkflowSequence" OnAddClick="SearchPanel_AddClick"
                ShowKeywordSearch="false" ShowFilterButton="false" EncloseRowDiv="false" AddButtonCausesValidation="true">
            </Metronic:SearchPanel>
            <Metronic:GridView ID="gvWorkflowSequence" runat="server" ItemType="MAT.App.Workflow.Sequence.WorkflowSequenceViewModel" DataKeyNames="WorkflowSequenceId"
                SelectMethod="gvWorkflowSequence_GetData" OnRowCommand="gvWorkflowSequence_RowCommand">
                <Columns>
                    <MAT:TemplateField ItemStyle-Width="20px">
                        <ItemTemplate>
                            <div class="action-buttons">
                                <MAT:LinkButton ID="lbSelect" runat="server" CssClass="blue" FrontIconCss="ace-icon fa fa-search-plus bigger-130" CausesValidation="false"
                                    FunctionAccessControlCode="Edit" CommandName="MySelect" CommandArgument='<%# Eval("WorkflowSequenceId") %>'></MAT:LinkButton>
                            </div>
                        </ItemTemplate>
                    </MAT:TemplateField>
                    <MAT:BoundField DataField="SequenceNo" HeaderText="SeqNo" />
                    <MAT:BoundField DataField="Name" HeaderText="Name" />
                    <MAT:TemplateField HeaderText="WorkflowActions">
                        <ItemTemplate>
                            <%# MAT.Helper.EnumHelper.GetTextInBitwise("MAT.App.Workflow.WorkflowAction", Convert.ToInt32(Eval("WorkflowActions"))) %>
                        </ItemTemplate>
                    </MAT:TemplateField>
                    <MAT:TemplateField HeaderText="ManualAssignment">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbManualAssignment" runat="server" Checked='<%# Eval("ManualAssignment") %>' Enabled="false" />
                        </ItemTemplate>
                    </MAT:TemplateField>
                </Columns>
            </Metronic:GridView>
        </div>
    </div>
</div>
