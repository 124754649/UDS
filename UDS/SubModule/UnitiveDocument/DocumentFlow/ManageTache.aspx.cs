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
using System.Data.SqlClient;

namespace UDS.SubModule.UnitiveDocument.DocumentFlow
{
	/// <summary>
	/// ManageTache 的摘要说明。
	/// </summary>
	public class ManageTache : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Button cmdNewTache;
		protected System.Web.UI.WebControls.Button cmdDeleteTache;
		protected System.Web.UI.WebControls.DataGrid dgTacheList;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
			if(!Page.IsPostBack)
			{
				Bangding();
				cmdDeleteTache.Attributes["OnClick"] = "javascript:return confirm('您确认要删除这些环节吗?');";
			}
		}
		#region 绑定DBGRID
		private void Bangding()
		{

			UDS.Components.DocumentFlow df = new UDS.Components.DocumentFlow();

			DataTable dt;
			df.GetTache(0,out dt);
		
			dgTacheList.DataSource = dt.DefaultView;
			dgTacheList.DataBind();

			df =null;
		}
		#endregion

		#region 翻页事件
		public void DataGrid_PageChanged(object sender,DataGridPageChangedEventArgs e)
		{
			dgTacheList.CurrentPageIndex = e.NewPageIndex;
			Bangding();
		}
		#endregion

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
			this.cmdNewTache.Click += new System.EventHandler(this.cmdNewTache_Click);
			this.cmdDeleteTache.Click += new System.EventHandler(this.cmdDeleteTache_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private string GetSelectedItemID(string controlID)
		{
			String selectedID;
			selectedID = "";
			//遍历DataGrid获得checked的ID
			foreach (DataGridItem item in dgTacheList.Items)
			{
				if(((CheckBox)item.FindControl(controlID)).Checked==true )
					selectedID += dgTacheList.DataKeys[item.ItemIndex] + ",";
			}
			if(selectedID.Length>0)
				selectedID=selectedID.Substring(0,selectedID.Length-1);
			return selectedID;
		}
	
		public string TranslateRightToFinish(string tStr)
		{
			string str="";
			if(tStr=="True")
			{
				str = "可以结束";
			}
			else
			{
				str = "不可结束";
			}
			
			return str;
		}

		public string TranslatePassNum(string tStr)
		{
			string str="";
			if(tStr=="0")
				str = "单人通过";
			if(Int32.Parse(tStr)>0)
				str = tStr.ToString() + "人会签";
			if(Int32.Parse(tStr)<0)
				str = "全体通过";

			return str;

		}

		public string TranslateFlowRule(string tStr)
		{
			switch(tStr)
			{
				case "0":
					return "默认全体";
				case "1":
					return "按部门";
				case "2" :
					return "按项目";
				default:
					return "未知";
			}
		}

		private void cmdNewTache_Click(object sender, System.EventArgs e)
		{
			Server.Transfer("EditTache.aspx");
		}

		private void cmdDeleteTache_Click(object sender, System.EventArgs e)
		{
			string TacheID = GetSelectedItemID("cboTacheID");
			UDS.Components.DocumentFlow df = new UDS.Components.DocumentFlow();
			
			
			df.DeleteTache(TacheID);
			df = null;

			Bangding();
		
		}

	}
}
