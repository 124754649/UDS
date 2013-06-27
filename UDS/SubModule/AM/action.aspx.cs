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

namespace UDS.SubModule.AM
{
    public partial class action : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string skeSql = "select * from ({0}) as a where rowno >= {1} and rowno <= {2} {3}";

            string corSql = "select id, name, code, specification, number, totalprice, taxrate, location, startusingtime, buyingtiem, status, usingman, remark, " +
                "row_number() over ({1}) as rowno " +
                "from uds_assetmanagement {0}";

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
                        string[] fields = (queryStyle.fields as JArray);
                        string[] values = queryStyle.values;

                        List<UDSAssetManagement> retValue = new List<UDSAssetManagement>();

                        UDSAssetManagement uam1 = new UDSAssetManagement()
                        {
                            Name = "测试1",
                            Code = "test1",
                            Id = 1,
                            BuyingTime = DateTime.Now,
                            StartUsingTime = DateTime.Now
                        };

                        UDSAssetManagement uam2 = new UDSAssetManagement()
                        {
                            Name = "测试2",
                            Code = "test2",
                            Id = 2,
                            BuyingTime = DateTime.Now,
                            StartUsingTime = DateTime.Now
                        };

                        PageRecords pr = new PageRecords();

                        pr.Order = order;
                        pr.Orderby = orderby;
                        pr.Rows = int.Parse(rows);
                        pr.TotalRows = 2;

                        retValue.Add(uam1);
                        retValue.Add(uam2);

                        pr.Records = retValue;

                        var jsonSer = new Newtonsoft.Json.JsonSerializer();
                        StringWriter sw = new StringWriter();
                        using (JsonWriter jw = new JsonTextWriter(sw))
                        {
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
            }
        }
    }
}