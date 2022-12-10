<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MAT.WebApp.App.Authentication.Login" %>

<%@ Register Assembly="MAT.Ace" Namespace="MAT.Ace.UIElements" TagPrefix="cc1" %>

<!DOCTYPE html>

<html lang="en">
<!-- begin::Head -->
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title><%: MAT.AppSettings.ApplicationName %></title>

    <!--begin::Base Styles -->
    <webopt:BundleReference runat="server" Path="~/styleBundle" />
    <!--end::Base Styles -->
    <%--<link rel="shortcut icon" href="assets/mat/media/img/logo/favicon.ico" />--%>
</head>
<!-- end::Head -->
<!-- end::Body -->
<body class="m--skin- m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
    <div class="m-grid m-grid--hor m-grid--root m-page">
        <div class="m-grid__item m-grid__item--fluid m-grid m-grid--hor m-login m-login--signin m-login--2 m-login-2--skin-1" id="m_login" style='background-image: url(<%= this.ResolveUrl("~/assets/app/media/img//bg/bg-2.jpg")%>);'>
            <div class="m-grid__item m-grid__item--fluid m-login__wrapper">
                <div class="m-login__container">
                    <div class="m-login__logo">
                        <a href="#">
                            <img src='<%= this.ResolveUrl("~/assets/mat/media/img/logo/CIDB-logo.png")%>'>
                        </a>
                    </div>
                    <form id="form1" runat="server" class="m-login__form m-form">
                        <asp:ScriptManager runat="server">
                            <Scripts>
                                <%--To learn more about bundling scripts in ScriptManager see http://go.microsoft.com/fwlink/?LinkID=301884 --%>
                                <%--Framework Scripts--%>
                                <asp:ScriptReference Name="jquery" />
                                <asp:ScriptReference Name="WebFormsBundle" />
                                <%--Site Scripts--%>
                            </Scripts>
                        </asp:ScriptManager>
                        <asp:UpdatePanel ID="upLogin" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Panel runat="server" DefaultButton="btnLogin">
                                    <div class="m-login__signin">
                                        <div class="m-login__head">
                                            <h3 class="m-login__title" style="color: white;"><%: MAT.AppSettings.ApplicationName %>
                                            </h3>
                                        </div>
                                        <Metronic:Alert runat="server" ID="loginAlert"></Metronic:Alert>
                                        <div class="form-group m-form__group">
                                            <Metronic:TextBox ID="UserName" runat="server" placeholder="Username" Mandatory="true"
                                                Style="background-color: transparent; border: solid; border-width: 1px; border-color: lightgray; color: white;"
                                                ValidationGroup="Login"></Metronic:TextBox>
                                        </div>
                                        <div class="form-group m-form__group">
                                            <Metronic:TextBox ID="Password" runat="server" placeholder="Password" Mandatory="true" TextMode="Password"
                                                Style="background-color: transparent; border: solid; border-width: 1px; border-color: lightgray; color: white;"
                                                ValidationGroup="Login"></Metronic:TextBox>
                                        </div>
                                        <div class="row m-login__form-sub">
                                            <div class="col m--align-right m-login__form-right">
                                                <a href="javascript:;" id="m_login_forget_password" class="m-link" style="color: white;">Forgot Password ?
                                                </a>
                                            </div>
                                        </div>
                                        <div class="m-login__form-action">
                                            <Metronic:LinkButton ID="btnLogin" runat="server" Text="Login" CssClass="btn m-btn m-btn--pill m-btn--custom m-btn--air m-login__btn m-login__btn--primary"
                                                OnClick="btnLogin_Click" ValidationGroup="Login"></Metronic:LinkButton>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <asp:UpdatePanel ID="upForgotPassword" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Panel runat="server" DefaultButton="btnForgotPassword">
                                    <div class="m-login__forget-password">
                                        <div class="m-login__head">
                                            <h3 class="m-login__title"  style="color: gray;">Forgotten Password ?
                                            </h3>
                                            <div class="m-login__desc">
                                                Enter your username to reset your password:
                                            </div>
                                        </div>
                                        <Metronic:Alert runat="server" ID="forgotPasswordAlert"></Metronic:Alert>
                                        <div class="form-group m-form__group">
                                            <Metronic:TextBox ID="UsernameFgt" runat="server" placeholder="Username" Mandatory="true" ValidationGroup="ForgotPassword"
                                                Style="background-color: transparent; border: solid; border-width: 1px; border-color: lightgray; color: black;"></Metronic:TextBox>
                                        </div>
                                        <div class="m-login__form-action">
                                            <Metronic:LinkButton ID="btnForgotPassword" runat="server" Text="Request" CssClass="btn m-btn m-btn--pill m-btn--custom m-btn--air m-login__btn m-login__btn--primary"
                                                OnClick="btnForgotPassword_Click" ValidationGroup="ForgotPassword"></Metronic:LinkButton>
                                            &nbsp;&nbsp;
                                        <Metronic:LinkButton ID="m_login_forget_password_cancel" runat="server" Text="Cancel" CssClass="btn m-btn m-btn--pill m-btn--custom m-btn--air m-login__btn"
                                            OnClick="btnForgotPassword_Click" CausesValidation="false" ShowLoader="false"></Metronic:LinkButton>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- end:: Page -->
    <!--begin::Base Scripts -->
    <%: Scripts.Render("~/bundles/metronic") %>
    <!--end::Base Scripts -->
    <!--begin::Page Snippets -->
    <%: Scripts.Render("~/bundles/login") %>
    <!--end::Page Snippets -->




    <%--        <div class="main-container">
            <div class="main-content">
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1">
                        <div class="login-container">
                            <div class="center">
                                <h2>
                                    <i class="ace-icon fa fa-leaf green"></i>
                                    <span class="red"><%: MAT.AppSettings.ApplicationName.Split(' ').FirstOrDefault() %></span>
                                    <span class="grey" id="id-text2"><%: string.Join(" ", MAT.AppSettings.ApplicationName.Split(' ').Skip(1)) %></span>
                                </h2>
                                <h4 class="blue" id="id-company-text">&copy; <%: MAT.AppSettings.CompanyName %></h4>
                            </div>

                            <div class="space-6"></div>

                            <div class="position-relative">
                                <asp:Panel ID="loginbox" runat="server" class="login-box visible widget-box no-border" DefaultButton="btnLogin">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <h4 class="header blue lighter bigger">
                                                <i class="ace-icon fa fa-coffee green"></i>
                                                <%: MAT.Resources.GlobalResource.PleaseEnterYourInformation %>
                                            </h4>

                                            <div class="space-6"></div>

                                            <fieldset>
                                                <div class="form-group">
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <asp:TextBox ID="UserName" runat="server" CssClass="form-control" placeholder="Username" ValidationGroup="Login"></asp:TextBox>
                                                            <i class="ace-icon fa fa-user"></i>
                                                        </span>
                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" Display="Dynamic" CssClass="text-danger" ErrorMessage="" ValidationGroup="Login" />
                                                    </label>
                                                </div>

                                                <div class="form-group">
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <asp:TextBox ID="Password" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password" ValidationGroup="Login"></asp:TextBox>
                                                            <i class="ace-icon fa fa-lock"></i>
                                                        </span>
                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" Display="None" CssClass="text-danger" ErrorMessage="" ValidationGroup="Login" />
                                                    </label>
                                                </div>

                                                <div class="space"></div>

                                                <div class="clearfix">
                                                    <label class="inline">
                                                        <input type="checkbox" class="ace" runat="server" id="RememberMe" />
                                                        <span class="lbl"><%: MAT.Resources.GlobalResource.RememberMe %></span>
                                                    </label>

                                                    <asp:LinkButton ID="btnLogin" runat="server" CssClass="width-35 pull-right btn btn-sm btn-primary" ValidationGroup="Login"
                                                        OnClick="btnLogin_Click"><i class="ace-icon fa fa-key"></i>
                                                        <span class="bigger-110"><%: MAT.Resources.GlobalResource.Login %></span></asp:LinkButton>
                                                </div>

                                                <div class="space-4"></div>

                                                <cc1:Alerts ID="Alerts1" runat="server" />
                                            </fieldset>

                                        </div>
                                        <!-- /.widget-main -->

                                        <div class="toolbar clearfix">
                                            <div>
                                                <a href="#" data-target="#forgotbox" class="forgot-password-link">
                                                    <i class="ace-icon fa fa-arrow-left"></i>
                                                    <%: MAT.Resources.GlobalResource.IForgotMyPassword %>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.widget-body -->
                                </asp:Panel>
                                <!-- /.login-box -->

                                <asp:Panel ID="forgotbox" runat="server" class="forgot-box widget-box no-border" DefaultButton="btnForgotPassword">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <h4 class="header red lighter bigger">
                                                <i class="ace-icon fa fa-key"></i>
                                                <%: MAT.Resources.GlobalResource.RetrievePassword %>
                                            </h4>

                                            <div class="space-6"></div>
                                            <p>
                                                <%: MAT.Resources.GlobalResource.EnterYourUsernameToReceiveInstructions %>
                                            </p>

                                            <fieldset>
                                                <div class="form-group">
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <asp:TextBox ID="UsernameFgt" runat="server" CssClass="form-control" placeholder="Username" ValidationGroup="ForgotPassword"></asp:TextBox>
                                                            <i class="ace-icon fa fa-user"></i>
                                                        </span>
                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="UsernameFgt" Display="None" CssClass="text-danger" ErrorMessage="" ValidationGroup="ForgotPassword" />
                                                    </label>
                                                </div>

                                                <div class="clearfix">
                                                    <asp:LinkButton ID="btnForgotPassword" runat="server" CssClass="width-35 pull-right btn btn-sm btn-danger" ValidationGroup="ForgotPassword"
                                                        OnClick="btnForgotPassword_Click"><i class="ace-icon fa fa-lightbulb-o"></i>
                                                        <span class="bigger-110"><%: MAT.Resources.GlobalResource.SendMe %>!</span></asp:LinkButton>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <!-- /.widget-main -->

                                        <div class="toolbar center">
                                            <a href="#" data-target="#loginbox" class="back-to-login-link"><%: MAT.Resources.GlobalResource.BackToLogin %>
                                                <i class="ace-icon fa fa-arrow-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- /.widget-body -->
                                </asp:Panel>
                                <!-- /.forgot-box -->

                            </div>
                            <!-- /.position-relative -->

                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.main-content -->
        </div>--%>

    <!-- /.main-container -->

    <!-- basic scripts -->

    <%--    <script type="text/javascript">
        if ('ontouchstart' in document.documentElement) document.write("<script src='<%= this.ResolveUrl("~/Scripts/jquery.mobile-1.4.5.min.js") %>'>" + "<" + "/script>");
    </script>--%>

    <!-- inline scripts related to this page -->
    <%-- <script type="text/javascript">
        jQuery(function ($) {
            $(document).on('click', '.toolbar a[data-target]', function (e) {
                e.preventDefault();
                var target = $(this).data('target');
                $('.widget-box.visible').removeClass('visible');//hide others
                $(target).addClass('visible');//show target
            });
        });

    </script>--%>
</body>
</html>
