<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Administration.General.Currency.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-portlet">
        <div class="m-portlet__body">
            <asp:UpdatePanel ID="upParent" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="GridView1" AddNavigateUrl="Add.aspx">
                        <SearchTemplate>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="CurrencyCode" Text="CurrencyCode" />
                                        <div class="col-sm-7">
                                            <Metronic:TextBox runat="server" ID="CurrencyCode"></Metronic:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="CurrencyName" Text="CurrencyName" />
                                        <div class="col-sm-7">
                                            <Metronic:TextBox ID="CurrencyName" runat="server"></Metronic:TextBox>
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
                        <Metronic:GridView ID="GridView1" runat="server" ItemType="MAT.App.General.Currency.CurrencyViewModel" DataKeyNames="CurrencyId" SelectMethod="GridView1_GetData">
                            <Columns>
                                <MAT:TemplateField ItemStyle-Width="20px">
                                    <ItemTemplate>
                                        <div class="action-buttons">
                                            <MAT:HyperLink ID="LinkButton3" runat="server" CssClass="blue" FrontIconCss="ace-icon fa fa-search-plus bigger-130"
                                                FunctionAccessControlCode="View" NavigateUrl='<%# string.Format("View.aspx?id={0}", Item.CurrencyId) %>'></MAT:HyperLink>
                                        </div>
                                    </ItemTemplate>
                                </MAT:TemplateField>
                                <MAT:BoundField DataField="CurrencyCode" HeaderText="Code" SortExpression="CurrencyCode" />
                                <MAT:BoundField DataField="CurrencyName" HeaderText="Name" SortExpression="CurrencyName" />
                            </Columns>
                            <PagerStyle CssClass="m-datatable__pager" />
                        </Metronic:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
