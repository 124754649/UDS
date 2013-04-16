using System;
using System.ComponentModel;
using System.Collections;
using System.Diagnostics;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace UDS.Components {
	/// <summary>
	/// ͨ�õ����ݿ⴦���࣬ͨ��ado.net�����ݿ�����
	/// </summary>
	public class Database : IDisposable {
		// ��������Դ
		private SqlConnection con;
		
		/// <summary>
		/// ִ�д洢����
		/// </summary>
		/// <param name="procName">�洢���̵�����</param>
		/// <returns>���ش洢���̷���ֵ</returns>
		public int RunProc(string procName) {
			SqlCommand cmd = CreateCommand(procName, null);
			cmd.ExecuteNonQuery();
			this.Close();
			return (int)cmd.Parameters["ReturnValue"].Value;
		}

		/// <summary>
		/// ִ�д洢����
		/// </summary>
		/// <param name="procName">�洢��������</param>
		/// <param name="prams">�洢�����������</param>
		/// <returns>���ش洢���̷���ֵ</returns>
		public int RunProc(string procName, SqlParameter[] prams) {
			SqlCommand cmd = CreateCommand(procName, prams);
			cmd.ExecuteNonQuery();
			this.Close();
			return (int)cmd.Parameters["ReturnValue"].Value;
		}

		/// <summary>
		/// ִ�д洢����
		/// </summary>
		/// <param name="procName">�洢���̵�����</param>
		/// <param name="dataReader">���ش洢���̷���ֵ</param>
		public void RunProc(string procName, out SqlDataReader dataReader) {
			SqlCommand cmd = CreateCommand(procName, null);
			dataReader = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
			//return (int)cmd.Parameters["ReturnValue"].Value;
		}

		/// <summary>
		/// ִ�д洢����
		/// </summary>
		/// <param name="procName">�洢���̵�����</param>
		/// <param name="prams">�洢�����������</param>
		/// <param name="dataReader">�洢�����������</param>
		public void RunProc(string procName, SqlParameter[] prams, out SqlDataReader dataReader) {
			SqlCommand cmd = CreateCommand(procName, prams);
			dataReader = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
			//return (int)cmd.Parameters["ReturnValue"].Value;
		}
		
		/// <summary>
		/// ����һ��SqlCommand�����Դ���ִ�д洢����
		/// </summary>
		/// <param name="procName">�洢���̵�����</param>
		/// <param name="prams">�洢�����������</param>
		/// <returns>����SqlCommand����</returns>
		private SqlCommand CreateCommand(string procName, SqlParameter[] prams) {
			// ȷ�ϴ�����
			Open();

			
			SqlCommand cmd = new SqlCommand(procName, con);
			cmd.CommandType = CommandType.StoredProcedure;

			// ���ΰѲ�������洢����
			if (prams != null) {
				foreach (SqlParameter parameter in prams)
					cmd.Parameters.Add(parameter);
			}
			
			// ���뷵�ز���
			cmd.Parameters.Add(
				new SqlParameter("ReturnValue", SqlDbType.Int, 4,
				ParameterDirection.ReturnValue, false, 0, 0,
				string.Empty, DataRowVersion.Default, null));

			return cmd;
		}

		/// <summary>
		/// �����ݿ�����.
		/// </summary>
		private void Open() {
			// �����ݿ�����
			if (con == null) {
				con = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ConnectionString);				
			}				
			if(con.State ==System.Data.ConnectionState.Closed)
				con.Open();

		}

		/// <summary>
		/// �ر����ݿ�����
		/// </summary>
		public void Close() {
			if (con != null)
				con.Close();
		}

		/// <summary>
		/// �ͷ���Դ
		/// </summary>
		public void Dispose() {
			// ȷ�������Ƿ��Ѿ��ر�
			if (con != null) {
				con.Dispose();
				con = null;
			}				
		}

		/// <summary>
		/// �����������
		/// </summary>
		/// <param name="ParamName">�洢��������</param>
		/// <param name="DbType">��������</param></param>
		/// <param name="Size">������С</param>
		/// <param name="Value">����ֵ</param>
		/// <returns>�µ� parameter ����</returns>
		public SqlParameter MakeInParam(string ParamName, SqlDbType DbType, int Size, object Value) {
			return MakeParam(ParamName, DbType, Size, ParameterDirection.Input, Value);
		}		

		/// <summary>
		/// ���뷵��ֵ����
		/// </summary>
		/// <param name="ParamName">�洢��������</param>
		/// <param name="DbType">��������</param>
		/// <param name="Size">������С</param>
		/// <returns>�µ� parameter ����</returns>
		public SqlParameter MakeOutParam(string ParamName, SqlDbType DbType, int Size) {
			return MakeParam(ParamName, DbType, Size, ParameterDirection.Output, null);
		}		

		/// <summary>
		/// ���뷵��ֵ����
		/// </summary>
		/// <param name="ParamName">�洢��������</param>
		/// <param name="DbType">��������</param>
		/// <param name="Size">������С</param>
		/// <returns>�µ� parameter ����</returns>
		public SqlParameter MakeReturnParam(string ParamName, SqlDbType DbType, int Size) 
		{
			return MakeParam(ParamName, DbType, Size, ParameterDirection.ReturnValue, null);
		}	
	
		/// <summary>
		/// ���ɴ洢���̲���
		/// </summary>
		/// <param name="ParamName">�洢��������</param>
		/// <param name="DbType">��������</param>
		/// <param name="Size">������С</param>
		/// <param name="Direction">��������</param>
		/// <param name="Value">����ֵ</param>
		/// <returns>�µ� parameter ����</returns>
		public SqlParameter MakeParam(string ParamName, SqlDbType DbType, Int32 Size, ParameterDirection Direction, object Value) {
			SqlParameter param;

			if(Size > 0)
				param = new SqlParameter(ParamName, DbType, Size);
			else
				param = new SqlParameter(ParamName, DbType);

			param.Direction = Direction;
			if (!(Direction == ParameterDirection.Output && Value == null))
				param.Value = Value;

			return param;
		}
	}
}
