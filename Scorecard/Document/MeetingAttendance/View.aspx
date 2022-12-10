<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Document.MeetingAttendance.View" %>

<%@ Register Src="~/Scorecard/UserControl/ucAttachment.ascx" TagPrefix="UserControl" TagName="ucAttachment" %>
<%@ Register Src="~/Administration/UserControl/ucDataInformation.ascx" TagPrefix="UserControl" TagName="ucDataInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton runat="server" ID="btnEdit" FunctionAccessControlCode="Edit" SkinID="ButtonEdit"></Metronic:LinkButton>
    <Metronic:FormViewButton runat="server" ID="btnDelete" CommandName="Delete" SkinID="ButtonDelete" 
        AssociatedFormViewId="fvParent" FunctionAccessControlCode="Delete"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" CausesValidation="false" SkinID="ButtonBack" PostBackUrl="Index.aspx"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DefaultMode="ReadOnly" 
        ItemType="MAT.App.Scorecard.Scorecard.Document.MeetingAttendance.MeetingDetailsViewModel" DataKeyNames="MeetingId"
        SelectMethod="fvParent_SelectItem" DeleteMethod="fvParent_DeleteItem">
        <ItemTemplate>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Committee" AssociatedControlID="Committee"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:DropDownList runat="server" ID="ddlCommittee" SelectMethod="Committee_Get" DataTextField="Value" 
                                DataValueField="Key" Text='<%# Item.CommitteeId %>' Enabled="false" Visible="false"></Metronic:DropDownList>
                            <MAT:Label runat="server" ID="Committee" SkinID="FormValue"></MAT:Label>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="MeetingDate" AssociatedControlID="Meeting"></MAT:Label>
                        <div class="col-sm-8">
                            <MAT:Label runat="server" ID="Meeting" SkinID="FormValue" Text='<%# Item.Date.HasValue ? Item.Date.Value.ToShortDateString() : "" %>'></MAT:Label>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="MeetingNumber" AssociatedControlID="MeetingNumber"></MAT:Label>
                        <div class="col-sm-8">
                            <MAT:Label runat="server" ID="MeetingNumber" SkinID="FormValue" Text='<%# Item.ReferenceNo %>'></MAT:Label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Subject" AssociatedControlID="Subject"></MAT:Label>
                        <div class="col-sm-8">
                            <MAT:label runat="server" ID="Subject" SkinID="FormValue" Text='<%# Item.Subject %>'></MAT:label>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Venue" AssociatedControlID="Venue"></MAT:Label>
                        <div class="col-sm-8">
                            <MAT:Label runat="server" ID="Venue" SkinID="FormValue" Text='<%# Item.Venue %>'></MAT:Label>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <UserControl:ucAttachment runat="server" ID="ucAttachment" Mode="ReadOnly" DataSet='<%# Item.Attachments %>' Title="MeetingMinutes" />
        </ItemTemplate>
    </MAT:FormView>
    <br />
    <asp:UpdatePanel runat="server" ID="upGv">
        <ContentTemplate>
            <div class="m-portlet">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <h3 class="m-portlet__head-text">
                                <MAT:Literal runat="server" Text="Attendance"></MAT:Literal>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <MAT:Label runat="server" ID="AttendanceSummary"></MAT:Label>
                    <Metronic:GridView runat="server" ID="gvList" DataKeyNames="MemberId" 
                        ItemType="MAT.App.Scorecard.Scorecard.Document.MeetingAttendance.MeetingAttendeeViewModel"
                        SkinID="Custom" SelectMethod="gvList_Get" ShowHeaderWhenEmpty="true">
                        <Columns>
                            <MAT:TemplateField>
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </MAT:TemplateField>
                            <MAT:BoundField DataField="Salutation" HeaderText="Salutation"></MAT:BoundField>
                            <MAT:BoundField DataField="MemberName" HeaderText="Member"></MAT:BoundField>
                            <MAT:EnumBoundField DataField="MemberType" HeaderText="Position" EnumName="MAT.App.Scorecard.Scorecard.Administration.CommitteeMember.MemberType"></MAT:EnumBoundField>
                            <%--<MAT:BoundField DataField="EffectiveDate"></MAT:BoundField>
                            <MAT:BoundField DataField="Date"></MAT:BoundField>--%>
                            <MAT:EnumBoundField DataField="IsPresent" HeaderText="Attendance" EnumName="MAT.App.Scorecard.Enumerate.IsPresent"></MAT:EnumBoundField>
                        </Columns>
                    </Metronic:GridView>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <UserControl:ucDataInformation runat="server" id="ucDataInformation" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
