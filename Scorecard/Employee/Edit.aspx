<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Employee.Edit" %>

<%@ Register Src="~/Scorecard/Security/DataSecurityAccessEntity.ascx" TagPrefix="MAT" TagName="DataSecurityAccessEntity" %>
<%@ Register Src="~/Administration/UserControl/ucDataInformation.ascx" TagPrefix="MAT" TagName="ucDataInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Edit" CommandName="Update"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" CausesValidation="false" SkinID="ButtonBack" OnClick="btnBack_Click"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="EmployeeID" DefaultMode="Edit" DataSourceID="odsAction" OnItemUpdating="fvParent_ItemUpdating">
        <EditItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">                            
                            <h3 class="m-portlet__head-text">
                                <MAT:Literal runat="server" Text="EditUser"></MAT:Literal>
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
                                    <Metronic:TextBox runat="server" ID="txtUserName" ReadOnly="true" Text='<%# Eval("Username") %>'></Metronic:TextBox>
                                </div>
                            </div>

                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="FirstName"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtFirstName" Mandatory="true" Text='<%# Bind("FirstName") %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="LastName"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtlastName" Text='<%# Bind("LastName") %>'></Metronic:TextBox>
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
                                    <Metronic:DropDownList runat="server" ID="ddlRole" DataSourceID="odsRole" DataValueField="Key" DataTextField="Value" SelectedValue='<%# Bind("RoleId") %>'></Metronic:DropDownList>
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
                                    <Metronic:TextBox runat="server" ID="txtEmail" Text='<%# Bind("Email") %>'></Metronic:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <MAT:DataSecurityAccessEntity runat="server" ID="DataSecurityAccessEntity" UserId='<%# Eval("UserId") %>' />
            <MAT:ucDataInformation runat="server" id="ucDataInformation" TableName="Employee" PrimaryKeyName="EmployeeId" PrimaryKeyValue='<%# Eval("EmployeeId") %>' />
        </EditItemTemplate>
    </MAT:FormView>
    <MAT:ObjectDataSource ID="odsAction" runat="server" SelectMethod="ListEmployeeById" UpdateMethod="UpdateEmployee" OnUpdated="odsAction_Updated" TypeName="MAT.App.Scorecard.Employee.ODS.Employee">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="Id" DbType="Guid" Name="employeeId" />
        </SelectParameters>
        <UpdateParameters>
            <asp:QueryStringParameter QueryStringField="Id" DbType="Guid" Name="employeeId" />
            <asp:Parameter Name="RoleId" DbType="Guid" />
            <asp:Parameter Name="EntityID" DbType="Guid" />
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="employeeStatus" Type="Object" />
            <asp:Parameter Name="SupervisorEmpId" DbType="Guid" />
        </UpdateParameters>
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
