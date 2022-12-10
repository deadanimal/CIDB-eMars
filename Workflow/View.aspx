<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.Workflow.View" %>

<%@ Register Src="~/Workflow/Sequence/UserControl/ucWorkflowSequence.ascx" TagName="WorkflowSequence" TagPrefix="UserControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton ID="btnEdit" runat="server" SkinID="ButtonEdit" FunctionAccessControlCode="Edit" OnClick="btnEdit_Click"></Metronic:LinkButton>
    <Metronic:FormViewButton ID="btnDelete" runat="server" SkinID="ButtonDelete" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Delete" CommandName="Delete"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="HyperLink1" runat="server" SkinID="ButtonBack" OnClick="HyperLink1_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="WorkflowId" DefaultMode="ReadOnly" ItemType="MAT.App.Workflow.WorkflowViewModel"
        SelectMethod="fvParent_GetItem" DeleteMethod="fvParent_DeleteItem">
        <ItemTemplate>
             <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label6" runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Name" ID="Name" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label1" runat="server" SkinID="FormLabel" Text="EffectiveDate" AssociatedControlID="EffectiveDate" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="EffectiveDate" ID="EffectiveDate" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label3" runat="server" SkinID="FormLabel" Text="WorkflowType" AssociatedControlID="WorkflowType" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="WorkflowType" ID="WorkflowType" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label4" runat="server" SkinID="FormLabel" Text="TransactionType" AssociatedControlID="WorkflowTxnTypeCId" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="WorkflowTxnTypeCId" ID="WorkflowTxnTypeCId" />
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xs-12">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" CssClass="col-sm-2 control-label no-padding-right mat-control-label" Text="Description" AssociatedControlID="Description" />
                                <div class="col-sm-10 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Description" ID="Description" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <UserControl:WorkflowSequence ID="ucWorkflowSequence" runat="server" Mode="ReadOnly" Value='<%# Bind("Sequences") %>' />
            </div>
            <MAT:DataInformation ID="ucDataInformation" runat="server" TableName="Workflow" PrimaryKeyName="WorkflowId" PrimaryKeyValue='<%# Eval("WorkflowId") %>' />
        </ItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
