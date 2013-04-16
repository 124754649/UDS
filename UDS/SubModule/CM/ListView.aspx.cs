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

namespace UDS.SubModule.CM
{
	/// <summary>
	/// ListView ��ժҪ˵����
	/// </summary>
	public class ListView : System.Web.UI.Page
	{
		private void Page_Load(object sender, System.EventArgs e)
		{
			Response.Cookies["UserID"].Value = "1";
			Response.Cookies["ActiveNodeID"].Value = "0";
			Response.Cookies["Username"].Value = "admin";
			Response.Cookies["UserID"].Expires = new DateTime(2010,1,1 );
			Response.Cookies["Username"].Expires = new DateTime(2010,1,1 );
		}

		#region Web ������������ɵĴ���
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: �õ����� ASP.NET Web ���������������ġ�
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
