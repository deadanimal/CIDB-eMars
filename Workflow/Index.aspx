<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Workflow.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-portlet">
        <div class="m-portlet__body">
            <asp:UpdatePanel ID="upParent" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="gvList" AddNavigateUrl="Add.aspx">
                        <searchtemplate>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="EffectiveDateFrom" Text="EffectiveDate" />
                                        <div class="col-sm-7">
                                            <div class="input-daterange input-group">
                                                <MAT:TextBox ID="EffectiveDateFrom" runat="server" CssClass="input-sm form-control"></MAT:TextBox>
                                                <span class="input-group-addon">
                                                    <i class="fa fa-exchange"></i>
                                                </span>
                                                <MAT:TextBox ID="EffectiveDateTo" runat="server" CssClass="input-sm form-control"></MAT:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="Name" Text="Name" />
                                        <div class="col-sm-7">
                                            <MAT:TextBox ID="Name" runat="server" SkinID="DefaultTextBox"></MAT:TextBox>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="WorkflowType" Text="WorkflowType" />
                                        <div class="col-sm-7">
                                            <Metronic:DropDownList ID="WorkflowType" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="WorkflowType_Get"></Metronic:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="WorkflowTxnType" Text="TransactionType" />
                                        <div class="col-sm-7">
                                            <Metronic:DropDownList ID="WorkflowTxnType" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="WorkflowTxnType_Get"></Metronic:DropDownList>
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
                        </searchtemplate>
                    </Metronic:SearchPanel>

                    <div class="table-responsive">
                        <Metronic:GridView ID="gvList" runat="server" ItemType="MAT.App.Workflow.WorkflowViewModel" DataKeyNames="WorkflowId" SelectMethod="gvList_Get">
                            <columns>
                                <MAT:TemplateField HeaderStyle-Width="25px">
                                    <ItemTemplate>
                                        <div class="action-buttons">
                                            <MAT:HyperLink ID="LinkButton3" runat="server" SkinID="ButtonViewIcon"
                                                FunctionAccessControlCode="Edit" NavigateUrl='<%# string.Format("View.aspx?id={0}", Item.WorkflowId) %>'></MAT:HyperLink>
                                        </div>
                                    </ItemTemplate>
                                </MAT:TemplateField>
                                <MAT:BoundField DataField="EffectiveDate" HeaderText="EffectiveDate" SortExpression="EffectiveDate" DataFormatString="{0:dd/MM/yyyy}" />
                                <MAT:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <MAT:TemplateField HeaderText="WorkflowType" SortExpression="WorkflowType">
                                    <ItemTemplate>
                                        <%# MAT.Helper.EnumHelper.GetText(Eval("WorkflowType").ToString()) %>
                                    </ItemTemplate>
                                </MAT:TemplateField>
                                <MAT:BoundField DataField="WorkflowTxnType" HeaderText="TransactionType" SortExpression="WorkflowTxnType" />
                            </columns>

                            <pagerstyle cssclass="m-datatable__pager" />

                        </Metronic:GridView>

                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
