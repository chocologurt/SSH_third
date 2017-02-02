﻿using Microsoft.AspNet.Identity;
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
    public partial class AddHobby : System.Web.UI.Page
    {
        string selected_value = "";
        string selected_category = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                if (!Page.IsPostBack)
                {
                    string cs = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                    SqlConnection con = new SqlConnection(cs);
                    string str = "SELECT DISTINCT TypeOfHobby, AcroymnOfType FROM Hobbies";
                    SqlDataAdapter adpt = new SqlDataAdapter(str, con);
                    DataTable dt = new DataTable();
                    adpt.Fill(dt);
                    CategoryDropDownList.DataSource = dt;
                    CategoryDropDownList.DataBind();
                    CategoryDropDownList.DataTextField = "TypeOfHobby";
                    CategoryDropDownList.DataValueField = "AcroymnOfType";
                    CategoryDropDownList.DataBind();
                    CategoryDropDownList.Items.Insert(0, new ListItem("--Select Category--", "0"));
                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx"); //redirect to main page
            }
        }

        protected void AddHobby_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "addHobbyPortion", "confirmAddNewHobby()", true);
        }

        protected void ConfirmHobby_Click(object sender, EventArgs e)
        {
            var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            var user = manager.FindByName(Context.User.Identity.GetUserName());

            List<String> hobbyList = new List<string>();

            string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con2 = new SqlConnection(cs2);
            SqlCommand cmd2 =
                new SqlCommand("SELECT NameOfHobby FROM userHobbies WHERE Username = @userName AND AcroymnOfType = @AOT", con2);
            cmd2.Parameters.AddWithValue("@userName", user.UserName);
            cmd2.Parameters.AddWithValue("@AOT", CategoryDropDownList.SelectedValue);
            con2.Open();

            // PasswordVerificationResult results = myPasswordHasher.VerifyHashedPassword(hashedpassword2, NewPassword.Text);
            using (SqlDataReader reader = cmd2.ExecuteReader())
            {
                while (reader.Read())
                {
                    hobbyList.Add(Convert.ToString(reader["NameOfHobby"]));
                }
            }

            con2.Close();

            if (!hobbyList.Contains(HobbyDropDownList.SelectedItem.Text))
            {
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd =
                    new SqlCommand("INSERT INTO userHobbies (Username, NameOfHobby, HobbySerialCode, TypeOfHobby, AcroymnOfType) VALUES(@userId, @hobby,@code, @TOH, @AOT )", con);
                cmd.Parameters.AddWithValue("@userId", user.UserName);
                cmd.Parameters.AddWithValue("@hobby", HobbyDropDownList.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Code", HobbyDropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@TOH", CategoryDropDownList.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@AOT", CategoryDropDownList.SelectedValue);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("~/Account/Manage?m=AddHobbySuccess");

            }
            else
            {
                ErrorMessage.Text = "You already have this Hobby";
            }
        }

        protected void CategoryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            selected_value = CategoryDropDownList.SelectedValue;
            selected_category = CategoryDropDownList.SelectedItem.Text;

            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            string str = "SELECT NameOfHobby, HobbySerialCode FROM Hobbies WHERE AcroymnOfType = @AOT";

            SqlDataAdapter adpt = new SqlDataAdapter(str, con);
            adpt.SelectCommand.Parameters.AddWithValue("@AOT", selected_value);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            HobbyDropDownList.DataSource = dt;
            HobbyDropDownList.DataBind();
            HobbyDropDownList.DataTextField = "NameOfHobby";
            HobbyDropDownList.DataValueField = "HobbySerialCode";
            HobbyDropDownList.DataBind();
        }
    }
}