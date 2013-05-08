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
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Web.Script.Serialization;
using System.IO;
using Newtonsoft.Json;
namespace MaiSystem
{
    [DataContract]
    internal class ListAccount
    {
        [DataMember]
        internal string RealName;
        [DataMember]
        internal string StaffName;
    }
	/// <summary>
	/// SelectReceiver ��ժҪ˵����
	/// </summary>
	public class SelectReceiver : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label lblReceiver;
		protected System.Web.UI.WebControls.Label lblCc;
		protected System.Web.UI.WebControls.Label lblBcc;
		protected System.Web.UI.WebControls.Label lblAddressBook;
		protected System.Web.UI.WebControls.DropDownList listAddressBook;
		//protected System.Web.UI.WebControls.DropDownList listAccount;
		public string ClassID,DispType;
		protected System.Web.UI.WebControls.DropDownList listDept;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			ClassID		= Request.QueryString["ClassID"].ToString();
			DispType	= Request.QueryString["type"].ToString();
            string result = Request.QueryString["resulttype"];

			if(!Page.IsPostBack )
			{
                if (string.IsNullOrEmpty(result))
                {
                    PopulateData();
                }
                else
                {
                    ICollection retValue;
                    Staff staff = new Staff();
                    
                    if (DispType == "1")
                        retValue = staff.GetStaffInTeam(Int32.Parse(ClassID));
                    else
                        retValue = staff.GetAllStaffs().ToDataTable(true).DefaultView;
                    IList retList = new ArrayList();
                    var em = retValue as DataView;
                    foreach(DataRow dr in em.Table.Rows)
                    {
                        ListAccount la = new ListAccount();
                        la.RealName = dr["RealName"].ToString();
                        la.StaffName = dr["Staff_Name"].ToString();
                        retList.Add(la);
                    }

                    var jsonSer = new Newtonsoft.Json.JsonSerializer();
                    //jsonSer.RegisterConverters(new JavaScriptConverter[] { 
                    //    new ListItemCollectionConverter() });
                    StringWriter sw = new StringWriter();
                    using (JsonWriter jw = new JsonTextWriter(sw))
                    {
                        jw.Formatting = Formatting.Indented;

                        jsonSer.Serialize(jw, retList);
                    }

                    Response.ContentType = "text/json";
                    
                    Response.Write(sw.ToString());
                    sw.Close();
                    Response.End();
                }
			}
		}

		#region ��ʼ�������б��
		/// <summary>
		/// �����ݽ��г�ʼ��
		/// </summary>
		private void PopulateData() 
		{
			Staff staff = new Staff();
			//listAccount.Items.Clear();
			//if(DispType=="1")
			//	listAccount.DataSource = staff.GetStaffInTeam(Int32.Parse(ClassID));
			//else
			//	listAccount.DataSource = staff.GetAllStaffs();
            //listAccount.DataTextField = "RealName";
            //listAccount.DataValueField = "Staff_Name";
            //listAccount.DataBind ();
            //listAccount.SelectedIndex = 0;
			
			listDept .DataSource = staff.GetPositionList(1);
			listDept.DataTextField = "Position_Name";
			listDept.DataValueField = "Position_ID";
			listDept.DataBind();
			listDept.Items.Insert(0,new ListItem("��˾���в���","0"));
			listDept.SelectedIndex = 0;
			listDept.Attributes["onclick"]="SaveValue()";
			staff=null;
		}
		#endregion

		#region �����б��¼�
		public void DeptListChange(object sender, System.EventArgs e)
		{
			Staff staff = new Staff();
			//if(listDept.SelectedItem .Value=="0")
			//	listAccount.DataSource = staff.GetStaffInTeam(Int32.Parse(ClassID));
			//else
			//	listAccount.DataSource = staff.GetStaffByPosition(Int32.Parse(listDept.SelectedItem.Value));
			//listAccount.DataTextField = "RealName";
			//listAccount.DataValueField = "Staff_Name";
			//listAccount.DataBind ();
			
			staff = null;
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
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
}
