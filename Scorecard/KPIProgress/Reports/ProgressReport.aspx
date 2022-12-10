<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProgressReport.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.KPIProgress.Reports.ProgressReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ReportViewer runat="server" ID="ReportViewer1" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%"
        ShowZoomControl="false" ShowFindControls="false" ShowExportControls="true" ShowRefreshButton="false" AsyncRendering="false" ShowWaitControlCancelLink="false"
        SizeToReportContent="true">
        <LocalReport DisplayName="Report">
            <DataSources>
                <asp:ReportDataSource DataSourceId="odsReport" Name="DataSet1" />
            </DataSources>
        </LocalReport>
    </asp:ReportViewer>
    <asp:ObjectDataSource runat="server" ID="odsReport" OldValuesParameterFormatString="original_{0}" SelectMethod="ProgressReport"
        TypeName="MAT.App.Scorecard.Reports.Manager">
        <SelectParameters>
            <asp:QueryStringParameter Name="ScorecardKpiDetailId" ConvertEmptyStringToNull="true" DbType="Guid" QueryStringField="sckpid" />
            <asp:QueryStringParameter Name="ScorecardKpiId" ConvertEmptyStringToNull="true" DbType="Guid" QueryStringField="sckpi" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
