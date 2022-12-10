<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.KPIProgress.ProgressSubmission.Index" %>

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
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Status" AssociatedControlID="Status"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:MultiSelect runat="server" ID="Status" SelectMethod="Status_Get" DataTextField="Value" DataValueField="Key" OnDataBound="Status_DataBound"></Metronic:MultiSelect>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="KpiCode" AssociatedControlID="KpiCode"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="KpiCode"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="KpiName" AssociatedControlID="KpiName"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="KpiName"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="KPI" AssociatedControlID="KPI"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Kpi"></Metronic:TextBox>
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
    <Metronic:GridView runat="server" ID="gvList" DataKeyNames="ScorecardKpiDetailId" SelectMethod="gvList_Get"
        ItemType="MAT.App.Scorecard.Scorecard.KpiProgress.ProgressSubmission.KpiProgressSubmissionListViewModel">
        <Columns>
            <MAT:TemplateField ItemStyle-Width="20px">
                <ItemTemplate>
                    <Metronic:LinkButton runat="server" ID="lb" SkinID="ButtonViewIcon" CausesValidation="false"
                        PostBackUrl='<%# string.Format("Edit.aspx?id={0}", Item.ScorecardKpiDetailId ) %>'></Metronic:LinkButton>
                </ItemTemplate>
            </MAT:TemplateField>
            <MAT:BoundField DataField="KpiCode" HeaderText="KpiCode" SortExpression="KpiCode"></MAT:BoundField>
            <MAT:BoundField DataField="KpiName" HeaderText="KpiName" SortExpression="KpiName"></MAT:BoundField>
            <MAT:BoundField DataField="Kpi" HeaderText="SubKpi" SortExpression="Kpi"></MAT:BoundField>
            <MAT:TemplateField HeaderText="Period" SortExpression="ProgressStartDate">
                <ItemTemplate>
                    <%# Item.Period + " " + Item.ProgressStartDate.Year.ToString()  %>
                </ItemTemplate>
            </MAT:TemplateField>
            <MAT:BoundField HeaderText="Target" DataField="Target" SortExpression="Target"></MAT:BoundField>
            <MAT:BoundField HeaderText="Progress" DataField="Progress" SortExpression="Progress"></MAT:BoundField>
            <MAT:EnumBoundField HeaderText="Status" DataField="Status" SortExpression="Status"
                EnumName="MAT.App.Scorecard.Enumerate.ScorecardKpiDetailStatus">
            </MAT:EnumBoundField>
            <MAT:BoundField HeaderText="LastUpdatedOn" DataField="LastUpdatedOn"
                DataFormatString="{0:dd/MM/yyyy}" SortExpression="LastUpdatedOn">
            </MAT:BoundField>
        </Columns>
    </Metronic:GridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
