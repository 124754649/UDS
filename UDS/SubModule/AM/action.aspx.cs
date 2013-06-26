using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;

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

            dynamic queryStyle = JValue.Parse(Request.Params["qs"]);

            if ("q" == queryStyle.method)
            {
                string startIndex = queryStyle.startIndex;
                string orderby = queryStyle.orderby;
                string order = queryStyle.order;
                string rows = queryStyle.rows;
                string[] fields = queryStyle.fields;
                string[] values = queryStyle.values;
            }
        }
    }
}