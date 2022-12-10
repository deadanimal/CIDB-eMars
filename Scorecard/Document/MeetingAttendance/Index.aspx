<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Document.MeetingAttendance.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Metronic:SearchPanel runat="server" ID="SearchPanel" AssociatedGridViewId="gvList" AddNavigateUrl="Add.aspx">
        <SearchTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Committee" AssociatedControlID="Committee"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Committee"></Metronic:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="MeetingDate" AssociatedControlID="MeetingDate"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="MeetingDate" SkinID="DatePicker"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <div class="col-sm-12">
                                    <div class="pull-right">
                                        <Metronic:LinkButton ID="btnSearch" runat="server" SkinID="ButtonSearch" OnClick="btnSearch_Click"></Metronic:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </SearchTemplate>
    </Metronic:SearchPanel>
    <Metronic:GridView runat="server" ID="gvList" DataKeyNames="MeetingId" SelectMethod="gvList_Get"
        ItemType="MAT.App.Scorecard.Scorecard.Document.MeetingAttendance.MeetingAttendanceListViewModel">
        <Columns>
            <MAT:TemplateField ItemStyle-Width="20px">
                <ItemTemplate>
                    <Metronic:LinkButton runat="server" ID="lb" SkinID="ButtonViewIcon" CausesValidation="false"
                        PostBackUrl='<%# string.Format("View.aspx?id={0}", Item.MeetingId) %>'></Metronic:LinkButton>
                </ItemTemplate>
            </MAT:TemplateField>
            <MAT:BoundField DataField="CommitteeCode" HeaderText="CommitteeCode" SortExpression="CommitteeCode"></MAT:BoundField>
            <MAT:BoundField DataField="CommitteeName" HeaderText="CommitteeName" SortExpression="CommitteeName"></MAT:BoundField>
            <MAT:BoundField DataField="MeetingDate" HeaderText="MeetingDate" DataFormatString="{0: dd/MM/yyyy}" SortExpression="MeetingDate"></MAT:BoundField>
            <MAT:BoundField DataField="ReferenceNo" HeaderText="ReferenceNo" SortExpression="ReferenceNo"></MAT:BoundField>
            <MAT:BoundField DataField="NoOfAttendees" HeaderText="NoOfAttendees" SortExpression="NoOfAttendees"></MAT:BoundField>
            <MAT:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy"></MAT:BoundField>
            <MAT:BoundField DataField="CreatedDate" HeaderText="CreatedOn" DataFormatString="{0: dd/MM/yyyy}" SortExpression="CreatedDate"></MAT:BoundField>
            <MAT:BoundField DataField="AttachmentCount" HeaderText="Attachment" SortExpression="AttachmentCount"></MAT:BoundField>
        </Columns>
    </Metronic:GridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
