<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Employee.Add" %>

<%@ Register Src="~/Scorecard/Security/DataSecurityAccessEntity.ascx" TagPrefix="MAT" TagName="DataSecurityAccessEntity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Create" CommandName="Insert"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" CausesValidation="false" SkinID="ButtonBack" OnClick="btnBack_Click"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="EmployeeID" DefaultMode="Insert" DataSourceID="odsAction" OnItemInserting="fvParent_ItemInserting" OnItemInserted="fvParent_ItemInserted">
        <InsertItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <span class="m-portlet__head-icon m--hide"><i class="la la-gear"></i></span>
                            <h3 class="m-portlet__head-text">
                                <MAT:Literal runat="server" Text="CreateUser"></MAT:Literal>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="UserName" AssociatedControlID="txtUsername"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtUsername" Mandatory="true" Text='<%# Bind("username") %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="FirstName" AssociatedControlID="txtFirstname"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtFirstname" Mandatory="true" Text='<%# Bind("firstname") %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="LastName" AssociatedControlID="txtLastname"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtLastname" Text='<%# Bind("lastname") %>'></Metronic:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="UserGroup" AssociatedControlID="ddlRole"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="ddlRole" DataSourceID="odsRole" DataValueField="Key" DataTextField="Value" Mandatory="true" Text='<%# Bind("roleId") %>'></Metronic:DropDownList>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Entity" AssociatedControlID="ddlEntity"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="ddlEntity" DataSourceID="odsEntity" DataValueField="Key" DataTextField="Value" Text='<%# Bind("entityID") %>'></Metronic:DropDownList>
                                </div>
                            </div>
                            <div class="form-group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Supervisor" AssociatedControlID="Supervisor" />
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" id="Supervisor" DataValueField="Key" DataTextField="Value" SelectMethod="Supervisor_Get" Text='<%# Bind("supervisorEId") %>'></Metronic:DropDownList>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Email" AssociatedControlID="txtEmail"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtEmail" Text='<%# Bind("email") %>'></Metronic:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <MAT:DataSecurityAccessEntity runat="server" ID="DataSecurityAccessEntity" />
        </InsertItemTemplate>
    </MAT:FormView>
    <MAT:ObjectDataSource ID="odsAction" runat="server" TypeName="MAT.App.Scorecard.Employee.ODS.Employee" InsertMethod="CreateEmployeeWithUsername">
        <InsertParameters>
            <asp:Parameter Name="employeeId" DbType="Guid" Direction="Output" />
            <asp:Parameter Name="roleId" DbType="Guid" />
            <asp:Parameter Name="entityID" DbType="Guid" />
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="supervisorEId" DbType="Guid" />
        </InsertParameters>
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
