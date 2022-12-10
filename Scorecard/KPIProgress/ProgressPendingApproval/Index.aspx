<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.KPIProgress.ProgressPendingApproval.Index" %>

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
                                <MAT:Label runat="server" SkinID="FormLabel" Text="SubmitterName" AssociatedControlID="SubmitterName"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="SubmitterName"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Code" AssociatedControlID="Code"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Code"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Name"></Metronic:TextBox>
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
    <Metronic:GridView runat="server" ID="gvList" DataKeyNames="WorkflowInstanceDetailId" SelectMethod="gvList_Get"
        ItemType="MAT.App.Scorecard.Scorecard.KpiProgress.ProgressPendingApproval.ProgressPendingApprovalListViewModel">
        <Columns>
            <MAT:TemplateField ItemStyle-Width="20px">
                <ItemTemplate>
                    <Metronic:LinkButton runat="server" ID="lb" SkinID="ButtonViewIcon" CausesValidation="false"
                        PostBackUrl='<%# string.Format("Edit.aspx?id={0}", Item.WorkflowInstanceDetailId) %>'></Metronic:LinkButton>
                </ItemTemplate>
            </MAT:TemplateField>
            <MAT:BoundField DataField="KpiCode" HeaderText="KpiCode" SortExpression="KpiCode"></MAT:BoundField>
            <MAT:BoundField DataField="KpiName" HeaderText="KpiName" SortExpression="KpiName"></MAT:BoundField>
            <MAT:BoundField DataField="Name" HeaderText="SubKpi" SortExpression="Name"></MAT:BoundField>
            <MAT:TemplateField HeaderText="Period" SortExpression="StartDate">
                <ItemTemplate>
                    <%# Item.Period + " " + Item.StartDate.Year.ToString() %>
                </ItemTemplate>
            </MAT:TemplateField>
            <MAT:BoundField HeaderText="Target" DataField="Target" SortExpression="Target"></MAT:BoundField>
            <MAT:BoundField HeaderText="Progress" DataField="Progress" SortExpression="Progress"></MAT:BoundField>
            <MAT:BoundField HeaderText="Performance" DataField="Performance" DataFormatString="{0:N0}" SortExpression="Performance"></MAT:BoundField>
            <MAT:BoundField HeaderText="SubmittedDate" DataField="SubmittedDate" DataFormatString="{0:dd/MM/yyyy}" SortExpression="SubmittedDate"></MAT:BoundField>
            <MAT:BoundField HeaderText="SubmittedBy" DataField="SubmittedBy" SortExpression="SubmittedBy"></MAT:BoundField>
        </Columns>
    </Metronic:GridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
