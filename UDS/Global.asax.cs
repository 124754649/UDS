using System;
using System.Collections;
using System.ComponentModel;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;

namespace UDS 
{
	/// <summary>
	/// Global ��ժҪ˵����
	/// </summary>
	public class Global : System.Web.HttpApplication
	{
		public Global()
		{
			InitializeComponent();
		}	
		
		protected void Application_Start(Object sender, EventArgs e)
		{

		}
 
		protected void Session_Start(Object sender, EventArgs e)
		{
			Session.Timeout = 600;
            //ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
            //    new ScriptResourceDefinition
            //    {
            //        Path = "~/js/jquery-1.9.1.min.js",
            //        DebugPath = "~/js/jquery-1.9.1.min.js",
            //        //CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.min.js",
            //        //CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.js"
            //    });
		}

		protected void Application_BeginRequest(Object sender, EventArgs e)
		{

		}

        //protected void Application_EndRequest(Object sender, EventArgs e)
        //{

        //}

		protected void Application_AuthenticateRequest(Object sender, EventArgs e)
		{

		}

		protected void Application_Error(Object sender, EventArgs e)
		{

		}

		protected void Session_End(Object sender, EventArgs e)
		{

		}

		protected void Application_End(Object sender, EventArgs e)
		{

		}

		

			
		#region Web Form Designer generated code
		/// <summary>
		/// �����֧������ķ��� - ��Ҫʹ�ô���༭���޸�
		/// �˷��������ݡ�
		/// </summary>
		private void InitializeComponent()
		{    
		}
		#endregion
	}
}

