using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MAT.WebApp.App.Reports
{
    public partial class SR002 : WebApp.UI.Page
    {
        public string ReportName => Request["ReportName"];
        public string ReportServerPath => System.Configuration.ConfigurationManager.AppSettings["CIDB:SSRSReportServer"];
        public string ReportUser => System.Configuration.ConfigurationManager.AppSettings["CIDB:SSRSADUser"];
        public string ReportPassword => System.Configuration.ConfigurationManager.AppSettings["CIDB:SSRSADPassword"];

        public static string ReportPath = string.Empty;
        public static string Thrust = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    var master = this.Page.Master as Site;
                    master.SubTitle = ReportName;
                    if (string.IsNullOrEmpty(ReportName)) Response.End();

                    hfDomain.Value = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority);
                    string RootPath = HttpContext.Current.Server.MapPath("~");
                    using (var mgr = new MAT.App.Scorecard.Reports.Manager())
                    {
                        ReportPath = mgr.GetReportPath(ReportName);
                    }
                    //ReportPath = "/CIDB/SR/SR001-AKtest";
                    if (ReportPath != "")
                    {
                        InitializeReportViewer(ReportPath);
                    }
                }
                catch
                {

                }
            }
        }

        #region "InitializeReportViewer"
        private void InitializeReportViewer(string ReportPath)
        {
            try
            {

                //string ReportServerPath = string.Empty;
                //if (System.Configuration.ConfigurationManager.AppSettings["ReportServerPath"] != null)
                //{
                //    ReportServerPath = System.Configuration.ConfigurationManager.AppSettings["ReportServerPath"].ToString();
                //}

                Uri reportServer = new System.Uri(ReportServerPath);
                ReportViewer1.Reset();
                ReportViewer1.ProcessingMode = ProcessingMode.Remote;
                // ReportViewer1.ShowParameterPrompts = false;
                ReportViewer1.AsyncRendering = true;
                ReportViewer1.ShowFindControls = true;
                ReportViewer1.SizeToReportContent = true;
                ReportViewer1.ShowPrintButton = false;
                ReportViewer1.ShowExportControls = false;
                //ReportViewer1.ZoomPercent = 75;
                ServerReport serverReport = ReportViewer1.ServerReport;
                serverReport.ReportServerUrl = reportServer;
                serverReport.ReportPath = ReportPath;

                if (!string.IsNullOrEmpty(ReportUser) && !string.IsNullOrEmpty(ReportPassword))
                    ReportViewer1.ServerReport.ReportServerCredentials = new ReportCredentials(ReportUser, ReportPassword, "");

                var RptParameters = new List<ReportParameter>
                {
                    new ReportParameter("UserID", MAT.Context.Profile.UserId.ToString()),
                };

                ReportViewer1.ServerReport.SetParameters(RptParameters.ToArray());

                serverReport.Refresh();
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region "btnExportReport_Click"
        protected void btnExportReport_Click(object sender, EventArgs e)
        {
            Microsoft.Reporting.WebForms.ReportViewer rp = new Microsoft.Reporting.WebForms.ReportViewer();
            //string ReportServerPath = string.Empty;
            string ExportFilePath = string.Empty;
            string ExportFolder = string.Empty;
            string Year = string.Empty;
            string Quarter = string.Empty;
            string Footer = string.Empty;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            string strhtml = string.Empty;
            string ReportServerUrl = string.Empty;
            if (System.Configuration.ConfigurationManager.AppSettings["ReportServerPath"] != null)
            {
                //ReportServerPath = System.Configuration.ConfigurationManager.AppSettings["ReportServerPath"].ToString();
            }
            if (System.Configuration.ConfigurationManager.AppSettings["ReportServerUrl"] != null)
            {
                ReportServerUrl = System.Configuration.ConfigurationManager.AppSettings["ReportServerUrl"].ToString();
            }
            if (System.Configuration.ConfigurationManager.AppSettings["ExportFolder"] != null)
            {
                ExportFolder = System.Configuration.ConfigurationManager.AppSettings["ExportFolder"].ToString();
            }
            ExportFilePath = AppDomain.CurrentDomain.BaseDirectory + ExportFolder;
            Year = ReportViewer1.ServerReport.GetParameters()[0].Values[0].ToString();
            Quarter = ReportViewer1.ServerReport.GetParameters()[1].Values[0].ToString();
            Footer = ReportViewer1.ServerReport.GetParameters()[2].Values[0].ToString();

            ReportParameter[] reportParas;
            reportParas = new ReportParameter[4];
            reportParas[0] = new ReportParameter("Year", Year);
            reportParas[1] = new ReportParameter("Quarter", Quarter);
            reportParas[2] = new ReportParameter("Footer", Footer);
            reportParas[3] = new ReportParameter("UserID", MAT.Context.Profile.UserId.ToString());

            rp.ServerReport.ReportServerCredentials = new ReportCredentials(ReportUser, ReportPassword, "");
            rp.ProcessingMode = ProcessingMode.Remote;
            rp.ServerReport.ReportServerUrl = new Uri(ReportServerPath); // Report Server URL
            rp.ServerReport.ReportPath = ReportPath;
            rp.ServerReport.SetParameters(reportParas);

            Warning[] warnings;
            string[] streamIds;
            byte[] bytes = rp.ServerReport.Render("html5", null, out mimeType, out encoding, out extension, out streamIds, out warnings);
            string ExportHTMLFullPath = string.Empty;
            string rn = string.Empty;
            if (ReportPath.Contains("SR001"))
            {
                rn = "SR001";
            }
            else if (ReportPath.Contains("SR002"))
            {
                rn = "SR002";
            }
            else if (ReportPath.Contains("SR003"))
            {
                rn = "SR003";
            }
            else
            {
                rn = "";
            }

            rn = ReportName + "_" + Year + "_" + Quarter;

            ExportFilePath = Server.MapPath("~/Reports/ExportFiles/");

            ExportHTMLFullPath = ExportFilePath + ReportName + "_ExportReport.html";

            if (!Directory.Exists(ExportFilePath))
                Directory.CreateDirectory(ExportFilePath);
            if (Directory.Exists(ExportFilePath))
            {
                FileStream stream = File.Create(ExportHTMLFullPath, bytes.Length);
                stream.Write(bytes, 0, bytes.Length);
                stream.Close();
                strhtml = System.IO.File.ReadAllText(ExportHTMLFullPath);
                strhtml = strhtml.Replace("</title>", "</title><style> span[style='color:#696969;']{ display: table-cell; padding: 3px; border: solid 1px; } div[alt='AccelteamHTMLTextBox'] div div div { display: table-row; }/* span[alt='AccelteamHTMLTextBoxHolder'] { display: table-cell; padding: 3px; border: solid 1px; } span[alt='AccelteamHTMLTextBoxHolder']:only-child { border: 0px; display:normal; }*/ div[alt='AccelteamHTMLTextBox'] li { font-size: 6pt !important; font-family: 'Segoe UI' !important; }</style>");
                strhtml = strhtml.Replace(ReportServerPath, ReportServerUrl);
                using (StreamWriter writer = new StreamWriter(ExportHTMLFullPath))
                {
                    writer.Write(strhtml);

                }

                Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('ExportFiles/" + ReportName + "_ExportReport.html');", true);
            }
        }
        #endregion
    }
}