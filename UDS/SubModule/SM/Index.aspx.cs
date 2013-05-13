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
using System.Data.SqlClient;
using UDS.Components;
using UDS.Entity;
using System.Collections.Generic;
using System.IO;
using Newtonsoft.Json;

namespace UDS.SubModule.SM
{
	/// <summary>
	/// Index 的摘要说明。
	/// </summary>
	public class Index : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Button btnRead;
		protected System.Web.UI.WebControls.DataGrid dgMsgList;
		protected System.Web.UI.WebControls.Button btnDelete;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			string Username		 = (Request.QueryString["Username"]!=null)?Request.QueryString["Username"].ToString():Request.Cookies["Username"].Value.ToString();
			string DispType		 = (Request.QueryString["DispType"]!=null)?Request.QueryString["DispType"].ToString():"1";

            string result = Request.Params["result"];

			if(!Page.IsPostBack)
			{
                if (string.IsNullOrEmpty(result))
                {
                    BindGrid(Username, DispType);
                    Session["MsgDispType"] = DispType;
                    this.btnDelete.Attributes["onclick"] = "javascript:return confirm('您确认要删除吗?');";
                }
                else
                {
                    SMS sm = new SMS();
                    SqlDataReader dreader = null;
                    try
                    {
                        dreader = sm.GetMyReceive(Username);

                        DataTable dt = dreader.ToDataTable(true);

                        List<UDSSMS> retList = new List<UDSSMS>();

                        foreach (DataRow dr in dt.Rows)
                        {
                            if (dr.IsNull("isread") || !bool.Parse(dr["isread"].ToString()))
                            {
                                UDSSMS sms = new UDSSMS()
                                {
                                    Id = dr["ID"].ToString(),
                                    Content = dr["content"].ToString(),
                                    IsRead = dr.IsNull("isread") ? false : bool.Parse(dr["isread"].ToString()),
                                    ReceiverRealName = dr["ReceiverRealName"].ToString(),
                                    Sender = dr["sender"].ToString(),
                                    SenderRealName = dr["senderrealname"].ToString(),
                                    SendTime = DateTime.Parse(dr["sendtime"].ToString()).ToString(),
                                    Type = dr["type"].ToString()
                                };

                                retList.Add(sms);
                            }
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
                        Response.Flush();
                        Response.End();
                    }
                    catch (Exception eX)
                    {
                        if (null != dreader)
                        {
                            if (!dreader.IsClosed)
                            {
                                dreader.Close();
                            }
                        }

                        Response.StatusCode = 400;
                        Response.ContentType = "text/html";
                        Response.Write(eX.Message);
                        Response.End();
                    }
                }
			}
		}

		#region 数据绑定至DataGrid
		/// <summary>
		/// 将用户的短讯记录显示在datagrid上
		/// </summary>
		protected void BindGrid(string Username,string DispType) 
		{   
			SMS sm = new SMS();
			SqlDataReader dr = null;
			if(DispType=="1") //我的所的接收
			{
				try
				{
					dr = sm.GetMyReceive(Username);
					dgMsgList.DataSource = UDS.Components.Tools.ConvertDataReaderToDataTable(dr).DefaultView;
					dgMsgList.DataBind();
				}
				catch
				{
					Server.Transfer("../Error.aspx");
				}
			}
			
			
			if(DispType=="2") //我所发送
			{
				try
				{
					dr = sm.GetMySent(Username);
					dgMsgList.DataSource = UDS.Components.Tools.ConvertDataReaderToDataTable(dr).DefaultView;
					dgMsgList.DataBind();
				}
				catch
				{
					Server.Transfer("../Error.aspx");
				}

			}

			switch (DispType)
			{
				case "1":
					dgMsgList.Columns[2].Visible = false; //　隐藏收件人
					break;
				case "2":
					dgMsgList.Columns[1].Visible = false; //　隐藏收件人
					this.btnRead .Visible = false;         //隐藏已阅按钮
					this.btnDelete .Visible = false;       //隐藏删除按钮
					break;
				default: 
					break;
			}


			sm = null;
			dr = null;
		}
		#endregion


		#region 翻页事件
		public void DataGrid_PageChanged(object sender,DataGridPageChangedEventArgs e)
		{
			dgMsgList.CurrentPageIndex = e.NewPageIndex;
			BindGrid(Request.Cookies["Username"].Value.ToString(),Session["MsgDispType"]!=null?Session["MsgDispType"].ToString():"1");
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
			this.btnRead.Click += new System.EventHandler(this.btnRead_Click);
			this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
			this.ID = "Index";
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btnDelete_Click(object sender, System.EventArgs e)
		{
			SMS sm		= new SMS();
			string ids			  = "";
			foreach(DataGridItem dgi in dgMsgList.Items)
			{
				CheckBox cb=(CheckBox)(dgi.Cells[0].Controls[1]);
				if (cb.Checked==true)
				{
					int i		= dgi.ItemIndex;
					string id	= dgMsgList.DataKeys[i].ToString();				
					ids+= id+",";
				}
			}
			if(ids.EndsWith(",")) ids = ids.Substring(0,ids.Length-1);
			//选择为空
			if( ids==String.Empty)
			{
				Response.Write("<script language=javascript>alert('请选择消息!');window.location='Index.aspx?DispType="+Session["MsgDispType"].ToString()+"';</script>");
			}
			else
			{
				if(sm.MsgDelete(ids))
				{
					Response.Write("<script language=javascript>alert('短讯删除成功!');window.location='Index.aspx?DispType="+Session["MsgDispType"].ToString()+"';</script>");
				}
			}
		
		}

		private void btnRead_Click(object sender, System.EventArgs e)
		{
			SMS sm		= new SMS();
			string Username		 = (Request.QueryString["Username"]!=null)?Request.QueryString["Username"].ToString():Request.Cookies["Username"].Value.ToString();
			string ids			  = "";
			foreach(DataGridItem dgi in dgMsgList.Items)
			{
				CheckBox cb=(CheckBox)(dgi.Cells[0].Controls[1]);
				if (cb.Checked==true)
				{
					int i		= dgi.ItemIndex;
					string id	= dgMsgList.DataKeys[i].ToString();				
					ids+= id+",";
				}
			}
			if(ids.EndsWith(",")) ids = ids.Substring(0,ids.Length-1);
			//选择为空
			if( ids==String.Empty)
			{
				Response.Write("<script language=javascript>alert('请选择消息!');window.location='Index.aspx?DispType="+Session["MsgDispType"].ToString()+"';</script>");
			}
			else
			{
				if(sm.ReadMsg(ids,Username))
				{
					Response.Write("<script language=javascript>alert('短讯已阅!');window.location='Index.aspx?DispType="+Session["MsgDispType"].ToString()+"';</script>");
				}
			}
		
		
		}
	}
}
