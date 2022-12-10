using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MAT.WebApp.App.Reports
{
    public class DataLayer
    {
        public static string ConnString;
        public static DataSet KPIList_SR001(string Year, string Quarter)
        {
            DataSet ds = new DataSet("KPIList");
            try
            {

                //ConnString = "Server=" + ConfigurationManager.AppSettings["dbServer"].ToString()+";Database=" + ConfigurationManager.AppSettings["Database"].ToString()+";Uid=" + ConfigurationManager.AppSettings["dbID"].ToString()+";Pwd=" + ConfigurationManager.AppSettings["dbPassword"].ToString();

                using (SqlConnection conn = new SqlConnection(ConnectionString()))
                {
                    SqlCommand sqlComm = new SqlCommand("sp_SR001_KPIList", conn);
                    sqlComm.Parameters.AddWithValue("@Year", Year);
                    sqlComm.Parameters.AddWithValue("@Quarter", Quarter);

                    sqlComm.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = sqlComm;

                    da.Fill(ds);
                }
                return ds;
            }

            catch (Exception ex)
            {
                throw ex;
            }

        }
        public static DataSet KPIList_SR002(string Year, string Quarter, string Username)
        {
            //ConnString = "Server=" + ConfigurationManager.AppSettings["dbServer"].ToString()+";Database=" + ConfigurationManager.AppSettings["Database"].ToString()+";Uid=" + ConfigurationManager.AppSettings["dbID"].ToString()+";Pwd=" + ConfigurationManager.AppSettings["dbPassword"].ToString();
            DataSet ds = new DataSet("KPIList");
            try
            {

                using (SqlConnection conn = new SqlConnection(ConnectionString()))
                {
                    SqlCommand sqlComm = new SqlCommand("sp_SR002_KPIList", conn);
                    sqlComm.Parameters.AddWithValue("@Year", Year);
                    sqlComm.Parameters.AddWithValue("@Quarter", Quarter);
                    sqlComm.Parameters.AddWithValue("@UserId", Username);

                    sqlComm.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = sqlComm;

                    da.Fill(ds);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }
        public static string ConnectionString()
        {
            string ConnString = "Server=" + ConfigurationManager.AppSettings["dbServer"].ToString() + ";Database=" + ConfigurationManager.AppSettings["Database"].ToString() + ";Uid=" + ConfigurationManager.AppSettings["dbID"].ToString() + ";Pwd=" + ConfigurationManager.AppSettings["dbPassword"].ToString();
            return ConnString;
        }
        public static DataSet getKPIDetails(string Year, string Quarter, string KPICode)
        {
            DataSet ds = new DataSet("KPIDetails");
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString()))
                {
                    SqlCommand sqlComm = new SqlCommand("sp_SR_KPIDetails", conn);
                    sqlComm.Parameters.AddWithValue("@Year", Year);
                    sqlComm.Parameters.AddWithValue("@Quarter", Quarter);
                    sqlComm.Parameters.AddWithValue("@KPI_Code", KPICode);
                    sqlComm.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = sqlComm;

                    da.Fill(ds);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }
        public static DataSet GetDataSet(string SPName)
        {
            try
            {
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(ConnectionString()))
                {
                    SqlCommand sqlComm = new SqlCommand(SPName, conn);

                    sqlComm.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = sqlComm;

                    da.Fill(ds);
                }
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}