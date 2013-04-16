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
	/// BangdingRole 的摘要说明。
	/// </summary>
	public class BangdingRole : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Button cmdAdd;
		protected System.Web.UI.WebControls.Button cmdDelete;
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.ListBox lstCurRole;
		protected System.Web.UI.WebControls.ListBox lstAllRole;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Button cmdReturn;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Label Label8;
		protected System.Web.UI.WebControls.Button cmdAddPositon;
		protected System.Web.UI.WebControls.Button cmdDeletePosition;
		protected System.Web.UI.WebControls.ListBox lstCurPosition;
		protected System.Web.UI.WebControls.ListBox lstAllPosition;
		protected System.Web.UI.WebControls.Button cmdAddStaff;
		protected System.Web.UI.WebControls.Button cmdDeleteStaff;
		protected System.Web.UI.WebControls.Button cmdDeleteTeam;
		protected System.Web.UI.WebControls.Button cmdAddTeam;
		protected System.Web.UI.WebControls.ListBox lstCurTeam;
		protected System.Web.UI.WebControls.ListBox lstAllTeam;
		protected System.Web.UI.WebControls.ListBox lstCurStaff;
		protected System.Web.UI.WebControls.ListBox lstAllStaff;
		public int TacheID;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
			TacheID = Request.QueryString["TacheID"]==""?0:Int32.Parse(Request.QueryString["TacheID"].ToString());
			if(!Page.IsPostBack)
			{				
				Bangding();
			}
		}
		private void InitCurRole()
		{
			SqlDataReader dr; //存放人物的数据
			Database mySQL = new Database();

			SqlParameter[] parameters = {
											mySQL.MakeInParam("@TacheID",SqlDbType.Int ,4,TacheID)
										};
			
			mySQL.RunProc("sp_Flow_GetBangdingRole",parameters,out dr);
			lstCurRole.Items.Clear(); 
			while(dr.Read())
			{
				ListItem item = new ListItem();
				lstCurRole.Items.Add(new ListItem(dr["role_name"].ToString(),dr["role_id"].ToString()));				
				
			}


		}
		private void InitAllRole()
		{
			SqlDataReader dr; //存放人物的数据
			Database mySQL = new Database();

			SqlParameter[] parameters = {
											mySQL.MakeInParam("@TacheID",SqlDbType.Int ,4,TacheID)
										};
			
			mySQL.RunProc("sp_Flow_GetNotBangdingRole",parameters,out dr);
			lstAllRole.Items.Clear();
			while(dr.Read())
			{
				lstAllRole.Items.Add(new ListItem(dr["role_name"].ToString(),dr["role_id"].ToString()));								
			}

		}
		private void InitCurPosition()
		{
			SqlDataReader dr; //存放人物的数据
			Database mySQL = new Database();

			SqlParameter[] parameters = {
											mySQL.MakeInParam("@TacheID",SqlDbType.Int ,4,TacheID)
										};
			
			mySQL.RunProc("sp_Flow_GetBangdingPosition",parameters,out dr);
			lstCurPosition.Items.Clear(); 
			while(dr.Read())
			{
				ListItem item = new ListItem();
				lstCurPosition.Items.Add(new ListItem(dr["Position_name"].ToString(),dr["Position_id"].ToString()));				
				
			}


		}
		private void InitAllPosition()
		{
			SqlDataReader dr; //存放人物的数据
			Database mySQL = new Database();

			SqlParameter[] parameters = {
											mySQL.MakeInParam("@TacheID",SqlDbType.Int ,4,TacheID)
										};
			
			mySQL.RunProc("sp_Flow_GetNotBangdingPosition",parameters,out dr);
			lstAllPosition.Items.Clear();
			while(dr.Read())
			{
				lstAllPosition.Items.Add(new ListItem(dr["Position_name"].ToString(),dr["Position_id"].ToString()));								
			}

		}		
		private void InitCurTeam()
		{
			SqlDataReader dr; //存放人物的数据
			Database mySQL = new Database();

			SqlParameter[] parameters = {
											mySQL.MakeInParam("@TacheID",SqlDbType.Int ,4,TacheID)
										};
	
			mySQL.RunProc("sp_Flow_GetBangdingTeam",parameters,out dr);
			lstCurTeam.Items.Clear(); 
			while(dr.Read())
			{
				ListItem item = new ListItem();
				lstCurTeam.Items.Add(new ListItem(dr["Team_name"].ToString(),dr["Team_id"].ToString()));				
		
			}


		}
		private void InitAllTeam()
		{
			SqlDataReader dr; //存放人物的数据
			Database mySQL = new Database();

			SqlParameter[] parameters = {
											mySQL.MakeInParam("@TacheID",SqlDbType.Int ,4,TacheID)
										};
			
			mySQL.RunProc("sp_Flow_GetNotBangdingTeam",parameters,out dr);
			lstAllTeam.Items.Clear();
			while(dr.Read())
			{
				lstAllTeam.Items.Add(new ListItem(dr["Team_name"].ToString(),dr["Team_id"].ToString()));								
			}

		}		
		private void InitCurStaff()
		{
			SqlDataReader dr; //存放人物的数据
			Database mySQL = new Database();

			SqlParameter[] parameters = {
											mySQL.MakeInParam("@TacheID",SqlDbType.Int ,4,TacheID)
										};

			mySQL.RunProc("sp_Flow_GetBangdingStaff",parameters,out dr);
			lstCurStaff.Items.Clear(); 
			while(dr.Read())
			{
				ListItem item = new ListItem();
				lstCurStaff.Items.Add(new ListItem(dr["Staff_name"].ToString(),dr["Staff_id"].ToString()));				

			}
		}
		private void InitAllStaff()
		{
			SqlDataReader dr; //存放人物的数据
			Database mySQL = new Database();

			SqlParameter[] parameters = {
											mySQL.MakeInParam("@TacheID",SqlDbType.Int ,4,TacheID)
										};
			
			mySQL.RunProc("sp_Flow_GetNotBangdingStaff",parameters,out dr);
			lstAllStaff.Items.Clear();
			while(dr.Read())
			{
				lstAllStaff.Items.Add(new ListItem(dr["Staff_name"].ToString(),dr["Staff_id"].ToString()));								
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
			this.cmdAddStaff.Click += new System.EventHandler(this.cmdAddStaff_Click);
			this.cmdDeleteStaff.Click += new System.EventHandler(this.cmdDeleteStaff_Click);
			this.cmdDeleteTeam.Click += new System.EventHandler(this.cmdDeleteTeam_Click);
			this.cmdAddTeam.Click += new System.EventHandler(this.cmdAddTeam_Click);
			this.lstAllRole.SelectedIndexChanged += new System.EventHandler(this.lstAllRole_SelectedIndexChanged);
			this.cmdAdd.Click += new System.EventHandler(this.cmdAdd_Click);
			this.cmdDelete.Click += new System.EventHandler(this.cmdDelete_Click);
			this.cmdReturn.Click += new System.EventHandler(this.cmdReturn_Click);
			this.cmdAddPositon.Click += new System.EventHandler(this.cmdAddPositon_Click);
			this.cmdDeletePosition.Click += new System.EventHandler(this.cmdDeletePosition_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
		#region 绑定数据库
		private void Bangding()
		{			
			InitCurRole();
			InitAllRole();

			InitCurPosition();
			InitAllPosition();

			InitCurTeam();
			InitAllTeam();

			InitCurStaff();
			InitAllStaff();

		}
		#endregion

		private void cmdAdd_Click(object sender, System.EventArgs e)
		{
			if(lstAllRole.SelectedIndex >=0)
			{
				Database mySQL = new Database();

				SqlParameter[] parameters = {
												mySQL.MakeInParam("@TacheID",SqlDbType.Int ,4,TacheID),
												mySQL.MakeInParam("@RoleID",SqlDbType.Int ,4,Int32.Parse (lstAllRole.Items[lstAllRole.SelectedIndex].Value)  )
											};
			
				mySQL.RunProc("sp_Flow_AddBangdingRole",parameters);

				//Response.Write("<script language='javascript'>alert('绑定成功！');</script>");
				Bangding();

			}
		}

		private void cmdDelete_Click(object sender, System.EventArgs e)
		{
			if(lstCurRole.SelectedIndex>=0)
			{
				Database mySQL = new Database();

				SqlParameter[] parameters = {
												mySQL.MakeInParam("@TacheID",SqlDbType.Int ,4,TacheID),
												mySQL.MakeInParam("@RoleID",SqlDbType.Int ,4,Int32.Parse (lstCurRole.Items[lstCurRole.SelectedIndex].Value)  )
											};
			
				mySQL.RunProc("sp_Flow_DeleteBangdingRole",parameters);

				//Response.Write("<script language='javascript'>alert('取消绑定成功！');</script>");		
				Bangding();
			}
		}

		private void lstAllRole_SelectedIndexChanged(object sender, System.EventArgs e)
		{
		
		}

		private void cmdReturn_Click(object sender, System.EventArgs e)
		{
			Server.Transfer("ManageTache.aspx");
		}

		private void cmdAddPositon_Click(object sender, System.EventArgs e)
		{
			if(lstAllPosition.SelectedIndex >=0)
			{
				Database mySQL = new Database();

				SqlParameter[] parameters = {
												mySQL.MakeInParam("@TacheID",SqlDbType.Int ,4,TacheID),
												mySQL.MakeInParam("@PositionID",SqlDbType.Int ,4,Int32.Parse (lstAllPosition.Items[lstAllPosition.SelectedIndex].Value)  )
											};
			
				mySQL.RunProc("sp_Flow_AddBangdingPosition",parameters);

				Bangding();

			}		
		}

		private void cmdDeletePosition_Click(object sender, System.EventArgs e)
		{
			if(lstCurPosition.SelectedIndex>=0)
			{
				Database mySQL = new Database();

				SqlParameter[] parameters = {
												mySQL.MakeInParam("@TacheID",SqlDbType.Int ,4,TacheID),
												mySQL.MakeInParam("@PositionID",SqlDbType.Int ,4,Int32.Parse (lstCurPosition.Items[lstCurPosition.SelectedIndex].Value)  )
											};
			
				mySQL.RunProc("sp_Flow_DeleteBangdingPosition",parameters);

				//Response.Write("<script language='javascript'>alert('取消绑定成功！');</script>");		
				Bangding();
			}
		
		}

		private void cmdDeleteTeam_Click(object sender, System.EventArgs e)
		{
			if(lstCurTeam.SelectedIndex>=0)
			{
				Database mySQL = new Database();

				SqlParameter[] parameters = {
												mySQL.MakeInParam("@TacheID",SqlDbType.Int ,4,TacheID),
												mySQL.MakeInParam("@TeamID",SqlDbType.Int ,4,Int32.Parse (lstCurTeam.Items[lstCurTeam.SelectedIndex].Value)  )
											};
			
				mySQL.RunProc("sp_Flow_DeleteBangdingTeam",parameters);

				//Response.Write("<script language='javascript'>alert('取消绑定成功！');</script>");		
				Bangding();
			}
		
		}

		private void cmdDeleteStaff_Click(object sender, System.EventArgs e)
		{
			if(lstCurStaff.SelectedIndex>=0)
			{
				Database mySQL = new Database();

				SqlParameter[] parameters = {
												mySQL.MakeInParam("@TacheID",SqlDbType.Int ,4,TacheID),
												mySQL.MakeInParam("@StaffID",SqlDbType.Int ,4,Int32.Parse (lstCurStaff.Items[lstCurStaff.SelectedIndex].Value)  )
											};
			
				mySQL.RunProc("sp_Flow_DeleteBangdingStaff",parameters);

				//Response.Write("<script language='javascript'>alert('取消绑定成功！');</script>");		
				Bangding();
			}
		
		}

		private void cmdAddTeam_Click(object sender, System.EventArgs e)
		{
			if(lstAllTeam.SelectedIndex >=0)
			{
				Database mySQL = new Database();

				SqlParameter[] parameters = {
												mySQL.MakeInParam("@TacheID",SqlDbType.Int ,4,TacheID),
												mySQL.MakeInParam("@TeamID",SqlDbType.Int ,4,Int32.Parse (lstAllTeam.Items[lstAllTeam.SelectedIndex].Value)  )
											};
			
				mySQL.RunProc("sp_Flow_AddBangdingTeam",parameters);

				Bangding();

			}		
		
		}

		private void cmdAddStaff_Click(object sender, System.EventArgs e)
		{
			if(lstAllStaff.SelectedIndex >=0)
			{
				Database mySQL = new Database();

				SqlParameter[] parameters = {
												mySQL.MakeInParam("@TacheID",SqlDbType.Int ,4,TacheID),
												mySQL.MakeInParam("@StaffID",SqlDbType.Int ,4,Int32.Parse (lstAllStaff.Items[lstAllStaff.SelectedIndex].Value)  )
											};
			
				mySQL.RunProc("sp_Flow_AddBangdingStaff",parameters);

				Bangding();

			}		
		
		}
	}
}
