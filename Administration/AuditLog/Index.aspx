<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Administration.AuditLog.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-portlet">
        <div class="m-portlet__body">
            <asp:UpdatePanel ID="upParent" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="GridView1" ShowAddButton="false">
                        <SearchTemplate>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="txt_DateFrom" Text="Date" />
                                        <div class="col-sm-7">
                                            <div class="input-daterange input-group">
                                                <Metronic:TextBox ID="txt_DateFrom" runat="server" name="start"></Metronic:TextBox>
                                                <div class="input-group-append">
                                                    <span class="input-group-text">
                                                        <i class="la la-ellipsis-h"></i>
                                                    </span>
                                                </div>
                                                <Metronic:TextBox ID="txt_DateTo" runat="server" name="end"></Metronic:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="ddl_Action" Text="Action" />
                                        <div class="col-sm-7">
                                            <Metronic:DropDownList ID="ddl_Action" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="Action_Get" CssClass="select2"></Metronic:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="txtUser" Text="User" />
                                        <div class="col-sm-7">
                                            <Metronic:TextBox ID="txtUser" runat="server"></Metronic:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="ddlModule" Text="Module" />
                                        <div class="col-sm-7">
                                            <Metronic:DropDownList ID="ddlModule" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="Module_Get"></Metronic:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="txt_KeyWord" Text="Keyword" />
                                        <div class="col-sm-7">
                                            <Metronic:TextBox ID="txt_KeyWord" runat="server"></Metronic:TextBox>
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
                        <Metronic:GridView ID="GridView1" runat="server" ItemType="MAT.App.AuditLog.AuditLogViewModel" DataKeyNames="AuditLogId"
                            SelectMethod="GridView1_Get" AutoGenerateColumns="false">
                            <Columns>
                                <MAT:TemplateField ItemStyle-Width="20px">
                                    <ItemTemplate>
                                        <div class="action-buttons">
                                            <MAT:HyperLink ID="HyperLink1" runat="server" CssClass="blue" FrontIconCss="ace-icon fa fa-search-plus bigger-130"
                                                NavigateUrl='<%# string.Format("View.aspx?id={0}", Item.AuditLogId) %>'></MAT:HyperLink>
                                        </div>
                                    </ItemTemplate>
                                </MAT:TemplateField>
                                <MAT:BoundField DataField="CreatedDate" HeaderText="Date" SortExpression="CreatedDate" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
                                <MAT:BoundField DataField="UserName" HeaderText="User" SortExpression="UserName" />
                                <MAT:TemplateField HeaderText="Module" SortExpression="FunctionName">
                                    <ItemTemplate>
                                        <%# MAT.Helper.Resource.GetResourceText(Eval("FunctionName").ToString()) %>
                                    </ItemTemplate>
                                </MAT:TemplateField>
                                <MAT:BoundField DataField="AuditAction" HeaderText="Action" SortExpression="AuditAction" />
                                <MAT:BoundField DataField="Keywords" HeaderText="Keyword" SortExpression="Keywords" />
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
