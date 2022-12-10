<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.Administration.Security.User.View" %>

<%@ Register Src="~/Administration/Security/User/UserControl/ucDataAccessRight.ascx" TagName="DataAccessRight" TagPrefix="UserControl" %>
<%@ Register Src="~/Administration/Security/User/UserControl/ucEmployeeEmploymentHistory.ascx" TagName="EmployeeEmploymentHistory" TagPrefix="UserControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton ID="btnEdit" runat="server" SkinID="ButtonEdit" FunctionAccessControlCode="Edit" OnClick="btnEdit_Click"></Metronic:LinkButton>
    <Metronic:FormViewButton runat="server" ID="btnDelete" SkinID="ButtonDelete" FunctionAccessControlCode="Delete" 
        AssociatedFormViewId="fvParent" CommandName="Delete"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" OnClick="btnBack_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="EmployeeId" DefaultMode="ReadOnly" ItemType="MAT.App.Employee.EmployeeViewModel"
        SelectMethod="fvParent_GetItem" DeleteMethod="fvParent_DeleteItem">
        <ItemTemplate>
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
                                <MAT:Label ID="Label6" runat="server" SkinID="FormLabel" Text="AuthenticationType" AssociatedControlID="AuthenticationType" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="AuthenticationTypeView" ID="AuthenticationType" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label2" runat="server" SkinID="FormLabel" Text="Username" AssociatedControlID="Username" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Username" ID="Username" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group" runat="server" id="divConfirmPassword">
                                <MAT:Label ID="Label4" runat="server" SkinID="FormLabel" Text="Status" AssociatedControlID="Status" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="UserStatus" ID="Status" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label1" runat="server" SkinID="FormLabel" Text="UserRole" AssociatedControlID="UserRole" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="RoleId" ID="UserRole" />
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
                                <MAT:Label ID="Label5" runat="server" SkinID="FormLabel" Text="FirstName" AssociatedControlID="FirstName" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="FirstName" ID="FirstName" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="LastName" AssociatedControlID="LastName" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="LastName" ID="LastName" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="EmployeeNo" AssociatedControlID="EmployeeNo" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="EmployeeNo" ID="EmployeeNo" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="JoinedDate" AssociatedControlID="JoinedDate" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="JoinedDate" ID="JoinedDate" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="ResignationDate" AssociatedControlID="ResignationDate" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="ResignationDate" ID="ResignationDate" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Email" AssociatedControlID="Email" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Email" ID="Email" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="MobilePhone" AssociatedControlID="MobilePhone" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="MobilePhone" ID="MobilePhone" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label7" runat="server" SkinID="FormLabel" Text="ProfileImage" AssociatedControlID="avtProfileImage" />
                                <div class="col-sm-7">
                                    <Metronic:Avatar ID="avtProfileImage" runat="server" DestinationPath="Upload//ProfileImage" ReadOnly="true" Title="UploadLogo"
                                        ImagePath='<%# Eval("ProfileImagePath") %>' />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <UserControl:EmployeeEmploymentHistory ID="ucEmployeeEmploymentHistory" runat="server" Value='<%# Eval("EmploymentHistories") %>' ReadOnly="true" />
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
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Address1" ID="Address1" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label3" runat="server" SkinID="FormLabel" AssociatedControlID="Address2" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Address2" ID="Address2" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label8" runat="server" SkinID="FormLabel" AssociatedControlID="Address3" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Address3" ID="Address3" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Postcode" AssociatedControlID="Postcode" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Postcode" ID="Postcode" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <MAT:CountryState ID="CountryState" runat="server" CurrentMode="ReadOnly" AreaMasterId='<%# Bind("AreaMasterId") %>' />
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="City" AssociatedControlID="CityName" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="CityName" ID="CityName" />
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
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="DateOfBirth" ID="cldDateOfBirth" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="NationalID" AssociatedControlID="txtNationalID" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="ICNo" ID="txtNationalID" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="PassportNo" AssociatedControlID="txtPassportNo" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="PassportNo" ID="txtPassportNo" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Nationality" AssociatedControlID="ddlNationality" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="NationalityCID" ID="ddlNationality" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Gender" AssociatedControlID="ddlGender" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Gender" ID="ddlGender" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Race" AssociatedControlID="ddlRace" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="RaceCID" ID="ddlRace" />
                                </div>
                            </div>

                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="MaritalStatus" AssociatedControlID="ddlMaritalStatus" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="MaritalStatus" ID="ddlMaritalStatus" />
                                </div>
                            </div>

                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Religion" AssociatedControlID="ddlReligion" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="ReligionCID" ID="ddlReligion" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <UserControl:DataAccessRight ID="ucDataAccessRight" runat="server" AccessToEntityIdList='<%# Eval("AccessToEntityIdList") %>' />
                <MAT:DataInformation runat="server" TableName="[User]" PrimaryKeyName="UserId" PrimaryKeyValue='<%# Eval("UserId") %>' />
            </div>
        </ItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
