using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using SSH3.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SSH3.Account
{
    public partial class FriendProfilePage : System.Web.UI.Page
    {
        protected string dbConn = "DefaultConnection";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Context.User.Identity.IsAuthenticated)
            {
                if (!Page.IsPostBack)
                {
                    

                    var username = Request.QueryString["m"];

                    string cs = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand("select * from userSkillSet where Username = @userId", con);
                    cmd.Parameters.AddWithValue("@userId", username);
                    SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    Adpt.Fill(dt);
                    SkillsGridView.DataSource = dt;
                    SkillsGridView.DataBind();

                   // string filename = "";

                    SqlCommand cmd2 = new SqlCommand("select * from userHobbies where Username = @userId", con);
                    cmd2.Parameters.AddWithValue("@userId", username);
                    SqlDataAdapter Adpt2 = new SqlDataAdapter(cmd2);
                    DataTable dt2 = new DataTable();
                    Adpt2.Fill(dt2);
                    HobbiesGridView.DataSource = dt2;
                    HobbiesGridView.DataBind();

                    SqlCommand cmd3 =
                        new SqlCommand("select userID, userInstitution, userDesignation, userFieldOfIndustry, FullName from users where userID = @userID", con);
                    cmd3.Parameters.AddWithValue("@userID", username);
                    con.Open();
                    SqlDataReader reader = cmd3.ExecuteReader();
                    while (reader.Read())
                    {
                        userUsernameText.Text = reader["userID"].ToString();
                        userInstitutionText.Text = reader["userInstitution"].ToString();
                        userDesignationText.Text = reader["userDesignation"].ToString();
                        userFOIText.Text = reader["userFieldOfIndustry"].ToString();
                        userFullNameText.Text = reader["FullName"].ToString();
                    }
                    con.Close();

                    string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                    SqlConnection con2 = new SqlConnection(cs2);
                    SqlCommand cmd4 =
                        new SqlCommand("select userPic from users where userID=@userID", con2);
                    cmd4.Parameters.AddWithValue("@userID", username);
                    con2.Open();
                    string img = cmd4.ExecuteScalar().ToString();
                    con2.Close();

                    //if (!String.IsNullOrEmpty(filename))
                    //{
                    //    string imgPath = username + "_" + filename;
                    //    userPicture.ImageUrl = @"~\UserProfilePics\" + imgPath;
                    //}
                    //else
                    //{
                    //    userPicture.ImageUrl = @"~\UserProfilePics\profile-icon-png-905.png";
                    //}
                    if (String.IsNullOrEmpty(img))
                    {
                        userPicture.ImageUrl = "/Imagesss/profile-icon-png-905.png";
                    }
                    else
                    {
                        userPicture.ImageUrl = "GetImage.ashx?username=" + username;
                    }
                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx"); //redirect to main page
            }

        }

       
    }
}
