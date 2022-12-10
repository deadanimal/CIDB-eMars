<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MAT.WebApp.App.Administration.Security.UserRole.Edit" %>

<%@ Register Src="~/Administration/Security/UserRole/UserControl/ucRoleFunction.ascx" TagName="RoleFunction" TagPrefix="UserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Create" CommandName="Update"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" OnClick="btnBack_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="RoleId" DefaultMode="Edit" ItemType="MAT.App.Security.Role.RoleMasterViewModel"
        UpdateMethod="fvParent_UpdateItem" SelectMethod="fvParent_GetItem">
        <EditItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Name" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Name" ID="Name" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="padding-top: 20px;">
                        <div class="col-md-12">
                            <UserControl:RoleFunction ID="ucRoleFunction1" runat="server" SelectedValues="<%# Item.RoleFunctions %>" />
                        </div>
                    </div>
                </div>
            </div>
            <MAT:DataInformation ID="ucDataInformation" runat="server" TableName="Role" PrimaryKeyName="RoleId" PrimaryKeyValue='<%# Eval("RoleId") %>' />
        </EditItemTemplate>
    </MAT:FormView>
</asp:Content>
