using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

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

        /// <summary>
        /// 把列表转换为JSON字符串
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="list"></param>
        /// <returns></returns>
        public static string ToJson(this object list)
        {
            var jsonSer = new Newtonsoft.Json.JsonSerializer();

            string retValue = "";

            StringWriter sw = new StringWriter();
            using (JsonWriter jw = new JsonTextWriter(sw))
            {
                jw.Formatting = Formatting.Indented;
                jsonSer.Serialize(jw, list);
                retValue = sw.ToString();
                //sw.Close();
            }

            return retValue;
        }

        /// <summary>
        /// 把列表转换为JSON字符串
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="list"></param>
        /// <returns></returns>
        public static void ToJsonWriter<T>(this IList<T> list, Action<StringWriter> writeAction)
        {
            var jsonSer = new Newtonsoft.Json.JsonSerializer();

            StringWriter sw = new StringWriter();
            using (JsonWriter jw = new JsonTextWriter(sw))
            {
                jw.Formatting = Formatting.Indented;
                jsonSer.Serialize(jw, list);
                writeAction(sw);
                sw.Close();
            }
        }

        /// <summary>
        /// 把列表转换为Response输出
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="list"></param>
        /// <param name="response"></param>
        public static void ToResponseContent<T>(this IList<T> list, HttpResponse  response, Action<StringWriter> writeAction)
        {
            response.ContentType = "text/json";

            list.ToJsonWriter<T>(sw =>
            {
                response.Write(sw.ToString());
            });

            response.End();
        }

        /// <summary>
        /// 把字符串输出为400的Response
        /// </summary>
        /// <param name="msg"></param>
        /// <param name="response"></param>
        public static void To400ResponseContent(this string msg, HttpResponse response)
        {
            response.StatusCode = 400;
            response.ContentType = "text/html";
            response.Write(msg);
            response.End();
        }
    }
}