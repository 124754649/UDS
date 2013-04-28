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
using System.Configuration;  

namespace UDS.SubModule.UnitiveDocument.MoveTeam
{
	/// <summary>
	/// TreeView 的摘要说明。
	/// </summary>
	public class TreeView : System.Web.UI.Page
	{
        protected System.Web.UI.WebControls.TreeView TreeView1;
		protected DataTable dataTbl1,dataTbl2;
		protected String Action="";
		public  String ToID="",FromID="";
        private string nodeTemplate = "<span class='treenodespan' data-id='{0}' data-text='{1}'>{1}</span>";

		private void Page_Load(object sender, System.EventArgs e)
		{
			FromID	 = (Request.QueryString["FromID"]!=null)?Request.QueryString["FromID"].ToString():"";

			if(!Page.IsPostBack)
			{	
				Action	 = (Request.QueryString["Action"]!=null)?Request.QueryString["Action"].ToString():"";
				
				if(Action=="1")
				{
					ToID	 = (Request.QueryString["ToID"]!=null)?Request.QueryString["ToID"].ToString():"";
					UDS.Components.ProjectClass prj = new UDS.Components.ProjectClass();
                    try
                    {
                        prj.Remove(Int32.Parse(FromID), Int32.Parse(ToID));
                        Response.StatusCode = 200;
                        Response.Write("OK");
                    }
                    catch (Exception eX)
                    {
                        Response.StatusCode = 400;
                        Response.StatusDescription = eX.Message;
                        Response.Write(eX.Message);
                    }
                    finally
                    {
                        prj = null;
                    }

                    Response.End();
				}
				InitRootNodeDataTable();
				InitTreeRootNode(TreeView1.Nodes);			    
			}
		}

		/// <summary>
		/// 初始化 RootNode DataTable
		/// </summary>
		private void InitRootNodeDataTable()
		{
			Database data = new Database();
			SqlDataReader dataReader = null;
			String username = Request.Cookies["Username"].Value.ToString();
			SqlParameter[] prams = {
									   data.MakeInParam("@UserName",      SqlDbType.VarChar , 20, username),
									   data.MakeInParam("@RightCode",      SqlDbType.Int , 1, 1),
									   data.MakeInParam("@IncludeFunctionNode",      SqlDbType.Int , 1, 0)	
								   };
			try
			{
				data.RunProc("sp_GetShowClass", prams,out dataReader);
			}
			catch(Exception ex)
			{
				Response.Write(ex.ToString());
				//UDS.Components.Error.Log(ex.ToString());
			}
			dataTbl1 = dataReader.ToDataTable(true); 
			dataTbl1.TableName = "TreeView";
		}

		/// <summary>
		/// 初始化 ChildNode DataTable
		/// </summary>
		private void InitChildNodeDataTable(int ClassParentID)
		{
			Database data = new Database();
			SqlDataReader dataReader = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@Class_id",      SqlDbType.Int  , 20, ClassParentID)
								   };
			try
			{
				data.RunProc("sp_GetAllChildClass", prams,out dataReader);
			}
			catch(Exception ex)
			{
				Response.Write(ex.ToString());
				//UDS.Components.Error.Log(ex.ToString());
			}
			dataTbl2 = dataReader.ToDataTable(true); 
			dataTbl2.TableName = "TreeView";
		}

		/// <summary>
		/// 初始化TreeView 的 RootNode
		/// </summary>
		private void InitTreeRootNode(TreeNodeCollection TNC)
		{
			DataView dataView  = new DataView();
			dataView		   = dataTbl1.Copy().DefaultView;
			dataView.RowFilter = "ClassParentID = ClassID";
            
			foreach(DataRowView drv in dataView)
			{	
				TreeNode tn    = new TreeNode();
				tn.Value		   = drv["ClassID"].ToString();
				//tn.Text		   = drv["ClassName"].ToString();
                tn.Text = string.Format(nodeTemplate, tn.Value, drv["ClassName"].ToString());

				tn.ImageUrl    = GetIcon(drv["ClassType"].ToString());
                tn.SelectAction = TreeNodeSelectAction.None;
				//tn.NavigateUrl = "# onclick='alert('dddd')'";
				//tn.Target      = "self";
				TNC.Add(tn);
				InitChildNodeDataTable(Int32.Parse(tn.Value.ToString()));
				InitTreeChildNode(tn.ChildNodes,tn.Value);
			}
			dataTbl1 = null;
			dataTbl2 = null;
		}	

		/// <summary>
		/// 初始化TreeView 的 ChildNode
		/// </summary>
		private void InitTreeChildNode(TreeNodeCollection TNC,string classParentID)
		{
			DataView dataView  = new DataView();
			dataView		   = dataTbl2.Copy().DefaultView ;
			dataView.RowFilter = "ClassParentID = " + classParentID + "";
			foreach(DataRowView drv in dataView)
			{	
				TreeNode tn    = new TreeNode();
				tn.Value		   = drv["ClassID"].ToString();
				//tn.Text		   = drv["ClassName"].ToString();
                tn.Text = string.Format(nodeTemplate, tn.Value, drv["ClassName"].ToString());
				tn.ImageUrl    = GetIcon(drv["ClassType"].ToString());
                tn.SelectAction = TreeNodeSelectAction.None;
				//tn.NavigateUrl = "#";
				//tn.Target      = "parent";
				TNC.Add(tn);
				InitTreeChildNode(tn.ChildNodes,tn.Value);
			}
		}	
		
		#region 获取节点图标
		/// <summary>
		/// 获取节点图标
		/// </summary>
		private string GetIcon(string ClassType)
		{
			string rtnValue = VirtualPathUtility.ToAbsolute("~/DataImages/");
			switch (ClassType)
			{
				case "0":
					rtnValue+= "flag.gif" ;
					break;
				case "1":
					rtnValue+= "myDoc.gif" ;
					break;
				case "2":
					rtnValue+= "mail.gif" ;
					break;
				case "3":
					rtnValue+= "page.gif" ;
					break;
				case "4":
					rtnValue+= "staff.gif" ;
					break;
				case "5":
					rtnValue+= "help_page.gif" ;
					break;
				case "6":
					rtnValue+= "MyTask.gif";
					break;
				case "7":
					rtnValue+= "mail.gif" ;
					break;
				case "8":
					rtnValue+= "myDoc.gif" ;
					break;
				case "9":
					rtnValue+= "DocFlow.gif" ;
					break;
				case "10":
					rtnValue+= "ClientManage.gif" ;
					break;
				case "11":
					rtnValue+= "myLinkman.gif" ;
					break;
				case "12":
					rtnValue+= "position.gif" ;
					break;
				case "13":
					rtnValue+= "role.gif" ;
					break;
				case "14":
					rtnValue+= "kaoqin.gif" ;
					break;
				default: 
					rtnValue+= "red_ball.gif";
					break;
			}
			return rtnValue;
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
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

	}
}
