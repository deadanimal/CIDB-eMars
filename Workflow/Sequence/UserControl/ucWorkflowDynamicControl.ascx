<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucWorkflowDynamicControl.ascx.cs" Inherits="MAT.WebApp.App.Workflow.Sequence.UserControl.ucWorkflowDynamicControl" %>
<MAT:FormView ID="fvControl" runat="server" DefaultMode="Insert" RenderOuterTable="false" ItemType="MAT.App.Workflow.Sequence.Assignment.Condition.ConditionDynamicControlViewModel"
    OnDataBound="fvControl_DataBound">
    <InsertItemTemplate>
        <asp:DynamicControl runat="server" Mode="Insert" DataField="StringValue" ID="StringValue" Visible='<%# WorkflowDataType == MAT.App.Workflow.WorkflowDataType.Text %>' 
            ValidationGroup='<%# ValidationGroup %>' />
        <asp:DynamicControl runat="server" Mode="Insert" DataField="IntegerValue" ID="IntegerValue" Visible='<%# WorkflowDataType == MAT.App.Workflow.WorkflowDataType.Integer %>'
            ValidationGroup='<%# ValidationGroup %>' />
        <asp:DynamicControl runat="server" Mode="Insert" DataField="DecimalValue" ID="DecimalValue" Visible='<%# WorkflowDataType == MAT.App.Workflow.WorkflowDataType.Decimal %>' 
            ValidationGroup='<%# ValidationGroup %>' />
        <asp:DynamicControl runat="server" Mode="Insert" DataField="DateValue" ID="DateValue" Visible='<%# WorkflowDataType == MAT.App.Workflow.WorkflowDataType.Date %>' 
            ValidationGroup='<%# ValidationGroup %>' />
    </InsertItemTemplate>
</MAT:FormView>
