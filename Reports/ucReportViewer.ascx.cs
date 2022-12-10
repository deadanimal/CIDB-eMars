using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace MAT.WebApp.App.Reports
{
    public partial class ucReportViewer : System.Web.UI.UserControl
    {
        public string ReportName => Request["ReportName"];
        public string ReportServerPath => System.Configuration.ConfigurationManager.AppSettings["CIDB:SSRSReportServer"];
        public string ReportUser => System.Configuration.ConfigurationManager.AppSettings["CIDB:SSRSADUser"];
        public string ReportPassword => System.Configuration.ConfigurationManager.AppSettings["CIDB:SSRSADPassword"];

        public bool PromptAreaCollapsed
        {
            get => rvMasterReportViewer.PromptAreaCollapsed;
            set => rvMasterReportViewer.PromptAreaCollapsed = value;
        }

        //protected override void OnInit(EventArgs e)
        //{
        //    base.OnInit(e);

        //    if (!Page.IsPostBack)
        //    {
        //        // Set the processing mode for the ReportViewer to Remote  
        //        rvMasterReportViewer.ProcessingMode = ProcessingMode.Remote;

        //        ServerReport serverReport = rvMasterReportViewer.ServerReport;

        //        // Set the report server URL and report path  
        //        serverReport.ReportServerUrl =
        //            new Uri("http://mssql/ReportServer");
        //        serverReport.ReportPath =
        //            "/CIDB/SR/SR002";

        //        // Create the sales order number report parameter  
        //        //ReportParameter salesOrderNumber = new ReportParameter();
        //        //salesOrderNumber.Name = "SalesOrderNumber";
        //        //salesOrderNumber.Values.Add("SO43661");

        //        //// Set the report parameters for the report  
        //        //rvMasterReportViewer.ServerReport.SetParameters(
        //        //    new ReportParameter[] { salesOrderNumber });
        //    }

        //}
        #region "Page_Load"
        protected void Page_Load(object sender, EventArgs e)
        {
            // display report name
            var master = this.Page.Master as Site;
            master.PageTitle = "Reports";
            master.SubTitle = ReportName;

            // show nothing if empty string
            if (string.IsNullOrEmpty(ReportName)) Response.End();

            if (!Page.IsPostBack)
            {
                InitializeReportViewer();
                using (var mgr = new MAT.App.Scorecard.Reports.Manager())
                {
                    var reportPath = mgr.GetReportPath(ReportName);
                    LoadSSRSReport(reportPath, MAT.Context.Profile.UserId);
                }
            }
        }
        #endregion

        protected void Page_PreRender(object sender, EventArgs e)
        {
            // change report name
            var master = Page.Master as Site;
            master.SubTitle = ReportName;
        }

        private String getBrowserType()
        {
            System.Web.HttpBrowserCapabilities browserObj = Request.Browser;
            return browserObj.Browser;
        }

        private void LoadSSRSReport(string reportPath, Guid userId)
        {
            rvMasterReportViewer.ServerReport.ReportPath = reportPath;

            var RptParameters = new List<ReportParameter>
            {
                new ReportParameter("UserID", userId.ToString()),
            };

            rvMasterReportViewer.ServerReport.SetParameters(RptParameters.ToArray());
            rvMasterReportViewer.ServerReport.Refresh();
        }

        private void InitializeReportViewer()
        {
            rvMasterReportViewer.Reset();
            rvMasterReportViewer.ProcessingMode = ProcessingMode.Remote;
            rvMasterReportViewer.ServerReport.ReportServerUrl = new Uri(ReportServerPath);

            // this is for testing purpose
            if (!string.IsNullOrEmpty(ReportUser) && !string.IsNullOrEmpty(ReportPassword))
                rvMasterReportViewer.ServerReport.ReportServerCredentials = new ReportCredentials(ReportUser, ReportPassword, "");
        }

        protected void rvMasterReportViewer_Drillthrough(object sender, DrillthroughEventArgs e)
        {

        }
    }

    public class ReportCredentials : IReportServerCredentials
    {
        string ReportUserName, ReportPassword, ReportDomain;

        public ReportCredentials(string userName, string password, string domain)
        {
            ReportUserName = userName;
            ReportPassword = password;
            ReportDomain = domain;
        }

        public System.Security.Principal.WindowsIdentity ImpersonationUser => null;

        public System.Net.ICredentials NetworkCredentials => new System.Net.NetworkCredential(ReportUserName, ReportPassword, ReportDomain);

        public bool GetFormsCredentials(out System.Net.Cookie authCoki, out string userName, out string password, out string authority)
        {
            //userName = ReportUserName;
            //password = ReportPassword;
            //authority = ReportDomain;
            //authCoki = new System.Net.Cookie(".ASPXAUTH", ".ASPXAUTH", "/", "Domain");

            authCoki = null;
            userName = null;
            password = null;
            authority = null;


            return false;
        }
    }
}