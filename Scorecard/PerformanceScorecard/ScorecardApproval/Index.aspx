<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.PerformanceScorecard.ScorecardApproval.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Metronic:GridView runat="server" ID="gvList" DataKeyNames="WorkflowInstanceDetailId" SelectMethod="gvList_Get"
        ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.ScorecardApproval.ScorecardApprovalViewModel"
        OnRowCommand="gvList_RowCommand">
        <Columns>
            <MAT:TemplateField ItemStyle-Width="20px">
                <ItemTemplate>
                    <div class="action-buttons">
                        <Metronic:LinkButton runat="server" ID="btnSelect" CommandName="Select" FunctionAccessControlCode="Edit" SkinID="ButtonViewIcon"
                            CausesValidation="false" CommandArgument='<%# Item.WorkflowInstanceDetailId %>'></Metronic:LinkButton>
                    </div>
                </ItemTemplate>
            </MAT:TemplateField>
            <MAT:BoundField DataField="Code" HeaderText="Code" SortExpression="Code"></MAT:BoundField>
            <MAT:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></MAT:BoundField>
            <MAT:EnumBoundField DataField="Frequency" HeaderText="Frequency" SortExpression="Name"
                EnumName="MAT.App.Scorecard.Enumerate.ScorecardFrequency">
            </MAT:EnumBoundField>
            <MAT:TemplateField HeaderText="Period">
                <ItemTemplate>
                    <%# Item.StartDate.ToShortDateString() + " - " + Item.EndDate.ToShortDateString() %>
                </ItemTemplate>
            </MAT:TemplateField>
            <MAT:EnumBoundField DataField="WorkflowInstanceDetailStatus" HeaderText="Status"
                EnumName="MAT.App.Workflow.Instance.WorkflowInstanceDetailStatus">
            </MAT:EnumBoundField>
            <MAT:BoundField DataField="SubmittedBy" HeaderText="SubmittedBy" SortExpression="Name"></MAT:BoundField>
            <MAT:BoundField DataField="SubmittedOn" HeaderText="SubmittedOn" DataFormatString="{0 : dd/MM/yyyy}" SortExpression="Name"></MAT:BoundField>
        </Columns>
    </Metronic:GridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
