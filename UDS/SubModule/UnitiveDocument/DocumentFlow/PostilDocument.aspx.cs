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
	/// PostilDocument ��ժҪ˵����
	/// </summary>
	public class PostilDocument : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Button cmdOK;
		protected System.Web.UI.WebControls.TextBox txtPostil;
		private long DocID;
		private int Operation;
		protected System.Web.UI.WebControls.Label labTitle;
		private string UserName;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// �ڴ˴������û������Գ�ʼ��ҳ��

			//cmdCancel.Attributes.Add("onclick","javascript:window.close();");
			DocID = Int32.Parse(Request["DocID"].ToString());
			Operation = Int32.Parse(Request["Operation"].ToString());
			UserName = Request.Cookies["UserName"].Value.ToString();
			switch(Operation)
			{
				case 1:
					labTitle.Text ="ͨ����ע:";
					break;
				case 2:
					labTitle.Text ="ʧ����ע:";
					break;
				case 3:
					labTitle.Text ="�����ע:";
					break;
				default:
					break;
			}

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
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void cmdOK_Click(object sender, System.EventArgs e)
		{

			UDS.Components.DocumentFlow df =new UDS.Components.DocumentFlow();
			
			df.AddPostil(UserName,DocID,txtPostil.Text,Operation);
									
			switch(Operation)
			{
				case 1:
					NextDocument(DocID);
					break;
				case 2:
					df.FaileDocument(DocID);					
					break;
				case 3:
					df.FinishDocument(DocID);					
					break;
				default:
					break;
			}
			
			df = null;
			Server.Transfer("ListDocument.aspx?DisplayType=3");

			//Response.Write("<script laguage='javascript'>window.close();</script>");
		}

		private void NextDocument(long lDocID)
		{
			long DefineID;			
			
			UDS.Components.DocumentFlow df =new UDS.Components.DocumentFlow();

			DefineID = df.GetNextDefineID(lDocID);							

			if(DefineID>0)
			{
				//���͵���һ����
				switch(df.GetTacheRule(DefineID))
				{					
					case 0:													//����Ŀ��	
						if(df.GetParentProjectAccount(UserName)>0)			//���ϼ���Ŀ
						{	
							df = null;
							Server.Transfer("SelectProject.aspx?DocID=" + lDocID.ToString() + "&DefineID=" + DefineID.ToString());							
						}
						else												//û���ϼ���Ŀ
						{										
							Response.Write("<script language='javascript'>alert('" + df.DoMessage(-3,lDocID) + "');</script>");
							df = null;
						}
						break;					
					case 1:													//��������		
						Response.Write("<script language='javascript'>alert('" + df.DoMessage(df.PostDocument(UserName,DocID,DefineID,0),DocID) + "');</script>");
						break;					
					case 2:													//����������ȫ�����˶���
						break;
					default:
						break;
				}
			}
			else
				df.FinishDocument(lDocID);									//û����һ���ڣ�����

			df = null;
						
		}

	}
}
