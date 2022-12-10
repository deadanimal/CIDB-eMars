<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.PerformanceScorecard.ChangeRequest.Index" %>

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
                                <MAT:Label runat="server" SkinID="FormLabel" Text="View By" AssociatedControlID="ddlViewBy"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList ID="ddlViewBy" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="ddlViewBy_Get"></Metronic:DropDownList>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Submission Date From" AssociatedControlID="txtDateFrom"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtDateFrom" SkinID="DatePicker"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Submission Date To" AssociatedControlID="txtDateTo"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtDateTo" SkinID="DatePicker"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Submitter Name" AssociatedControlID="txtSubmitterName"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtSubmitterName"></Metronic:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="ChangeTo" AssociatedControlID="ddlChangeTo"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList ID="ddlChangeTo" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="ddlChangeTo_Get"></Metronic:DropDownList>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Code" AssociatedControlID="txtCode"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtCode"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="txtName"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtName"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Status" AssociatedControlID="ddlStatus"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList ID="ddlStatus" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="ddlStatus_Get"></Metronic:DropDownList>
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
    <Metronic:GridView runat="server" ID="gvList" ItemType="MAT.App.Scorecard.Scorecard.PerformanceScorecard.ChangeRequest.ChangeRequestViewModel"
        DataKeyNames="KpiChangeRequestId" SelectMethod="gvList_Get">
        <Columns>
            <MAT:TemplateField ItemStyle-Width="20px">
                <ItemTemplate>
                    <Metronic:LinkButton runat="server" ID="btnView" SkinID="ButtonViewIcon" OnClick="btnView_Click" CommandArgument='<%# Item.KpiChangeRequestId %>' CausesValidation="false"></Metronic:LinkButton>
                </ItemTemplate>
            </MAT:TemplateField>
            <MAT:BoundField HeaderText="Scorecard" DataField="ScorecardCodeName"></MAT:BoundField>
            <MAT:BoundField HeaderText="ChangeTo" DataField="ChangeTo"></MAT:BoundField>
            <MAT:BoundField HeaderText="Code" DataField="Code"></MAT:BoundField>
            <MAT:BoundField HeaderText="Name" DataField="Name"></MAT:BoundField>
            <MAT:BoundField HeaderText="ChangeRequest" DataField="ChangeRequest"></MAT:BoundField>
            <MAT:BoundField HeaderText="RequestedDate" DataField="RequestedDate" DataFormatString="{0:dd/MM/yyyy}"></MAT:BoundField>
            <MAT:BoundField HeaderText="RequestedBy" DataField="SubmitterName"></MAT:BoundField>
            <MAT:BoundField HeaderText="Status" DataField="KpiChangeRequestStatusDesc"></MAT:BoundField>
        </Columns>
    </Metronic:GridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
