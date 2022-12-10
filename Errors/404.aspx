<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="MAT.WebApp.App.Errors._404" %>

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
                            <i class="ace-icon fa fa-sitemap"></i>
                            404
                        </span>
                        Page Not Found
                    </h1>

                    <hr />
                    <h3 class="lighter smaller">We looked everywhere but we couldn't find it!</h3>

                    <div>
                        <div class="space"></div>
                        <h4 class="smaller">Try one of the following:</h4>

                        <ul class="list-unstyled spaced inline bigger-110 margin-15">
                            <li>
                                <i class="ace-icon fa fa-hand-o-right blue"></i>
                                Re-check the url for typos
                            </li>
                            <li>
                                <i class="ace-icon fa fa-hand-o-right blue"></i>
                                Contact adminstrator for assistance 
                            </li>
                        </ul>
                    </div>

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
