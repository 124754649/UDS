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
	/// ManageTache ��ժҪ˵����
	/// </summary>
	public class ManageTache : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Button cmdNewTache;
		protected System.Web.UI.WebControls.Button cmdDeleteTache;
		protected System.Web.UI.WebControls.DataGrid dgTacheList;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// �ڴ˴������û������Գ�ʼ��ҳ��
			if(!Page.IsPostBack)
			{
				Bangding();
				cmdDeleteTache.Attributes["OnClick"] = "javascript:return confirm('��ȷ��Ҫɾ����Щ������?');";
			}
		}
		#region ��DBGRID
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

		#region ��ҳ�¼�
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
			// CODEGEN���õ����� ASP.NET Web ���������������ġ�
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// �����֧������ķ��� - ��Ҫʹ�ô���༭���޸�
		/// �˷��������ݡ�
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
			//����DataGrid���checked��ID
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
				str = "���Խ���";
			}
			else
			{
				str = "���ɽ���";
			}
			
			return str;
		}

		public string TranslatePassNum(string tStr)
		{
			string str="";
			if(tStr=="0")
				str = "����ͨ��";
			if(Int32.Parse(tStr)>0)
				str = tStr.ToString() + "�˻�ǩ";
			if(Int32.Parse(tStr)<0)
				str = "ȫ��ͨ��";

			return str;

		}

		public string TranslateFlowRule(string tStr)
		{
			switch(tStr)
			{
				case "0":
					return "Ĭ��ȫ��";
				case "1":
					return "������";
				case "2" :
					return "����Ŀ";
				default:
					return "δ֪";
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
