<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Administration.SystemSetting.Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" AssociatedFormViewId="fvParent" CommandName="Update" FunctionAccessControlCode="Edit"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" CausesValidation="false" OnClick="btnBack_Click"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DefaultMode="Edit" ItemType="MAT.App.General.Parameter.SystemSetting.Scorecard.SystemSettingViewModel"
        UpdateMethod="fvParent_UpdateItem" SelectMethod="fvParent_GetItem" OnItemCommand="fvParent_ItemCommand" OnDataBound="fvParent_DataBound">
        <EditItemTemplate>
            <div class="m-portlet m-portlet--tabs">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-tools">
                        <ul class="nav nav-tabs m-tabs-line m-tabs-line--primary m-tabs-line--2x" role="tablist">
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link active show" data-toggle="tab" href="#m_tabs_6_1" role="tab" aria-selected="true">
                                    <i class="la la-cogs"></i>
                                    <MAT:Label ID="Label23" runat="server" Text="General"></MAT:Label>
                                </a>
                            </li>
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#m_tabs_6_2" role="tab" aria-selected="false">
                                    <i class="la la-lock"></i>
                                    <MAT:Label ID="Label21" runat="server" Text="Authentication"></MAT:Label>
                                </a>
                            </li>
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#m_tabs_6_3" role="tab" aria-selected="false">
                                    <i class="la la-key"></i>
                                    <MAT:Label ID="Label3" runat="server" Text="PasswordPolicy"></MAT:Label>
                                </a>
                            </li>
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#m_tabs_6_4" role="tab" aria-selected="false">
                                    <i class="la la-envelope"></i>
                                    <MAT:Label ID="Label4" runat="server" Text="SMTP"></MAT:Label>
                                </a>
                            </li>
                            <li class="nav-item m-tabs__item">
                                <a class="nav-link m-tabs__link" data-toggle="tab" href="#m_tabs_6_5" role="tab" aria-selected="false">
                                    <i class="la la-mobile"></i>
                                    <MAT:Label ID="Label28" runat="server" Text="SMS"></MAT:Label>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="m-portlet__body">
                    <div class="tab-content">
                        <div class="tab-pane active show" id="m_tabs_6_1" role="tabpanel">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label25" runat="server" SkinID="FormLabel" Text="DefaultLanguage" AssociatedControlID="DefaultLanguage" />

                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="DefaultLanguage" ID="DefaultLanguage" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group" runat="server" id="divCurrency">
                                        <MAT:Label ID="Label24" runat="server" SkinID="FormLabel" Text="DefaultCurrency" AssociatedControlID="ddl_DefaultCurrency" />

                                        <div class="col-sm-7">
                                            <Metronic:DropDownList ID="ddl_DefaultCurrency" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="ddl_DefaultCurrency_Get" CssClass="select2" Text='<%# Bind("DefaultCurrency") %>'></Metronic:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group" runat="server" id="divCalendar">
                                        <MAT:Label ID="Label26" runat="server" SkinID="FormLabel" Text="DefaultHolidayCalendar" AssociatedControlID="ddl_DefaultHolidayCalendar" />
                                        <div class="col-sm-7">
                                            <Metronic:DropDownList ID="ddl_DefaultHolidayCalendar" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="ddl_DefaultHolidayCalendar_Get" CssClass="select2" Text='<%# Bind("DefaultHolidayCalendar") %>'></Metronic:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label27" runat="server" SkinID="FormLabel" Text="AdministratorEmail" AssociatedControlID="AdministratorEmail" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="AdministratorEmail" ID="AdministratorEmail" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="m_tabs_6_2" role="tabpanel">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label18" runat="server" SkinID="FormLabel" Text="AuthenticationType" AssociatedControlID="rptAuthenticationType" />
                                        <div class="col-sm-7">
                                            <div class="m-checkbox-list">
                                                <asp:Repeater ID="rptAuthenticationType" runat="server" SelectMethod="AuthenticationType_Get">
                                                    <ItemTemplate>
                                                        <Metronic:CheckBox ID="chkAuthenticationType" runat="server" AccessKey='<%# Eval("Key") %>' Text='<%# Eval("Value") %>'></Metronic:CheckBox>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>
                                            <%--  <asp:CheckBoxList runat="server" Mode="Edit" DataField="AuthenticationType" ID="AuthenticationType"
                                                SelectMethod="AuthenticationType_Get" OnSelectedIndexChanged="AuthenticationType_SelectedIndexChanged" SkinID="Select2" />--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label19" runat="server" SkinID="FormLabel" Text="ActiveDirectoryDomain" AssociatedControlID="ActiveDirectoryDomain" />

                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="ActiveDirectoryDomain" ID="ActiveDirectoryDomain" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label20" runat="server" SkinID="FormLabel" Text="ActiveDirectoryUsername" AssociatedControlID="ActiveDirectoryUsername" />

                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="ActiveDirectoryUsername" ID="ActiveDirectoryUsername" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label22" runat="server" SkinID="FormLabel" Text="ActiveDirectoryPassword" AssociatedControlID="ActiveDirectoryPassword" />

                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="ActiveDirectoryPassword" ID="ActiveDirectoryPassword" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="m_tabs_6_3" role="tabpanel">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label1" runat="server" SkinID="FormLabel" Text="PasswordAge" AssociatedControlID="PasswordAge" />

                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="PasswordAge" ID="PasswordAge" />
                                        </div>
                                    </div>

                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label5" runat="server" SkinID="FormLabel" Text="MinimumPasswordLength" AssociatedControlID="MinimumPasswordLength" />

                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="MinimumPasswordLength" ID="MinimumPasswordLength" />
                                        </div>
                                    </div>

                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label6" runat="server" SkinID="FormLabel" Text="MinimumUpperCaseLetters" AssociatedControlID="MinimumUpperCaseLetters" />

                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="MinimumUpperCaseLetters" ID="MinimumUpperCaseLetters" />
                                        </div>
                                    </div>

                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label13" runat="server" SkinID="FormLabel" Text="MinimumLowerCaseLetters" AssociatedControlID="MinimumLowerCaseLetters" />

                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="MinimumLowerCaseLetters" ID="MinimumLowerCaseLetters" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label14" runat="server" SkinID="FormLabel" Text="MinimumNumerals" AssociatedControlID="MinimumNumerals" />

                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="MinimumNumerals" ID="MinimumNumerals" />
                                        </div>
                                    </div>

                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label15" runat="server" SkinID="FormLabel" Text="MinimumSpecialCharacters" AssociatedControlID="MinimumSpecialCharacters" />

                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="MinimumSpecialCharacters" ID="MinimumSpecialCharacters" />
                                        </div>
                                    </div>

                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label16" runat="server" SkinID="FormLabel" Text="NumberOfPasswordHistory" AssociatedControlID="NumberOfPasswordHistory" />

                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="NumberOfPasswordHistory" ID="NumberOfPasswordHistory" />
                                        </div>
                                    </div>

                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label17" runat="server" SkinID="FormLabel" Text="AccountLockoutThreshold" AssociatedControlID="AccountLockoutThreshold" />

                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="AccountLockoutThreshold" ID="AccountLockoutThreshold" />
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="m_tabs_6_4" role="tabpanel">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label7" runat="server" SkinID="FormLabel" Text="SenderName" AssociatedControlID="SenderName" />

                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="SenderName" ID="SenderName" />
                                        </div>
                                    </div>

                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label8" runat="server" SkinID="FormLabel" Text="EmailAddress" AssociatedControlID="EmailAddress" />

                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="EmailAddress" ID="EmailAddress" />
                                        </div>
                                    </div>

                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label9" runat="server" SkinID="FormLabel" Text="EmailServer" AssociatedControlID="EmailServer" />

                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="EmailServer" ID="EmailServer" />
                                        </div>
                                    </div>

                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label10" runat="server" SkinID="FormLabel" Text="OutgoingPortNo" AssociatedControlID="OutgoingPortNo" />

                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="OutgoingPortNo" ID="OutgoingPortNo" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="EnableSsl" AssociatedControlID="EnableSsl" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="EnableSsl" ID="EnableSsl" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label11" runat="server" SkinID="FormLabel" Text="UserName" AssociatedControlID="UserName" />

                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="UserName" ID="UserName" />
                                        </div>
                                    </div>

                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label12" runat="server" SkinID="FormLabel" Text="Password" AssociatedControlID="Password" />

                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="Password" ID="Password" />
                                        </div>
                                    </div>

                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label2" runat="server" SkinID="FormLabel" Text="TestEmail" AssociatedControlID="TestEmail" />

                                        <div class="col-sm-7">
                                            <div class="input-group">
                                                <asp:TextBox ID="TestEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                                <Metronic:LinkButton ID="btnSendTestEmail" runat="server" Text="Send" CssClass="btn btn-primary btn-sm m-btn  m-btn m-btn--icon" FrontIconCss="fa fa-envelope padding_right_1"
                                                    CommandName="SendTestEmail" />
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>

                        <div class="tab-pane" id="m_tabs_6_5" role="tabpanel">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Username" AssociatedControlID="SmsUsername" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="SmsUsername" ID="SmsUsername" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Password" AssociatedControlID="SmsPassword" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="SmsPassword" ID="SmsPassword" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Keyword" AssociatedControlID="SmsKeyword" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="SmsKeyword" ID="SmsKeyword" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Smsid" AssociatedControlID="Smsid" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="Smsid" ID="Smsid" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Shortcode" AssociatedControlID="SmsShortcode" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="SmsShortcode" ID="SmsShortcode" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="ServiceType" AssociatedControlID="SmsServiceType" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="SmsServiceType" ID="SmsServiceType" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="EndPoint" AssociatedControlID="SmsEndPoint" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" Mode="Edit" DataField="SmsEndPoint" ID="SmsEndPoint" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </EditItemTemplate>
    </MAT:FormView>

    <%--use to keep tab index--%>
    <asp:HiddenField ID="TabIndex" runat="server" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
    <script>
        function setTabIndex(value) {
            $('#<%= TabIndex.ClientID %>').val(value);
        }

        $('#myTabs a').click(function (e) {
            e.preventDefault();
            setTabIndex($(this).attr('href'));
        })

        // set startup tab
        $('#myTabs a[href="<%= TabIndex.Value %>"]').tab('show');
    </script>
</asp:Content>
