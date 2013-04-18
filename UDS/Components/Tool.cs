using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Generic;

namespace UDS.Components
{
	/// <summary>
	/// 常用工具函数类
	/// </summary>
	public class Tools
	{
	
		#region 将DataReader 转为 DataTable
		/// <summary>
		/// 将DataReader 转为 DataTable
		/// </summary>
		/// <param name="DataReader">DataReader</param>
		public static DataTable ConvertDataReaderToDataTable(SqlDataReader dataReader)
		{
			DataTable datatable = new DataTable();
			DataTable schemaTable = dataReader.GetSchemaTable();
			List<DataColumn> listCols = new List<DataColumn>();
			//动态添加列
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
				//添加数据
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
				throw new Exception("转换出错出错!",ex);
			}
			
		}

		#endregion

		#region 将英文的星期几转为中文
		public static string ConvertDayOfWeekToZh(System.DayOfWeek dw)
		{
			string DayOfWeekZh="";
			switch (dw.ToString ("D"))
			{
				case "0":
					DayOfWeekZh="日";
					break;
				case "1":
					DayOfWeekZh="一";
					break;
				case "2":
					DayOfWeekZh="二";
					break;
				case "3":
					DayOfWeekZh="三";
					break;
				case "4":
					DayOfWeekZh="四";
					break;
				case "5":
					DayOfWeekZh="五";
					break;
				case "6":
					DayOfWeekZh="六";
					break;
			}
			
			return DayOfWeekZh;
		}
		#endregion

	}
}
