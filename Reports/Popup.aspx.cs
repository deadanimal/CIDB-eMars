using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MAT.WebApp.App.Reports
{
    public partial class Popup : WebApp.UI.Page
    {
        public override MAT.Web.Security.PageType PageType => Web.Security.PageType.Common;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HTML"] != null)
            {
                divReports.InnerHtml = Session["HTML"].ToString();
            }
            else
            {
                divReports.InnerHtml = "No data found";
            }
        }
    }
}