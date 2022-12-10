<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MAT.WebApp.App.Administration.Security.User.Add" %>

<%@ Register Src="~/Administration/Security/User/UserControl/ucDataAccessRight.ascx" TagName="DataAccessRight" TagPrefix="UserControl" %>
<%@ Register Src="~/Administration/Security/User/UserControl/ucActiveDirectoryUser.ascx" TagName="ActiveDirectoryUser" TagPrefix="UserControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Create" CommandName="Insert"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" CausesValidation="false" OnClick="btnBack_Click"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="EmployeeId" DefaultMode="Insert" ItemType="MAT.App.Employee.EmployeeInsertViewModel"
        InsertMethod="fvParent_InsertItem" OnItemCreated="fvParent_ItemCreated">
        <InsertItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <span class="m-portlet__head-icon m--hide">
                                <i class="la la-gear"></i>
                            </span>
                            <h3 class="m-portlet__head-text">
                                <MAT:Literal runat="server" Text="LoginInfo"></MAT:Literal>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="AuthenticationType" AssociatedControlID="AuthenticationType" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="AuthenticationType" ID="AuthenticationType" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Username" AssociatedControlID="Username" />
                                <div class="col-sm-7">
                                    <Metronic:TextBox ID="Username" runat="server" MaxLength="200" Text='<%# Bind("Username") %>' Mandatory="true"></Metronic:TextBox>
                                    <span class="input-group-addon" id="span1" runat="server" visible="false">
                                        <MAT:LinkButton ID="spanADButton" runat="server" FrontIconCss="ace-icon fa fa-users bigger-130"
                                            FunctionAccessControlCode="View" OnClick="btnADUser_Click" CausesValidation="false"></MAT:LinkButton>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label2" runat="server" SkinID="FormLabel" Text="UserRole" AssociatedControlID="UserRole" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="RoleId" ID="UserRole" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group" runat="server" id="divPassword">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Password" AssociatedControlID="Password" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Password" ID="Password" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group" runat="server" id="divConfirmPassword">
                                <MAT:Label ID="Label1" runat="server" SkinID="FormLabel" Text="ConfirmPassword" AssociatedControlID="ConfirmPassword" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="ConfirmPassword" ID="ConfirmPassword" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <span class="m-portlet__head-icon m--hide">
                                <i class="la la-gear"></i>
                            </span>
                            <h3 class="m-portlet__head-text">
                                <MAT:Literal runat="server" Text="EmployeeInfo"></MAT:Literal>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="FirstName" AssociatedControlID="FirstName" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="FirstName" ID="FirstName" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="LastName" AssociatedControlID="LastName" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="LastName" ID="LastName" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="EmployeeNo" AssociatedControlID="EmployeeNo" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="EmployeeNo" ID="EmployeeNo" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="JoinedDate" AssociatedControlID="JoinedDate" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="JoinedDate" ID="JoinedDate" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="ResignationDate" AssociatedControlID="ResignationDate" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="ResignationDate" ID="ResignationDate" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Email" AssociatedControlID="Email" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Email" ID="Email" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="MobilePhone" AssociatedControlID="MobilePhone" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="MobilePhone" ID="MobilePhone" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mat-form-group">
                                <MAT:Label ID="Label7" runat="server" SkinID="FormLabel" Text="ProfileImage" AssociatedControlID="avtProfileImage" />
                                <div class="col-sm-7">
                                    <Metronic:Avatar ID="avtProfileImage" runat="server" DestinationPath="Upload//ProfileImage" Title="UploadLogo" ImagePath='<%# Bind("ProfileImagePath") %>' />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <span class="m-portlet__head-icon m--hide">
                                <i class="la la-gear"></i>
                            </span>
                            <h3 class="m-portlet__head-text">
                                <MAT:Literal runat="server" Text="JobInfo"></MAT:Literal>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Department" AssociatedControlID="Department" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="BelongsToEId" ID="Department" />
                                </div>
                            </div>
                            <%--  MultiSelection  --%>
                            <div class="form-group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="UserCategory" AssociatedControlID="ms_userCategory" />
                                <div class="col-sm-7">
                                    <Metronic:MultiSelect runat="server" ID="ms_userCategory" SelectMethod="UserCategory_Get"
                                        DataValueField="Key" DataTextField="Value" SelectedValues="<%# BindItem.UserCategoriesStr %>" ValidationGroup="EmploymentHistory">
                                    </Metronic:MultiSelect>
                                </div>
                            </div>

                            <div class="form-group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Supervisor" AssociatedControlID="Supervisor" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="SupervisorEmpId" ID="Supervisor" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="HolidayCalendar" AssociatedControlID="HolidayCalendar" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="HolidayCalendarId" ID="HolidayCalendar" />
                                </div>
                            </div>
                            <div class="form-group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Currency" AssociatedControlID="Currency" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="CurrencyId" ID="Currency" />
                                </div>
                            </div>
                            <div class="form-group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="CostCenter" AssociatedControlID="CostCenter" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="CostCenterCid" ID="CostCenter" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <span class="m-portlet__head-icon m--hide">
                                <i class="la la-gear"></i>
                            </span>
                            <h3 class="m-portlet__head-text">
                                <MAT:Literal runat="server" Text="Correspondence"></MAT:Literal>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Address" AssociatedControlID="Address1" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Address1" ID="Address1" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label5" runat="server" SkinID="FormLabel" AssociatedControlID="Address2" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Address2" ID="Address2" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label3" runat="server" SkinID="FormLabel" AssociatedControlID="Address3" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Address3" ID="Address3" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Postcode" AssociatedControlID="Postcode" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Postcode" ID="Postcode" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <MAT:CountryState ID="CountryState" runat="server" CurrentMode="Insert" AreaMasterId='<%# Bind("AreaMasterId") %>' />
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="City" AssociatedControlID="CityName" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="CityName" ID="CityName" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <span class="m-portlet__head-icon m--hide">
                                <i class="la la-gear"></i>
                            </span>
                            <h3 class="m-portlet__head-text">
                                <MAT:Literal runat="server" Text="PersonalInformation"></MAT:Literal>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">

                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="DateOfBirth" AssociatedControlID="cldDateOfBirth" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="DateOfBirth" ID="cldDateOfBirth" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="NationalID" AssociatedControlID="txtNationalID" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="ICNo" ID="txtNationalID" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="PassportNo" AssociatedControlID="txtPassportNo" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="PassportNo" ID="txtPassportNo" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Nationality" AssociatedControlID="ddlNationality" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="NationalityCID" ID="ddlNationality" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Gender" AssociatedControlID="ddlGender" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Gender" ID="ddlGender" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Race" AssociatedControlID="ddlRace" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="RaceCID" ID="ddlRace" />
                                </div>
                            </div>

                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="MaritalStatus" AssociatedControlID="ddlMaritalStatus" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="MaritalStatus" ID="ddlMaritalStatus" />
                                </div>
                            </div>

                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Religion" AssociatedControlID="ddlReligion" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="ReligionCID" ID="ddlReligion" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <UserControl:DataAccessRight ID="ucDataAccessRight" runat="server" AccessToEntityIdList='<%# Bind("AccessToEntityIdList") %>' />
            </div>
        </InsertItemTemplate>
    </MAT:FormView>
    <UserControl:ActiveDirectoryUser ID="ucActiveDirectoryUser" runat="server" OnUserSelected="ucActiveDirectoryUser_UserSelected" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
