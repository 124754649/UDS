using System;
using System.Data;
using System.Data.SqlClient;

namespace UDS.Components
{
	enum AssignRightsAction
	{
		RULE_ADD    =1,
		RULE_DELETE =2,
		ACTIVITY_ADD =3,
		ACTIVITY_DELETE =4,
		ACTIVITY_UPDATE  =5
	};
	/// <summary>
	/// ��Ȩ�޵Ĳ���
	/// </summary>
	public class AssignRights
	{
		#region ���Ȩ��
		/// <summary>
		/// ���Ȩ��
		/// </summary>
		/// <param name="SrcID"></param>
		/// <param name="ObjID"></param>
		/// <param name="BaseOn"></param>
		/// <param name="ProcID"></param>
		/// <returns></returns>
		public int AddRight(long SrcID,long ObjID,int BaseOn,int ProcID) 
		{
			int iReturn=1;
			UDS.Components.Database mySQL = new UDS.Components.Database();
			try
			{

				SqlParameter[] parameters = {
												mySQL.MakeInParam("@Act_ID",	SqlDbType.Int,	4,ProcID),
												mySQL.MakeInParam("@Based_On",	SqlDbType.Int,	4,BaseOn),
												mySQL.MakeInParam("@Src_ID",	SqlDbType.Int,	4,SrcID),
												mySQL.MakeInParam("@Obj_ID",	SqlDbType.Int,	4,ObjID)											

										};					
				mySQL.RunProc("sp_AddAssignRule",parameters);				
			}
			catch(Exception e)
			{
				Error.Log(e.ToString());
			}
			finally
			{
				mySQL.Close();
				mySQL = null;	
			}
			return iReturn;
			

		}
		#endregion

		#region ɾ��Ȩ��
		/// <summary>
		/// ɾ��Ȩ��
		/// </summary>
		/// <param name="RuleIDs">Ȩ�޼�¼��</param>
		public int DeleteRight(string RuleIDs) 
		{
			int iReturn=1;
			UDS.Components.Database mySQL = new UDS.Components.Database();
			try
			{

				SqlParameter[] parameters = {
												mySQL.MakeInParam("@Rule_IDS",SqlDbType.VarChar ,300,RuleIDs)
																					
											};
				mySQL.RunProc("sp_DeleteAssignRule",parameters);		
			}
			catch(Exception e)
			{
				Error.Log(e.ToString());
			}
			finally
			{
				//mySQL.Close();
				//mySQL = null;	
			}
			return iReturn;
			

		}
		#endregion
		
		#region ���Ȩ���б�
		/// <summary>
		/// ���Ȩ���б�
		/// </summary>
		/// <param name="UserName">�û���</param>
		/// <param name="ClassID">Ȩ�޶���</param>
		/// <param name="dr">����DataReader</param>
		/// <returns>�����Ƿ�ɹ�</returns>
		public int GetProcessList(string UserName,long ClassID,out SqlDataReader dr) 
		{
			int iReturn=1;
			UDS.Components.Database mySQL = new UDS.Components.Database();
			SqlParameter[] parameters = {
											mySQL.MakeInParam("@UserName",SqlDbType.VarChar ,300,UserName),
											mySQL.MakeInParam("@ClassID",SqlDbType.Int,4,ClassID)											
										};
			dr = null;
			try
			{
				mySQL.RunProc("sp_GetRightListToClass",parameters,out dr);		
			}
			catch(Exception e)
			{
				Error.Log(e.ToString());
			}
			finally
			{
				//mySQL.Close();
				//mySQL = null;	
			}
			return iReturn;
			

		}
		#endregion

		#region ���Ȩ���б�
		/// <summary>
		/// ���Ȩ���б�
		/// </summary>
		/// <param name="UserName">�û���</param>
		/// <param name="ClassID">Ȩ�޶���</param>
		/// <param name="dr">����DataTable</param>
		/// <returns>�����Ƿ�ɹ�</returns>
		public int GetProcessList(string UserName,long ClassID,out DataTable dt) 
		{
			int iReturn=1;
			SqlDataReader dr;
			UDS.Components.Database mySQL = new UDS.Components.Database();
			SqlParameter[] parameters = {
											mySQL.MakeInParam("@UserName",SqlDbType.VarChar ,300,UserName),
											mySQL.MakeInParam("@ClassID",SqlDbType.Int,4,ClassID)											
										};
			dt = null;
			try
			{
				mySQL.RunProc("sp_GetRightListToClass",parameters,out dr);		
				dt = UDS.Components.Tools.ConvertDataReaderToDataTable(dr);
				
			}
			catch(Exception e)
			{
				Error.Log(e.ToString());
			}
			finally
			{
				//mySQL.Close();
				//mySQL = null;	
			}
			return iReturn;
			

		}
		#endregion

		#region �ж��û��Զ����Ƿ���ĳ��Ȩ��
		/// <summary>
		/// �ж��û��Զ����Ƿ���ĳ��Ȩ��
		/// </summary>
		/// <param name="UserName">�û���</param>
		/// <param name="classID">�����Ķ���</param>		
		/// <param name="actID">Ȩ��ID</param>
		/// <returns>�Ƿ���Ȩ��</returns>
		public bool GetAccessPermission(string UserName,int classID,int actID)
		{
			int flag = 0;
			// �������ݿ�����༰DataReader
			Database data = new Database();
				
			// ִ�д洢���̣�������SqlDataReader����
			SqlParameter[] prams = {
									   data.MakeInParam("@Class_ID" , SqlDbType.Int, 20, classID),
									   data.MakeInParam("@UserName" , SqlDbType.NVarChar, 20, UserName),
									   data.MakeInParam("@Act_ID" , SqlDbType.Int, 20, actID),
									   // data.MakeInParam("@Inheit" , SqlDbType.Bit, 1, 1),	
									   data.MakeOutParam("@ReturnValue",SqlDbType.Int,20)
								   };
			
			try 
			{
				data.RunProc("sp_GetAccessPermission",prams);
				flag = Int32.Parse(prams[3].Value.ToString());
				return (flag==1)?true:false;
			}
			catch(Exception ex)
			{
				Error.Log(ex.ToString());
				throw new Exception("��ȡ����Ȩ����",ex);
			}
			finally
			{
				data	   = null;
			}
			
		}
		#endregion

	}
}
