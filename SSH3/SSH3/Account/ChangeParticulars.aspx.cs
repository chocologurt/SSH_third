using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using SSH3.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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

                    string usermode="";

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
                        con.Close();
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
            else if (menteeParticulars.Visible == true)
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