<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Administration.General.Entity.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="GridView1" AddNavigateUrl="Add.aspx">
        <SearchTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label1" runat="server" SkinID="FormLabel" AssociatedControlID="Code" Text="Code" />
                                <div class="col-sm-8">
                                    <Metronic:TextBox ID="Code" runat="server"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label2" runat="server" SkinID="FormLabel" AssociatedControlID="Name" Text="Name" />
                                <div class="col-sm-8">
                                    <Metronic:TextBox ID="Name" runat="server"></Metronic:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="m-form__group mat-form-group">
                                <MAT:Label ID="Label3" runat="server" SkinID="FormLabel" AssociatedControlID="CompanyRegistrationNo" Text="CompanyRegistrationNo" />
                                <div class="col-sm-8">
                                    <Metronic:TextBox ID="CompanyRegistrationNo" runat="server"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="m-form__group mat-form-group">
                                <div class="col-sm-12">
                                    <div class="pull-right">
                                        <Metronic:LinkButton ID="btnSearch" runat="server" SkinID="ButtonSearch" OnClick="btnSearch_Click"></Metronic:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </SearchTemplate>
    </Metronic:SearchPanel>

    <%-- Grid View create Table --%>
    <div class="table-responsive">
        <Metronic:GridView ID="GridView1" runat="server" ItemType="MAT.App.General.Entity.EntityViewModel" DataKeyNames="EntityId"
            SelectMethod="GridView1_Get" AutoGenerateColumns="false">
            <Columns>
                <MAT:TemplateField ItemStyle-Width="20px">
                    <ItemTemplate>
                        <div class="action-buttons">
                            <MAT:HyperLink ID="HyperLink1" runat="server" CssClass="blue" FrontIconCss="ace-icon fa fa-search-plus bigger-130"
                                FunctionAccessControlCode="Edit" NavigateUrl='<%# string.Format("View.aspx?id={0}", Item.EntityId) %>'></MAT:HyperLink>
                        </div>
                    </ItemTemplate>
                </MAT:TemplateField>
                <MAT:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                <MAT:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <MAT:BoundField DataField="CompanyRegistrationNo" HeaderText="CompanyRegistrationNo" SortExpression="CompanyRegistrationNo" />
            </Columns>
        </Metronic:GridView>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
