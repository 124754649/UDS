namespace UDS.Inc
{
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

	/// <summary>
	///		ClassTreeView ��ժҪ˵����
	/// </summary>
	public abstract class ClassTreeView : System.Web.UI.UserControl
	{
		protected DataTable dataTbl1,dataTbl2;
        protected System.Web.UI.WebControls.TreeView TreeView1;
		

		private void Page_Load(object sender, System.EventArgs e)
		{
			
			if(!Page.IsPostBack)
			{	
				InitRootNodeDataTable();
				InitTreeRootNode(TreeView1.Nodes);
                TreeView1.ExpandDepth = 1;
			}
		}
	
		private void ExpandNode(string NodeID)
		{
			
			
		}

		/// <summary>
		/// ��ʼ�� RootNode DataTable
		/// </summary>
		private void InitRootNodeDataTable()
		{
			Database data = new Database();
			SqlDataReader dataReader = null;
			String username = Request.Cookies["Username"].Value.ToString();
			SqlParameter[] prams = {
									   data.MakeInParam("@UserName",      SqlDbType.VarChar , 20, username)
									
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
            dataTbl1 = dataReader.ToDataTable(false);
			dataReader.Close();
			dataTbl1.TableName = "TreeView";
		}

		/// <summary>
		/// ��ʼ�� ChildNode DataTable
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
			//dataTbl2 = ConvertDataReaderToDataTable(dataReader); 
            dataTbl2 = dataReader.ToDataTable(false);
			dataReader.Close();
			dataTbl2.TableName = "TreeView";
		}

		/// <summary>
		/// ��ʼ��TreeView �� RootNode
		/// </summary>
		private void InitTreeRootNode(TreeNodeCollection TNC)
		{
			DataView dataView  = new DataView();
			dataView		   = dataTbl1.Copy().DefaultView;
		//	dataView.RowFilter = "ClassParentID = ClassID";
			foreach(DataRowView drv in dataView)
			{
				TreeNode tn    = new TreeNode();
				tn.Value		   = drv["ClassID"].ToString();
				tn.Text		   = "<span onmousemove=javascript:title='"+drv["ClassName"]+"'>"+drv["ClassName"].ToString()+"</span>";
				tn.ImageUrl    = GetIcon(drv["ClassType"].ToString());
				tn.NavigateUrl = ResolveUrl("~/SubModule/UnitiveDocument/Switch.aspx?Action=1&ClassID="+drv["ClassID"].ToString());
				tn.Target      = "MainFrame";
				TNC.Add(tn);
				InitChildNodeDataTable(Int32.Parse(tn.Value.ToString()));
				InitTreeChildNode(tn.ChildNodes,tn.Value);
			}
			dataTbl1 = null;
			dataTbl2 = null;
		}	

		/// <summary>
		/// ��ʼ��TreeView �� ChildNode
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
				tn.Text		   = "<span onmousemove=javascript:title='"+drv["ClassName"]+"'>"+drv["ClassName"].ToString()+"</span>";
				tn.ImageUrl    = GetIcon(drv["ClassType"].ToString());
				tn.NavigateUrl = ResolveUrl("~/SubModule/UnitiveDocument/Switch.aspx?Action=1&ClassID="+drv["ClassID"].ToString());
				tn.Target      = "MainFrame";
				TNC.Add(tn);
				InitTreeChildNode(tn.ChildNodes,tn.Value);
			}
		}	
		
		#region ��ȡ�ڵ�ͼ��
		/// <summary>
		/// ��ȡ�ڵ�ͼ��
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
					rtnValue+= "roleManage.gif" ;
					break;
				case "14":
					rtnValue+= "kaoqin.gif" ;
					break;
				case "15":
					rtnValue+= "workadmin.gif" ;
					break;
				case "16":
					rtnValue+= "message.gif" ;
					break;
                case "17":
					rtnValue+= "usbkey.gif" ;
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
			// CODEGEN���õ����� ASP.NET Web ���������������ġ�
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		///		�����֧������ķ��� - ��Ҫʹ��
		///		����༭���޸Ĵ˷��������ݡ�
		/// </summary>
		private void InitializeComponent()
		{
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
}
