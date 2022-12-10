<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Administration.Member.View" %>

<%@ Register Src="~/Administration/General/AreaMaster/UserControl/CountryState.ascx" TagPrefix="UserControl" TagName="CountryState" %>
<%@ Register Src="~/Administration/UserControl/ucDataInformation.ascx" TagPrefix="UserControl" TagName="ucDataInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton runat="server" ID="btnEdit" SkinID="ButtonEdit" FunctionAccessControlCode="Edit"></Metronic:LinkButton>
    <Metronic:FormViewButton runat="server" ID="btnDelete" SkinID="ButtonDelete" CommandName="Delete" AssociatedFormViewId="fvParent"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" CausesValidation="false" SkinID="ButtonBack" PostBackUrl="Index.aspx"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DataKeyNames="MemberId" DefaultMode="ReadOnly"
        ItemType="MAT.App.Scorecard.Scorecard.Administration.Member.MemberViewModel" SelectMethod="fvParent_SelectItem" DeleteMethod="fvParent_DeleteItem">
        <ItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Salutation" AssociatedControlID="Salutation"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:MultiSelect runat="server" ID="Salutation" SelectMethod="msSalutation_Get" DataTextField="Value" DataValueField="Key"
                                        SelectedValues='<%# msSelectedItem_Get(Item.MemberId) %>' Visible="false">
                                    </Metronic:MultiSelect>
                                    <MAT:Label runat="server" ID="lblSalutation" SkinID="FormValue"></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" SkinID="FormValue" ID="Name" Text='<%# Item.PersonName %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Organization" AssociatedControlID="Organization"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="Organization" SelectMethod="Organization_Get" DataValueField="Key" DataTextField="Value"
                                        Text='<%# Item.OrganizationEId %>' Visible="false">
                                    </Metronic:DropDownList>
                                    <MAT:Label runat="server" ID="lblOrganization" SkinID="FormValue"></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Status" AssociatedControlID="Status"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="Status" SelectMethod="Status_Get" DataValueField="Key" DataTextField="Value"
                                        Text='<%# Item.Status %>' Visible="false">
                                    </Metronic:DropDownList>
                                    <MAT:Label runat="server" ID="lblStatus" SkinID="FormValue"></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Position" AssociatedControlID="Position"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="Position" SkinID="FormValue" Text='<%# Item.Position %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="EmailAddress" AssociatedControlID="EmailAddress"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="EmailAddress" SkinID="FormValue" Text='<%# Item.Email %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="BusinessPhone" AssociatedControlID="BusinessPhone"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="BusinessPhone" SkinID="FormValue" Text='<%# Item.BusinessPhone %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="MobilePhone" AssociatedControlID="MobilePhone"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="MobilePhone" SkinID="FormValue" Text='<%# Item.MobilePhone %>'></MAT:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="FaxNo" AssociatedControlID="FaxNo"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="FaxNo" SkinID="FormValue" Text='<%# Item.BusinessFax %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="MailingAddress" AssociatedControlID="Address1"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="Address1" SkinID="FormValue" Text='<%# Item.Address1 %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel">&nbsp;</MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="Address2" SkinID="FormValue" Text='<%# Item.Address2 %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel">&nbsp;</MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="Address3" SkinID="FormValue" Text='<%# Item.Address3 %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Postcode" AssociatedControlID="Postcode"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="Postcode" SkinID="FormValue" Text='<%# Item.PostCode %>'></MAT:Label>
                                </div>
                            </div>
                            <UserControl:CountryState runat="server" ID="CountryState" CurrentMode="ReadOnly" AreaMasterId='<%# Item.AreaMasterId %>' />

                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="User" AssociatedControlID="ddlUser"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="ddlUser" SelectMethod="User_Get" DataTextField="Value" DataValueField="Key" SelectedValue="<%# BindItem.UserId %>" Enabled="false" Visible="false">
                                    </Metronic:DropDownList>
                                    <MAT:Label runat="server" ID="lblUser" SkinID="FormValue"></MAT:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="m-portlet">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <h3 class="m-portlet__head-text">
                                <MAT:Literal runat="server" Text="ContactPerson"></MAT:Literal>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="ContactPerson" AssociatedControlID="ContactPerson"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="ContactPerson" SkinID="FormValue" Text='<%# Item.ContactName %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="EmailAddress" AssociatedControlID="EmailAddress_ContactPerson"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="EmailAddress_ContactPerson" SkinID="FormValue" Text='<%# Item.ContactEmail %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="BusinessPhone" AssociatedControlID="BusinessPhone_ContactPerson"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="BusinessPhone_ContactPerson" SkinID="FormValue" Text='<%# Item.ContactBusinessPhone %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="MobilePhone" AssociatedControlID="MobilePhone_ContactPerson"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="MobilePhone_ContactPerson" SkinID="FormValue" Text='<%# Item.ContactMobilePhone %>'></MAT:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="MailingAddress" AssociatedControlID="ContactAddress1"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="ContactAddress1" SkinID="FormValue" Text='<%# Item.ContactAddress1 %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel">&nbsp;</MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="ContactAddress2" SkinID="FormValue" Text='<%# Item.ContactAddress2 %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel">&nbsp;</MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="ContactAddress3" SkinID="FormValue" Text='<%# Item.ContactAddress3 %>'></MAT:Label>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Postcode" AssociatedControlID="ContactPostCode"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" ID="ContactPostCode" SkinID="FormValue" Text='<%# Item.ContactPostCode %>'></MAT:Label>
                                </div>
                            </div>
                            <UserControl:CountryState runat="server" ID="ContactCountryState" CurrentMode="ReadOnly" AreaMasterId='<%# Item.ContactAreaMasterId %>' />
                        </div>
                    </div>
                </div>
            </div>
            <UserControl:ucDataInformation runat="server" id="ucDataInformation" TableName="Member" PrimaryKeyName="MemberId" PrimaryKeyValue='<%# Item.MemberId %>' />
        </ItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
