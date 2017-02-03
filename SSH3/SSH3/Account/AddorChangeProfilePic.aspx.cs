using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using SSH3.Models;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace SSH3.Account
{
    public partial class AddorChangeProfilePic : System.Web.UI.Page
    {
       
        protected string dbConn = "DefaultConnection";
        protected string SuccessMessage
        {
            get;
            private set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                if (!IsPostBack)
                {

                    var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
                    var currentUser = manager.FindById(Context.User.Identity.GetUserId());
                    var username = currentUser.UserName;

                    
                    imgDemo.ImageUrl = "GetImage.ashx?username=" + username;
                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx"); //redirect to main page
            }
        }

        protected void btnPreview_Click(object sender, EventArgs e)
        {
            var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            var user = manager.FindByName(Context.User.Identity.GetUserName());
            string username = user.UserName;
            if (FileUpload1.PostedFile != null)
            {// Check the extension of image
                string extension = Path.GetExtension(FileUpload1.FileName);
                if (extension.ToLower() == ".jpg")
                {
                    
                    Byte[] bytes;
                    Byte[] data = null;
                   
                     
                       
                       
                            //To create a PostedFile
                            HttpPostedFile File = FileUpload1.PostedFile;
                            //Create byte Array with file len
                            bytes = new Byte[File.ContentLength];
                            //force the control to load data in array
                            File.InputStream.Read(bytes, 0, File.ContentLength);
                      



                   

                    string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                    SqlConnection con2 = new SqlConnection(cs2);
                    SqlCommand cmd2 =
                        new SqlCommand("SELECT userPic FROM users WHERE userID = @userName", con2);
                    cmd2.Parameters.AddWithValue("@userName", username);
                    con2.Open();

                    using (SqlDataReader reader = cmd2.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            data = (byte[])(reader["userPic"]);
                        }
                    }

                    con2.Close();

                    if (data != null)
                    {
                       

                        string cs = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                        SqlConnection con = new SqlConnection(cs);
                        SqlCommand cmd =
                            new SqlCommand("UPDATE users SET userPic = @image WHERE userID = @userId", con);
                        cmd.Parameters.AddWithValue("@image", bytes);
                        cmd.Parameters.AddWithValue("@userId", username);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                       

                        Response.Redirect("~/Account/Manage?m=ChangePicSuccess");
                    }
                    else if (data == null)
                    {
                        string cs4 = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                        SqlConnection con4 = new SqlConnection(cs4);
                        SqlCommand cmd4 =
                            new SqlCommand("UPDATE users SET userPic = @image WHERE userID = @userId", con4);
                        cmd4.Parameters.AddWithValue("@image", bytes);
                        cmd4.Parameters.AddWithValue("@userId", username);
                       
                        con4.Open();
                        cmd4.ExecuteNonQuery();
                        con4.Close();
                        Response.Redirect("~/Account/Manage?m=ChangePicSuccess");
                    }
                }
                else
                {
                    ErrorMessage.Text = "Please only upload JPEG images.";
                }
            }
        }

        

        

       
    }
}