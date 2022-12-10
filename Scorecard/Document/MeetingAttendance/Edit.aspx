<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Document.MeetingAttendance.Edit" %>

<%@ Register Src="~/Scorecard/UserControl/ucAttachment.ascx" TagPrefix="UserControl" TagName="ucAttachment" %>
<%@ Register Src="~/Administration/UserControl/ucDataInformation.ascx" TagPrefix="UserControl" TagName="ucDataInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave" CommandName="Update" AssociatedFormViewId="fvParent"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" SkinID="ButtonBack"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DefaultMode="Edit" ItemType="MAT.App.Scorecard.Scorecard.Document.MeetingAttendance.MeetingDetailsViewModel" DataKeyNames="MeetingId"
        SelectMethod="fvParent_SelectItem" UpdateMethod="fvParent_UpdateItem">
        <EditItemTemplate>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Committee" AssociatedControlID="Committee"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:DropDownList runat="server" ID="ddlCommittee" SelectMethod="Committee_Get" DataTextField="Value" DataValueField="Key" Text='<%# Item.CommitteeId %>' Enabled="false" Visible="false"></Metronic:DropDownList>
                            <MAT:Label runat="server" ID="Committee" SkinID="FormValue"></MAT:Label>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="MeetingDate" AssociatedControlID="txtMeeting"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:TextBox runat="server" ID="txtMeeting" SkinID="DatePicker" Text='<%# Item.Date == null ? string.Empty : Item.Date.Value.ToShortDateString() %>' Mandatory="true"></Metronic:TextBox>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="MeetingNumber" AssociatedControlID="MeetingNumber"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:TextBox runat="server" ID="MeetingNumber" Text='<%# Bind("ReferenceNo") %>' Mandatory="true"></Metronic:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Subject" AssociatedControlID="txtSubject"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:TextBox runat="server" ID="txtSubject" Text='<%# Bind("Subject") %>' Mandatory="true"></Metronic:TextBox>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Venue" AssociatedControlID="txtVenue"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:TextBox runat="server" ID="txtVenue" Text='<%# Bind("Venue") %>' Mandatory="true"></Metronic:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <UserControl:ucAttachment runat="server" ID="ucAttachment" Title="MeetingMinutes" Mode="Edit" DataSet='<%# Item.Attachments %>' />
        </EditItemTemplate>
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
                    <asp:HiddenField runat="server" ID="hfPresent" />
                    <asp:HiddenField runat="server" ID="gvTotalCount" />
                    <Metronic:GridView runat="server" ID="gvList" DataKeyNames="MeetingAttendanceId" SkinID="Custom" SelectMethod="gvList_Get"
                        ShowHeaderWhenEmpty="true" ItemType="MAT.App.Scorecard.Scorecard.Document.MeetingAttendance.MeetingAttendeeViewModel"
                        OnRowDataBound="gvList_RowDataBound">
                        <Columns>
                            <MAT:TemplateField>
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </MAT:TemplateField>
                            <MAT:BoundField HeaderText="Salutation" DataField="Salutation"></MAT:BoundField>
                            <MAT:BoundField DataField="MemberName" HeaderText="Member"></MAT:BoundField>
                            <MAT:EnumBoundField DataField="MemberType" HeaderText="Position" EnumName="MAT.App.Scorecard.Scorecard.Administration.CommitteeMember.MemberType"></MAT:EnumBoundField>
                            <MAT:TemplateField HeaderText="Attendance">
                                <ItemTemplate>
                                    <Metronic:DropDownList runat="server" ID="ddlIsPresent" DataTextField="Value"
                                        DataValueField="Key" SelectMethod="ddlIsPresent_Get" Text='<%# Item.IsPresent %>'>
                                    </Metronic:DropDownList>
                                </ItemTemplate>
                            </MAT:TemplateField>
                        </Columns>
                    </Metronic:GridView>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <UserControl:ucDataInformation runat="server" ID="ucDataInformation" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
    <script type="text/javascript">
        function ddlChange(ddl, hfPresentCount, AttendanceSummary, gvTotalCount) {
            $(AttendanceSummary).text('');
            var count = parseInt($(hfPresentCount).val(), 10);
            if ($(ddl + " option:selected").val() == 1) {
                count = count + 1;
            }
            else count = count - 1;
            $(hfPresentCount).val(count);
            $(AttendanceSummary).text('Total Present : ' + $(hfPresentCount).val() + ' / ' + $(gvTotalCount).val());
        }
    </script>
</asp:Content>
