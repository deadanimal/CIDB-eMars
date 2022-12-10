using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MAT.WebApp.App.Reports
{
    public partial class SR001 : WebApp.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getYear();
                getQuarter();
            }
        }
        private void getYear()
        {
            DataSet dsYear = DataLayer.GetDataSet("SP_Year");
            ddlYear.DataSource = dsYear.Tables[0];
            ddlYear.DataValueField = "Year";
            ddlYear.DataTextField = "Year";
            ddlYear.DataBind();
            ddlYear.SelectedValue = Convert.ToString((DateTime.Now.Year));
        }
        private void getQuarter()
        {
            DataSet dsQuarter = DataLayer.GetDataSet("SP_Quarter");
            ddlQuarter.DataSource = dsQuarter.Tables[0];
            ddlQuarter.DataTextField = "Quarter";
            ddlQuarter.DataValueField = "QuarterNO";
            ddlQuarter.DataBind();
        }
        private string GetReportsHTML(string Year, string Quarter)
        {
            try
            {

                StringBuilder sbDiv = new StringBuilder();

                //sbDiv.AppendLine("<style type='text/css'>");
                //sbDiv.AppendLine("div {padding: 5px;}	#KPIParentDiv {	border: 0.5px dotted;}	#KPIDiv {	}	#divTHRUST_CODE:before {content: 'Thrust: ';}	#divTHRUST_CODE {display: inline;}	#divTHRUST_DESC {display: inline;}	#divINITIATIVE_CODE:before {content: 'Initiative: ';}	#divINITIATIVE_CODE {display: inline;}	#divINITIATIVE_DESC {display: inline;}	#divSUB_INITIATIVE_DESC {display: none;	}	#divSUB_INITIATIVE_CODE {display: none;} #divKPI_CODE:before {content: 'KPI: ';}	#divKPI_CODE {display: inline;background-color:black;}	#divKPI_DESC {display: inline;}	#divCUM_KPI_TARGET:before {	content: 'Target: ';}	#divCUM_KPI_PROGRESS:before {content: 'Progress: ';}#divCUM_KPI_PERCENTAGE:before {content: 'Achievement: ';}	#divCUM_KPI_PERCENTAGE:after {		content: ' % ';	}	#divKPI_LEADER_NAME1 {		display: none;	}	#divOWNER_NAME:before {		content: 'Owner: ';	}	#divSPONSOR_NAME:before {		content: 'Sponsor: ';	}	#divOIC_NAME:before {		content: 'OIC: ';	}	#divSPONSOR_NAME:before {		content: 'Sponsor: ';	}'");
                //sbDiv.AppendLine("</style>");
                sbDiv.AppendLine("<div id='MainDiv'>"); //MainDiv starts here
                DataSet dsKPI = DataLayer.KPIList_SR001(Year, Quarter);

                foreach (DataRow dr in dsKPI.Tables[0].Rows)
                {
                    DataSet dsKPIDetails = DataLayer.getKPIDetails(dr["Year"].ToString(), dr["Quarter"].ToString(), dr["Kpi_Code"].ToString());

                    sbDiv.AppendLine("<div id='KPIParentDiv'>"); //KPIParentDiv starts here
                    sbDiv.AppendLine("<div id='KPIDiv'>"); // KPIDiv starts here
                    foreach (DataRow drKPI in dsKPIDetails.Tables[1].Rows)
                    {
                        sbDiv.AppendLine("<div id='divKPI'>");
                        sbDiv.AppendLine("<div id='divKPI_CODE'>" + drKPI["KPI_Code"].ToString() + "</div>");
                        sbDiv.AppendLine("<div id='divKPI_DESC'>" + drKPI["KPI_DESC"].ToString() + "</div>");
                        sbDiv.AppendLine("</div>"); //divKPI ends here

                        sbDiv.AppendLine("<div id='divTHRUST'>");
                        sbDiv.AppendLine("<div id='divTHRUST_CODE'>" + "</div>");
                        sbDiv.AppendLine("<div id='divTHRUST_DESC'>" + drKPI["THRUST_DESC"].ToString() + "</div>");

                        sbDiv.AppendLine("</div>"); //divKPI ends here
                        sbDiv.AppendLine("<div id='divINITIATIVE'>");
                        sbDiv.AppendLine("<div id='divINITIATIVE_CODE'>" + drKPI["INITIATIVE_CODE"].ToString() + "</div>");
                        sbDiv.AppendLine("<div id='divINITIATIVE_DESC'>" + drKPI["INITIATIVE_DESC"].ToString() + "</div>");

                        sbDiv.AppendLine("</div>"); //divINITIATIVE ends here
                        sbDiv.AppendLine("<div id='divSUB_INITIATIVE'>");
                        sbDiv.AppendLine("<div id='divSUB_INITIATIVE_CODE'>" + drKPI["SUB_INITIATIVE_CODE"].ToString() + "</div>");
                        sbDiv.AppendLine("<div id='divSUB_INITIATIVE_DESC'>" + drKPI["SUB_INITIATIVE_DESC"].ToString() + "</div>");
                        sbDiv.AppendLine("</div>"); //divINITIATIVE ends here
                                                    // sbDiv.AppendLine("<div id='divTHRUST_CODE'>" + drKPI["THRUST_CODE"].ToString() + "</div>");

                    }
                    sbDiv.AppendLine("</div>"); //KPIDiv ends here
                    sbDiv.AppendLine("<div id='Chart'>"); //Div chart start
                    sbDiv.AppendLine("<div id='ChartTitle'></div>");
                    sbDiv.AppendLine("<div id='divCUM_KPI_PERCENTAGE'>" + dr["CUM_KPI_PERCENTAGE"].ToString() + "</div>");
                    sbDiv.AppendLine("<div id='divCUM_KPI_TARGET'>" + dr["CUM_KPI_TARGET"].ToString() + "</div>");
                    sbDiv.AppendLine("<div id='divCUM_KPI_PROGRESS'>" + dr["CUM_KPI_PROGRESS"].ToString() + "</div>");
                    sbDiv.AppendLine("</div>"); //ReportWriteUpDiv ends here

                    sbDiv.AppendLine("<div id='DivUserName'>");
                    foreach (DataRow drUserName in dsKPIDetails.Tables[2].Rows)
                    {

                        sbDiv.AppendLine("<div id='divKPI_LEADER_NAME1'>" + drUserName["KPI_LEADER_NAME1"].ToString() + "</div>");
                        sbDiv.AppendLine("<div id='divSPONSOR_NAME'>" + drUserName["SPONSOR_NAME"].ToString() + "</div>");
                        sbDiv.AppendLine("<div id='divOWNER_NAME'>" + drUserName["OWNER_NAME"].ToString() + "</div>");
                        sbDiv.AppendLine("<div id='divOIC_NAME'>" + drUserName["OIC_NAME"].ToString() + "</div>");

                    }
                    sbDiv.AppendLine("</div>"); //UserName div ends here

                    sbDiv.AppendLine("<div id='DivDeliveries'>");
                    sbDiv.AppendLine("<div id='DivDeliveriesTitle'>Deliverables</div>");
                    foreach (DataRow drDeli in dsKPIDetails.Tables[0].Rows)
                    {
                        sbDiv.AppendLine("<div id='DivByEachYear'>");
                        sbDiv.AppendLine("<div id='divYear'>" + drDeli["Year"].ToString() + "</div>");
                        string[] words = drDeli["P_T"].ToString().Split('/');
                        if (words.Length == 2)
                        {
                            sbDiv.AppendLine("<div id='div_Deliverable_Progress'>" + words[0].ToString() + "</div>");
                            sbDiv.AppendLine("<div id='div_Deliverable_Target'>" + words[1].ToString() + "</div>");
                        }
                        else if (words.Length == 1)
                        {
                            sbDiv.AppendLine("<div id='div_Deliverable_Progress'>" + words[0].ToString() + "</div>");
                            sbDiv.AppendLine("<div id='div_Deliverable_Target'>" + "0" + "</div>");
                        }
                        else
                        {
                            sbDiv.AppendLine("<div id='div_Deliverable_Progress'>" + "0" + "</div>");
                            sbDiv.AppendLine("<div id='div_Deliverable_Target'>" + "0" + "</div>");
                        }

                        sbDiv.AppendLine("<div id='divDesc'>" + drDeli["DESC"].ToString() + "</div>");
                        sbDiv.AppendLine("</div>");

                    }
                    sbDiv.AppendLine("</div>"); //Deliveries div ends here

                    sbDiv.AppendLine("<div id='ReportWriteUpDiv'>");
                    sbDiv.AppendLine("<div id='ReportWriteUpTitle'>Progress Report as of " + Quarter + " " + Year + "</div>");
                    sbDiv.AppendLine("<div id='divREPORT_WRITEUP'>" + dr["REPORT_WRITEUP"].ToString() + "</div>");
                    sbDiv.AppendLine("</div>"); //ReportWriteUpDiv ends here
                    sbDiv.AppendLine("</div>"); //Parent Div End here
                }

                sbDiv.AppendLine("</div>"); //Main div end here

                return sbDiv.ToString();
            }

            catch (Exception ex)
            {
                throw ex;
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                //divReports.InnerHtml = GetReportsHTML(ddlYear.Text, ddlQuarter.SelectedItem.ToString());
                string innerHtml = GetReportsHTML(ddlYear.Text, ddlQuarter.SelectedItem.ToString());
                // win.open('data:text/html;charset=utf-8,text%20to%20show');

                Session["HTML"] = innerHtml.ToString();

                ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('Popup.aspx');", true);

            }
            catch (Exception ex)
            {
                //Display error msg
            }
        }
    }
}