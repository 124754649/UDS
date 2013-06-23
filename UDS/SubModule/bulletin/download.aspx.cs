using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UDS.SubModule.bulletin
{
    public partial class download : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string bulletinid = Request.Params["id"];
            string attachmentid = Request.Params["aid"];

            if (string.IsNullOrWhiteSpace(bulletinid) || string.IsNullOrWhiteSpace(attachmentid))
            {
                Response.StatusCode = 400;
                Response.Write("错误的下载参数，导致文件无法正常下载");
            }
            else
            {
                string sql = "select attachmentpath from [UDS_BulletinAttachment] where [attachmentid] = {0} and [bulletinid] = {1}";

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["default"].ConnectionString))
                {
                    SqlCommand comm = conn.CreateCommand();
                    comm.Connection = conn;
                    comm.CommandText = string.Format(sql, attachmentid, bulletinid);

                    conn.Open();
                    string fileFullPath = comm.ExecuteScalar().ToString();
                    conn.Close();

                    if (string.IsNullOrWhiteSpace(fileFullPath))
                    {
                        Response.StatusCode = 400;
                        Response.Write("找不到要下载的文件");
                    }
                    else
                    {
                        FileInfo fi = new FileInfo(fileFullPath);

                        if (!fi.Exists)
                        {
                            Response.StatusCode = 400;
                            Response.Write("要下载的文件不存在");
                        }
                        else
                        {
                            const long ChunkSize = 102400;//100K 每次读取文件，只读取100Ｋ，这样可以缓解服务器的压力
                            byte[] buffer = new byte[ChunkSize];

                            Response.Clear();
                            System.IO.FileStream iStream = System.IO.File.OpenRead(fileFullPath);
                            long dataLengthToRead = iStream.Length;//获取下载的文件总大小
                            Response.ContentType = "application/octet-stream";
                            if (Request.Browser.Browser == "IE")
                            {
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + HttpUtility.UrlEncode(fi.Name, System.Text.Encoding.UTF8));
                            }
                            else
                            {
                                Response.AddHeader("Content-Disposition", "attachment; filename=" + fi.Name);
                            }
                            while (dataLengthToRead > 0 && Response.IsClientConnected)
                            {
                                int lengthRead = iStream.Read(buffer, 0, Convert.ToInt32(ChunkSize));//读取的大小
                                Response.OutputStream.Write(buffer, 0, lengthRead);
                                Response.Flush();
                                dataLengthToRead = dataLengthToRead - lengthRead;
                            }

                            //jquery.fileDownload uses this cookie to determine that a file download has completed successfully
                            Response.AppendCookie(new HttpCookie("fileDownload", "true") { Path = "/" });
                            //else
                            //    //ensure that the cookie is removed in case someone did a file download without using jquery.fileDownload
                            //    if (httpContext.Request.Cookies[CookieName] != null)
                            //    {
                            //        response.AppendCookie(new HttpCookie(CookieName, "true") { Expires = DateTime.Now.AddYears(-1), Path = CookiePath });
                            //    }
                            Response.Close();
                        }
                    }
                }
            }
        }
    }
}