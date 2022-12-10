<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Administration.Member.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Metronic:SearchPanel runat="server" ID="SearchPanel" AddNavigateUrl="Add.aspx" AssociatedGridViewId="gvList">
        <SearchTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Name"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Organization" AssociatedControlID="Organization"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="Organization" SelectMethod="Organization_Get" DataValueField="Key" DataTextField="Value"></Metronic:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Status" AssociatedControlID="Status"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="Status" DataTextField="Value" DataValueField="Key" SelectMethod="Status_Get"></Metronic:DropDownList>
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
                </div>
            </div>
        </SearchTemplate>
    </Metronic:SearchPanel>
    <Metronic:GridView runat="server" ID="gvList" DataKeyNames="MemberId" ItemType="MAT.App.Scorecard.Scorecard.Administration.Member.MemberViewModel" SelectMethod="gvList_Get" ShowHeaderWhenEmpty="true">
        <Columns>
            <MAT:TemplateField ItemStyle-Width="20px">
                <ItemTemplate>
                    <Metronic:LinkButton runat="server" ID="lb" SkinID="ButtonViewIcon" FunctionAccessControlCode="View" PostBackUrl='<%# string.Format("View.aspx?id={0}", Item.MemberId) %>'></Metronic:LinkButton>
                </ItemTemplate>
            </MAT:TemplateField>
            <%--<MAT:BoundField DataField="Salutation" HeaderText="Salutation"></MAT:BoundField>--%>
            <MAT:BoundField DataField="DisplayName" HeaderText="Name" SortExpression="DisplayName"></MAT:BoundField>
            <MAT:BoundField DataField="OrganizationName" HeaderText="Organization" SortExpression="OrganizationName"></MAT:BoundField>
            <MAT:BoundField DataField="Position" HeaderText="Position" SortExpression="Position"></MAT:BoundField>
            <MAT:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></MAT:BoundField>
            <MAT:BoundField DataField="BusinessPhone" HeaderText="BusinessPhone" SortExpression="BusinessPhone"></MAT:BoundField>
            <MAT:BoundField DataField="MobilePhone" HeaderText="MobilePhone" SortExpression="MobilePhone"></MAT:BoundField>
        </Columns>
    </Metronic:GridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
