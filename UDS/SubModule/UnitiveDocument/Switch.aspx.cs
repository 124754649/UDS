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
namespace UDS.SubModule.UnitiveDocument
{
	public class Switch : System.Web.UI.Page
	{
		private void Page_Load(object sender, System.EventArgs e)
		{
			if(!Page.IsPostBack )
			{
				JumpPage();
			}
		}

		public void JumpPage()
		{
			Class newClass		= new Class ();
			string action		= Request.QueryString["Action"].ToString();
			string classID		= Request.QueryString["classID"].ToString();
			string classtype    = newClass.GetClassType(Int32.Parse(classID));
			string className = newClass.GetClassName(int.Parse(classID));
			string url = "";
			Response.Cookies["ActiveNodeID"].Value = classID.ToString();

			switch (action)
			{
				case "0":
					url = Page.ResolveUrl("Document/DeliverDocument.aspx?ClassID=" + classID);
					break;
				case "1":
					switch (classtype)
					{
						case "0":
							url = Page.ResolveUrl("Project.aspx?classID=" + classID);
							break;
						case "1":
							url = Page.ResolveUrl("Document/ListView.aspx?classID="+classID);
							break;
						case "2":
						
							break;
						case "3":
							url = Page.ResolveUrl("BBS/Catalog.aspx?classID="+classID);
							break;
						case "4":
							url = Page.ResolveUrl("../Staff/ManageStaff.aspx?DisplayType=0");							
							break;
						case "5":
							url = Page.ResolveUrl("Task/Listview.aspx");
							break;
						case "6":
							url = Page.ResolveUrl("../Schedule/TaskList.aspx");
							break;
						case "7":
							url = Page.ResolveUrl("Mail/Index.aspx?classID="+classID);														
							break;
						case "8":
							url = Page.ResolveUrl("NewDoc/Listview.aspx");
							break;							
						case "9":
							url = Page.ResolveUrl("DocumentFlow/ListDocument.aspx");
							break;	
						case "10":
							url = Page.ResolveUrl("../CM/ClientListview.aspx");
							break;
						case "11":
							url = Page.ResolveUrl("../LinkMan/Listview.aspx");
							break;
						case "12":							
							url=Page.ResolveUrl("~/SubModule/position/Index.aspx");
							//Response.Write("<script laguage='javascript'>parent.location='" + url + "';</script>";
							break;
						case "13":							
							url=Page.ResolveUrl("~/SubModule/role/Index.aspx");
							//Response.Write("<script laguage='javascript'>parent.location='" + url + "';</script>";
							break;
						case "14":							
							url = Page.ResolveUrl("../WorkAttendance/SearchData.aspx");
							break;
						case "15":							
							url = Page.ResolveUrl("../WorkAttendance/Set.aspx");
							break;
						case "16":							
							url = Page.ResolveUrl("../SM/Index.aspx");
							break;
						case "17":							
							url = Page.ResolveUrl("../USBKey/USBKey_setup.aspx");
							break;
						case "100":
							url = Page.ResolveUrl("ManageQuery/ManageQuery.aspx");	
							break;
						case "18":
							url = Page.ResolveUrl("~/SubModule/Bulletin/Index.html");
							break;
                        case "19":
                            url = Page.ResolveUrl("~/SubModule/AM/index.aspx");
                            break;
						default:
                            if (int.Parse(classtype) < 0)
                            {
                                url = Page.ResolveUrl("~/SubModule/UnitiveDocument/DocumentFlow/NewDocument.aspx?FlowID=" + 
                                    Math.Abs(int.Parse(classtype)).ToString());
                            }
                            else
                            {

                            }
							break;
					}
					break;
				default:
					break;
			}

			ClientScript.RegisterStartupScript(this.GetType(), "redirect", "<script language='javascript'>parent.navigatemf('" + className + "', '" + url + "', '" + className + "');</script>");
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
			this.Load += new System.EventHandler(this.Page_Load);
		}
		#endregion
	}
}
