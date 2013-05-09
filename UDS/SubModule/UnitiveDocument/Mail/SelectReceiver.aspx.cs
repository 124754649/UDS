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
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Web.Script.Serialization;
using System.IO;
using Newtonsoft.Json;
namespace MaiSystem
{
    [DataContract]
    internal class ListAccount
    {
        [DataMember]
        internal string RealName;
        [DataMember]
        internal string StaffName;
    }

    [DataContract]
    internal class Position
    {
        [DataMember]
        internal string PositionName;
        [DataMember]
        internal string PositionID;
    }

	/// <summary>
	/// SelectReceiver 的摘要说明。
	/// </summary>
	public class SelectReceiver : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label lblReceiver;
		protected System.Web.UI.WebControls.Label lblCc;
		protected System.Web.UI.WebControls.Label lblBcc;
		protected System.Web.UI.WebControls.Label lblAddressBook;
		protected System.Web.UI.WebControls.DropDownList listAddressBook;
		//protected System.Web.UI.WebControls.DropDownList listAccount;
		public string ClassID,DispType;
		//protected System.Web.UI.WebControls.DropDownList listDept;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			ClassID		= Request.QueryString["ClassID"].ToString();
			DispType	= Request.QueryString["type"].ToString();
            string result = Request.QueryString["resulttype"];
            string depid = Request.QueryString["dep"];

			if(!Page.IsPostBack )
			{
                if (string.IsNullOrEmpty(result))
                {
                    
                }
                else
                {
                    Staff staff = new Staff();
                    switch (result)
                    {
                        case "staff":
                            ICollection retValue;

                            if (DispType == "1")
                            {
                                if (string.IsNullOrEmpty(depid) || "0" == depid)
                                {
                                    retValue = staff.GetStaffInTeam(Int32.Parse(ClassID));
                                }
                                else
                                {
                                    retValue = staff.GetStaffInTeam(int.Parse(depid));
                                }
                            }
                            else
                            {
                                retValue = staff.GetAllStaffs().ToDataTable(true).DefaultView;
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
                            List<Position> retPoss = new List<Position>();
                            foreach (DataRow dr in ds.Rows)
                            {
                                Position p = new Position();
                                p.PositionID = dr["Position_ID"].ToString();
                                p.PositionName = dr["Position_Name"].ToString();
                                retPoss.Add(p);
                            }

                            Position fp = new Position();
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
