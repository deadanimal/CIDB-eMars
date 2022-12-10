<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Workflow.MyApprovalDelegation.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="GridView1" AddNavigateUrl="Add.aspx">
        <SearchTemplate>
            <div class="row form-horizontal">
                <div class="col-sm-6 col-xs-12" role="form">
                    <div class="form-group">
                        <MAT:Label ID="Label1" runat="server" CssClass="col-sm-4 control-label no-padding-right" AssociatedControlID="ddl_ToUser" Text="ToUser" SkinID="FormLabel" />
                        <div class="col-sm-8">
                            <MAT:DropDownList ID="ddl_ToUser" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="User_Get" CssClass="select2"></MAT:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-12" role="form">
                    <div class="form-group">
                        <MAT:Label ID="Label7" runat="server" CssClass="col-sm-4 control-label no-padding-right" AssociatedControlID="txt_StartDate" Text="StartDate" SkinID="FormLabel" />
                        <div class="col-sm-8">
                            <div class="input-daterange ">
                                <MAT:TextBox ID="txt_StartDate" runat="server" CssClass="input-sm form-control"></MAT:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-12" role="form">
                    <div class="form-group">
                        <MAT:Label ID="Label2" runat="server" CssClass="col-sm-4 control-label no-padding-right" AssociatedControlID="txt_EndDate" Text="EndDate" SkinID="FormLabel" />
                        <div class="col-sm-8">
                            <div class="input-daterange ">
                                <MAT:TextBox ID="txt_EndDate" runat="server" CssClass="input-sm form-control"></MAT:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix">
                <div class="pull-right tableTools-container">
                    <div class="btn-group">
                        <MAT:LinkButton ID="btnSearch" runat="server" SkinID="ButtonSearch" CausesValidation="false" OnClick="btnSearch_Click"></MAT:LinkButton>
                    </div>
                </div>
            </div>
        </SearchTemplate>
    </Metronic:SearchPanel>

    <div class="table-responsive">
        <Metronic:GridView ID="GridView1" runat="server" ItemType="MAT.App.Workflow.ApprovalDelegation.WorkflowApprovalDelegationViewModel" DataKeyNames="WorkflowApprovalDelegationId"
            SelectMethod="GridView1_Get" AutoGenerateColumns="false">
            <Columns>
                <MAT:TemplateField ItemStyle-Width="20px">
                    <ItemTemplate>
                        <div class="action-buttons">
                            <MAT:HyperLink ID="HyperLink1" runat="server" CssClass="blue" FrontIconCss="ace-icon fa fa-search-plus bigger-130"
                                FunctionAccessControlCode="Edit" NavigateUrl='<%# string.Format("View.aspx?id={0}", Item.WorkflowApprovalDelegationId) %>'></MAT:HyperLink>
                        </div>
                    </ItemTemplate>
                </MAT:TemplateField>
                <MAT:BoundField DataField="ToUserName" HeaderText="ToUser" SortExpression="ToUserName" />
                <MAT:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" DataFormatString="{0:dd/MM/yyyy}" />
                <MAT:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" DataFormatString="{0:dd/MM/yyyy}" />
                <MAT:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" />
            </Columns>
        </Metronic:GridView>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
