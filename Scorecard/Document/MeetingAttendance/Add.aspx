<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Document.MeetingAttendance.Add" %>

<%@ Register Src="~/Scorecard/UserControl/ucAttachment.ascx" TagPrefix="UserControl" TagName="ucAttachment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave" CausesValidation="true" CommandName="Insert" AssociatedFormViewId="fvParent" ValidationGroup="add"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" CausesValidation="false" SkinID="ButtonBack" PostBackUrl="Index.aspx"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DefaultMode="Insert" InsertMethod="fvParent_InsertItem"
        ItemType="MAT.App.Scorecard.Scorecard.Document.MeetingAttendance.MeetingDetailsViewModel" >
        <InsertItemTemplate>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="CommitteeCode" AssociatedControlID="CommitteeCode"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:DropDownList runat="server" ID="CommitteeCode" SelectMethod="CommitteeCode_Get" DataTextField="Value" DataValueField="Key" Mandatory="true"
                                OnSelectedIndexChanged="ddlCommittee_SelectedIndexChanged" AutoPostBack="true" ValidationGroup="add">
                            </Metronic:DropDownList>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="CommitteeName" AssociatedControlID="CommitteeName"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:TextBox runat="server" ID="CommitteeName" ReadOnly="true"></Metronic:TextBox>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="MeetingDate" AssociatedControlID="MeetingDate"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:TextBox runat="server" ID="MeetingDate" SkinID="DatePicker" Text='<%# BindItem.Date %>' Mandatory="true" ValidationGroup="add" OnTextChanged="txtMeeting_TextChanged" AutoPostBack="true"></Metronic:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Subject" AssociatedControlID="txtSubject"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:TextBox runat="server" ID="txtSubject" Text='<%# BindItem.Subject %>' Mandatory="true" ValidationGroup="add"></Metronic:TextBox>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Venue" AssociatedControlID="txtVenue"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:TextBox runat="server" ID="txtVenue" Text='<%# BindItem.Venue %>' Mandatory="true" ValidationGroup="add"></Metronic:TextBox>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="MeetingNumber" AssociatedControlID="MeetingNumber"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:TextBox runat="server" ID="MeetingNumber" Text='<%# BindItem.ReferenceNo %>' Mandatory="true" ValidationGroup="add"></Metronic:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <UserControl:ucAttachment runat="server" ID="ucAttachment" Mode="Insert" Title="MeetingMinutes" />
        </InsertItemTemplate>
    </MAT:FormView>
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
                    <Metronic:GridView runat="server" ID="gvList" DataKeyNames="MemberId" SkinID="Custom" SelectMethod="gvList_Get"
                        ItemType="MAT.App.Scorecard.Scorecard.Document.MeetingAttendance.MeetingAttendeeViewModel"
                        OnRowDataBound="gvList_RowDataBound" >
                        <Columns>
                            <MAT:TemplateField>
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </MAT:TemplateField>
                            <MAT:BoundField DataField="Salutation" HeaderText="Salutation"></MAT:BoundField>
                            <MAT:BoundField DataField="MemberName" HeaderText="Member"></MAT:BoundField>
                            <MAT:EnumBoundField DataField="MemberType" HeaderText="Position" 
                                EnumName="MAT.App.Scorecard.Scorecard.Administration.CommitteeMember.MemberType"></MAT:EnumBoundField>
                            <MAT:TemplateField HeaderText="Attendance">
                                <ItemTemplate>
                                    <Metronic:DropDownList runat="server" ID="ddlIsPresent" DataTextField="Value"
                                        DataValueField="Key" SelectMethod="ddlIsPresent_Get"></Metronic:DropDownList>
                                </ItemTemplate>
                            </MAT:TemplateField>
                        </Columns>
                    </Metronic:GridView>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
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
