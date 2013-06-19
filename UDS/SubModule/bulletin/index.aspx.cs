using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UDS.SubModule.bulletin
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string method = Request.Params["m"];

            switch(method)
            {
                case "uuid":
                    string uuid = Guid.NewGuid().ToString();
                    string dir = Path.Combine(Server.MapPath("~/App_Browsers"), uuid);
                    if(!Directory.Exists(dir))
                        Directory.CreateDirectory(dir);

                    Response.Write(uuid);
                    Response.End();
                    break;
                default:
                    Response.StatusCode = 400;
                    Response.Write("错误的请求");
                    Response.End();
                    break;
            }
        }
    }
}