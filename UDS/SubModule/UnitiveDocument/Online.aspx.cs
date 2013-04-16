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
using System.Web.Security;

namespace UDS.SubModule.UnitiveDocument
{
	/// <summary>
	/// Online 的摘要说明。
	/// </summary>
	public class Online : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Literal lit;
		protected System.Web.UI.WebControls.Label lblOnlineCount;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			if(!Page.IsPostBack)
			{
				CheckUpdate();
			}
		}

		private void CheckUpdate()
		{
			
			#region 1.更新activetime 2.判断sessionid 3.删除十分钟内未活动人 4.拿到最新在线人数
			SMS sm = new SMS();
			try 
			{
				// ReturnID -1 是指非法登陆 -2指有新的短消息
				string Username = Request.Cookies["Username"].Value.ToString();
				string SessionID = Request.Cookies["ASP.NET_SessionId"].Value.ToString();
				string NodeID = (Request.Cookies["ActiveNodeID"]!=null)?Request.Cookies["ActiveNodeID"].Value.ToString():"0";
				//UDS.Components .Error.Log(Username+"11"+SessionID+"||"+NodeID);
				string ReturnStr = sm.CheckUpdate(Username,SessionID,Int32.Parse(NodeID));
				string ReturnID = ReturnStr.Substring(0,ReturnStr.IndexOf("|"));
				string NewMsgFlag = ReturnStr.Substring(ReturnStr.IndexOf("|")+1);
				if(ReturnID!="-1")
				{
					if(NewMsgFlag=="1") //incoming a new msg
					{
						if(Request.Cookies["UDS_RemindType"]!=null)
						{
							if(Request.Cookies["UDS_RemindType"].Value.ToString()=="1")
								lit.Text="<script language=javascript> mytop=screen.availHeight-310;myleft=0;var newmsgwin=window.open('../SM/MsgManage.aspx','auto_call_show','height=230,width=400,status=0,toolbar=no,menubar=no,location=no,scrollbars=yes,top='+mytop+',left='+myleft+',resizable=yes');newmsgwin.focus();</script>";
							else
								lit.Text = "<a href='#' onclick='show_sm()'><img src='../../Images/smsremind.gif' border=0></a>";
						}
						else
						{
							lit.Text="<script language=javascript> mytop=screen.availHeight-310;myleft=0;var newmsgwin=window.open('../SM/MsgManage.aspx','auto_call_show','height=230,width=400,status=0,toolbar=no,menubar=no,location=no,scrollbars=yes,top='+mytop+',left='+myleft+',resizable=yes');newmsgwin.focus();</script>";
						}
					}

					this.lblOnlineCount.Text = ReturnID.ToString();
				}
				else
				{
					// clear everything
					//FormsAuthentication.SignOut();
				//	Request.Cookies.Clear();
				//	HttpCookie UserCookie     = new HttpCookie("UserID", string.Empty);
				//	HttpCookie UserNameCookie = new HttpCookie("Username", string.Empty);

				//	Response.Cookies.Add(UserCookie);
				//	Response.Cookies.Add(UserNameCookie);
				//	Session.Clear();
	
					Response.Write("<script language=javascript>alert('有相同用户登陆或同一机器两用户登陆,窗口将自动关闭!');top.close();</script>");
				}	
					

			}
			catch(Exception ex)
			{
				UDS.Components.Error.Log(ex.ToString());
				Server.Transfer("../Error.aspx");
			}
			#endregion
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
