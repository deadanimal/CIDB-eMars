<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.Workflow.ApprovalDelegation.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton ID="btnEdit" runat="server" SkinID="ButtonEdit" FunctionAccessControlCode="Edit" OnClick="btnEdit_Click"></Metronic:LinkButton>
    <Metronic:FormViewButton ID="btnDelete" runat="server" SkinID="ButtonDelete" FunctionAccessControlCode="Delete" AssociatedFormViewId="fvParent" CommandName="Delete" CausesValidation="false"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" NavigateUrl="Index.aspx" OnClick="btnBack_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DefaultMode="ReadOnly"
        ItemType="MAT.App.Workflow.ApprovalDelegation.WorkflowApprovalDelegationViewModel"
        DataKeyNames="WorkflowApprovalDelegationId"
        SelectMethod="fvParent_GetItem" DeleteMethod="fvParent_DeleteItem">
        <ItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label5" runat="server" CssClass="col-sm-4 control-label no-padding-right" AssociatedControlID="ddl_FromUser" Text="FromUser" SkinID="FormLabel" />

                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" ID="ddl_FromUser" Mode="ReadOnly" DataField="FromUserId" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label1" runat="server" CssClass="col-sm-4 control-label no-padding-right" AssociatedControlID="ddl_ToUser" Text="ToUser" SkinID="FormLabel" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" ID="ddl_ToUser" Mode="ReadOnly" DataField="ToUserId" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label7" runat="server" CssClass="col-sm-4 control-label no-padding-right" AssociatedControlID="txt_StartDate" Text="StartDate" SkinID="FormLabel" />
                                <div class="col-sm-7">
                                    <div>
                                        <asp:DynamicControl runat="server" ID="txt_StartDate" Mode="ReadOnly" DataField="StartDate" DataFormatString="{0:dd/MM/yyyy}" />

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label2" runat="server" CssClass="col-sm-4 control-label no-padding-right" AssociatedControlID="txt_EndDate" Text="EndDate" SkinID="FormLabel" />
                                <div class="col-sm-7">
                                    <div>
                                        <asp:DynamicControl runat="server" ID="txt_EndDate" Mode="ReadOnly" DataField="EndDate" DataFormatString="{0:dd/MM/yyyy}" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xs-12" role="form">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" CssClass="col-sm-2 control-label no-padding-right mat-control-label text-right" Text="Remarks" AssociatedControlID="dc_Remarks" />
                                <div class="col-sm-10 col-xs-12">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Remarks" ID="dc_Remarks" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <MAT:DataInformation ID="ucDataInformation" runat="server" TableName="[WorkflowApprovalDelegation]" PrimaryKeyName="[WorkflowApprovalDelegationId]"
                PrimaryKeyValue='<%# Item.WorkflowApprovalDelegationId %>' />
        </ItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
