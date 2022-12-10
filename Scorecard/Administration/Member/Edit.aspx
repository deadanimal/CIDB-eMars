<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Administration.Member.Edit" %>

<%@ Register Src="~/Administration/General/AreaMaster/UserControl/CountryState.ascx" TagPrefix="UserControl" TagName="CountryState" %>
<%@ Register Src="~/Administration/UserControl/ucDataInformation.ascx" TagPrefix="UserControl" TagName="ucDataInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave" CommandName="Update" AssociatedFormViewId="fvParent"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnCancel" SkinID="ButtonFreeText" Text="Cancel"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DataKeyNames="MemberId" DefaultMode="Edit" ItemType="MAT.App.Scorecard.Scorecard.Administration.Member.MemberViewModel"
        SelectMethod="fvParent_SelectItem" UpdateMethod="fvParent_UpdateItem">
        <EditItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Salutation" AssociatedControlID="Salutation"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:MultiSelect runat="server" ID="Salutation" SelectMethod="msSalutation_Get" DataTextField="Value" DataValueField="Key" SelectedValues='<%# msSelectedItem_Get(Item.MemberId) %>'></Metronic:MultiSelect>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Name" Text='<%# BindItem.PersonName %>' Mandatory="true"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Organization" AssociatedControlID="Organization"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="Organization" SelectMethod="Organization_Get" DataValueField="Key" DataTextField="Value" Mandatory="true" Text='<%# BindItem.OrganizationEId %>'></Metronic:DropDownList>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Status" AssociatedControlID="Status"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="Status" SelectMethod="Status_Get" DataValueField="Key" DataTextField="Value" Text='<%# BindItem.Status %>'></Metronic:DropDownList>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Position" AssociatedControlID="Position"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Position" Text='<%# BindItem.Position %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="EmailAddress" AssociatedControlID="EmailAddress"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="EmailAddress" Text='<%# BindItem.Email %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="BusinessPhone" AssociatedControlID="BusinessPhone"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="BusinessPhone" Text='<%# BindItem.BusinessPhone %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="MobilePhone" AssociatedControlID="MobilePhone"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="MobilePhone" Text='<%# BindItem.MobilePhone %>'></Metronic:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="FaxNo" AssociatedControlID="FaxNo"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="FaxNo" Text='<%# BindItem.BusinessFax %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="MailingAddress" AssociatedControlID="Address1"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Address1" Text='<%# BindItem.Address1 %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text=""></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Address2" Text='<%# BindItem.Address2 %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text=""></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Address3" Text='<%# BindItem.Address3 %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Postcode" AssociatedControlID="Postcode"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Postcode" Text='<%# BindItem.PostCode %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <UserControl:CountryState runat="server" ID="CountryState" CurrentMode="Edit" AreaMasterId='<%# BindItem.AreaMasterId %>' />

                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="User" AssociatedControlID="ddlUser"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="ddlUser" SelectMethod="User_Get" DataTextField="Value" DataValueField="Key" SelectedValue="<%# BindItem.UserId %>">
                                    </Metronic:DropDownList>
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
                                    <Metronic:TextBox runat="server" ID="ContactPerson" Text='<%# BindItem.ContactName %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="EmailAddress" AssociatedControlID="EmailAddress_ContactPerson"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="EmailAddress_ContactPerson" Text='<%# BindItem.ContactEmail %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="BusinessPhone" AssociatedControlID="BusinessPhone_ContactPerson"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="BusinessPhone_ContactPerson" Text='<%# BindItem.ContactBusinessPhone %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="MobilePhone" AssociatedControlID="MobilePhone_ContactPerson"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="MobilePhone_ContactPerson" Text='<%# BindItem.ContactMobilePhone %>'></Metronic:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="MailingAddress" AssociatedControlID="ContactAddress1"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="ContactAddress1" Text='<%# BindItem.ContactAddress1 %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text=""></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="ContactAddress2" Text='<%# BindItem.ContactAddress2 %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text=""></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="ContactAddress3" Text='<%# BindItem.ContactAddress3 %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Postcode" AssociatedControlID="ContactPostCode"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="ContactPostCode" Text='<%# BindItem.ContactPostCode %>'></Metronic:TextBox>
                                </div>
                            </div>
                            <UserControl:CountryState runat="server" ID="ContactCountryState" CurrentMode="Edit" AreaMasterId='<%# BindItem.ContactAreaMasterId %>' />
                        </div>
                    </div>
                </div>
            </div>
            <UserControl:ucDataInformation runat="server" id="ucDataInformation" TableName="Member" PrimaryKeyName="MemberId" PrimaryKeyValue='<%# Item.MemberId %>' />
        </EditItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
