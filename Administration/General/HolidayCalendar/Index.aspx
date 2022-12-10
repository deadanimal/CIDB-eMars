<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Administration.General.HolidayCalendar.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-portlet">
        <div class="m-portlet__body">
            <asp:UpdatePanel ID="upParent" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="GridView1" AddNavigateUrl="Add.aspx">
                        <SearchTemplate>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label3" runat="server" SkinID="FormLabel" AssociatedControlID="Name" Text="Name" />
                                        <div class="col-sm-7">
                                            <Metronic:TextBox ID="Name" runat="server" SkinID="DefaultTextBox"></Metronic:TextBox>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label2" runat="server" SkinID="FormLabel" AssociatedControlID="Description" Text="Description" />
                                        <div class="col-sm-7">
                                            <Metronic:TextBox ID="Description" runat="server" SkinID="DefaultTextBox"></Metronic:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <div class="col-sm-12">
                                            <div class="pull-right">
                                                <Metronic:LinkButton ID="btnSearch" runat="server" SkinID="ButtonSearch" CausesValidation="false" OnClick="btnSearch_Click"></Metronic:LinkButton>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </SearchTemplate>
                    </Metronic:SearchPanel>

                    <div class="table-responsive">
                        <Metronic:GridView ID="GridView1" runat="server" ItemType="MAT.App.General.HolidayCalendar.HolidayCalendarViewModel" DataKeyNames="HolidayCalendarId"
                            SelectMethod="GridView1_Get" AutoGenerateColumns="false">
                            <Columns>
                                <MAT:TemplateField>
                                    <ItemTemplate>

                                        <div class="action-buttons">
                                            <MAT:HyperLink ID="HyperLink1" runat="server" CssClass="blue" FrontIconCss="ace-icon fa fa-search-plus bigger-130"
                                                FunctionAccessControlCode="Edit" NavigateUrl='<%# string.Format("View.aspx?id={0}", Item.HolidayCalendarId) %>'></MAT:HyperLink>
                                        </div>

                                    </ItemTemplate>
                                </MAT:TemplateField>
                                <MAT:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <MAT:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />

                            </Columns>
                            <PagerStyle CssClass="m-datatable__pager" />

                        </Metronic:GridView>

                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
