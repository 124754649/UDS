using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using UDS.Components;
using MaiSystem;
using System.IO;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace UDS.SubModule.SM
{
	/// <summary>
	/// SelectReceiver 的摘要说明。
	/// </summary>
	public class SelectReceiver : System.Web.UI.Page
	{
		//protected System.Web.UI.WebControls.DropDownList listAccount;
		//protected System.Web.UI.WebControls.Label lblReceiver;
		//protected System.Web.UI.WebControls.Label lblMReceiver;
		//protected System.Web.UI.WebControls.DropDownList listDept;

        private void Page_Load(object sender, System.EventArgs e)
        {
            string resulttyep = Request.Params["result"];
            string depid = Request.Params["dep"];

            if (!Page.IsPostBack)
            {
                if (string.IsNullOrEmpty(resulttyep))
                {
                    
                }
                else
                {
                    UDS.Components.Staff staff = new UDS.Components.Staff();

                    switch (resulttyep)
                    {
                        case "staff":
                            ICollection retValue;

                            if (string.IsNullOrEmpty(depid) || "0" == depid)
                            {
                                retValue = staff.GetAllStaffs().ToDataTable(true).DefaultView;
                            }
                            else
                            {
                                retValue = staff.GetStaffByPosition(Int32.Parse(depid));
                            }

                            IList retList = new ArrayList();
                            var em = retValue as DataView;
                            foreach (DataRow dr in em.Table.Rows)
                            {
                                ListAccount la = new ListAccount();
                                la.RealName = dr["RealName"].ToString();
                                la.StaffName = dr["Staff_Name"].ToString();
                                retList.Add(la);
                            }

                            var jsonSer = new Newtonsoft.Json.JsonSerializer();
                            StringWriter sw = new StringWriter();
                            using (JsonWriter jw = new JsonTextWriter(sw))
                            {
                                jw.Formatting = Formatting.Indented;

                                jsonSer.Serialize(jw, retList);
                            }

                            Response.ContentType = "text/json";

                            Response.Write(sw.ToString());
                            sw.Close();
                            Response.End();
                            break;
                        case "position":
                            DataTable ds = staff.GetPositionList(1).ToDataTable(true);
                            List<MaiSystem.Position> retPoss = new List<MaiSystem.Position>();
                            foreach (DataRow dr in ds.Rows)
                            {
                                MaiSystem.Position p = new MaiSystem.Position();
                                p.PositionID = dr["Position_ID"].ToString();
                                p.PositionName = dr["Position_Name"].ToString();
                                retPoss.Add(p);
                            }

                            MaiSystem.Position fp = new MaiSystem.Position();
                            fp.PositionName = "公司所有部门";
                            fp.PositionID = "0";
                            retPoss.Insert(0, fp);

                            var posSer = new Newtonsoft.Json.JsonSerializer();
                            StringWriter possw = new StringWriter();
                            using (JsonWriter jw = new JsonTextWriter(possw))
                            {
                                jw.Formatting = Formatting.Indented;

                                posSer.Serialize(jw, retPoss);
                            }

                            Response.ContentType = "text/json";

                            Response.Write(possw.ToString());
                            possw.Close();
                            Response.End();
                            break;
                    }
                }
            }
        }

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN：该调用是 ASP.NET Web 窗体设计器所必需的。
			//
			InitializeComponent();
			base.OnInit(e);
		}
								
		/// <summary>
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
					{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
}
