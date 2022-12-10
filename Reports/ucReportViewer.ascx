<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucReportViewer.ascx.cs" Inherits="MAT.WebApp.App.Reports.ucReportViewer" %>


<asp:UpdatePanel ID="upReport" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <div style="height: 100%; overflow: auto;">
            <asp:ReportViewer ID="rvMasterReportViewer" runat="server" ProcessingMode="Remote" WaitMessageFont-Names="Verdana"
                WaitMessageFont-Size="14pt" CssClass="reportviewer" PromptAreaCollapsed="true"
                ShowPrintButton="false" ShowZoomControl="false" ShowRefreshButton="false" ShowBackButton="false" ShowFindControls="false"
                ShowExportControls="true" AsyncRendering="true" SizeToReportContent="true" ShowToolBar="true"
                OnDrillthrough="rvMasterReportViewer_Drillthrough" Height="100%" Width="100%">
            </asp:ReportViewer>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<%--To hide report viewer loading indicator--%>
<style>
    div[id$='AsyncWait_Wait'] {
        display: none !important;
        visibility: hidden !important;
    }
</style>
