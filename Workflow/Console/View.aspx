<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.Workflow.Console.View" %>

<%@ Register Src="~/Workflow/Console/AbortControl.ascx" TagPrefix="MAT" TagName="AbortControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <MAT:LinkButton ID="btnAbort" runat="server" Text="Abort" FunctionAccessControlCode="Edit" OnClick="btnAbort_Click" CssClass="btn btn-info" FrontIconCss="ace-icon fa fa-floppy-o bigger-110"></MAT:LinkButton>
    <MAT:HyperLink ID="HyperLink1" runat="server" SkinID="ButtonBack" NavigateUrl='Index.aspx' CausesValidation="false"></MAT:HyperLink>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="WorkflowInstanceId" DefaultMode="ReadOnly" ItemType="MAT.App.Workflow.Console.ViewModel"
        SelectMethod="fvParent_GetItem" DeleteMethod="fvParent_DeleteItem">
        <ItemTemplate>
            <div class="row">
                <div class="col-xs-12">
                    <div class="form-horizontal">
                        <div class="col-sm-6 col-xs-12" role="form">
                            <div class="form-group">
                                <MAT:Label ID="Label6" runat="server" SkinID="FormLabel" Text="WorkflowName" AssociatedControlID="WorkflowName" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="WorkflowName" ID="WorkflowName" />
                                </div>
                            </div>
                            <div class="form-group">
                                <MAT:Label ID="Label3" runat="server" SkinID="FormLabel" Text="WorkflowType" AssociatedControlID="WorkflowType" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="WorkflowType" ID="WorkflowType" />
                                </div>
                            </div>
                            <div class="form-group">
                                <MAT:Label ID="Label1" runat="server" SkinID="FormLabel" Text="Initiator" AssociatedControlID="CreatedBy" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="CreatedBy" ID="CreatedBy" />
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xs-12" role="form">
                            <div class="form-group">
                                <MAT:Label ID="Label2" runat="server" SkinID="FormLabel" Text="WorkflowStatus" AssociatedControlID="ConsoleStatus" />
                                <div class="col-sm-8 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="ConsoleStatus" ID="ConsoleStatus" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </ItemTemplate>
    </MAT:FormView>

    <div class="table-responsive">
        <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="gvWorkflowInstanceHistory"
            ShowAddButton="false" ShowKeywordSearch="false" ShowFilterButton="false" EncloseRowDiv="false" AddButtonCausesValidation="true">
        </Metronic:SearchPanel>
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

    <MAT:AbortControl runat="server" ID="AbortControl" OnAborted="AbortControl_OnAborted" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
