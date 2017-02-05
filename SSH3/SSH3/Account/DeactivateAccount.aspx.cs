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
    public partial class DeactivateAccount : System.Web.UI.Page
    {
        protected string dbConn = "DefaultConnection";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void reasonDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (reasonDropDownList.SelectedValue == "3")
            {
                //otherReasonTxtBox.Visible = true;
                //otherReasonLabel.Visible = true;
                otherReasonDiv.Visible = true;
            }
            else if(reasonDropDownList.SelectedValue != "3")
            {
                //otherReasonLabel.Visible = false;
                //otherReasonTxtBox.Visible = true;
                otherReasonDiv.Visible = false;
            }
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            var currentUser = manager.FindById(Context.User.Identity.GetUserId());
            Request.GetOwinContext().Authentication.SignOut();
            manager.Delete(currentUser);
            

            string cs = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd =
                new SqlCommand("INSERT INTO userDeactivate (Username, Code, Reason )VALUES (@userId, @code, @reason) ", con);
            cmd.Parameters.AddWithValue("@userId", currentUser.UserName);
            cmd.Parameters.AddWithValue("@code", reasonDropDownList.SelectedValue);
            cmd.Parameters.AddWithValue("@reason", reasonDropDownList.SelectedItem.Text);

            //SqlCommand cmd2 =
            //    new SqlCommand("DELETE FROM AspNetUsers WHERE UserName = @userId", con);
            //cmd2.Parameters.AddWithValue("@userId", currentUser.UserName);

            SqlCommand cmd3 =
                new SqlCommand("DELETE FROM pwList WHERE userName = @userId", con);
            cmd3.Parameters.AddWithValue("@userId", currentUser.UserName);

            SqlCommand cmd4 =
                new SqlCommand("DELETE FROM users WHERE userID = @userId", con);
            cmd4.Parameters.AddWithValue("@userId", currentUser.UserName);

            SqlCommand cmd5 =
                new SqlCommand("DELETE FROM userSkillSet WHERE Username = @userId", con);
            cmd5.Parameters.AddWithValue("@userId", currentUser.UserName);
            con.Open();
            cmd.ExecuteNonQuery();
            //cmd2.ExecuteNonQuery();
            cmd3.ExecuteNonQuery();
            cmd4.ExecuteNonQuery();
            cmd5.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/Account/ConfirmDeactivation.aspx");
        }
    }
}