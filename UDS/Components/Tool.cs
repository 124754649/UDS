using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Generic;

namespace UDS.Components
{
	/// <summary>
	/// ���ù��ߺ�����
	/// </summary>
	public class Tools
	{
	
		#region ��DataReader תΪ DataTable
		/// <summary>
		/// ��DataReader תΪ DataTable
		/// </summary>
		/// <param name="DataReader">DataReader</param>
		public static DataTable ConvertDataReaderToDataTable(SqlDataReader dataReader)
		{
			DataTable datatable = new DataTable();
			DataTable schemaTable = dataReader.GetSchemaTable();
			List<DataColumn> listCols = new List<DataColumn>();
			//��̬�����
			try
			{
				if (null != schemaTable)
				{
					foreach (DataRow drow in schemaTable.Rows)
					{
						string columnName = System.Convert.ToString(drow["ColumnName"]);
						DataColumn column = new DataColumn(columnName, (Type)(drow["DataType"]));
						column.Unique = (bool)drow["IsUnique"];
						column.AllowDBNull = (bool)drow["AllowDBNull"];
						column.AutoIncrement = (bool)drow["IsAutoIncrement"];
						listCols.Add(column);
                        datatable.Columns.Add(column);
					}
				}
				//�������
				while(dataReader.Read())
				{
					DataRow myDataRow = datatable.NewRow();
                    for (int i = 0; i < listCols.Count; i++)
                    {
                        myDataRow[((DataColumn)listCols[i])] = dataReader[i];
                    }
					datatable.Rows.Add(myDataRow);
				}
				schemaTable = null;
				dataReader.Close();
				return datatable;
			}
			catch(Exception ex)
			{
				Error.Log(ex.ToString());
				throw new Exception("ת���������!",ex);
			}
			
		}

		#endregion

		#region ��Ӣ�ĵ����ڼ�תΪ����
		public static string ConvertDayOfWeekToZh(System.DayOfWeek dw)
		{
			string DayOfWeekZh="";
			switch (dw.ToString ("D"))
			{
				case "0":
					DayOfWeekZh="��";
					break;
				case "1":
					DayOfWeekZh="һ";
					break;
				case "2":
					DayOfWeekZh="��";
					break;
				case "3":
					DayOfWeekZh="��";
					break;
				case "4":
					DayOfWeekZh="��";
					break;
				case "5":
					DayOfWeekZh="��";
					break;
				case "6":
					DayOfWeekZh="��";
					break;
			}
			
			return DayOfWeekZh;
		}
		#endregion

	}
}
