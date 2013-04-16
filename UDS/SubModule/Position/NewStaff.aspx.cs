using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using UDS.Components;

namespace UDS.SubModule.Position
{
	/// <summary>
	/// NewStaff 的摘要说明。
	/// </summary>
	public class NewStaff : System.Web.UI.Page
	{
		public	static string  PositionID;	
		private static long StaffID=0;
		private static int sex=1;
		private static int EditStatus =0;
		public	int ReturnPage=0;
		protected static string Username;
		protected System.Web.UI.WebControls.TextBox txtStaffName;
		protected System.Web.UI.WebControls.TextBox txtRealName;
		protected System.Web.UI.WebControls.TextBox txtBirthday;
		protected System.Web.UI.WebControls.TextBox txtEmail;
		protected System.Web.UI.WebControls.TextBox txtPhone;
		protected System.Web.UI.WebControls.TextBox txtMobile;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator3;
		protected System.Web.UI.WebControls.CompareValidator CompareValidator1;
		protected System.Web.UI.WebControls.RadioButton rb_male;
		protected System.Web.UI.WebControls.RadioButton rb_female;
		protected System.Web.UI.WebControls.RegularExpressionValidator checkmail;
		protected System.Web.UI.WebControls.Literal message;
		protected System.Web.UI.WebControls.RegularExpressionValidator checkmobile;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator4;
		protected System.Web.UI.WebControls.DropDownList cboPosition;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator2;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1; //记录所属部门
		protected System.Web.UI.HtmlControls.HtmlTableRow myposition;
		protected System.Web.UI.WebControls.TextBox txtRePassword;
		protected System.Web.UI.WebControls.Button cmdSubmit;
		protected System.Web.UI.HtmlControls.HtmlTable AutoNumber1;
		protected System.Web.UI.WebControls.TextBox txtCaste;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator5;
		protected System.Web.UI.WebControls.RegularExpressionValidator RegularExpressionValidator1;
		protected System.Web.UI.WebControls.CheckBox cbRemind;
	//	protected System.Web.UI.WebControls.DropDownList cboPosition;
		protected System.Web.UI.WebControls.TextBox txtPassword;
		
		private void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
			if(!Page.IsPostBack)
			{
				//操作者登录名
				HttpCookie UserCookie = Request.Cookies["Username"];
				Username = UserCookie.Value.ToString();
				//绑定部门
				BindPosition();				
				//修改于2003-10-8日 目的：改正生日103岁问题
				//txtBirthday.Text = DateTime.Now.ToShortDateString();
				if(Request.QueryString["PositionID"]!=null)
				{
					PositionID = Request.QueryString["PositionID"].ToString();
					SelectPosition(Int32.Parse(PositionID));
				}
				else
					PositionID = "0";

				if(Request.QueryString["StaffID"]!=null)
				{
					
					StaffID = Int32.Parse(Request.QueryString["StaffID"].ToString());
					GetStaffInfo(StaffID);
					EditStatus = 1;	
					cbRemind.Visible =false;
					//cboPosition.Visible =false;
					cboPosition.Enabled =false;
				
				}				
				else
				{
					EditStatus = 0;
					sex = 1;
				}								
			}

			if(Request.QueryString["ReturnPage"]!=null)
			{
				ReturnPage = Int32.Parse(Request.QueryString["ReturnPage"].ToString());
			}
			else
				ReturnPage = 0;
			
			//if(PositionID!="0")
				//myposition.Visible = false;
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
			this.cmdSubmit.Click += new System.EventHandler(this.cmdSubmit_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void BindPosition()
		{
			UDS.Components.Database db = new UDS.Components.Database();
			SqlDataReader dr_position = null;
			db.RunProc("sp_GetAllPosition",out dr_position);
			cboPosition.DataSource = dr_position;
			cboPosition.DataTextField = "Position_Name";
			cboPosition.DataValueField = "Position_ID";			
			cboPosition.DataBind();
		}
		private void GetStaffInfo(long StaffID)
		{
			SqlDataReader dr;
			UDS.Components.Staff person = new UDS.Components.Staff();
			dr = person.GetStaffInfo(StaffID);
			txtPassword.TextMode = System.Web.UI.WebControls.TextBoxMode.SingleLine;
			txtRePassword.TextMode = System.Web.UI.WebControls.TextBoxMode.SingleLine;
			if(dr.Read ())
			{
				
				txtStaffName.Text = dr["Staff_Name"].ToString();
				txtStaffName.ReadOnly =true;
				txtRealName.Text = dr["RealName"].ToString();
				if(dr["Sex"].ToString() =="True")
				{
					rb_male.Checked =true;
					sex =1;
				}
				else
				{
					rb_female.Checked =true;
					sex = 0;
				}

				 

				
//修改于2003-10-8日 目的：改正生日103岁问题
//				if( txtBirthday.Text =="")
//					txtBirthday.Text = DateTime.Now.ToShortDateString();
//				txtBirthday.Text = dr["Birthday"].ToString().IndexOf(" ")>0?dr["Birthday"].ToString().Substring(0,dr["Birthday"].ToString().IndexOf(" ")):dr["Birthday"].ToString() ;


				txtBirthday		.Text	= ((dr["Birthday"]==DBNull.Value) || (DateTime.Parse(dr["Birthday"].ToString()).Date==DateTime.Parse("1900-1-1").Date))?"-":DateTime.Parse(dr["Birthday"].ToString()).ToLongDateString();
				txtPassword		.Text	= dr["Password"].ToString();
				txtRePassword	.Text	= dr["Password"].ToString();
				txtEmail		.Text	= dr["Email"].ToString();
				txtPhone		.Text	= dr["Phone"].ToString();
				txtMobile		.Text	= dr["Mobile"].ToString();
				txtCaste		.Text	= dr["Caste"].ToString();
				PositionID				= dr["Position_ID"].ToString();
				
				SelectPosition(Int32.Parse(dr["Position_ID"].ToString()));

			}			
			person = null;
			dr.Close();
			dr =null;
		}
		
		private void SelectPosition(int PositionID)
		{
			for(int i = 0;i<cboPosition.Items.Count;i++ )
			{
				if(Int32.Parse(cboPosition.Items[i].Value) == PositionID)
					cboPosition.SelectedIndex = i;
			}
		}


	

		private void cmdSubmit_Click(object sender, System.EventArgs e)
		{
			if(rb_male.Checked==true)
				sex =1;
			else
				sex =0;

			if(EditStatus ==0)
			{
				UDS.Components.Database db = new UDS.Components.Database();
				SqlDataReader dr;
				if(myposition.Visible==true)
					PositionID = cboPosition.Items[cboPosition.SelectedIndex].Value.ToString();

				SqlParameter[] prams = {
										   db.MakeInParam("@StaffName",SqlDbType.VarChar,300,txtStaffName.Text),
										   db.MakeInParam("@Password",SqlDbType.VarChar,300,txtPassword.Text ),
										   db.MakeInParam("@RealName",SqlDbType.VarChar,300,txtRealName.Text),
										   db.MakeInParam("@Sex",SqlDbType.Int,4,sex),
										   db.MakeInParam("@Status",SqlDbType.Int,4,0),
										   db.MakeInParam("@Email",SqlDbType.VarChar,300,txtEmail.Text),
										   db.MakeInParam("@RegistedDate",SqlDbType.DateTime,8,DateTime.Now.ToString()),
										   db.MakeInParam("@PositionID",SqlDbType.Int,4,Int32.Parse(PositionID)),
										   db.MakeInParam("@Phone",SqlDbType.VarChar,50,txtPhone.Text),
										   db.MakeInParam("@Mobile",SqlDbType.VarChar,50,txtMobile.Text),
										   db.MakeInParam("@Birthday",SqlDbType.DateTime,8,(txtBirthday.Text.Trim()=="")?"1900-1-1":txtBirthday.Text),
										   db.MakeInParam("@Caste",SqlDbType.Int,4,Int32.Parse(txtCaste.Text))
									   };
				db.RunProc("sp_AddStaff",prams,out dr);
				if(dr.Read())
				{
					SqlDataReader dr_isok;//所有在职人员
					UDS.Components.Staff sta=new UDS.Components.Staff();
					dr_isok=sta.GetAllStaffs();
					//处理短信提醒
					if(this.cbRemind.Checked ==true)
					{
						while(dr_isok.Read())
						{
							SMS sm = new SMS();
							sm.SendMsg(Username,dr_isok["Staff_name"].ToString(),cboPosition.SelectedItem.Text+"处新到员工 "+txtRealName.Text+",特此通知.",1,DateTime.Now,"",0,0);
							//sm.SendMsg(Username,mailbody.MailReceiverStr+mailbody.MailCcToAddr+mailbody.MailBccToAddr,"您从"+Username+"处收到了一封新的邮件",1,DateTime.Now,"",0,0);
							sm = null;
						}
						dr_isok=null;
					}
					if(ReturnPage==0)
						Response.Redirect("ListView.aspx?Position_ID="+PositionID);	
					else
						Response.Redirect("../Staff/ManageStaff.aspx");	
					dr=null;
				}	
				else
					message.Text = "<font color=red>该用户已经存在！</font>";

					
			}
			else
			{
				UDS.Components.Staff person = new UDS.Components.Staff();		
				switch(person.UpdateInfo(StaffID,txtRealName.Text,sex,txtBirthday.Text=="-"?"1900-01-01":txtBirthday.Text,txtPassword.Text,txtEmail.Text,txtPhone.Text,txtMobile.Text,Int32.Parse(cboPosition.Items[cboPosition.SelectedIndex].Value ),Int32.Parse(txtCaste.Text)))
				{
					case 0:
						PositionID = Int32.Parse(cboPosition.Items[cboPosition.SelectedIndex].Value ).ToString();
						if(ReturnPage==0)
							Response.Redirect("ListView.aspx?Position_ID="+PositionID);	
						else
							Response.Redirect("../Staff/ManageStaff.aspx");	
						message.Text = "修改成功！";
						break;
					case -1:
						message.Text = "验证密码不对！";
						break;
					default:
						break;
				}
			}
		
		}
	}
}
