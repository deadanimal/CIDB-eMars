<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.Administration.Security.UserRole.View" %>

<%@ Register Src="~/Administration/Security/UserRole/UserControl/ucRoleFunction.ascx" TagName="RoleFunction" TagPrefix="UserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton ID="btnEdit" runat="server" SkinID="ButtonEdit" FunctionAccessControlCode="Edit" OnClick="btnEdit_Click"></Metronic:LinkButton>
    <Metronic:FormViewButton ID="btn_Delete" runat="server" SkinID="ButtonDelete" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Delete" CommandName="Delete"
        CausesValidation="false"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" OnClick="btnBack_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="RoleId" DefaultMode="ReadOnly" ItemType="MAT.App.Security.Role.RoleMasterViewModel"
        SelectMethod="fvParent_GetItem" DeleteMethod="fvParent_DeleteItem">
        <ItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Name" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" DataField="Name" ID="Name" />
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
        </ItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
    <script type="text/javascript">
        
    </script>
</asp:Content>
