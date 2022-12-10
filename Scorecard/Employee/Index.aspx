<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Employee.Index" %>

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
                                <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="Name" Text="Name"></MAT:Label>
                                <div class="col-sm-7">
                                    <Metronic:TextBox runat="server" ID="Name"></Metronic:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <div class="col-sm-12">
                                    <div class="pull-left">
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
    <asp:UpdatePanel runat="server" ID="upGrid" UpdateMode="Conditional">
        <ContentTemplate>
            <Metronic:GridView ID="gvList" runat="server" SelectMethod="gvList_Get" DataKeyNames="EmployeeId" OnSelectedIndexChanged="gvList_SelectedIndexChanged" PagerType="DropDownList" EnableViewState="false">
                <Columns>
                    <MAT:CommandField ShowSelectButton="true" SelectText="Select" HeaderStyle-Width="50px"></MAT:CommandField>
                    <MAT:BoundField DataField="DisplayName" HeaderText="Name" SortExpression="DisplayName"></MAT:BoundField>
                    <MAT:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></MAT:BoundField>
                    <MAT:BoundField DataField="EntityName" HeaderText="Entity" SortExpression="EntityName"></MAT:BoundField>
                    <MAT:EnumBoundField DataField="EmployeeStatus" HeaderText="Status" SortExpression="EmployeeStatus" EnumName="MAT.App.Scorecard.Employee.Enumerate.EmployeeStatus">
                    </MAT:EnumBoundField>
                </Columns>
            </Metronic:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
