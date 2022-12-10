<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Employee.View" %>

<%@ Register Src="~/Scorecard/Security/DataSecurityAccessEntity.ascx" TagPrefix="MAT" TagName="DataSecurityAccessEntity" %>
<%@ Register Src="~/Administration/UserControl/ucDataInformation.ascx" TagPrefix="MAT" TagName="ucDataInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton ID="btnResetPassword" runat="server" Text="ResetPassword" CausesValidation="false" CommandArgument='<%# Eval("UserId") %>' OnClick="btnResetPassword_Click" />
    <Metronic:LinkButton ID="btnEdit" runat="server" SkinID="ButtonEdit" FunctionAccessControlCode="Edit" OnClick="btnEdit_Click"></Metronic:LinkButton>
    <Metronic:LinkButton ID="btnBack" runat="server" CausesValidation="false" SkinID="ButtonBack" OnClick="btnBack_Click"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="EmployeeID" DefaultMode="ReadOnly" DataSourceID="odsAction">
        <ItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <span class="m-portlet__head-icon m--hide"><i class="la la-gear"></i></span>
                            <h3 class="m-portlet__head-text">
                                <MAT:Literal runat="server" Text="ViewUser"></MAT:Literal>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="UserName"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtUserName" ReadOnly="true" Text='<%# Bind("Username") %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="FirstName"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtFirstName" ReadOnly="true" Text='<%# Bind("FirstName") %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="LastName"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtlastName" ReadOnly="true" Text='<%# Bind("LastName") %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Status"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="ddlStatus" SelectedValue='<%# Bind("EmployeeStatus") %>' DataValueField="Key" DataTextField="Value" ReadOnly="true" SelectMethod="ddlStatusGet"></Metronic:DropDownList>                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Role"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="ddlRole" DataSourceID="odsRole" DataValueField="Key" DataTextField="Value" SelectedValue='<%# Bind("RoleId") %>' ReadOnly="true"></Metronic:DropDownList>                                    
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Entity"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="ddlEntity" DataSourceID="odsEntity" DataValueField="Key" DataTextField="Value" SelectedValue='<%# Bind("EntityID") %>'></Metronic:DropDownList>
                                </div>
                            </div>
                            <div class="form-group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Supervisor" AssociatedControlID="Supervisor" />
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" id="Supervisor" DataValueField="Key" DataTextField="Value" SelectMethod="Supervisor_Get" Text='<%# Bind("SupervisorEmpId") %>'></Metronic:DropDownList>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Email"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtEmail" ReadOnly="true" Text='<%# Bind("Email") %>'></Metronic:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <MAT:DataSecurityAccessEntity runat="server" ID="DataSecurityAccessEntity" UserId='<%# Eval("UserId") %>' />
            <MAT:ucDataInformation runat="server" id="ucDataInformation" TableName="Employee" PrimaryKeyName="EmployeeId" PrimaryKeyValue='<%# Eval("EmployeeId") %>' />
        </ItemTemplate>
    </MAT:FormView>
    <MAT:ObjectDataSource ID="odsAction" runat="server" SelectMethod="ListEmployeeById" TypeName="MAT.App.Scorecard.Employee.ODS.Employee">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="Id" DbType="Guid" Name="employeeId" />
        </SelectParameters>
    </MAT:ObjectDataSource>    
    <asp:ObjectDataSource ID="odsRole" runat="server" SelectMethod="Role" TypeName="MAT.App.Security.Role.DropDown">
        <SelectParameters>
            <asp:Parameter Name="defaultText" Type="Object" DefaultValue="1" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsEntity" runat="server" SelectMethod="OrganizationalHierarchy" TypeName="MAT.App.General.OrganizationalHierarchy.DropDown">
        <SelectParameters>
            <asp:Parameter Name="defaultText" Type="Object" DefaultValue="1" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
