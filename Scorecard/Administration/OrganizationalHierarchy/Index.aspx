<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Administration.OrganizationalHierarchy.Index" %>

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
                                <MAT:Label runat="server" SkinID="FormLabel" Text="ParentEntity" AssociatedControlID="ParentEntity"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="ParentEntity" DataValueField="Key" DataTextField="Value"
                                        SelectMethod="EntityGet"></Metronic:DropDownList>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Name"></Metronic:TextBox>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="EntityType" AssociatedControlID="EntityType"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="EntityType" DataValueField="Key" DataTextField="Value" SelectMethod="EntityType_Get"></Metronic:DropDownList>
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

    <Metronic:GridView runat="server" ID="gvList" DataKeyNames="EntityId" ItemType="MAT.App.Scorecard.Scorecard.General.OrganizationalHierarchyViewModel"
        SelectMethod="gvList_SelectItem">
        <Columns>
            <MAT:TemplateField ItemStyle-Width="20px">
                <ItemTemplate>
                    <Metronic:LinkButton runat="server" ID="lb" SkinID="ButtonViewIcon" FunctionAccessControlCode="View"
                        PostBackUrl='<%# string.Format("View.aspx?id={0}",  Item.EntityId) %>'></Metronic:LinkButton>
                </ItemTemplate>
            </MAT:TemplateField>
            <MAT:BoundField DataField="ParentEntityName" HeaderText="ParentEntity" SortExpression="ParentEntityName"></MAT:BoundField>
            <MAT:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></MAT:BoundField>
            <MAT:BoundField DataField="EntityTypeCName" HeaderText="EntityType" SortExpression="EntityTypeCName"></MAT:BoundField>
            <MAT:BoundField DataField="ModifiedDate" HeaderText="LastUpdatedDate" SortExpression="ModifiedDate" DataFormatString="{0:dd/MM/yyyy}"></MAT:BoundField>
            <MAT:BoundField DataField="ModifiedBy" HeaderText="LastUpdatedBy" SortExpression="ModifiedBy"></MAT:BoundField>
        </Columns>
    </Metronic:GridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
