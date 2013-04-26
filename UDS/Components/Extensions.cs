using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace UDS.Components
{
    public static class Extensions
    {
        /// <summary>
        /// 将DataReader 转为 DataTable
        /// </summary>
        /// <param name="DataReader">DataReader</param>
        public static DataTable ToDataTable(this SqlDataReader dataReader, bool closeReader)
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
                while (dataReader.Read())
                {
                    DataRow myDataRow = datatable.NewRow();
                    for (int i = 0; i < listCols.Count; i++)
                    {
                        myDataRow[((DataColumn)listCols[i])] = dataReader[i];
                    }
                    datatable.Rows.Add(myDataRow);
                }
                schemaTable = null;
                if(closeReader)
                    dataReader.Close();
                return datatable;
            }
            catch (Exception ex)
            {
                Error.Log(ex.ToString());
                throw new Exception("转换出错出错!", ex);
            }

        }
    }
}