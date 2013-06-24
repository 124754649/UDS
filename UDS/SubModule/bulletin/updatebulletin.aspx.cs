using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UDS.SubModule.bulletin
{
    public partial class updatebulletin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string UserID = null == Request.Cookies["UserID"] ? "" : Request.Cookies["UserID"].Value;

            string method = Request.Params["m"];

            switch(method)
            {
                case "1":
                    //更新已读
                    string bid = Request.Params["bid"];
                    try
                    {
                        if (!string.IsNullOrEmpty(bid))
                        {
                            string checksql = "select count(staffid) from uds_bulletinreadlist where bulletinid = {0} and staffid = {1}";

                            string sql = "insert into UDS_BulletinReadList(bulletinid, staffid, readtime) values({0}, {1}, '{2}')";

                            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ConnectionString))
                            {
                                SqlCommand comm = new SqlCommand();
                                comm.Connection = con;

                                con.Open();

                                comm.CommandText = string.Format(checksql, bid, UserID);

                                int count = int.Parse(comm.ExecuteScalar().ToString());

                                if (0 == count)
                                {
                                    comm.CommandText = string.Format(sql, bid, UserID, DateTime.Now);
                                    comm.ExecuteNonQuery();
                                }
                                con.Close();
                            }

                            Response.Write("标记为已读成功");
                        }
                        else
                        {
                            Response.StatusCode = 400;
                            Response.Write("错误的参数，无法记录是否已读");
                        }
                    }
                    catch (Exception eX)
                    {
                        Response.StatusCode = 400;
                        Response.Write(eX.Message);
                    }
                    finally
                    {
                        Response.End();
                    }
                    break;
            }
        }
    }
}