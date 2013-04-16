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
	/// PostilDocument 的摘要说明。
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
			// 在此处放置用户代码以初始化页面

			//cmdCancel.Attributes.Add("onclick","javascript:window.close();");
			DocID = Int32.Parse(Request["DocID"].ToString());
			Operation = Int32.Parse(Request["Operation"].ToString());
			UserName = Request.Cookies["UserName"].Value.ToString();
			switch(Operation)
			{
				case 1:
					labTitle.Text ="通过批注:";
					break;
				case 2:
					labTitle.Text ="失败批注:";
					break;
				case 3:
					labTitle.Text ="完成批注:";
					break;
				default:
					break;
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
				//发送到下一环节
				switch(df.GetTacheRule(DefineID))
				{					
					case 0:													//按项目走	
						if(df.GetParentProjectAccount(UserName)>0)			//有上级项目
						{	
							df = null;
							Server.Transfer("SelectProject.aspx?DocID=" + lDocID.ToString() + "&DefineID=" + DefineID.ToString());							
						}
						else												//没有上级项目
						{										
							Response.Write("<script language='javascript'>alert('" + df.DoMessage(-3,lDocID) + "');</script>");
							df = null;
						}
						break;					
					case 1:													//按部门走		
						Response.Write("<script language='javascript'>alert('" + df.DoMessage(df.PostDocument(UserName,DocID,DefineID,0),DocID) + "');</script>");
						break;					
					case 2:													//其他：环节全部的人都走
						break;
					default:
						break;
				}
			}
			else
				df.FinishDocument(lDocID);									//没有下一环节，结束

			df = null;
						
		}

	}
}
