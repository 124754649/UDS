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
namespace UDS.SubModule.UnitiveDocument
{
	/// <summary>
	/// Desktop ��ժҪ˵����
	/// </summary>
	public class Desktop : System.Web.UI.Page
	{
		protected System.Web.UI.HtmlControls.HtmlImage IMG2;
		protected System.Web.UI.HtmlControls.HtmlImage IMG1;
		protected System.Web.UI.WebControls.DataGrid dgList;
		protected System.Web.UI.HtmlControls.HtmlImage IMG3;
		protected System.Web.UI.HtmlControls.HtmlImage Img4;
		protected System.Web.UI.WebControls.DataGrid dgDocList;
		protected System.Web.UI.WebControls.DataGrid dgMailList;
		protected System.Web.UI.WebControls.DataGrid dgAppDocList;
		protected static string Username;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			HttpCookie UserCookie = Request.Cookies["Username"];
			Username = UserCookie.Value.ToString();
			
			
			if(!Page.IsPostBack)
			{
				//���ڲ���
				DutyOperation();
				Bangding();
				bindtaskgrid();
			}
		}

		private void DutyOperation()
		{
			try
			{
				WA_Duty wd = new WA_Duty(Int32.Parse(Request.Cookies["UserID"].Value.Trim()));
				int Duty = wd.HaveCompletedDuty(DateTime.Now);
				//��鵱���Ƿ��Ѿ�����ϰ࿼��
				if(Duty==-1)
				{
					if(wd.CheckStatus(DutyAction.OnDuty)) //û�гٵ�
					{
						wd.RecordOnDutyData(DateTime.Now,true,"").ToString();
						//������ҳ���ʾ�ɹ�
						Response.Write("<script language=javascript>window.open('../WorkAttendance/checksucessful.aspx?login=in','_blank','height=200,width=400,status=no,toolbar=no,menubar=no,location=no')</script>");
					}
					else//�ٵ�
					{
						//��ת����д����ҳ��
						Response.Redirect("../WorkAttendance/Default.aspx?notnormal=1&login=in");
					}	

				}
			}
			catch(Exception ex)
			{
				UDS.Components.Error.Log(ex.Message);
				Server.Transfer("../Error.aspx");
			}
		}

		public void bindtaskgrid()
		{
			UDS.Components.Task task = new UDS.Components.Task();
			DataTable mydb = Tools.ConvertDataReaderToDataTable(task.GetAllTaskBySomeone(DateTime.Today.ToShortDateString(),Username,1));
		
			if(mydb.Rows.Count<5)
			{
				int tmp = 5-mydb.Rows.Count;
				for(int i=0;i<tmp;i++)
				{
					DataRow myDataRow = mydb.NewRow();
					myDataRow[0] = "-";
					mydb.Rows.Add(myDataRow);
					
				}
			}
			this.dgList .DataSource = mydb.DefaultView;
			this.dgList.DataBind();
			// setgrid();
			mydb.Dispose();
		}

		public string GetStatus(string str)
		{
			
			switch (str) 
			{
				case "0":
					return "?"; // ����
				case "1":
					return "!"; // ����
				case "2":
					return "��"; // ���
				default:
					return "";
			}
			

		}

		public string GetPeriodByPeriodID(string EndTime,string begintime,string endtime)
		{
			if(begintime=="0"&&endtime=="0")
			{
				if(EndTime!="")
					return DateTime.Parse(EndTime).ToShortTimeString();
				else
					return "-";

			}
			else
			{
				if(begintime==""&&endtime=="")
				{
					return "-";
				}
				int b = Int32.Parse(begintime);
				int e = Int32.Parse(endtime);
				DateTime dt = new DateTime(1999,1,1,8,0,0,0);
				TimeSpan ts = new TimeSpan(0,0,(b-1)*30,0,0);
				DateTime bt = dt.Add(ts);
				DateTime et = bt.Add(new TimeSpan(0,0,(e-b+1)*30,0,0));
				return bt.ToShortTimeString()+"-"+et.ToShortTimeString();
			}
			
		}

		public string GetDateString(string DateString)
		{
			if(DateString=="")
				return "";
			 else
				 return DateTime.Parse(DateString).ToShortDateString();
		}

		public string GetRealName(string Username)
		{
			if(Username!="")
				return UDS.Components.Staff.GetRealNameByUsername(Username);
			else
				return "";
		}

		public string GetType(string type)
		{
			string Type="";
			if(type!="")
			{
				switch (Int32.Parse(type)) 
				{
					case 1:
						Type="����";
						break;
					case 2:
						Type="�İ�";
						break;
					case 3:
						Type="����";
						break;
					case 4:
						Type="�绰";
						break;
					case 5:
						Type="�߷�";
						break;
					case 6:
						Type="���";
						break;
					case 7:
						Type="����";
						break;
					case 8:
						Type="����";
						break;
			
				}
				return Type;
			}
			else
				return "";

		}

		public string GetProjectName(string project)
		{
			if(project!="")
				return UDS.Components .ProjectClass .GetProjectName (Int32.Parse(project));
			else
				return "";
		}


		private void setgrid()
		{
			// foreach(DataGridItem dgi in this.dgList .Items)
			{
				// Label lb=(Label)(dgi.Cells[2].Controls[1]);
				// if(lb.Text=="?") dgi.BackColor=Color.AliceBlue ;
			}
		}
		
		#region ��ҳ�¼�
		public void DataGrid_PageChanged(object sender,DataGridPageChangedEventArgs e)
		{
			this.dgList .CurrentPageIndex = e.NewPageIndex;
			UDS.Components.Task task = new UDS.Components.Task();
			DataTable mydb = Tools.ConvertDataReaderToDataTable(task.GetTodayTaskBySomeone(DateTime.Today.ToShortDateString(),Username,1));
			this.dgList .DataSource = mydb.DefaultView;
			this.dgList.DataBind();
			setgrid();
			
		}
		#endregion

		#region ��DBGRID
		private void Bangding()
		{
			SqlDataReader dr; //������������
			UDS.Components.Desktop myDesktop = new UDS.Components.Desktop();
			String UserName = Request.Cookies["UserName"].Value.ToString();

			dr = myDesktop.GetMyDocument(UserName,10);
			DataTable dt =Tools.ConvertDataReaderToDataTable(dr);
			if(dt.Rows.Count<5)
			{
				int tmp = 5-dt.Rows.Count;
				for(int i=0;i<tmp;i++)
				{
					DataRow myDataRow = dt.NewRow();
					myDataRow[0] = "-";
					dt.Rows.Add(myDataRow);
					
				}
			}
			dgDocList.DataSource = dt.DefaultView;
			dgDocList.DataBind();

			dr = myDesktop.GetMyMail(UserName,1);
			dt =Tools.ConvertDataReaderToDataTable(dr);
			if(dt.Rows.Count<5)
			{
				int tmp = 5-dt.Rows.Count;
				for(int i=0;i<tmp;i++)
				{
					DataRow myDataRow = dt.NewRow();
					myDataRow[0] = "-";
				//	myDataRow[4] = "";
					myDataRow[7] = "";
					dt.Rows.Add(myDataRow);
					
				}
			}
//			DataView dv = dt.DefaultView;
//			dv.Sort = "MailSendDate Desc";
			dgMailList.DataSource = dt.DefaultView ;
			dgMailList.DataBind();

			dr = myDesktop.GetMyApprove(UserName,2);
			dt =Tools.ConvertDataReaderToDataTable(dr);
			if(dt.Rows.Count<5)
			{
				int tmp = 5-dt.Rows.Count;
				for(int i=0;i<tmp;i++)
				{
					DataRow myDataRow = dt.NewRow();
					myDataRow[0] = "-";
					dt.Rows.Add(myDataRow);
					
				}
			}
			dgAppDocList.DataSource = dt.DefaultView;
			dgAppDocList.DataBind();
			dr.Close();
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
			this.dgDocList.SelectedIndexChanged += new System.EventHandler(this.dgDocList_SelectedIndexChanged);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void dgDocList_SelectedIndexChanged(object sender, System.EventArgs e)
		{
		
		}


	}
}
