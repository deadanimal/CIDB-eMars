<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Workflow.ApprovalDelegation.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-portlet">
        <div class="m-portlet__body">
            <asp:UpdatePanel ID="upParent" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="GridView1" AddNavigateUrl="Add.aspx">
                        <SearchTemplate>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label5" runat="server" CssClass="col-sm-4 control-label no-padding-right" AssociatedControlID="ddl_FromUser" Text="FromUser" SkinID="FormLabel" />
                                        <div class="col-sm-7">
                                            <Metronic:DropDownList ID="ddl_FromUser" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="User_Get"></Metronic:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label1" runat="server" CssClass="col-sm-4 control-label no-padding-right" AssociatedControlID="ddl_ToUser" Text="ToUser" SkinID="FormLabel" />
                                        <div class="col-sm-7">
                                            <Metronic:DropDownList ID="ddl_ToUser" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="User_Get"></Metronic:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label7" runat="server" CssClass="col-sm-4 control-label no-padding-right" AssociatedControlID="txt_StartDate" Text="StartDate" SkinID="FormLabel" />
                                        <div class="col-sm-7">
                                            <div class="input-daterange ">
                                                <MAT:TextBox ID="txt_StartDate" runat="server" CssClass="input-sm form-control"></MAT:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label2" runat="server" CssClass="col-sm-4 control-label no-padding-right" AssociatedControlID="txt_EndDate" Text="EndDate" SkinID="FormLabel" />
                                        <div class="col-sm-7">
                                            <div class="input-daterange ">
                                                <MAT:TextBox ID="txt_EndDate" runat="server" CssClass="input-sm form-control"></MAT:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <div class="col-sm-12">
                                            <div class="pull-right">
                                                <Metronic:LinkButton ID="btnSearch" runat="server" SkinID="ButtonSearch" CausesValidation="false" OnClick="btnSearch_Click"></Metronic:LinkButton>

                                            </div>
                                        </div>
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
                                <MAT:BoundField DataField="FromUserName" HeaderText="FromUser" SortExpression="FromUserName" />
                                <MAT:BoundField DataField="ToUserName" HeaderText="ToUser" SortExpression="ToUserName" />
                                <MAT:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" DataFormatString="{0:dd/MM/yyyy}" />
                                <MAT:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" DataFormatString="{0:dd/MM/yyyy}" />
                                <MAT:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" />
                            </Columns>

                            <PagerStyle CssClass="m-datatable__pager" />

                        </Metronic:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
