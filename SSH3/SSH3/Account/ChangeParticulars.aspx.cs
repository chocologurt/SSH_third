using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using SSH3.Models;
using System;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;

namespace SSH3.Account
{
    public partial class ChangeParticulars : System.Web.UI.Page
    {
        protected string dbConn = "DefaultConnection";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                if (!Page.IsPostBack)
                {
                    var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
                    var user = manager.FindByName(Context.User.Identity.GetUserName());

                    string usermode = "";

                    string cs = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand("select userMode from users where userID = @userId", con);
                    cmd.Parameters.AddWithValue("@userId", user.UserName);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        usermode = reader["userMode"].ToString();
                    }
                    con.Close();

                    if (usermode == "1")
                    {
                        menteeParticulars.Visible = true;

                            imgDemo.ImageUrl = "GetImage.ashx?username=" + user.UserName;
                        string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                        SqlConnection con2 = new SqlConnection(cs2);
                        SqlCommand cmd2 = new SqlCommand("select userInstitution, FullName from users where userID = @userId", con2);
                        cmd2.Parameters.AddWithValue("@userId", user.UserName);
                        con2.Open();
                        SqlDataReader reader2 = cmd2.ExecuteReader();
                        while (reader2.Read())
                        {
                            menteeInstitution.Text = reader2["userInstitution"].ToString();
                            menteeFullName.Text = reader2["FullName"].ToString();
                        }
                        con2.Close();
                        
                    }
                    else if (usermode == "2")
                    {
                        mentorParticulars.Visible = true;

                        string cs3 = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                        SqlConnection con3 = new SqlConnection(cs3);
                        SqlCommand cmd3 = new SqlCommand("select userInstitution, userDesignation, FullName from users where userID = @userId", con3);
                        cmd3.Parameters.AddWithValue("@userId", user.UserName);
                        con3.Open();
                        SqlDataReader reader3 = cmd3.ExecuteReader();
                        while (reader3.Read())
                        {
                            mentorInstitution.Text = reader3["userInstitution"].ToString();
                            mentorDesignation.Text = reader3["userDesignation"].ToString();
                            mentorFullName.Text = reader3["FullName"].ToString();
                        }
                        con3.Close();
                        imgDemo2.ImageUrl = "GetImage.ashx?username=" + user.UserName;
                    }
                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx"); //redirect to main page
            }
        }

        protected void changeParticularsBtn_Click(object sender, EventArgs e)
        {
            var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            var user = manager.FindByName(Context.User.Identity.GetUserName());

            if (mentorParticulars.Visible == true)
            {
                if (FileUpload2.PostedFile != null)
                {// Check the extension of image
                    string extension = Path.GetExtension(FileUpload2.FileName);
                    if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png")
                    {
                        Byte[] bytes;

                        //To create a PostedFile
                        HttpPostedFile File = FileUpload2.PostedFile;
                        //Create byte Array with file len
                        bytes = new Byte[File.ContentLength];
                        //force the control to load data in array
                        File.InputStream.Read(bytes, 0, File.ContentLength);

                        string cs4 = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                        SqlConnection con4 = new SqlConnection(cs4);
                        SqlCommand cmd4 = new SqlCommand("UPDATE users SET userInstitution = @institution, userDesignation = @designation, userPic = @pic, FullName = @fullname WHERE userID = @userId", con4);
                        cmd4.Parameters.AddWithValue("@institution", mentorInstitution.Text);
                        cmd4.Parameters.AddWithValue("@designation", mentorDesignation.Text);
                        cmd4.Parameters.AddWithValue("@pic", bytes);
                        cmd4.Parameters.AddWithValue("@fullname", mentorFullName.Text);
                        cmd4.Parameters.AddWithValue("@userId", user.UserName);
                        con4.Open();
                        cmd4.ExecuteNonQuery();
                        con4.Close();

                        Response.Redirect("~/Account/Manage?m=ChangeParticularsSuccess");
                    }
                    else
                    {
                        ErrorMessage.Text = "We only accept JPEG or PNG images.";
                        return;
                    }
                }
                else
                {
                    string cs4 = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                    SqlConnection con4 = new SqlConnection(cs4);
                    SqlCommand cmd4 = new SqlCommand("UPDATE users SET userInstitution = @institution, userDesignation = @designation, FullName = @fullname WHERE userID = @userId", con4);
                    cmd4.Parameters.AddWithValue("@institution", mentorInstitution.Text);
                    cmd4.Parameters.AddWithValue("@designation", mentorDesignation.Text);
                    cmd4.Parameters.AddWithValue("@fullname", mentorFullName.Text);
                    cmd4.Parameters.AddWithValue("@userId", user.UserName);
                    con4.Open();
                    cmd4.ExecuteNonQuery();
                    con4.Close();

                    Response.Redirect("~/Account/Manage?m=ChangeParticularsSuccess");
                }
            }
            else if (menteeParticulars.Visible == true)
            {
                if (FileUpload1.PostedFile != null)
                {// Check the extension of image
                    string extension = Path.GetExtension(FileUpload1.FileName);
                    if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png")
                    {
                        Byte[] bytes;

                        //To create a PostedFile
                        HttpPostedFile File = FileUpload1.PostedFile;
                        //Create byte Array with file len
                        bytes = new Byte[File.ContentLength];
                        //force the control to load data in array
                        File.InputStream.Read(bytes, 0, File.ContentLength);
                        string cs5 = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                        SqlConnection con5 = new SqlConnection(cs5);
                        SqlCommand cmd5 = new SqlCommand("UPDATE users SET userInstitution = @institution, userPic = @pic, FullName = @fullname WHERE userID = @userId", con5);
                        cmd5.Parameters.AddWithValue("@institution", menteeInstitution.Text);
                        cmd5.Parameters.AddWithValue("@pic", bytes);
                        cmd5.Parameters.AddWithValue("@fullname", menteeFullName.Text);
                        cmd5.Parameters.AddWithValue("@userId", user.UserName);
                        con5.Open();
                        cmd5.ExecuteNonQuery();
                        con5.Close();

                        Response.Redirect("~/Account/Manage?m=ChangeParticularsSuccess");
                    }
                    else
                    {
                        ErrorMessage.Text = "We only accept JPEG or PNG images.";
                        return;
                    }
                }
                else
                {
                    string cs5 = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                    SqlConnection con5 = new SqlConnection(cs5);
                    SqlCommand cmd5 = new SqlCommand("UPDATE users SET userInstitution = @institution, FullName = @fullname WHERE userID = @userId", con5);
                    cmd5.Parameters.AddWithValue("@institution", menteeInstitution.Text);
                    cmd5.Parameters.AddWithValue("@fullname", menteeFullName.Text);
                    cmd5.Parameters.AddWithValue("@userId", user.UserName);
                    con5.Open();
                    cmd5.ExecuteNonQuery();
                    con5.Close();

                    Response.Redirect("~/Account/Manage?m=ChangeParticularsSuccess");
                }
            }
        }
    }
}