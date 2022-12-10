<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MAT.WebApp.App.Workflow.Edit" %>

<%@ Register Src="~/Workflow/Sequence/UserControl/ucWorkflowSequence.ascx" TagName="WorkflowSequence" TagPrefix="UserControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Edit" CommandName="Update"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" OnClick="btnBack_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="WorkflowId" DefaultMode="Edit" ItemType="MAT.App.Workflow.WorkflowViewModel"
        SelectMethod="fvParent_GetItem" UpdateMethod="fvParent_UpdateItem">
        <EditItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label6" runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="Name" ID="Name" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label1" runat="server" SkinID="FormLabel" Text="EffectiveDate" AssociatedControlID="EffectiveDate" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="EffectiveDate" ID="EffectiveDate" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label3" runat="server" SkinID="FormLabel" Text="WorkflowType" AssociatedControlID="WorkflowType" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="WorkflowType" ID="WorkflowType" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label4" runat="server" SkinID="FormLabel" Text="TransactionType" AssociatedControlID="WorkflowTxnTypeCId" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="WorkflowTxnTypeCId" ID="WorkflowTxnTypeCId" />
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xs-12">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" CssClass="col-sm-2 control-label no-padding-right mat-control-label" Text="Description" AssociatedControlID="Description" />
                                <div class="col-sm-10 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="Description" ID="Description" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <UserControl:WorkflowSequence ID="ucWorkflowSequence" runat="server" Mode="Edit" Value='<%# Bind("Sequences") %>' 
                    OnAddClick="ucWorkflowSequence_AddClick" OnEditClick="ucWorkflowSequence_EditClick"/>
            </div>
            <MAT:DataInformation ID="ucDataInformation" runat="server" TableName="Workflow" PrimaryKeyName="WorkflowId" PrimaryKeyValue='<%# Eval("WorkflowId") %>' />
        </EditItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>

