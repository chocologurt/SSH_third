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
    public partial class AddSkill : System.Web.UI.Page
    {
        protected string dbConn = "DefaultConnection";
        string selected_value = "";
        string selected_category = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                if (!Page.IsPostBack)
                {
                    string cs = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                    SqlConnection con = new SqlConnection(cs);
                    string str = "SELECT DISTINCT FieldOfSkill, AcroymnOfField FROM SkillsSet";
                    SqlDataAdapter adpt = new SqlDataAdapter(str, con);
                    DataTable dt = new DataTable();
                    adpt.Fill(dt);
                    CategoryDropDownList.DataSource = dt;
                    CategoryDropDownList.DataBind();
                    CategoryDropDownList.DataTextField = "FieldOfSkill";
                    CategoryDropDownList.DataValueField = "AcroymnOfField";
                    CategoryDropDownList.DataBind();
                    CategoryDropDownList.Items.Insert(0, new ListItem("--Select Category--", "0"));
                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx"); //redirect to main page
            }
        }



        protected void ConfirmSkill_Click(object sender, EventArgs e)
        {

            var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            var user = manager.FindByName(Context.User.Identity.GetUserName());

            List<String> skillList = new List<string>();

            string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
            SqlConnection con2 = new SqlConnection(cs2);
            SqlCommand cmd2 =
                new SqlCommand("SELECT NameOfSkill FROM userSkillSet WHERE userName = @userName AND AcroymnOfField = @AOF", con2);
            cmd2.Parameters.AddWithValue("@userName", user.UserName);
            cmd2.Parameters.AddWithValue("@AOF", CategoryDropDownList.SelectedValue);
            con2.Open();

            // PasswordVerificationResult results = myPasswordHasher.VerifyHashedPassword(hashedpassword2, NewPassword.Text);
            using (SqlDataReader reader = cmd2.ExecuteReader())
            {
                while (reader.Read())
                {
                    skillList.Add(Convert.ToString(reader["NameOfSkill"]));
                }
            }

            con2.Close();

            if (!skillList.Contains(SkillDropDownList.SelectedItem.Text))
            {
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd =
                    new SqlCommand("INSERT INTO userSkillSet (Username, NameOfSkill, SkillSerialCode, FieldOfSkill, AcroymnOfField) VALUES(@userId, @Skill,@code, @FOS, @AOF )", con);
                cmd.Parameters.AddWithValue("@userId", user.UserName);
                cmd.Parameters.AddWithValue("@Skill", SkillDropDownList.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Code", SkillDropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@FOS", CategoryDropDownList.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@AOF", CategoryDropDownList.SelectedValue);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("~/Account/Manage?m=AddSkillSuccess");

            }
            else
            {
                ErrorMessage.Text = "You already have this skill";
            }
        }


        protected void CategoryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            selected_value = CategoryDropDownList.SelectedValue;
            selected_category = CategoryDropDownList.SelectedItem.Text;

            string cs = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            string str = "SELECT NameOfSkill, SkillSerialCode FROM SkillsSet WHERE AcroymnOfField = @AOF";

            SqlDataAdapter adpt = new SqlDataAdapter(str, con);
            adpt.SelectCommand.Parameters.AddWithValue("@AOF", selected_value);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            SkillDropDownList.DataSource = dt;
            SkillDropDownList.DataBind();
            SkillDropDownList.DataTextField = "NameOfSkill";
            SkillDropDownList.DataValueField = "SkillSerialCode";
            SkillDropDownList.DataBind();
        }

        protected void AddSkill_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "addSkillPortion", "confirmNewSkillModal()", true);
        }
    }
}