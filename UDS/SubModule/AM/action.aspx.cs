using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using UDS.Entity;
using System.IO;
using Newtonsoft.Json;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace UDS.SubModule.AM
{
    public partial class action : System.Web.UI.Page
    {
        private bool IsNumeric(string v)
        {
            int testint;
            if (int.TryParse(v, out testint))
                return true;
            else
            {
                float testfloat;
                if (float.TryParse(v, out testfloat))
                    return true;
                else {
                    double testdouble;
                    if (double.TryParse(v, out testdouble))
                    {
                        return true;
                    }
                    else
                    {
                        long testlong;
                        if (long.TryParse(v, out testlong))
                            return true;
                        else
                        {
                            return false;
                        }
                    }
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string skeSql = "select * from ({0}) as a where rowno >= {1} and rowno <= {2} {3}";

            string corSql = "select id, name, code, specification, number, totalprice, taxrate, location, startusingtime, buyingtime, status, usingman, remark, " +
                "row_number() over ({1}) as rowno " +
                "from uds_assetmanagement {0}";

            string countSkeSql = "select count(id) from uds_assetmanagement {0}";

            string method = Request.Params["m"];

            switch (method)
            {
                case "q":
                    try
                    {
                        string startIndex = Request.Params["startIndex"];
                        string orderby = Request.Params["orderby"];
                        string order = Request.Params["order"];
                        string rows = Request.Params["rows"];
                        string type = Request.Params["type"];

                        dynamic queryStyle = JValue.Parse(HttpUtility.UrlDecode(Request.Params["qs"]));
                        string[] fields = (queryStyle.fields as JArray).Select(x => (string)x).ToArray();
                        string[] values = (queryStyle.values as JArray).Select(x => (string)x).ToArray();

                        string wheresql = "";

                        if (0 != fields.Length)
                        {
                            wheresql = "where";
                            for (int i = 0; i < fields.Length; i++)
                            {
                                if (i != fields.Length - 1)
                                {
                                    if(IsNumeric(values[i]))
                                    {
                                        wheresql = wheresql + " " + fields[i] + " = " + values[i] + " and";
                                    }
                                    else
                                    {
                                        wheresql = wheresql + " " + fields[i] + " like '" + values[i] + "%' and";
                                    }
                                }
                                else
                                {
                                    if (IsNumeric(values[i]))
                                    {
                                        wheresql = wheresql + " " + fields[i] + " = " + values[i];
                                    }
                                    else
                                    {
                                        wheresql = wheresql + " " + fields[i] + " like '" + values[i] + "%'";
                                    }
                                }
                            }
                        }

                        string orderSql = "";

                        if (!string.IsNullOrWhiteSpace(orderby))
                        {
                            orderSql = "order by " + orderby;

                            if (!string.IsNullOrWhiteSpace(order))
                            {
                                orderSql = orderSql + " " + order;
                            }
                            else
                            {
                                orderSql = orderSql + " asc"; 
                            }
                        }

                        string innerSql = string.Format(corSql, wheresql, orderSql);

                        string sql = string.Format(skeSql, innerSql, startIndex, int.Parse(rows) + int.Parse(startIndex) - 1, orderSql);

                        string countSql = string.Format(countSkeSql, wheresql);

                        PageRecords pr = new PageRecords();

                        pr.Order = order;
                        pr.Orderby = orderby;
                        pr.Rows = int.Parse(rows);
                        pr.Fields = fields;
                        pr.Values = values;

                        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ConnectionString))
                        {
                            SqlCommand countComm = conn.CreateCommand();
                            countComm.Connection = conn;

                            SqlCommand qComm = conn.CreateCommand();
                            qComm.Connection = conn;

                            countComm.CommandText = countSql;
                            qComm.CommandText = sql;

                            conn.Open();

                            int total = int.Parse(countComm.ExecuteScalar().ToString());

                            pr.TotalRows = total;

                            IDataReader reader = qComm.ExecuteReader();

                            List<UDSAssetManagement> retValue = new List<UDSAssetManagement>();

                            while (reader.Read())
                            {
                                UDSAssetManagement ua = new UDSAssetManagement();
                                ua.Id = reader.GetInt32(0);
                                ua.Name = reader.GetString(1);
                                ua.Code = reader.GetString(2);
                                ua.Specification = reader.GetString(3);
                                ua.Number = reader.GetInt32(4);
                                ua.TotalPrice = reader.GetDecimal(5);
                                ua.TaxRate = reader.GetDecimal(6);
                                ua.Location = reader.GetString(7);
                                if (reader.IsDBNull(8))
                                    ua.StartUsingTime = null;
                                else
                                    ua.StartUsingTime = reader.GetDateTime(8);

                                if (reader.IsDBNull(9))
                                    ua.BuyingTime = null;
                                else
                                    ua.BuyingTime = reader.GetDateTime(9);

                                ua.Status = reader.GetInt32(10);
                                ua.UsingMan = reader.IsDBNull(11) ? "" : reader.GetString(11);
                                ua.Remark = reader.IsDBNull(12) ? "" : reader.GetString(12);

                                retValue.Add(ua);
                            }

                            pr.Records = retValue;

                            reader.Close();
                            conn.Close();
                        }

                        var jsonSer = new Newtonsoft.Json.JsonSerializer();
                        StringWriter sw = new StringWriter();
                        using (JsonWriter jw = new JsonTextWriter(sw))
                        {
                            jw.DateFormatString = "yyyy年MM月dd日";
                            jw.Formatting = Formatting.Indented;

                            jsonSer.Serialize(jw, pr);
                        }

                        Response.ContentType = "application/json";

                        Response.Write(sw.ToString());
                        sw.Close();
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
                case "s":
                    SqlConnection saveconn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ConnectionString);
                    SqlTransaction trans = null;
                    try
                    {
                        UDSAssetManagement asset = JsonConvert.DeserializeObject<UDSAssetManagement>(Request.Params["target"]);

                        string sql = "insert into uds_assetmanagement" +
                            "(name,code,specification,number,totalprice,taxrate,location,startusingtime,buyingtime,status,usingman,remark) " +
                            "values('{0}', '{1}', '{2}', {3}, {4}, {5}, '{6}', {7}, {8}, {9}, '{10}', '{11}');SELECT SCOPE_IDENTITY();";

                        sql = string.Format(sql, asset.Name, asset.Code, asset.Specification, asset.Number, asset.TotalPrice,
                            asset.TaxRate, asset.Location,
                            asset.StartUsingTime.HasValue ? "'" + asset.StartUsingTime.Value.ToString("yyyy-MM-dd") + "'" : "null",
                            asset.BuyingTime.HasValue ? "'" + asset.BuyingTime.Value.ToString("yyyy-MM-dd") + "'" : "null", 
                            asset.Status, 
                            asset.UsingMan, 
                            asset.Remark);

                        SqlCommand comm = saveconn.CreateCommand();
                        comm.Connection = saveconn;
                        comm.CommandText = sql;

                        saveconn.Open();
                        trans = saveconn.BeginTransaction();
                        comm.Transaction = trans;

                        int newid = int.Parse(comm.ExecuteScalar().ToString());

                        trans.Commit();

                        saveconn.Close();

                        Response.Write(newid.ToString());
                    }
                    catch (Exception eX)
                    {
                        if (null != trans)
                            trans.Rollback();

                        Response.StatusCode = 400;
                        Response.Write(eX.Message);
                    }
                    finally
                    {
                        if (ConnectionState.Open == saveconn.State)
                            saveconn.Close();

                        Response.End();
                    }
                    break;
                case "u":
                    SqlConnection updconn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ConnectionString);
                    SqlTransaction updtrans = null;
                    try
                    {
                        UDSAssetManagement asset = JsonConvert.DeserializeObject<UDSAssetManagement>(Request.Params["target"]);

                        string sql = "update uds_assetmanagement" +
                            " set name = '{0}', code = '{1}', specification = '{2}', number = {3}, " +
                            "totalprice = {4}, taxrate = {5}, location = '{6}', startusingtime = {7}, buyingtime = {8}, " +
                            "status = {9}, usingman = '{10}', remark = '{11}' " +
                            "where id = {12}";

                        sql = string.Format(sql, asset.Name, asset.Code, asset.Specification, asset.Number, asset.TotalPrice,
                            asset.TaxRate, asset.Location,
                            asset.StartUsingTime.HasValue ? "'" + asset.StartUsingTime.Value.ToString("yyyy-MM-dd") + "'" : "null",
                            asset.BuyingTime.HasValue ? "'" + asset.BuyingTime.Value.ToString("yyyy-MM-dd") + "'" : "null", 
                            asset.Status, 
                            asset.UsingMan, 
                            asset.Remark,
                            asset.Id);

                        SqlCommand comm = updconn.CreateCommand();
                        comm.Connection = updconn;
                        comm.CommandText = sql;

                        updconn.Open();
                        updtrans = updconn.BeginTransaction();
                        comm.Transaction = updtrans;

                        comm.ExecuteNonQuery();

                        updtrans.Commit();

                        updconn.Close();
                    }
                    catch (Exception eX)
                    {
                        if (null != updtrans)
                            updtrans.Rollback();

                        Response.StatusCode = 400;
                        Response.Write(eX.Message);
                    }
                    finally
                    {
                        if (ConnectionState.Open == updconn.State)
                            updconn.Close();

                        Response.End();
                    }
                    break;
            }
        }
    }
}