<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccessDenied.aspx.cs" Inherits="MAT.WebApp.App.Errors.AccessDenied" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- /section:settings.box -->
    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->

            <!-- #section:pages/error -->
            <div class="error-container">
                <div class="well">
                    <h1 class="grey lighter smaller">
                        <span class="blue bigger-125">
                            <i class="ace-icon fa fa-ban"></i>
                        </span>
                        Access Denied
                    </h1>

                    <hr />
                    <h3 class="lighter smaller">You are not allowed to access this part of the application. Contact adminstrator for assistance.</h3>

                    <hr />
                    <div class="space"></div>

                    <div class="center">
                        <MAT:LinkButton ID="btnBack" runat="server" OnClientClick="javascript:history.back();return false;" SkinID="ButtonBack" CausesValidation="false"></MAT:LinkButton>
                        <MAT:HyperLink ID="btnDashboard" runat="server" NavigateUrl="~/Default.aspx" SkinID="ButtonDashboard"></MAT:HyperLink>
                    </div>
                </div>
            </div>

            <!-- /section:pages/error -->

            <!-- PAGE CONTENT ENDS -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
