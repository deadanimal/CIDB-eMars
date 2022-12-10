<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucWorkflowInstanceHistory.ascx.cs" Inherits="MAT.WebApp.App.Workflow.UserControl.ucWorkflowInstanceHistory" %>
<%--<div class="col-xs-12">
    <h5 class="header smaller blue">
        <MAT:Literal runat="server" Text="WorkflowHistory"></MAT:Literal></h5>
    <p></p>--%>&nbsp;
<asp:UpdatePanel ID="upGrid" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <div class="table-responsive">
        <div class="row">            
            <div class="col-sm-6">
                <div class="form-group m-form__group mat-form-group">
                    <MAT:Label runat="server" SkinID="FormLabel" Text="Submission" AssociatedControlID="Submission"></MAT:Label>
                    <div class="col-sm-8">
                        <MAT:Label runat="server" ID="Submission" SkinID="FormValue"></MAT:Label>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="gvWorkflowInstanceHistory"
                    ShowAddButton="false" ShowKeywordSearch="false" ShowFilterButton="false" EncloseRowDiv="false" AddButtonCausesValidation="true">
                </Metronic:SearchPanel>        
            </div>
        </div>
        <Metronic:GridView ID="gvWorkflowInstanceHistory" runat="server" ItemType="MAT.App.Workflow.Instance.Detail.WorkflowInstanceDetailViewModel"
            SelectMethod="gvWorkflowInstanceHistory_GetData">
            <Columns>
                <MAT:BoundField DataField="AssignmentDate" HeaderText="AssignmentDate" SortExpression="AssignmentDate" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
                <MAT:BoundField DataField="AssignedToUserName" HeaderText="AssignedTo" SortExpression="AssignedToUserName" />
                <MAT:EnumBoundField EnumName="MAT.App.Workflow.Instance.WorkflowInstanceDetailStatus" DataField="WorkflowInstanceDetailStatus" HeaderText="Status" SortExpression="WorkflowInstanceDetailStatus" />
                    <MAT:TemplateField HeaderText="ActionDateBy" SortExpression="ActionDate">
                        <ItemTemplate>
                            <%# !string.IsNullOrEmpty(Convert.ToString(Eval("ActionDate"))) ? (Eval("ActionDate", "{0:dd/MM/yyyy HH:mm:ss}") + " / " + Eval("ActionByUserName")) : "" %>
                        </ItemTemplate>
                    </MAT:TemplateField>
                    <MAT:BoundField DataField="Comment" HeaderText="Remark" SortExpression="Comment" />
            </Columns>
        </Metronic:GridView>
    </div>
    </ContentTemplate>
</asp:UpdatePanel>
<%--</div>
</div>--%>
