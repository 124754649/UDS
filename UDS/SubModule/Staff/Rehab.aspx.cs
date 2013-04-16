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

namespace UDS.SubModule.Staff
{
	/// <summary>
	/// Rehab ��ժҪ˵����
	/// </summary>
	public class Rehab : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.DataGrid StaffList;
		protected System.Web.UI.WebControls.TextBox txb_PageNo;
		protected System.Web.UI.WebControls.TextBox txb_ItemPerPage;
		protected System.Web.UI.WebControls.Label lbl_totalrecord;
		protected System.Web.UI.WebControls.ImageButton btn_first;
		protected System.Web.UI.WebControls.ImageButton btn_pre;
		protected System.Web.UI.WebControls.Label lbl_curpage;
		protected System.Web.UI.WebControls.Label lbl_totalpage;
		protected System.Web.UI.WebControls.ImageButton btn_next;
		protected System.Web.UI.WebControls.ImageButton btn_last;
		protected System.Web.UI.HtmlControls.HtmlInputButton selectbutton;
		protected System.Web.UI.HtmlControls.HtmlInputButton btn_Go;
		protected System.Web.UI.HtmlControls.HtmlInputButton cmdChangeDepartment;
		protected System.Web.UI.HtmlControls.HtmlInputButton cmdRestoreDocument;

	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// �ڴ˴������û������Գ�ʼ��ҳ��
			if(!Page.IsPostBack)
			{
				BindGrid();
			}
		}
		
		/// <summary>
		/// ���ݰ�
		/// </summary>
		private void BindGrid()
		{
			SqlDataReader dr; //������������
			Database db = new Database();
			db.RunProc("sp_GetDimissionStaff",out dr);
			DataTable dt =Tools.ConvertDataReaderToDataTable(dr);
			//��DataTable��ĩβ���Ͽ��У�ʹ��DataGrid�̶�����
			int blankrows = StaffList.PageSize - (dt.Rows.Count % StaffList.PageSize);
			for (int i = 0; i < blankrows; i++)
			{
				dt.Rows.Add(dt.NewRow());
			}

			StaffList.DataSource = dt.DefaultView;
			StaffList.DataBind();
			//���ڿռ�¼����ʾcheckbox
			for(int i=0;i<StaffList.Items.Count;i++)
			{
				if(StaffList.Items[i].Cells[1].Text=="&nbsp;")
				{
					StaffList.Items[i].FindControl("cb_StaffID").Visible = false;
				}
			}
			lbl_totalrecord.Text =StaffList.PageCount.ToString();
			lbl_curpage.Text = txb_PageNo.Text = (StaffList.CurrentPageIndex + 1).ToString();
			txb_ItemPerPage.Text = StaffList.PageSize.ToString();
			lbl_totalpage.Text = StaffList.PageCount.ToString();
		}


		private void PagerButtonClick(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			//���LinkButton�Ĳ���ֵ
			String arg = ((ImageButton)sender).CommandArgument;
          
			switch(arg)
			{
				case ("next"):
					if (StaffList.CurrentPageIndex < (StaffList.PageCount - 1))
						StaffList.CurrentPageIndex ++;
					break;
				case ("pre"):
					if (StaffList.CurrentPageIndex > 0)
						StaffList.CurrentPageIndex --;
					break;
				case ("first"):
					StaffList.CurrentPageIndex=0;
					break;
				case ("last"):
					StaffList.CurrentPageIndex = (StaffList.PageCount - 1);
					break;
				default:
					//��ҳֵ
					StaffList.CurrentPageIndex = Convert.ToInt32(arg);
					break;
			}
			BindGrid();
		}            

		private void btnGo_Click(object sender, System.EventArgs e)
		{
			//ҳ��ֱ����ת�Ĵ���
			if(txb_PageNo.Text.Trim()!="")
			{
				int PageI=Int32.Parse(txb_PageNo.Text.Trim())-1;
				if (PageI >=0 && PageI < (StaffList.PageCount))
					StaffList.CurrentPageIndex = PageI ;
			} 
			BindGrid();
		}

	
		private void txb_ItemPerPage_TextChanged(object sender, System.EventArgs e)
		{
			if(txb_ItemPerPage.Text.Trim()!="")
			{
				int itemPage=Int32.Parse(txb_ItemPerPage.Text.Trim());
				if(itemPage>0)
					StaffList.PageSize =  Int32.Parse(txb_ItemPerPage.Text.Trim());
			}
			BindGrid();
		}

		private string GetSelectedItemID(string controlID)
		{
			String selectedID;
			selectedID = "";
			//����DataGrid���checked��ID
			foreach (DataGridItem item in StaffList.Items)
			{
				if(((CheckBox)item.FindControl(controlID)).Checked)
					selectedID += item.Cells[1].Text.Trim()+",";				
			}
			selectedID=selectedID.Substring(0,selectedID.Length-1);
			return selectedID;
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
			this.btn_first.Click += new System.Web.UI.ImageClickEventHandler(this.PagerButtonClick);
			this.btn_pre.Click += new System.Web.UI.ImageClickEventHandler(this.PagerButtonClick);
			this.btn_next.Click += new System.Web.UI.ImageClickEventHandler(this.PagerButtonClick);
			this.btn_last.Click += new System.Web.UI.ImageClickEventHandler(this.PagerButtonClick);
			this.btn_Go.ServerClick += new System.EventHandler(this.btnGo_Click);
			this.txb_ItemPerPage.TextChanged += new System.EventHandler(this.txb_ItemPerPage_TextChanged);
			this.cmdChangeDepartment.ServerClick += new System.EventHandler(this.cmdChangeDepartment_ServerClick);
			this.cmdRestoreDocument.ServerClick += new System.EventHandler(this.cmdRestoreDocument_ServerClick);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void cmdChangeDepartment_ServerClick(object sender, System.EventArgs e)
		{
			Response.Redirect("../Department/ChangeDepartment.aspx?BackFilePath="+Request.CurrentExecutionFilePath+"&StaffIDS="+GetSelectedItemID("cb_StaffID"));
		}

		private void cmdRestoreDocument_ServerClick(object sender, System.EventArgs e)
		{
			UDS.Components.Staff st = new UDS.Components.Staff();
			if(st.ReturnPosition(GetSelectedItemID("cb_StaffID"))==false)
				Server.Transfer("../Error.aspx");
			else
				Response.Redirect("Rehab.aspx");
		}
	}
}
