<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Administration.Security.User.Index" %>

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
                        <SearchTemplate>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label1" runat="server" SkinID="FormLabel" AssociatedControlID="Username" Text="Username" />
                                        <div class="col-sm-7">
                                            <Metronic:TextBox ID="Username" runat="server"></Metronic:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label4" runat="server" SkinID="FormLabel" AssociatedControlID="FullName" Text="FullName" />
                                        <div class="col-sm-7">
                                            <Metronic:TextBox ID="FullName" runat="server"></Metronic:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label2" runat="server" SkinID="FormLabel" AssociatedControlID="Status" Text="Status" />
                                        <div class="col-sm-7">
                                            <Metronic:DropDownList ID="Status" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="UserStatus_Get"></Metronic:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label3" runat="server" SkinID="FormLabel" AssociatedControlID="UserRole" Text="UserRole" />
                                        <div class="col-sm-7">
                                            <Metronic:DropDownList ID="UserRole" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="UserRole_Get"></Metronic:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label5" runat="server" SkinID="FormLabel" AssociatedControlID="Department" Text="Department" />
                                        <div class="col-sm-7">
                                            <Metronic:DropDownList ID="Department" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="Department_Get"></Metronic:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <div class="col-sm-12">
                                            <div class="pull-right">
                                                <Metronic:LinkButton ID="btnSearch" runat="server" SkinID="ButtonSearch" OnClick="btnSearch_Click"></Metronic:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </SearchTemplate>
                    </Metronic:SearchPanel>

                    <div class="table-responsive">
                        <Metronic:GridView ID="gvList" runat="server" ItemType="MAT.App.Employee.EmployeeViewModel" DataKeyNames="EmployeeId" SelectMethod="gvList_Get">
                            <Columns>
                                <MAT:TemplateField ItemStyle-Width="25px">
                                    <ItemTemplate>
                                        <Metronic:LinkButton ID="btnView" runat="server" SkinID="ButtonViewIcon" OnClick="btnView_Click" CommandArgument='<%# Item.EmployeeId%>'></Metronic:LinkButton>
                                    </ItemTemplate>
                                </MAT:TemplateField>
                                <MAT:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                                <MAT:BoundField DataField="DisplayName" HeaderText="FullName" SortExpression="DisplayName" />
                                <MAT:EnumBoundField DataField="UserStatus" EnumName="MAT.App.Security.User.UserStatus" HeaderText="Status" SortExpression="UserStatus"></MAT:EnumBoundField>
                                <MAT:BoundField DataField="UserRole" HeaderText="UserRole" SortExpression="UserRole" />
                                <MAT:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                            </Columns>
                        </Metronic:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
