using System;
using System.Data;
using System.Data.SqlClient;

namespace UDS.Components
{
	/// <summary>
	/// ���Ŵ�����
	/// </summary>
	public class Department
	{

		public Department()
		{
		}
		/// <summary>
		/// ��Ӳ���
		/// </summary>
		/// <param name="pid">�����ŵĸ�����id</param>
		/// <param name="name">�����ŵ�����</param>
		/// <param name="description">�����ŵ�����</param>
		/// <returns>�����ŷ��䵽��id</returns>
		public static long Add(long ParentDepartmentID,string name,string description)
		{
			Database db = new Database();
			SqlParameter[] prams = new SqlParameter[3];
			
			prams[0] = new SqlParameter();
			prams[1] = new SqlParameter();
			prams[2] = new SqlParameter();
			
			
			prams[0].SqlDbType = SqlDbType.Int;
			prams[0].ParameterName = "@Dept_ParentID";
			prams[0].Value = ParentDepartmentID;

			
			prams[1].SqlDbType = SqlDbType.VarChar;
			prams[1].Size = 255;
			prams[1].ParameterName = "@Dept_Name";
			prams[1].Value = name;

			
			prams[2].SqlDbType = SqlDbType.Text;
			prams[2].ParameterName = "@Dept_Remark";
			prams[2].Value = description;
			

			//prams[3] = new SqlParameter();
			//prams[3].SqlDbType = SqlDbType.Int;
			//prams[3].ParameterName = "@ID";
			//prams[3].Direction = ParameterDirection.ReturnValue;

			return (db.RunProc("sp_AddDepartment",prams));
		}
		/// <summary>
		/// ��ӿ���ʱ��
		/// </summary>
		/// <param name="id">����id</param>
		/// <param name="ondutytime">�ϰ�ʱ��</param>
		/// <param name="offdutytime">�°�ʱ��</param>
		/// <returns></returns>
		public static int AddDutyTime(long DepartmentID,DateTime ondutytime,DateTime offdutytime)
		{
			Database db = new Database();
			SqlParameter[] prams = {
									   db.MakeInParam("@departmentid",SqlDbType.Int,4,DepartmentID),
									   db.MakeInParam("@ondutytime",SqlDbType.DateTime,8,ondutytime),
									   db.MakeInParam("@offdutytime",SqlDbType.DateTime,8,offdutytime)
								   };
			return (db.RunProc("sp_WA_AddDepartmentDutyTime",prams));
		}
		/// <summary>
		/// ���Ĳ��ſ���ʱ��
		/// </summary>
		/// <param name="id">����id</param>
		/// <param name="ondutytime">�ϰ�ʱ��</param>
		/// <param name="offdutytime">�°�ʱ��</param>
		/// <returns></returns>
		public static int UpdateDutyTime(long DepartmentID,DateTime ondutytime,DateTime offdutytime)
		{
			Database db = new Database();
			SqlParameter[] prams = {
									   db.MakeInParam("@departmentid",SqlDbType.Int,4,DepartmentID),
									   db.MakeInParam("@ondutytime",SqlDbType.VarChar,20,ondutytime.ToShortTimeString()),
									   db.MakeInParam("@offdutytime",SqlDbType.VarChar,20,offdutytime.ToShortTimeString())
								   };
			return (db.RunProc("sp_WA_UpdateDepartmentDutyTime",prams));
		}

		public static int DeleteDutyTime(long DepartmentID)
		{
			Database db = new Database();
			SqlParameter[] prams = {
									   db.MakeInParam("@departmentid",SqlDbType.Int,4,DepartmentID)
								   };
			return (db.RunProc("sp_WA_DeleteDepartmentDutyTime",prams));
		}


		public static int Delete(long DepartmentID)
		{
			Database db = new Database();
			SqlParameter[] prams = {
										db.MakeInParam("@Dept_id",SqlDbType.Int,4,DepartmentID)
								   };
			return(db.RunProc("sp_DeleteDepartment",prams));
		}

		public static int Modify(long DepartmentID,string dep_name,string dep_description)
		{
			Database db = new Database();
			SqlParameter[] prams = {
										db.MakeInParam("@dept_id",SqlDbType.Int,4,DepartmentID),
										db.MakeInParam("@dept_name",SqlDbType.VarChar,300,dep_name),
										db.MakeInParam("@dept_description",SqlDbType.VarChar,300,dep_description)
								   };
			return (db.RunProc("sp_UpdateDepartmentInfo",prams));
		}
		
		public SqlDataReader GetDepartmentInfo(long DepartmentID)
		{
			Database db = new Database();
			SqlDataReader dr;
			SqlParameter[] prams = {
									   db.MakeInParam("@dept_id",SqlDbType.Int,4,DepartmentID)
								   };
			db.RunProc("sp_GetDepartmentInfo",prams,out dr);

			return dr;
			
		}

		public SqlDataReader GetDepartmentDutyTime(long DepartmentID)
		{
			Database db = new Database();
			SqlDataReader dr;
			SqlParameter[] prams = {
									   db.MakeInParam("@DeptID",SqlDbType.Int,4,DepartmentID)
								   };
			db.RunProc("sp_GetDepartmentDutyTime",prams,out dr);

			return dr;
			
		}
		public int MoveDeparement(long FromDepartmentID,long ToDepartmentID)
		{

			Database db = new Database();
			SqlParameter[] prams = {
									   db.MakeInParam("@FromDepartmentID",SqlDbType.Int,4,FromDepartmentID),
									   db.MakeInParam("@ToDepartmentID",SqlDbType.Int,4,ToDepartmentID),
								   };
			return (db.RunProc("sp_MoveDepartment",prams));

		}

	}
}
