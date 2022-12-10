<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.KPIProgress.ProgressHistory.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Metronic:SearchPanel runat="server" ID="SearchPanel" ShowAddButton="false" AssociatedGridViewId="gvList">
        <SearchTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="ViewBy" AssociatedControlID="ViewBy"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="ViewBy" SelectMethod="ViewBy_Get" DataTextField="Value" DataValueField="Key" OnDataBound="ViewBy_DataBound"></Metronic:DropDownList>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="ProgressPeriodFrom" AssociatedControlID="ProgressPeriodFrom"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="ProgressPeriodFrom" SkinID="DatePicker"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="ProgressPeriodTo" AssociatedControlID="ProgressPeriodTo"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="ProgressPeriodTo" SkinID="DatePicker"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="SubmissionDateFrom" AssociatedControlID="SubmissionDateFrom"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="SubmissionDateFrom" SkinID="DatePicker"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="SubmissionDateTo" AssociatedControlID="SubmissionDateTo"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="SubmissionDateTo" SkinID="DatePicker"></Metronic:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="ApprovedDateFrom" AssociatedControlID="ApprovedDateFrom"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="ApprovedDateFrom" SkinID="DatePicker"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="ApprovedDateTo" AssociatedControlID="ApprovedDateTo"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="ApprovedDateTo" SkinID="DatePicker"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="SubmitterName" AssociatedControlID="SubmitterName"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="SubmitterName"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="ApproverName" AssociatedControlID="ApproverName"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="ApproverName"></Metronic:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
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
    <Metronic:GridView runat="server" ID="gvList" SelectMethod="gvList_Get" DataKeyNames="ScorecardKpiDetailId" 
        ItemType="MAT.App.Scorecard.Scorecard.KpiProgress.ProgressHistrory.ProgressHistoryListViewModel"
        OnRowCommand="gvList_RowCommand">
        <Columns>
            <MAT:TemplateField ItemStyle-Width="20px">
                <ItemTemplate>
                    <Metronic:LinkButton runat="server" ID="lb" SkinID="ButtonViewIcon" CausesValidation="false"                        
                        PostBackUrl='<%# Item.Status == MAT.App.Scorecard.Enumerate.ScorecardKpiDetailStatus.Approved ? 
                            string.Format("View.aspx?id={0}", Item.ScorecardKpiDetailId) :
                            string.Format("Edit.aspx?id={0}", Item.ScorecardKpiDetailId) %>'></Metronic:LinkButton>
                </ItemTemplate>
            </MAT:TemplateField>            
            <MAT:BoundField DataField="KpiCode" HeaderText="KpiCode" SortExpression="KpiCode"></MAT:BoundField>
            <MAT:BoundField DataField="KpiName" HeaderText="KpiName" SortExpression="KpiName"></MAT:BoundField>
            <MAT:BoundField DataField="Name" HeaderText="SubKpi" SortExpression="Name"></MAT:BoundField>
            <MAT:TemplateField HeaderText="Period" SortExpression="Period">
                <ItemTemplate>
                    <%# Item.Period + " " + Item.StartDate.Year.ToString() %>
                </ItemTemplate>
            </MAT:TemplateField>
            <MAT:BoundField HeaderText="Target" DataField="Target" SortExpression="Target"></MAT:BoundField>
            <MAT:BoundField HeaderText="Progress" DataField="Progress" SortExpression="Progress"></MAT:BoundField>
            <MAT:EnumBoundField HeaderText="Status" DataField="Status" EnumName="MAT.App.Scorecard.Enumerate.ScorecardKpiDetailStatus" SortExpression="Status"></MAT:EnumBoundField>
            <MAT:BoundField HeaderText="LastActionDate" DataField="LastActionDate" DataFormatString="{0 : dd/MM/yyyy}" SortExpression="LastActionDate"></MAT:BoundField>
            <MAT:TemplateField HeaderText="LastActionBy" SortExpression="LastActionBy">
                <ItemTemplate>
                    <%# GetDisplayName(Item.LastActionBy) %>
                </ItemTemplate>
            </MAT:TemplateField>
        </Columns>
    </Metronic:GridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
