<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Administration.Salutation.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Metronic:SearchPanel runat="server" ID="SearchPanel" AssociatedGridViewId="gvList" AddNavigateUrl="Add.aspx" ShowFilterButton="false">
        <SearchTemplate>
        </SearchTemplate>
    </Metronic:SearchPanel>
    <Metronic:GridView runat="server" ID="gvList" SelectMethod="gvList_Get" ItemType="MAT.App.Scorecard.DbModels.CodeMaster" AllowSorting="true">
        <Columns>
            <MAT:TemplateField ItemStyle-Width="20px">
                <ItemTemplate>
                    <div class="action-buttons">
                        <Metronic:LinkButton runat="server" ID="hl" SkinID="ButtonViewIcon" FunctionAccessControlCode="View" 
                            PostBackUrl='<%# string.Format("View.aspx?id={0}", Item.CodeMasterId) %>'></Metronic:LinkButton>
                    </div>
                </ItemTemplate>
            </MAT:TemplateField>
            <MAT:BoundField DataField="Desc" HeaderText="Name" SortExpression="Desc"></MAT:BoundField>
        </Columns>
    </Metronic:GridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
