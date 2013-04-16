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
	/// SelectProject ��ժҪ˵����
	/// </summary>
	public class SelectProject : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.ListBox lbProject;
		protected System.Web.UI.WebControls.Button cmdOK;
		protected System.Web.UI.WebControls.Button cmdCancel;
		private string UserName;
		private long DocID;
		private long DefineID;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// �ڴ˴������û������Գ�ʼ��ҳ��
			UserName = Request.Cookies["UserName"].Value.ToString();
			DocID =Int32.Parse( Request["DocID"].ToString());
			DefineID =Int32.Parse( Request["DefineID"].ToString());

			if(!Page.IsPostBack)
				Bingding();
		}

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
			this.cmdOK.Click += new System.EventHandler(this.cmdOK_Click);
			this.cmdCancel.Click += new System.EventHandler(this.cmdCancel_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
		private void Bingding()
		{
			SqlDataReader dr;
			Database mySQL = new Database();
			SqlParameter[] p2 = {
									mySQL.MakeInParam("@StaffName",SqlDbType.VarChar,300,UserName)
			};						

			mySQL.RunProc("sp_Flow_GetParentProject",p2,out dr); 	
			
			lbProject.Items.Clear();
			while(dr.Read())
			{
				lbProject.Items.Add(new ListItem(dr["ClassName"].ToString(),dr["ClassID"].ToString()));
			}

			dr.Close();
			mySQL.Close();

		}
		private void cmdCancel_Click(object sender, System.EventArgs e)
		{
			UDS.Components.DocumentFlow df = new UDS.Components.DocumentFlow();

			df.DeleteDocument(DocID);
			df =null;
			Server.Transfer("Listview.aspx");
		}

		private void cmdOK_Click(object sender, System.EventArgs e)
		{
			if(lbProject.SelectedIndex>=0)
			{
				long ProjectID =Int32.Parse(lbProject.Items[lbProject.SelectedIndex].Value.ToString());
				UDS.Components.DocumentFlow df = new UDS.Components.DocumentFlow();
				
//				df.DoMessage(df.PostDocument(UserName,DocID,DefineID,ProjectID),DocID);

				df = null;
				Server.Transfer("ListDocument.aspx?DisplayType=1");
			}
			else
			{
				Response.Write("<script language='javascript'>alert('��ѡ��һ����Ŀ��');</script>");
			}
		}
	}
}
