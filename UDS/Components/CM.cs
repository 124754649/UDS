using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace UDS.Components
{
	/// <summary>
	/// CM ��ժҪ˵����
	/// </summary>
	public class CM
	{
		public CM(){}

		#region ��ӿͻ�
		/// <summary>
		/// ��ӿͻ�
		/// </summary>
		/// <param name="client"></param>
		/// <returns>���ؿͻ�id</returns>
		public int AddClinet(ClientInfo client)
		{
			Database data = new Database();
			SqlParameter[] prams = {
									    data.MakeInParam("@birthday",  SqlDbType.DateTime, 8, client.Birthday),
									    data.MakeInParam("@chieflinkmanid", SqlDbType.Int, 4, client.ChiefLinkmanID),
									    data.MakeInParam("@UpdateTime", SqlDbType.DateTime, 8, DateTime.Now),
									    data.MakeInParam("@AddmanID",SqlDbType.Int,4,client.AddManID),
									    data.MakeInParam("@ShortName",SqlDbType.VarChar,100,client.ClientShortName),
									    data.MakeInParam("@Name",SqlDbType.VarChar,100,client.ClientName),
									    data.MakeInParam("@ContactTimes",SqlDbType.Int,4,client.ContactTimes),
										data.MakeInParam("@SellPhase",SqlDbType.VarChar,100,client.SellPhase),
										data.MakeInParam("@BargainPrognosis",SqlDbType.VarChar,100,client.BargainPrognosis),
										data.MakeInParam("@Fee",SqlDbType.Int,4,client.Fee),
										data.MakeInParam("@Linkman_Telephone",SqlDbType.VarChar,100,client.Linkman_Telephone),
										data.MakeInParam("@CurStatus",SqlDbType.VarChar,100,client.CurStatus),
										data.MakeInParam("@Type",SqlDbType.VarChar,100,client.Type),
										data.MakeInParam("@Affiliatedarea",SqlDbType.VarChar,100,client.Affiliatedarea),
										data.MakeInParam("@URL",SqlDbType.VarChar,100,client.URL),
										data.MakeInParam("@ZIP",SqlDbType.VarChar,100,client.ZIP),
										data.MakeInParam("@Address",SqlDbType.VarChar,200,client.Address),
										data.MakeInParam("@CompanyProperty",SqlDbType.VarChar,100,client.EnterpriseType),
										data.MakeInParam("@Calling",SqlDbType.VarChar,2000,client.Calling),
										data.MakeInParam("@CompanySize",SqlDbType.VarChar,100,client.CompanySize),
										data.MakeInParam("@Money",SqlDbType.VarChar,100,client.Money),
										data.MakeInParam("@Operation",SqlDbType.VarChar,100,client.Operation),
										data.MakeInParam("@Introduce",SqlDbType.VarChar,1000,client.Introduce),
										data.MakeInParam("@ITGrade",SqlDbType.VarChar,1000,client.ITGrade),
										data.MakeInParam("@PCNumber",SqlDbType.Int,4,client.PCNumber),
										data.MakeInParam("@Net",SqlDbType.VarChar,100,client.Net),
										data.MakeInParam("@ITStaffs",SqlDbType.Int,4,client.ITStaffs),
										data.MakeInParam("@ITDepartment",SqlDbType.VarChar,100,client.ITDepartment),
										data.MakeInParam("@Principal",SqlDbType.VarChar,100,client.Principal),
										data.MakeInParam("@System",SqlDbType.VarChar,100,client.System),
										data.MakeInParam("@Customer",SqlDbType.VarChar,100,client.ClientSource),
										data.MakeInParam("@ClientInitiative",SqlDbType.VarChar,100,client.ClientInitiative)
										
			};
			return(data.RunProc ("sp_CM_AddClient",prams));
		}
		#endregion 

		#region �޸Ŀͻ�
		/// <summary>
		/// �޸Ŀͻ�
		/// </summary>
		/// <param name="client"></param>
		public void UpdateClient(ClientInfo client)
		{
			Database data = new Database();
			SqlParameter[] prams = {
									   data.MakeInParam("@ID",SqlDbType.Int,4,client.ID),
									   data.MakeInParam("@birthday",  SqlDbType.DateTime, 8, client.Birthday),
									   data.MakeInParam("@chieflinkmanid", SqlDbType.Int, 4, client.ChiefLinkmanID),
									   data.MakeInParam("@UpdateTime", SqlDbType.DateTime, 8, DateTime.Now),
									   data.MakeInParam("@AddmanID",SqlDbType.Int,4,client.AddManID),
									   data.MakeInParam("@ShortName",SqlDbType.VarChar,100,client.ClientShortName),
									   data.MakeInParam("@Name",SqlDbType.VarChar,100,client.ClientName),
									   data.MakeInParam("@ContactTimes",SqlDbType.Int,4,client.ContactTimes),
									   data.MakeInParam("@SellPhase",SqlDbType.VarChar,100,client.SellPhase),
									   data.MakeInParam("@BargainPrognosis",SqlDbType.VarChar,100,client.BargainPrognosis),
									   data.MakeInParam("@Fee",SqlDbType.Int,4,client.Fee),
									   data.MakeInParam("@Linkman_Telephone",SqlDbType.VarChar,100,client.Linkman_Telephone),
									   data.MakeInParam("@CurStatus",SqlDbType.VarChar,100,client.CurStatus),
									   data.MakeInParam("@Type",SqlDbType.VarChar,100,client.Type),
									   data.MakeInParam("@Affiliatedarea",SqlDbType.VarChar,100,client.Affiliatedarea),
									   data.MakeInParam("@URL",SqlDbType.VarChar,100,client.URL),
									   data.MakeInParam("@ZIP",SqlDbType.VarChar,100,client.ZIP),
									   data.MakeInParam("@Address",SqlDbType.VarChar,200,client.Address),
									   data.MakeInParam("@CompanyProperty",SqlDbType.VarChar,100,client.EnterpriseType),
									   data.MakeInParam("@Calling",SqlDbType.VarChar,2000,client.Calling),
									   data.MakeInParam("@CompanySize",SqlDbType.VarChar,100,client.CompanySize),
									   data.MakeInParam("@Money",SqlDbType.VarChar,100,client.Money),
									   data.MakeInParam("@Operation",SqlDbType.VarChar,100,client.Operation),
									   data.MakeInParam("@Introduce",SqlDbType.VarChar,1000,client.Introduce),
									   data.MakeInParam("@ITGrade",SqlDbType.VarChar,1000,client.ITGrade),
									   data.MakeInParam("@PCNumber",SqlDbType.Int,4,client.PCNumber),
									   data.MakeInParam("@Net",SqlDbType.VarChar,100,client.Net),
									   data.MakeInParam("@ITStaffs",SqlDbType.Int,4,client.ITStaffs),
									   data.MakeInParam("@ITDepartment",SqlDbType.VarChar,100,client.ITDepartment),
									   data.MakeInParam("@Principal",SqlDbType.VarChar,100,client.Principal),
									   data.MakeInParam("@System",SqlDbType.VarChar,100,client.System),
									   data.MakeInParam("@Customer",SqlDbType.VarChar,100,client.ClientSource),
									   data.MakeInParam("@ClientInitiative",SqlDbType.VarChar,100,client.ClientInitiative),
									   data.MakeInParam("@FirstContactTime",SqlDbType.DateTime,8,client.FirstContactTime),
									   data.MakeInParam("@NextContactTime",SqlDbType.DateTime,8,client.NextContactTime),
									   data.MakeInParam("@ContactTime",SqlDbType.DateTime,8,client.ContactTime)
			};
			data.RunProc ("sp_CM_UpdateClient",prams);
		}
		#endregion

		#region ɾ���ͻ�
		/// <summary>
		/// ɾ���ͻ�
		/// </summary>
		/// <param name="id">�ͻ�id</param>
		public void DelClient(int id)
		{
			Database data = new Database();
			SqlParameter[] prams = {
										data.MakeInParam("@clientid",SqlDbType.Int,4,id)
								   };
			data.RunProc("sp_CM_DelClient",prams);

		}
		#endregion

		#region �õ����пͻ�
		public SqlDataReader GetAllClient()
		{
			Database data = new Database();
			SqlDataReader dr = null;
			data.RunProc ("sp_CM_GetAllClient",out dr);
			return(dr);
		}
		#endregion

		#region ���ݿͻ�id�õ�������
		public SqlDataReader GetLinkmanFromClient(int clientid)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@clientid",  SqlDbType.Int, 4, clientid)
			};
			data.RunProc ("sp_CM_GetAllLinkmanFromClient",prams,out dr);
			return(dr);
		}
		#endregion

		#region ���ݿͻ����Ƶõ��ͻ�id
		public SqlDataReader GetClientIDByName(string clientname)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@name",  SqlDbType.VarChar, 100, clientname)
								   };
			data.RunProc ("sp_CM_GetClientIDByName",prams,out dr);
			return(dr);
		}
		#endregion

		#region ���ݿͻ�name�õ��ͻ���Ϣ
		public SqlDataReader GetClientInfoByName(string clientname)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@clientname",  SqlDbType.VarChar, 100, clientname)
								   };
			data.RunProc ("sp_CM_GetClientInfoByName",prams,out dr);
			return(dr);
		}
		#endregion

		#region ���ݿͻ�id�õ��ͻ���Ϣ(�ͻ�id=0�õ�ȫ���ͻ�)
		public SqlDataReader GetClientInfo(int clientid)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@clientid",  SqlDbType.Int, 4, clientid)
								   };
			data.RunProc ("sp_CM_GetClientInfo",prams,out dr);
			return(dr);
		}
		public ClientInfo GetClientAllInfo(int clientid)
		{
			ClientInfo client = new ClientInfo();
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@clientid",  SqlDbType.Int, 4, clientid)
								   };
			data.RunProc ("sp_CM_GetClientAllInfo",prams,out dr);
			while(dr.Read())
			{
				client.ID = Int32.Parse(dr["id"].ToString());
				client.ClientName = dr["Name"].ToString();
				client.ClientShortName = dr["ShortName"].ToString();
				client.ChiefLinkmanID = Int32.Parse(dr["ChiefLinkmanID"].ToString());
				client.Birthday = DateTime.Parse(dr["Birthday"].ToString());
				client.UpdateTime = DateTime.Parse(dr["UpdateTime"].ToString());
				client.ContactTimes = Int32.Parse(dr["ContactTimes"].ToString());
				client.SellPhase = dr["SellPhase"].ToString();
				client.BargainPrognosis = dr["BargainPrognosis"].ToString();
				client.Fee = Int32.Parse(dr["Fee"].ToString());
				client.AddManID = Int32.Parse(dr["AddManID"].ToString());
				client.Linkman_Telephone = dr["Linkman_Telephone"].ToString();
				client.CurStatus = dr["CurStatus"].ToString();
				client.Address = dr["address"].ToString();
				client.Affiliatedarea = dr["affiliatedarea"].ToString();
				client.Calling = dr["calling"].ToString();
				client.ClientInitiative = dr["ClientInitiative"].ToString();
				client.ClientSource = dr["customer"].ToString();
				client.ClientTrade = dr["calling"].ToString();
				client.ClientType = dr["type"].ToString();
				client.CompanyProperty = dr["companyproperty"].ToString();
				client.CompanySize = dr["companysize"].ToString();
				client.CurStatus = dr["curstatus"].ToString();
				client.Customer = dr["customer"].ToString();
				client.EnterpriseType = dr["CompanyProperty"].ToString();
				client.Introduce = dr["introduce"].ToString();
				client.ITDepartment = dr["itdepartment"].ToString();
				client.ITGrade = dr["itgrade"].ToString();
				client.ITStaffs = Int32.Parse(dr["itstaffs"].ToString());
				client.Linkman_Telephone = dr["Linkman_Telephone"].ToString();
				client.Money = dr["money"].ToString();
				client.Net = dr["Net"].ToString();
				client.Operation = dr["operation"].ToString();
				client.PCNumber = Int32.Parse(dr["pcnumber"].ToString());
				client.Principal = dr["principal"].ToString();
				client.SellPhase = dr["sellphase"].ToString();
				client.System = dr["system"].ToString();
				client.Type = dr["type"].ToString();
				client.URL = dr["URL"].ToString();
				client.ZIP = dr["ZIP"].ToString();

				if(dr["ContactTime"]!=DBNull.Value) 
					client.ContactTime = DateTime.Parse(dr["ContactTime"].ToString());
				else
					client.ContactTime = DateTime.Parse("1900-1-1");

				if(dr["firstcontacttime"]!=DBNull.Value) 
					client.FirstContactTime = DateTime.Parse(dr["firstcontacttime"].ToString());
				else
					client.FirstContactTime = DateTime.Parse("1900-1-1");

				if(dr["nextcontacttime"]!=DBNull.Value) 
					client.NextContactTime = DateTime.Parse(dr["nextcontacttime"].ToString());
				else
					client.NextContactTime = DateTime.Parse("1900-1-1");



			}
			return(client);
		}
		#endregion

		#region ����Эͬ��id�õ��ͻ���Ϣ
		public SqlDataReader GetClientInfoBycooperatorID(int cooperatorID)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@cooperatorID",  SqlDbType.Int, 4, cooperatorID)
								   };
			data.RunProc ("sp_CM_GetClientInfoByCooperatorID",prams,out dr);	
			return(dr);
		}
		#endregion

		#region �����ϵ��
		public int AddLinkman(Linkman linkman)
		{
			Database data = new Database();
			SqlParameter[] prams = {
									    data.MakeInParam("@ClientID",  SqlDbType.Int, 4, linkman.ClientID),
									    data.MakeInParam("@name", SqlDbType.VarChar, 50,linkman.Name),
									    data.MakeInParam("@mobile", SqlDbType.VarChar,50, linkman.Mobile),
									    data.MakeInParam("@telephone", SqlDbType.VarChar,50, linkman.Telephone),
										data.MakeInParam("@position", SqlDbType.VarChar,50, linkman.Position),
										data.MakeInParam("@email",SqlDbType.VarChar,50,linkman.Email),
										data.MakeInParam("@gender",SqlDbType.Bit,1,linkman.Gender),
										data.MakeInParam("@description",SqlDbType.VarChar,50,linkman.Description),
										data.MakeInParam("@address",SqlDbType.VarChar,100,linkman.Address),
										data.MakeInParam("@family",SqlDbType.VarChar,200,linkman.Family),
			};
			return(data.RunProc ("sp_CM_AddLinkman",prams));
		}

		#endregion

		#region �޸���ϵ��
		public void UpdateLinkman(Linkman linkman)
		{
			Database data = new Database();
			SqlParameter[] prams = {
									   data.MakeInParam("@ID",  SqlDbType.Int, 4, linkman.ID),
									   data.MakeInParam("@ClientID",  SqlDbType.Int, 4, linkman.ClientID),
									   data.MakeInParam("@name", SqlDbType.VarChar, 50,linkman.Name),
									   data.MakeInParam("@mobile", SqlDbType.VarChar,50, linkman.Mobile),
									   data.MakeInParam("@telephone", SqlDbType.VarChar,50, linkman.Telephone),
									   data.MakeInParam("@position", SqlDbType.VarChar,50, linkman.Position),
									   data.MakeInParam("@email",SqlDbType.VarChar,50,linkman.Email),
									   data.MakeInParam("@gender",SqlDbType.Bit,1,linkman.Gender),
									   data.MakeInParam("@description",SqlDbType.VarChar,50,linkman.Description),
									   data.MakeInParam("@address",SqlDbType.VarChar,100,linkman.Address),
									   data.MakeInParam("@family",SqlDbType.VarChar,200,linkman.Family),
			};
			data.RunProc ("sp_CM_UpdateLinkman",prams);

		}

		#endregion

		#region ɾ����ϵ��
		public bool DelLinkman(Linkman linkman)
		{
			Database data = new Database();
			SqlParameter[] prams = {
									   data.MakeInParam("@LinkmanID",  SqlDbType.Int, 4, linkman.ID),
									   
			};
			return(data.RunProc ("sp_CM_DelLinkman",prams)==0?true:false);
		}
		#endregion

		#region �õ�������ϵ��
		public SqlDataReader GetAllLinkman()
		{
			Database data = new Database();
			SqlDataReader dr = null;
			data.RunProc ("sp_CM_GetAllLinkman",out dr);
			return(dr);
		}

		public SqlDataReader GetAllContactLinkman()
		{
			Database data = new Database();
			SqlDataReader dr = null;
			data.RunProc ("sp_CM_GetAllContactLinkman",out dr);
			return(dr);
		}
		#endregion

		#region ����id�õ���ϵ��
		public SqlDataReader GetLinkmanByID(string linkmanid)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@LinkmanID",  SqlDbType.VarChar, 100, linkmanid)
								   };
			data.RunProc ("sp_CM_GetLinkmanByID",prams,out dr);
			return(dr);
		}

		public Linkman GetLinkmanStructByID(string linkmanid)
		{
			Database data = new Database();
			Linkman linkman = new Linkman();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@LinkmanID",  SqlDbType.VarChar, 100, linkmanid)
								   };
			data.RunProc ("sp_CM_GetLinkmanByID",prams,out dr);
			while(dr.Read())
			{
				
				linkman.Address = dr["address"].ToString();
				linkman.ClientID = Int32.Parse(dr["clientid"].ToString());
				linkman.Description = dr["description"].ToString();
				linkman.Email = dr["email"].ToString();
				linkman.Family = dr["family"].ToString();
				linkman.Gender = Convert.ToBoolean(dr["gender"]);
				linkman.ID = Int32.Parse(dr["id"].ToString());
				linkman.Mobile = dr["mobile"].ToString();
				linkman.Name = dr["name"].ToString();
				linkman.Position = dr["position"].ToString();
				linkman.Telephone = dr["telephone"].ToString();
			}
			
			return(linkman);
		}
		#endregion

		#region �õ����˸���ids��������ϵ��
		public SqlDataReader GetRemainLinkmen(string ids)
		{
			SqlDataReader dataReader = null;
			Database data = new Database();
			SqlParameter[] prams = {
									   data.MakeInParam("@ids",SqlDbType.VarChar,300,ids)
								   };

			try 
			{
				// run the stored procedure
				data.RunProc("sp_CM_GetRemainLinkmen", prams,out dataReader);
				return(dataReader);			
				
			}
			catch (Exception ex) 
			{
				Error.Log(ex.ToString());
				return null;
			}
			finally
			{
				data = null;
			}

		}
		#endregion

		#region ���ݿͻ�����˵õ������йص���ϵ��
		public SqlDataReader GetLinkmenByClientAddmanID(int id)
		{
			SqlDataReader dataReader = null;
			Database data = new Database();
			SqlParameter[] prams = {
									   data.MakeInParam("@id",SqlDbType.Int,4,id)
								   };

			try 
			{
				// run the stored procedure
				data.RunProc("sp_CM_GetLinkmenByClientAddmanID", prams,out dataReader);
				return(dataReader);			
				
			}
			catch (Exception ex) 
			{
				Error.Log(ex.ToString());
				return null;
			}
			finally
			{
				data = null;
			}

		}

		#endregion

		#region ��ӽӴ����
		public int AddContact(Contact contact)
		{
			Database data = new Database();
			SqlParameter[] prams = {
									    data.MakeInParam("@ClientID",  SqlDbType.Int, 4, contact.ClientID),
									    data.MakeInParam("@MarketmanID", SqlDbType.Int, 4,contact.StaffID),
									    data.MakeInParam("@UpdateTime", SqlDbType.DateTime,8, contact.UpdateTime),
									    data.MakeInParam("@ContactTime",SqlDbType.DateTime,8,contact.ContactTime),
										data.MakeInParam("@ContactAim",SqlDbType.VarChar,500,contact.ContactAim),
										data.MakeInParam("@SellMoney",SqlDbType.Int,4,contact.SellMoney),
										data.MakeInParam("@ContactTimes", SqlDbType.Int,4, contact.ContactTimes),
									    data.MakeInParam("@BargainPrognosis",SqlDbType.VarChar,50,contact.BargainPrognosis),
										data.MakeInParam("@ContactType",SqlDbType.VarChar,50,contact.ContactType),
									    data.MakeInParam("@CurStatus",SqlDbType.VarChar,100,contact.ContactStatus),
										data.MakeInParam("@Fee",SqlDbType.Int,4,contact.ThisFee),
									    data.MakeInParam("@FeeUsed",SqlDbType.VarChar,100,contact.FeeUsed),
										data.MakeInParam("@ContactContent",SqlDbType.VarChar,1000,contact.ContactContent),
										data.MakeInParam("@NextContactAim",SqlDbType.VarChar,1000,contact.NextContactAim),
										data.MakeInParam("@NextContactTime",SqlDbType.DateTime,8,contact.NextContactTime),
									   
			};
			contact.ID = data.RunProc ("sp_CM_AddContact",prams);
			

			foreach(Cooperater cooperater in contact.arrCooperater)
			{
				SqlParameter[] prams1 = new SqlParameter[]{
											data.MakeInParam("@staffid",SqlDbType.Int,4,cooperater.StaffID),
											data.MakeInParam("@contactid",SqlDbType.Int,4,contact.ID)
										};
				data.RunProc("sp_CM_AddContact_Cooperater",prams1);
			}
			foreach(Linkman linkman in contact.arrLinkman)
			{
				SqlParameter[] prams2 = new SqlParameter[]{
										  data.MakeInParam("@staffid",SqlDbType.Int,4,linkman.ID),
										  data.MakeInParam("@contactid",SqlDbType.Int,4,contact.ID)	
				};
				data.RunProc("sp_CM_AddContact_Linkman",prams2);
			}
			return(contact.ID);

		}
		#endregion

		#region �޸ĽӴ����
		public void UpdateContact(Contact contact)
		{
			Database data = new Database();
			SqlParameter[] prams = {
									   data.MakeInParam("@ID",SqlDbType.Int,4,contact.ID),
									   data.MakeInParam("@ClientID",  SqlDbType.Int, 4, contact.ClientID),
									   data.MakeInParam("@MarketmanID", SqlDbType.Int, 4,contact.StaffID),
									   data.MakeInParam("@UpdateTime", SqlDbType.DateTime,8, contact.ContactTime),
									   data.MakeInParam("@ContactTime",SqlDbType.DateTime,8,contact.ContactTime),
									   data.MakeInParam("@ContactAim",SqlDbType.VarChar,500,contact.ContactAim),
									   data.MakeInParam("@SellMoney",SqlDbType.Int,4,contact.SellMoney),
									   data.MakeInParam("@BargainPrognosis",SqlDbType.VarChar,50,contact.BargainPrognosis),
									   data.MakeInParam("@ContactType",SqlDbType.VarChar,50,contact.ContactType),
									   data.MakeInParam("@CurStatus",SqlDbType.VarChar,100,contact.ContactStatus),
									   data.MakeInParam("@Fee",SqlDbType.Int,4,contact.ThisFee),
									   data.MakeInParam("@FeeUsed",SqlDbType.VarChar,100,contact.FeeUsed),
									   data.MakeInParam("@ContactContent",SqlDbType.VarChar,1000,contact.ContactContent),
									   data.MakeInParam("@NextContactAim",SqlDbType.VarChar,1000,contact.NextContactAim),
									   data.MakeInParam("@NextContactTime",SqlDbType.DateTime,8,contact.NextContactTime),					   
		
			};
			data.RunProc("sp_CM_UpdateContact",prams);
			SqlParameter[] prams3 = new SqlParameter[]{
														  data.MakeInParam("@contactid",SqlDbType.Int,4,contact.ID)
													  };
			data.RunProc("sp_CM_DelContact_Linkman",prams3);
			SqlParameter[] prams4 = new SqlParameter[]{
														  data.MakeInParam("@contactid",SqlDbType.Int,4,contact.ID)
													  };
			data.RunProc("sp_CM_DelContact_Cooperater",prams4);

			foreach(Cooperater cooperater in contact.arrCooperater)
			{
				SqlParameter[] prams1 = new SqlParameter[]{
															  data.MakeInParam("@staffid",SqlDbType.Int,4,cooperater.StaffID),
															  data.MakeInParam("@contactid",SqlDbType.Int,4,contact.ID)
														  };
				data.RunProc("sp_CM_AddContact_Cooperater",prams1);
			}
			foreach(Linkman linkman in contact.arrLinkman)
			{
				SqlParameter[] prams2 = new SqlParameter[]{
															  data.MakeInParam("@staffid",SqlDbType.Int,4,linkman.ID),
															  data.MakeInParam("@contactid",SqlDbType.Int,4,contact.ID)	
														  };
				data.RunProc("sp_CM_AddContact_Linkman",prams2);
			}
		}
		#endregion
	
		#region ���ݿͻ�ID�õ��Ӵ���Ϣ
		public SqlDataReader GetClientContactInfo(int clientid)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@clientid",  SqlDbType.Int, 4, clientid)
								   };
			data.RunProc ("sp_CM_GetClientContactInfo",prams,out dr);
			return(dr);
		}
		#endregion

		#region ���ݿͻ�ID�õ������ڽӴ���Ϣ
		public SqlDataReader GetClientContactInfo_thisWeek(int clientid)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@clientid",  SqlDbType.Int, 4, clientid)
								   };
			data.RunProc ("sp_CM_GetClientContactInfo_thisWeek",prams,out dr);
			return(dr);
		}
		#endregion

		#region ���ݽӴ�id�õ��Ӵ���Ϣ
		public Contact GetClientContactStruct(int contactid)
		{
			Contact contact = new Contact();
			CM cm = new CM();
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@contactid",  SqlDbType.Int, 4, contactid)
								   };
			data.RunProc("sp_CM_GetContactByID",prams,out dr);
			while(dr.Read())
			{
				contact.BargainPrognosis = dr["BargainPrognosis"].ToString();
				contact.ClientID = Int32.Parse(dr["ClientID"].ToString());
				contact.ContactAim = dr["ContactAim"].ToString();
				contact.ContactContent = dr["ContactContent"].ToString();
				contact.ContactStatus = dr["CurStatus"].ToString();
				
				contact.ContactTimes = Int32.Parse(dr["ContactTimes"].ToString());
				contact.ContactType = dr["ContactType"].ToString();
				contact.FeeUsed = dr["FeeUsed"].ToString();
				contact.ID = Int32.Parse(dr["ID"].ToString());
				contact.NextContactAim = dr["NextContactAim"].ToString();
				contact.NextContactTime = DateTime.Parse(dr["NextContactTime"].ToString());
				contact.SellMoney = dr["SellMoney"].ToString();

				if(dr["contacttime"]!=DBNull.Value) 
					contact.ContactTime = DateTime.Parse(dr["contacttime"].ToString());
				else
					contact.ContactTime = DateTime.Parse("1900-1-1");

			}
			dr.Close();
			SqlParameter[] prams1 = {
									   data.MakeInParam("@contactid",  SqlDbType.Int, 4, contactid)
								   };
			data.RunProc("sp_CM_GetContactLinkman",prams1,out dr);
			while(dr.Read())
			{
				Linkman linkman = new Linkman();
				linkman.Address = dr["Address"].ToString();
				linkman.ClientID = Int32.Parse(dr["ClientID"].ToString());
				linkman.Description = dr["Description"].ToString();
				linkman.Email = dr["Email"].ToString();
				linkman.Family = dr["Family"].ToString();
				linkman.Gender = Convert.ToBoolean(dr["Gender"]);
				linkman.ID = Int32.Parse(dr["ID"].ToString());
				linkman.Mobile = dr["Mobile"].ToString();
				linkman.Name = dr["Name"].ToString();
				linkman.Position = dr["Position"].ToString();
				linkman.Telephone = dr["Telephone"].ToString();
				contact.AddLinkman(linkman);
			}
			dr.Close();
			SqlParameter[] prams2 = {
										data.MakeInParam("@contactid",  SqlDbType.Int, 4, contactid)
									};
			data.RunProc("sp_CM_GetContactCooperater",prams2,out dr);
			while(dr.Read())
			{
				Cooperater cooperater = new Cooperater();
				cooperater.StaffID = Int32.Parse(dr["CooperatingmanID"].ToString());
				contact.AddCooperater(cooperater);
			}

			return(contact);

		}
		#endregion

		#region �õ�����Эͬ��
		public SqlDataReader GetAllCooperater()
		{
			Database data = new Database();
			SqlDataReader dr = null;
			data.RunProc ("sp_CM_GetAllCooperater",out dr);
			return(dr);
		}
		#endregion

		#region ���ݿͻ�id�õ�Эͬ��
		public SqlDataReader GetCooperaterByClientID(int clientid)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									    data.MakeInParam("@ClientID",SqlDbType.Int,4,clientid)
			};
			data.RunProc ("sp_CM_GetCooperaterByClientID",prams,out dr);
			return(dr);
		}
		#endregion

		#region ������Աid�õ��ͻ��б�
		public SqlDataReader GetMyClients(int staffid)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@staffid",  SqlDbType.Int, 4, staffid)
								   };
			data.RunProc ("sp_CM_GetClientsByStaff",prams,out dr);
			return(dr);
		}
		#endregion

		#region ������Աid�õ�ʱ����ڵĽӴ����
		public SqlDataReader GetContactByStaffIDandTime(int staffid,DateTime begintime,DateTime endtime)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@staffid",  SqlDbType.Int, 4, staffid),
									   data.MakeInParam("@begintime",SqlDbType.DateTime,8,begintime),
									   data.MakeInParam("@endtime",SqlDbType.DateTime,8,endtime)
								   };
			data.RunProc ("sp_CM_GetContactByStaff",prams,out dr);
			return(dr);
		}
		#endregion

		#region ��ʱ�䷶Χ�ڵõ�������Ա�б�
		public SqlDataReader GetSellman(DateTime begintime,DateTime endtime)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@begintime",SqlDbType.DateTime,8,begintime),
									   data.MakeInParam("@endtime",SqlDbType.DateTime,8,endtime)
								   };
			data.RunProc ("sp_CM_GetSellman",prams,out dr);
			return(dr);
		}
		#endregion

		#region �õ�ʱ��νӴ����
		public SqlDataReader GetContactInfo(DateTime begintime,DateTime endtime)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									  
									   data.MakeInParam("@begintime",SqlDbType.DateTime,8,begintime),
									   data.MakeInParam("@endtime",SqlDbType.DateTime,8,endtime)
								   };
			data.RunProc ("sp_CM_GetContactInfo",prams,out dr);
			return(dr);
		}
		#endregion

		#region �õ�ʱ��ΰݷÿͻ��Ӵ����
		public SqlDataReader GetCallinContactInfo(DateTime begintime,DateTime endtime)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									  
									   data.MakeInParam("@begintime",SqlDbType.DateTime,8,begintime),
									   data.MakeInParam("@endtime",SqlDbType.DateTime,8,endtime)
								   };
			data.RunProc ("sp_CM_GetCallinContact",prams,out dr);
			return(dr);
		}
		#endregion

		#region �õ�ʱ����ڵ��¿ͻ����
		public SqlDataReader GetNewClient(DateTime begintime,DateTime endtime)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									
									   data.MakeInParam("@begintime",SqlDbType.DateTime,8,begintime),
									   data.MakeInParam("@endtime",SqlDbType.DateTime,8,endtime)
								   };
			data.RunProc ("sp_CM_GetNewClient",prams,out dr);
			return(dr);
		}
		#endregion

		#region �õ�ʱ����ڵĽ���̸�еĿͻ����
		public SqlDataReader GetNegotiateClient()
		{
			Database data = new Database();
			SqlDataReader dr = null;
			data.RunProc ("sp_CM_GetNegotiateClient",out dr);
			return(dr);
		}
		#endregion

		#region �õ�ʱ����ڵĽ���̸�е��¿ͻ����
		public SqlDataReader GetNewNegotiateClient(DateTime begintime,DateTime endtime)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									
									   data.MakeInParam("@begintime",SqlDbType.DateTime,8,begintime),
									   data.MakeInParam("@endtime",SqlDbType.DateTime,8,endtime)
								   };
			data.RunProc ("sp_CM_GetNewNegotiateClient",prams,out dr);
			return(dr);
		}
		#endregion

		#region ����sellmanid�õ�ʱ���ڵ��¿ͻ����
		public SqlDataReader GetNewClientBySellman(int sellmanid, DateTime begintime,DateTime endtime)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@sellmanid",SqlDbType.Int,4,sellmanid),
									   data.MakeInParam("@begintime",SqlDbType.DateTime,8,begintime),
									   data.MakeInParam("@endtime",SqlDbType.DateTime,8,endtime)
								   };
			data.RunProc ("sp_CM_GetNewClientBySellmanID",prams,out dr);
			return(dr);
		}
		#endregion

		#region �õ�ʱ��ε�3�ǿͻ����
		public SqlDataReader GetNew3StarClient(DateTime begintime,DateTime endtime)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									  
									   data.MakeInParam("@begintime",SqlDbType.DateTime,8,begintime),
									   data.MakeInParam("@endtime",SqlDbType.DateTime,8,endtime)
								   };
			data.RunProc ("sp_CM_GetNew3StarClient",prams,out dr);
			return(dr);
		}
		#endregion

		#region �õ�ȫ��3�ǿͻ����
		public SqlDataReader Get3StarClient()
		{
			Database data = new Database();
			SqlDataReader dr = null;
			data.RunProc ("sp_CM_Get3StarClient",out dr);
			return(dr);
		}
		#endregion

		#region ����sellmanid�õ�ʱ��ε�3�ǿͻ����
		public SqlDataReader GetNew3StarClientBySellmanID(int sellmanid,DateTime begintime,DateTime endtime)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@sellmanid",SqlDbType.Int,4,sellmanid),
									   data.MakeInParam("@begintime",SqlDbType.DateTime,8,begintime),
									   data.MakeInParam("@endtime",SqlDbType.DateTime,8,endtime)
								   };
			data.RunProc ("sp_CM_GetNew3StarClientBySellmanID",prams,out dr);
			return(dr);
		}
		#endregion

		#region ����sellmanid�õ�ʱ��εĽӴ����Ŀͻ����
		public SqlDataReader GetContactedClientBySellmanID(int sellmanid,DateTime begintime,DateTime endtime)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@sellmanid",SqlDbType.Int,4,sellmanid),
									   data.MakeInParam("@begintime",SqlDbType.DateTime,8,begintime),
									   data.MakeInParam("@endtime",SqlDbType.DateTime,8,endtime)
								   };
			data.RunProc ("sp_CM_GetContactedClientBySellman",prams,out dr);
			return(dr);
		}
		#endregion

		#region ����sellmanid�õ�ʱ��İݷù��Ŀͻ����
		public SqlDataReader GetCallinClientBySellmanID(int sellmanid,DateTime begintime,DateTime endtime)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@sellmanid",SqlDbType.Int,4,sellmanid),
									   data.MakeInParam("@begintime",SqlDbType.DateTime,8,begintime),
									   data.MakeInParam("@endtime",SqlDbType.DateTime,8,endtime)
								   };
			data.RunProc ("sp_CM_GetCallinContactBySellmanID",prams,out dr);
			return(dr);
		}
		#endregion

		#region ����sellmanid�õ�ʱ����ڵĽӴ����
		public SqlDataReader GetContactBySellmanID(int sellmanid,DateTime begintime,DateTime endtime)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@sellmanid",SqlDbType.Int,4,sellmanid),
									   data.MakeInParam("@begintime",SqlDbType.DateTime,8,begintime),
									   data.MakeInParam("@endtime",SqlDbType.DateTime,8,endtime)
								   };
			data.RunProc ("sp_CM_GetContactBySellmanID",prams,out dr);
			return(dr);
		}
		#endregion

		#region ����sellmanid�õ�ʱ����ڵİݷýӴ����
		public SqlDataReader GeCallinContactBySellmanID(int sellmanid,DateTime begintime,DateTime endtime)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@sellmanid",SqlDbType.Int,4,sellmanid),
									   data.MakeInParam("@begintime",SqlDbType.DateTime,8,begintime),
									   data.MakeInParam("@endtime",SqlDbType.DateTime,8,endtime)
								   };
			data.RunProc ("sp_CM_GetCallinContactBySellmanID",prams,out dr);
			return(dr);
		}
		#endregion

		#region �õ�ʱ�����������Ա�������
		public SqlDataReader GetFeeBySellmanID(int sellmanid,DateTime begintime,DateTime endtime)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@sellmanid",SqlDbType.Int,4,sellmanid),
									   data.MakeInParam("@begintime",SqlDbType.DateTime,8,begintime),
									   data.MakeInParam("@endtime",SqlDbType.DateTime,8,endtime)
								   };
			data.RunProc ("sp_CM_GetContactFeeBySellmanID",prams,out dr);
			return(dr);
		}
		#endregion

		#region ����sellmanid�õ�ʱ����ڵĲ��÷���
		public int GetTravelFeeBySellmanID(int sellmanid,DateTime begintime,DateTime endtime)
		{
			int result = 0;
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@sellmanid",SqlDbType.Int,4,sellmanid),
									   data.MakeInParam("@begintime",SqlDbType.DateTime,8,begintime),
									   data.MakeInParam("@endtime",SqlDbType.DateTime,8,endtime)
								   };
			data.RunProc ("sp_CM_GetTravelFeeBySellmanID",prams,out dr);
			while(dr.Read())
			{
				if(dr["fee"]!=DBNull.Value)
					result = Int32.Parse(dr["fee"].ToString());
			}
			return(result);
		}
		#endregion

		#region ����sellmanid�õ�ʱ����ڵĲ�������
		public int GetFoodFeeBySellmanID(int sellmanid,DateTime begintime,DateTime endtime)
		{
			int result = 0;
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@sellmanid",SqlDbType.Int,4,sellmanid),
									   data.MakeInParam("@begintime",SqlDbType.DateTime,8,begintime),
									   data.MakeInParam("@endtime",SqlDbType.DateTime,8,endtime)
								   };
			data.RunProc ("sp_CM_GetFoodFeeBySellmanID",prams,out dr);
			while(dr.Read())
			{
				if(dr["fee"]!=DBNull.Value)
					result = Int32.Parse(dr["fee"].ToString());
			}
			return(result);
		}
		#endregion

		#region ����sellmanid�õ�ʱ����ڵ���Ʒ����
		public int GetGiftFeeBySellmanID(int sellmanid,DateTime begintime,DateTime endtime)
		{
			int result = 0;
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@sellmanid",SqlDbType.Int,4,sellmanid),
									   data.MakeInParam("@begintime",SqlDbType.DateTime,8,begintime),
									   data.MakeInParam("@endtime",SqlDbType.DateTime,8,endtime)
								   };
			data.RunProc ("sp_CM_GetGiftFeeBySellmanID",prams,out dr);
			while(dr.Read())
			{
				if(dr["fee"]!=DBNull.Value)
					result = Int32.Parse(dr["fee"].ToString());
			}
			return(result);
		}
		#endregion

		#region ����sellmanid�õ�ʱ����ڵĹ��ط���
		public int GetOuterFeeBySellmanID(int sellmanid,DateTime begintime,DateTime endtime)
		{
			int result = 0;
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@sellmanid",SqlDbType.Int,4,sellmanid),
									   data.MakeInParam("@begintime",SqlDbType.DateTime,8,begintime),
									   data.MakeInParam("@endtime",SqlDbType.DateTime,8,endtime)
								   };
			data.RunProc ("sp_CM_GetOuterFeeBySellmanID",prams,out dr);
			while(dr.Read())
			{
				if(dr["fee"]!=DBNull.Value)
					result = Int32.Parse(dr["fee"].ToString());
			}
			return(result);
		}
		#endregion

		#region �ϴ�һ���ļ��õ�id��
		public int InsertFile(string path,string type,int pertainid,string extension)
		{
			Database data = new Database();
			SqlParameter[] prams = {
									   data.MakeInParam("@path",SqlDbType.VarChar,500,path),
									   data.MakeInParam("@type",SqlDbType.VarChar,50,type),
									   data.MakeInParam("@pertainID",SqlDbType.Int,4,pertainid),
									   data.MakeInParam("@extension",SqlDbType.VarChar,100,extension)
								   };
			
			return(data.RunProc ("sp_CM_AddFile",prams));
		}

		#endregion

		#region ����contactid�õ��ϴ�������Ϣ
		public SqlDataReader GetAttachmentByContactID(int contactid)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@contactid",SqlDbType.Int,4,contactid)
								   };
			data.RunProc ("sp_CM_GetAttachmentByContactID",prams,out dr);
			return(dr);
		}
		#endregion

		#region ����clientid�õ��ϴ�������Ϣ
		public SqlDataReader GetAttachmentByClientID(int clientid)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@clientid",SqlDbType.Int,4,clientid)
								   };
			data.RunProc ("sp_CM_GetAttachmentByClientID",prams,out dr);
			return(dr);
		}
		#endregion


	}

	#region ���ݽṹ

	#region �ͻ��ṹ
	/// <summary>
	/// �ͻ���Ϣ
	/// </summary>
	public class ClientInfo
	{
		private int id = 0;
		private DateTime birthday = DateTime.Now;
		private DateTime updatetime = DateTime.Now;
		private string clientshortname = "";
		private string clientname = "";
		private int chieflinkmanid = 0;
		private string linkman_telephone = "";
		private string clienttype = "";
		private string enterprisetype = "";
		private string clienttrade = "";
		private string clientsource = "";
		private string clientinitiative = "";
		private int addmanid = 0;
		private int contacttimes = 0;
		private string sellphase = "";
		private string bargainprognosis = "";
		private float fee = 0;
		private string curstatus = "";
		private string type = "";

		/// <summary>
		/// �ͻ�ID
		/// </summary>
		public int ID
		{
			get{return id;}
			set{id = value;	}
		}
		/// <summary>
		/// �������
		/// </summary>
		public DateTime Birthday
		{
			get{return birthday;}
			set{birthday = value;}
		}
		/// <summary>
		/// ����������
		/// </summary>
		public DateTime UpdateTime
		{
			get{return updatetime;}
			set{updatetime = value;}
		}
		/// <summary>
		/// �����ID
		/// </summary>
		public int AddManID
		{
			get{return addmanid;}
			set{addmanid = value;}
		}
		/// <summary>
		/// �ͻ����
		/// </summary>
		public string ClientShortName
		{
			get{return clientshortname;}
			set{clientshortname = value;}
		}
		/// <summary>
		/// ��Ҫ��ϵ��ID
		/// </summary>
		public int ChiefLinkmanID
		{
			get{return chieflinkmanid;}
			set{chieflinkmanid = value;}
		}
		/// <summary>
		/// �ͻ�ȫ��
		/// </summary>
		public string ClientName
		{
			get{return clientname;}
			set{clientname = value;}
		}
		/// <summary>
		/// �ͻ�����
		/// </summary>
		public string ClientType
		{
			get{return clienttype;}
			set{clienttype = value;}
		}
		/// <summary>
		/// ��ҵ����
		/// </summary>
		public string EnterpriseType
		{
			get{return enterprisetype;}
			set{enterprisetype = value;}
		}
		/// <summary>
		/// ������ҵ
		/// </summary>
		public string ClientTrade
		{
			get{return clienttrade;}
			set{clienttrade = value;}
		}
		/// <summary>
		/// �ͻ���Դ
		/// </summary>
		public string ClientSource
		{
			get{return clientsource;}
			set{clientsource = value;}
		}
		/// <summary>
		/// �ͻ�����
		/// </summary>
		public string ClientInitiative
		{
			get{return clientinitiative;}
			set{clientinitiative = value;}
		}
		/// <summary>
		/// �Ӵ�����
		/// </summary>
		public int ContactTimes
		{
			get{return contacttimes;}
			set{contacttimes = value;}
		}
		/// <summary>
		/// ���۽׶�
		/// </summary>
		public string SellPhase
		{
			get{return sellphase;}
			set{sellphase = value;}
		}
		/// <summary>
		/// �ɽ�����
		/// </summary>
		public string BargainPrognosis
		{
			get{return bargainprognosis;}
			set{bargainprognosis = value;}
		}
		/// <summary>
		/// ��������
		/// </summary>
		public float Fee
		{
			get{return fee;}
			set{fee = value;}
		}
		/// <summary>
		/// ��ϵ�˵绰
		/// </summary>
		public string Linkman_Telephone
		{
			get{return linkman_telephone;}
			set{linkman_telephone = value;}
		}
		/// <summary>
		/// ��ǰ״̬
		/// </summary>
		public string CurStatus
		{
			get{return curstatus;}
			set{curstatus = value;}
		}
		/// <summary>
		/// �ͻ�����
		/// </summary>
		public string Type
		{
			get{return type;}
			set{type = value;}
		}

		private string affiliatedarea = "";
		/// <summary>
		/// ��������
		/// </summary>
		public string Affiliatedarea
		{
			get{return affiliatedarea;}
			set{affiliatedarea = value;}
		}

		private string url = "";
		/// <summary>
		/// ��ַ
		/// </summary>
		public string URL
		{
			get{return url;}
			set{url = value;}
		}

		private string zip = "";
		/// <summary>
		/// �ʱ�
		/// </summary>
		public string ZIP
		{
			get{return zip;}
			set{zip = value;}
		}

		private string address = "";
		/// <summary>
		/// ��ַ
		/// </summary>
		public string Address
		{
			get{return address;}
			set{address = value;}
		}

		private string companyproperty = "";
		/// <summary>
		/// ��˾����
		/// </summary>
		public string CompanyProperty
		{
			get{return companyproperty;}
			set{companyproperty = value;}
		}

		private string calling = "";
		/// <summary>
		/// ������ҵ
		/// </summary>
		public string Calling
		{
			get{return calling;}
			set{calling = value;}
		}

		private string companysize = "";
		/// <summary>
		/// ��˾��ģ
		/// </summary>
		public string CompanySize
		{
			get{return companysize;}
			set{companysize = value;}
		}

		private string money = "";
		/// <summary>
		/// ע���ʽ�
		/// </summary>
		public string Money
		{
			get{return money;}
			set{money = value;}
		}

		private string operation = "";
		/// <summary>
		/// ��Ӫҵ��
		/// </summary>
		public string Operation
		{
			get{return operation;}
			set{operation = value;}
		}
		
		private string introduce = "";
		/// <summary>
		/// ��ҵ���
		/// </summary>
		public string Introduce
		{
			get{return introduce;}
			set{introduce = value;}
		}

		private string itgrade = "";
		/// <summary>
		/// ��Ϣ���̶�
		/// </summary>
		public string ITGrade
		{
			get{return itgrade;}
			set{itgrade = value;}
		}

		private int pcnumber = 0;
		/// <summary>
		/// ��������
		/// </summary>
		public  int PCNumber
		{
			get{return pcnumber;}
			set{pcnumber = value;}
		}

		private string net = "";
		/// <summary>
		/// ����״��
		/// </summary>
		public string Net
		{
			get{return net;}
			set{net = value;}
		}
		
		private int itstaffs = 0;
		/// <summary>
		/// רҵIT��Ա
		/// </summary>
		public int ITStaffs
		{
			get{return itstaffs;}
			set{itstaffs = value;}
		}
		
		private string itdepartment = "";
		/// <summary>
		/// IT����
		/// </summary>
		public string ITDepartment
		{
			get{return itdepartment;}
			set{itdepartment = value;}
		}

		private string principal;
		/// <summary>
		/// ������
		/// </summary>
		public string Principal
		{
			get{return principal;}
			set{principal = value;}
		}

		private string system = "";
		/// <summary>
		/// ϵͳ
		/// </summary>
		public string System
		{
			get{return system;}
			set{system = value;}
		}

		private string customer = "";
		/// <summary>
		/// �ͻ���Դ
		/// </summary>
		public string Customer
		{
			get{return customer;}
			set{customer = value;}
		}

		private DateTime firstcontacttime;
		/// <summary>
		/// �״νӴ�ʱ��
		/// </summary>
		public DateTime FirstContactTime
		{
			get{return firstcontacttime;}
			set{firstcontacttime = value;}
		}

		private DateTime nextcontacttime;
		/// <summary>
		/// �´νӴ�ʱ��
		/// </summary>
		public DateTime NextContactTime
		{
			get{return nextcontacttime;}
			set{nextcontacttime = value;}
		}

		private DateTime contacttime;
		/// <summary>
		/// �Ӵ�ʱ��
		/// </summary>
		public DateTime ContactTime
		{
			get{return contacttime;}
			set{contacttime = value;}
		}

	}
	/// <summary>
	/// �ͻ����
	/// </summary>
	enum ClientType {terminal,channal,social,media};
	/// <summary>
	/// ��ҵ����
	/// </summary>
	enum EnterpriseType {government,contry,oversea,stock,privateowned}
	/// <summary>
	/// ������ҵ
	/// </summary>
	enum ClientTrade 
	{
		realty,IT,business,telecom,post,refer,travel,bus,stock,insurance,tax,make,he,clothe,food,medicine,engine,auto,mechanism
	};
	/// <summary>
	/// ����״��
	/// </summary>
	enum ClientNet
	{LAN,WAN,INTERNET};
	/// <summary>
	/// �ͻ���Դ
	/// </summary>
	enum ClientSource
	{
		sellman,familiar,introduce,client
	};
	/// <summary>
	/// �ͻ�����
	/// </summary>
	enum ClientInitiative 
	{
		media,searchweb,proseminar,exhibition,post,email,
	};
	#endregion

	#region ��ϵ�˽ṹ
	public class Linkman
	{
		private int id = 0;
		private int clientid = 0;
		private string name = "";
		private string mobile = "";
		private string telephone = "";
		private string position = "";
		private string email = "";
		private bool gender = true;
		private string description = "";
		private string address = "";
		private string family = "";

		/// <summary>
		/// ��ϵ��id
		/// </summary>
		public int ID
		{
			get{return id;}
			set{id = value;}
		}
		/// <summary>
		/// ��ϵ������
		/// </summary>
		public string Name
		{
			get{return name;}
			set{name = value;}
		}
		/// <summary>
		/// �ͻ�ID
		/// </summary>
		public int ClientID
		{
			get{return clientid;}
			set{clientid = value;}
		}
		/// <summary>
		/// �ֻ�����
		/// </summary>
		public string Mobile
		{
			get{return mobile;}
			set{mobile = value;}
		}
		/// <summary>
		/// �绰
		/// </summary>
		public string Telephone
		{
			get{return telephone;}
			set{telephone = value;}
		}
		/// <summary>
		/// ְλ
		/// </summary>
		public string Position
		{
			get{return position;}
			set{position = value;}
		}

		public string Email
		{
			get{return email;}
			set{email = value;}
		}
		/// <summary>
		/// �Ա�
		/// </summary>
		public bool Gender
		{
			get{return gender;}
			set{gender = value;}
		}
		/// <summary>
		/// ����˵��
		/// </summary>
		public string Description
		{
			get{return description;}
			set{description = value;}
		}
		/// <summary>
		/// ��Ů���
		/// </summary>
		public string Family
		{
			get{return family;}
			set{family = value;}
		}
		/// <summary>
		/// ��ͥסַ
		/// </summary>
		public string Address
		{
			get{return address;}
			set{address = value;}
		}
	}
	#endregion

	#region Эͬ��Ա�ṹ
	public class Cooperater
	{
		private int staffid;
		/// <summary>
		/// Эͬ��ԱID
		/// </summary>
		public int StaffID
		{
			get{return staffid;}
			set{staffid = value;}
		}
	}

	#endregion

	#region �Ӵ�����ṹ
	public class Contact
	{
		private int id = 0;
		private int staffid = 0;
		private int clientid = 0;
		private string contactaim = "";
		private string sellmoney = "";
		private string bargainprognosis = "";
		private string contacttype = "";
		private float thisfee = 0;
		private string contactstatus = "";
		private string feeused = "";
		private string contactcontent = "";
		private string nextcontactaim = "";
		private DateTime nextcontacttime = DateTime.Now;
		private DateTime contacttime = DateTime.Now;
		private DateTime updatetime = DateTime.Now;
		private int contacttimes = 0;
		public ArrayList arrCooperater = new ArrayList(); 
		public ArrayList arrLinkman = new ArrayList();
		
		/// <summary>
		/// ���Эͬ��Ա
		/// </summary>
		/// <param name="cooperater"></param>
		public void AddCooperater(Cooperater cooperater)
		{
			if(!arrCooperater.Contains(cooperater))
				arrCooperater.Add(cooperater);

		}
		/// <summary>
		/// �Ƴ�Эͬ��Ա
		/// </summary>
		/// <param name="cooperater"></param>
		public void DelCooperater(Cooperater cooperater)
		{
			if(arrCooperater.Contains(cooperater))
			{
				arrCooperater.Remove(cooperater);			
			}
			else
			{
				throw new Exception("Ҫɾ���Ķ��󲻴���");
			}
		}
		/// <summary>
		/// �����ϵ��
		/// </summary>
		/// <param name="linkman"></param>
		public void AddLinkman(Linkman linkman)
		{
			if(!arrLinkman.Contains(linkman))
				arrLinkman.Add(linkman);
		}
		/// <summary>
		/// �Ƴ���ϵ��
		/// </summary>
		/// <param name="linkman"></param>
		public void DelLinkman(Linkman linkman)
		{
			if(arrLinkman.Contains(linkman))
			{
				arrLinkman.Remove(linkman);			}
			else
			{
				throw new Exception("Ҫɾ���Ķ��󲻴���");
			}
		}
		/// <summary>
		/// �Ӵ�ID
		/// </summary>
		public int ID
		{
			get{return id;}
			set{id = value;}
		}
		/// <summary>
		/// ������Աid
		/// </summary>
		public int StaffID
		{
			get{return staffid;}
			set{staffid = value;}
		}
		/// <summary>
		/// �ͻ�ID
		/// </summary>
		public int ClientID
		{
			get{return clientid;}
			set{clientid = value;}
		}
		/// <summary>
		/// ����ʱ��
		/// </summary>
		public DateTime UpdateTime
		{
			get{return updatetime;}
			set{updatetime = value;}
		}
		/// <summary>
		/// ��Ǣ����
		/// </summary>
		public int ContactTimes
		{
			get{return contacttimes;}
			set{contacttimes = value;}
		}

		/// <summary>
		/// �Ӵ�Ŀ��
		/// </summary>
		public string ContactAim
		{
			get{return contactaim;}
			set{contactaim = value;}
		}
		/// <summary>
		/// ���ڱ��
		/// </summary>
		public string SellMoney
		{
			get{return sellmoney;}
			set{sellmoney = value;}
		}

		/// <summary>
		/// �ɽ�Ԥ��
		/// </summary>
		public string BargainPrognosis
		{
			get{return bargainprognosis;}
			set{bargainprognosis = value;}
		}

		/// <summary>
		/// �Ӵ�״̬
		/// </summary>
		public string ContactType
		{
			get{return contacttype;}
			set{contacttype = value;}
		}
		/// <summary>
		/// �Ӵ�״̬
		/// </summary>
		public string ContactStatus
		{
			get{return contactstatus;}
			set{contactstatus = value;}
		}

		/// <summary>
		/// ���η���
		/// </summary>
		public float ThisFee
		{
			get{return thisfee;}
			set{thisfee = value;}
		}

		/// <summary>
		/// ������;
		/// </summary>
		public string FeeUsed
		{
			get{return feeused;}
			set{feeused = value;}
		}

		/// <summary>
		/// �Ӵ�����
		/// </summary>
		public string ContactContent
		{
			get{return contactcontent;}
			set{contactcontent = value;}
		}

		/// <summary>
		/// �´νӴ�Ŀ��
		/// </summary>
		public string NextContactAim
		{
			get{return nextcontactaim;}
			set{nextcontactaim = value;}
		}

		/// <summary>
		/// �Ӵ�ʱ��
		/// </summary>
		public DateTime ContactTime
		{
			get{return contacttime;}
			set{contacttime = value;}
		}
		/// <summary>
		/// �´νӴ�ʱ��
		/// </summary>
		public DateTime NextContactTime
		{
			get{return nextcontacttime;}
			set{nextcontacttime = value;}
		}
	}

	/// <summary>
	/// �Ӵ���ʽ
	/// </summary>
	enum ContactType{telephone,fax,email,mail,sms,callin,interview,meeting};

	/// <summary>
	/// �Ӵ�״̬
	/// </summary>
	enum ContactStat{trace,boot,commend,requirement,submit,negotiate,actualize,traceservice,last};

	/// <summary>
	/// ������;
	/// </summary>
	enum ContactFeeUsed{travel,food,gift,outer};

	#endregion

	#endregion

}

