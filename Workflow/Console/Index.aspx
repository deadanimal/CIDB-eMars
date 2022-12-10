<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Workflow.Console.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="gvList" AddNavigateUrl="Add.aspx">
        <SearchTemplate>
            <div class="form-horizontal row">
                <div class="col-sm-6 col-xs-12">
                    <div class="form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="EffectiveDateFrom" Text="Date" />
                        <div class="col-sm-8">
                            <div class="input-daterange input-group">
                                <MAT:TextBox ID="EffectiveDateFrom" runat="server" CssClass="input-sm form-control"></MAT:TextBox>
                                <span class="input-group-addon">
                                    <i class="fa fa-exchange"></i>
                                </span>
                                <MAT:TextBox ID="EffectiveDateTo" runat="server" CssClass="input-sm form-control"></MAT:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="CreatorName" Text="Initiator" />
                        <div class="col-sm-8">
                            <MAT:TextBox ID="CreatorName" runat="server" SkinID="DefaultTextBox"></MAT:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="ConsoleStatus" Text="Status" />
                        <div class="col-sm-8">
                            <MAT:DropDownList ID="ConsoleStatus" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="ConsoleStatus_Get" SkinID="Select2"></MAT:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-12">
                    <div class="form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="WorkflowName" Text="WorkflowName" />
                        <div class="col-sm-8">
                            <MAT:DropDownList ID="WorkflowName" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="WorkflowName_Get" SkinID="Select2"></MAT:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="WorkflowType" Text="WorkflowType" />
                        <div class="col-sm-8">
                            <MAT:DropDownList ID="WorkflowType" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="WorkflowType_Get" SkinID="Select2"></MAT:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="clearfix">
                        <div class="pull-right tableTools-container">
                            <div class="btn-group">
                                <MAT:LinkButton ID="btnSearch" runat="server" SkinID="ButtonSearch" CausesValidation="false" OnClick="btnSearch_Click"></MAT:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </SearchTemplate>
    </Metronic:SearchPanel>
    <div class="table-responsive">
        <Metronic:GridView ID="gvList" runat="server" ItemType="MAT.App.Workflow.Console.ListModel" DataKeyNames="WorkflowInstanceId" SelectMethod="gvList_Get">
            <Columns>
                <MAT:TemplateField HeaderStyle-Width="25px">
                    <ItemTemplate>
                        <div class="action-buttons">
                            <MAT:HyperLink ID="LinkButton3" runat="server" SkinID="ButtonViewIcon"
                                FunctionAccessControlCode="Edit" NavigateUrl='<%# string.Format("View.aspx?id={0}", Item.WorkflowInstanceId) %>'></MAT:HyperLink>
                        </div>
                    </ItemTemplate>
                </MAT:TemplateField>
                <MAT:TemplateField HeaderText="WorkflowName" SortExpression="WorkflowName">
                    <ItemTemplate>
                        <%# Item.WorkflowName %>&nbsp;<%# (string.IsNullOrWhiteSpace(Item.WorkflowDesc) ? "" : "(" + Item.WorkflowDesc + ")") %>
                    </ItemTemplate>
                </MAT:TemplateField>
                <MAT:TemplateField HeaderText="WorkflowType" SortExpression="WorkflowType">
                    <ItemTemplate>
                        <%# MAT.Helper.EnumHelper.GetText(Eval("WorkflowType").ToString()) %>
                    </ItemTemplate>
                </MAT:TemplateField>
                <MAT:BoundField DataField="CreatedDate" HeaderText="StartTime" SortExpression="CreatedDate" DataFormatString="{0:dd/MM/yyyy hh:mm:ss}" />
                <MAT:BoundField DataField="CreatedBy" HeaderText="Initiator" SortExpression="CreatedBy" />
                <MAT:EnumBoundField DataField="ConsoleStatus" HeaderText="Status" SortExpression="ConsoleStatus" EnumName="MAT.App.Workflow.Console.ConsoleStatus" />
            </Columns>
        </Metronic:GridView>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
