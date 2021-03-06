﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using UDS.Entity;

namespace UDS.SubModule.AFK
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string m = Request.Params["m"];

            switch(m.ToUpper())
            {
                case "AFL":
                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ConnectionString))
                    {
                        try
                        {
                            SqlCommand comm = new SqlCommand();
                            comm.CommandText = "select name, reason from vw_askforleave_list";
                            comm.Connection = conn;

                            List<AFKList> retValues = new List<AFKList>();

                            conn.Open();

                            SqlDataReader reader = comm.ExecuteReader();
                            while (reader.Read())
                            {
                                AFKList r = new AFKList();
                                r.Name = reader.GetString(0);
                                r.Reason = reader.GetString(1);

                                retValues.Add(r);
                            }
                            reader.Close();
                            conn.Close();

                            Response.ContentType = "application/json";

                            Response.Write(JsonConvert.SerializeObject(retValues, 
                                Formatting.Indented, 
                                new IsoDateTimeConverter() { DateTimeFormat = "yyyy年MM月dd日" }));
                        }
                        catch (Exception eX)
                        {
                            Response.StatusCode = 400;
                            Response.Write(eX.Message);
                        }
                        finally
                        { 
                            if(ConnectionState.Open == conn.State)
                                conn.Close();

                            Response.End();
                        }
                    }
                    break;
                case "AFK":
                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ConnectionString))
                    {
                        try
                        {
                            SqlCommand comm = new SqlCommand();
                            comm.CommandText = "select name, duration, remark, reason, startingHour, startingMinute, expiringHour, expiringMinute " +
                                "from vw_afk_list";
                            comm.Connection = conn;

                            List<AFKEntity> retValues = new List<AFKEntity>();

                            conn.Open();

                            SqlDataReader reader = comm.ExecuteReader();
                            while (reader.Read())
                            {
                                AFKEntity r = new AFKEntity();
                                r.Name = reader.GetString(0);
                                r.Duration = reader.GetString(1);
                                r.Remark = reader.GetString(2);
                                r.Reason = reader.GetString(3);
                                r.StartingHour = reader.GetString(4);
                                r.StartingMinute = reader.GetString(5);
                                r.ExpiringHour = reader.GetString(6);
                                r.ExpiringMinute = reader.GetString(7);

                                retValues.Add(r);
                            }
                            reader.Close();
                            conn.Close();

                            Response.ContentType = "application/json";

                            Response.Write(JsonConvert.SerializeObject(retValues, 
                                Formatting.Indented, 
                                new IsoDateTimeConverter() { DateTimeFormat = "yyyy年MM月dd日" }));
                        }
                        catch (Exception eX)
                        {
                            Response.StatusCode = 400;
                            Response.Write(eX.Message);
                        }
                        finally
                        {
                            if (ConnectionState.Open == conn.State)
                                conn.Close();

                            Response.End();
                        }
                    }
                    break;
            }
        }
    }
}