<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Document.Category.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="upParent" runat="server" UpdateMode="Always">
    <ContentTemplate>
        <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="GridView1" AddNavigateUrl="Add.aspx">
            <SearchTemplate>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="Name" Text="Name" />
                            <div class="col-sm-7">
                                <Metronic:TextBox ID="Name" runat="server"></Metronic:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                         <div class="form-group m-form__group mat-form-group">
                        </div>
                        <div class="col-sm-12">
                            <div class="pull-right">
                                <Metronic:LinkButton ID="btnSearch" runat="server" SkinID="ButtonSearch" CausesValidation="false" OnClick="btnSearch_Click"></Metronic:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </SearchTemplate>
        </Metronic:SearchPanel>

        <div class="table-responsive">
            <Metronic:GridView ID="GridView1" runat="server" ItemType="MAT.App.General.CodeMaster.CodeMasterViewModel" DataKeyNames="CodeMasterId"
                SelectMethod="GridView1_GetData">
                <Columns>
                    <MAT:TemplateField HeaderStyle-Width="25px">
                        <ItemTemplate>
                            <div class="action-buttons">
                                <Metronic:LinkButton ID="btnView" runat="server" SkinID="ButtonViewIcon" CommandArgument='<%# Item.CodeMasterId %>'
                                    OnClick="btnView_Click"></Metronic:LinkButton>
                            </div>
                        </ItemTemplate>
                    </MAT:TemplateField>
                    <MAT:BoundField DataField="Desc" HeaderText="Name" SortExpression="Desc" />
                    <MAT:BoundField DataField="SeqNo" HeaderText="Sequence" SortExpression="SeqNo" />
                </Columns>
                <PagerStyle CssClass="m-datatable__pager" />
            </Metronic:GridView>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
