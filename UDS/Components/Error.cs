using System;
using System.Diagnostics;
using System.IO;


namespace UDS.Components 
{
	/// <summary>
	/// �������������ڼ�¼������־
	/// </summary>
	public class Error {
		//��¼������־λ��
		private const string FILE_NAME = "udslog.txt";

		/// <summary>
		/// ��¼��־���ı��ļ�
		/// </summary>
		/// <param name="message">��¼������</param>
        public static void Log(string message)
        {
            string filefullname = System.Web.HttpContext.Current.Server.MapPath(FILE_NAME);

            if (File.Exists(filefullname))
            {
                StreamWriter sr = File.AppendText(FILE_NAME);
                sr.WriteLine("\n");
                sr.WriteLine(DateTime.Now.ToString() + message);
                sr.Close();
            }
            else
            {
                StreamWriter sr = File.CreateText(FILE_NAME);
                sr.Close();
            }

        }

    }
}
