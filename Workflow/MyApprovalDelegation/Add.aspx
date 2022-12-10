<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MAT.WebApp.App.Workflow.MyApprovalDelegation.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <MAT:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Create" CommandName="Insert"></MAT:FormViewButton>
    <MAT:HyperLink ID="btnBack" runat="server" SkinID="ButtonBack" NavigateUrl="Index.aspx" CausesValidation="false"></MAT:HyperLink>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DefaultMode="Insert"
        ItemType="MAT.App.Workflow.ApprovalDelegation.WorkflowApprovalDelegationViewModel"
        DataKeyNames="WorkflowApprovalDelegationId"  OnItemCreated="fvParent_ItemCreated"
        InsertMethod="fvParent_InsertItem">
        <InsertItemTemplate>
            <div class="row">
                <div class="col-xs-12">
                    <div class="form-horizontal">
                        <div class="col-sm-6 col-xs-12" role="form"> 
                            <div class="form-group">
                                <MAT:Label ID="Label5" runat="server" CssClass="col-sm-4 control-label no-padding-right" AssociatedControlID="lbl_UserName" Text="FromUser" SkinID="FormLabel" />
                                <div class="col-sm-8">
                                    <MAT:Label ID="lbl_UserName" runat="server" CssClass="col-sm-8 control-label no-padding-right" Text='<%# MAT.Context.Profile.DisplayName %>' SkinID="FormValue"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xs-12" role="form">
                            <div class="form-group">
                                <MAT:Label ID="Label1" runat="server" CssClass="col-sm-4 control-label no-padding-right" AssociatedControlID="ddl_ToUser" Text="ToUser" SkinID="FormLabel" />
                                <div class="col-sm-8">
                                    <asp:DynamicControl runat="server" ID="ddl_ToUser" Mode="Insert" DataField="ToUserId" />
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xs-12" role="form">
                            <div class="form-group">
                                <MAT:Label ID="Label7" runat="server" CssClass="col-sm-4 control-label no-padding-right" AssociatedControlID="txt_StartDate" Text="StartDate" SkinID="FormLabel" />
                                <div class="col-sm-8">
                                    <div>
                                        <asp:DynamicControl runat="server" ID="txt_StartDate" Mode="Insert" DataField="StartDate" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xs-12" role="form">
                            <div class="form-group">
                                <MAT:Label ID="Label2" runat="server" CssClass="col-sm-4 control-label no-padding-right" AssociatedControlID="txt_EndDate" Text="EndDate" SkinID="FormLabel" />
                                <div class="col-sm-8">
                                    <div>
                                        <asp:DynamicControl runat="server" ID="txt_EndDate" Mode="Insert" DataField="EndDate" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-xs-12" role="form">
                    <div class="form-group">
                        <MAT:Label runat="server" CssClass="col-sm-2 control-label no-padding-right mat-control-label  text-right" Text="Remarks" AssociatedControlID="dc_Remarks" />
                        <div class="col-sm-10 col-xs-12">
                            <asp:DynamicControl runat="server" Mode="Insert" DataField="Remarks" ID="dc_Remarks" />
                        </div>
                    </div>
                </div>
            </div>
        </InsertItemTemplate>
    </MAT:FormView>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
