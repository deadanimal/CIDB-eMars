<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.TicketManagement.CustomFieldMaster.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server" ID="upList" UpdateMode="Conditional">
        <ContentTemplate>
            <Metronic:SearchPanel runat="server" ID="SearchPanel" AssociatedGridViewId="gvListing" AddNavigateUrl="Add.aspx">
                <SearchTemplate>
                    <div class="m-portlet">
                        <div class="m-portlet__body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="FieldName"></MAT:Label>
                                        <div class="col-sm-7">
                                            <Metronic:TextBox runat="server" ID="FieldName"></Metronic:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Description" AssociatedControlID="Description"></MAT:Label>
                                        <div class="col-sm-7">
                                            <Metronic:TextBox runat="server" ID="Description"></Metronic:TextBox>
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
            <Metronic:GridView runat="server" ID="gvListing" ItemType="MAT.App.Scorecard.TicketManagement.CustomField.CustomFieldViewModel" DataKeyNames="CustomFieldId"
                SelectMethod="gvListing_Get" AutoGenerateColumns="false">
                <Columns>
                    <MAT:TemplateField ItemStyle-Width="20px">
                        <ItemTemplate>
                            <div class="action-buttons">
                                <MAT:HyperLink runat="server" ID="hl" CssClass="blue" FrontIconCss="ace-icon fa fa-search-plus bigger-130" FunctionAccessControlCode="View" NavigateUrl='<%# string.Format("View.aspx?id={0}", Item.CustomFieldId) %>'></MAT:HyperLink>
                            </div>
                        </ItemTemplate>
                    </MAT:TemplateField>
                    <MAT:BoundField DataField="FieldName" HeaderText="Name" SortExpression="FieldName"></MAT:BoundField>
                    <MAT:EnumBoundField DataField="FieldType" HeaderText="FieldType" SortExpression="FieldType" EnumName="MAT.App.Scorecard.TicketManagement.CustomField.FieldType"></MAT:EnumBoundField>
                    <MAT:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"></MAT:BoundField>
                </Columns>
            </Metronic:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
