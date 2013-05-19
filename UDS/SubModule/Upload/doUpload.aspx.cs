using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UDS.SubModule.Upload
{
    public partial class doUpload : System.Web.UI.Page
    {
        const int ChunkSize = 1024 * 1024;

        string saveFullPath = HttpContext.Current.Server.MapPath("~/App_Browsers");

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string fileName = Request.Files[0].FileName;
                byte[] rawFile;

                if (Request.Browser.Browser == "IE")
                {
                    using (var binaryReader = new BinaryReader(Request.Files[0].InputStream))
                    {
                        rawFile = binaryReader.ReadBytes(Request.Files[0].ContentLength);
                    }
                }
                else
                {
                    using (var binaryReader = new BinaryReader(Request.InputStream))
                    {
                        rawFile = binaryReader.ReadBytes((int)Request.InputStream.Length);

                    }
                }

                using (var fs = new FileStream(Path.Combine(saveFullPath, fileName), FileMode.Create))
                {
                    using (var bw = new BinaryWriter(fs))
                    {
                        bw.Write(rawFile);
                    }
                }

                Response.ContentType = "text/html";
                Response.Write("{\"success\":true}");
            }
            catch (Exception eX)
            {
                Response.ContentType = "text/html";
                Response.Write("{\"failed\":\"" + eX.Message + "\"}");
            }

            Response.End();
        }

        private void WriteStream(BinaryReader br, string fileName)
        {
            byte[] fileContents = new byte[] { };
            var buffer = new byte[ChunkSize];

            while (br.BaseStream.Position < br.BaseStream.Length - 1)
            {
                if (br.Read(buffer, 0, ChunkSize) > 0)
                {
                    fileContents = fileContents.Concat(buffer).ToArray();
                }
            }

            using (var fs = new FileStream(Path.Combine(saveFullPath, fileName), FileMode.Create))
            {
                using (var bw = new BinaryWriter(fs))
                {
                    bw.Write(fileContents);
                }
            }
        }
    }
}