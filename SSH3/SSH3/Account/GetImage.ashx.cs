using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

namespace SSH3.Account
{
    /// <summary>
    /// Summary description for GetImage
    /// </summary>
    public class GetImage : IHttpHandler
    {
        protected string dbConn = "DefaultConnection";
        public void ProcessRequest(HttpContext context)
        {
            //    context.Response.ContentType = "text/plain";
            //    context.Response.Write("Hello World");

            try
            {
                string username = context.Request.QueryString["username"].ToString();
                context.Response.ContentType = "image/jpeg";
                Stream strm = ShowImage(username);
                byte[] buffer = new byte[4096];
                int byteSeq = strm.Read(buffer, 0, 4096);
               
                while (byteSeq > 0)
                {
                    context.Response.OutputStream.Write(buffer, 0, byteSeq);
                    byteSeq = strm.Read(buffer, 0, 4096);
                }
            }
            catch (Exception e)
            {

            }
        }

        public Stream ShowImage(string username)
        {
            string conn = ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
            SqlConnection connection = new SqlConnection(conn);
            string sql = "SELECT userPic FROM users WHERE userID = @ID";
            SqlCommand cmd = new SqlCommand(sql, connection);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@ID", username);
            connection.Open();
            object img = cmd.ExecuteScalar();
            try
            {
                return new MemoryStream((byte[])img);
            }
            catch
            {
                return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}