<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SR003.aspx.cs" Inherits="MAT.WebApp.App.Reports.SR003" %>

<%--<%@ Register Src="~/Reports/ucReportViewer.ascx" TagPrefix="MAT" TagName="ucReportViewer" %>--%>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<MAT:ucReportViewer runat="server" id="ucReportViewer" />--%>

    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <asp:HiddenField ID="hfDomain" runat="server" Value="" />
    <asp:HiddenField ID="hfWidth" runat="server" />

    <iframe id="iframe1" runat="server" src="/Report" style="display: none;"></iframe>
    
    <div id="divMain" style="width: 65%; text-align: center; margin: auto; overflow: auto">
        <asp:Button ID="btnPrintServer" runat="server" Text="Print Report" OnClick="btnExportReport_Click" />
        <%--<rsweb:ReportViewer ID="ReportViewer2" runat="server"></rsweb:ReportViewer>--%>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" align="Center"
            Font-Names="Verdana" Font-Size="8pt" Height="80%" ProcessingMode="Remote" waitmessagefont-names="Verdana" waitmessagefont-size="14pt">
            <ServerReport ReportPath="" />
        </rsweb:ReportViewer>
    </div>

    <script type="text/javascript">
        var hfWidth = document.getElementById("hfWidth").value;
        //alert(document.getElementById("divMain").style.width);
        document.getElementById("divMain").style.width = "65%";
        //alert(document.getElementById("divMain").style.width);
    </script>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
    <style>
        span[style="color:#696969;"] {
            display: table-cell;
            padding: 3px;
            border: solid 1px;
        }

        div[alt="AccelteamHTMLTextBox"] div div div {
            display: table-row;
        }
        /*
        span[alt="AccelteamHTMLTextBoxHolder"] {
            display: table-cell;
            padding: 3px;
            border: solid 1px;
        }
            span[alt="AccelteamHTMLTextBoxHolder"]:only-child {
                border: 0px;
		        display:normal;
            }*/

        div[alt="AccelteamHTMLTextBox"] li {
            font-size: 6pt !important;
            font-family: 'Segoe UI' !important;
        }

        #btnPrintServer {
            position: absolute;
            margin: 10px;
            margin-top: 5%;
            margin-left: 25%;
        }
    </style>
</asp:Content>
