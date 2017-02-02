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
    public partial class ProfilePage : System.Web.UI.Page
    {
        protected string dbConn = "DefaultConnection";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Context.User.Identity.IsAuthenticated)
            {
                if (!Page.IsPostBack)
                {
                    MultiView1.ActiveViewIndex = 0;
                    personalInfoButton.CssClass = "btn btn-info";
                    SkillsOwnedButton.CssClass = "btn btn-primary";

                    var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
                    var user = manager.FindByName(Context.User.Identity.GetUserName());

                    string cs = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand("select * from userSkillSet where Username = @userId", con);
                    cmd.Parameters.AddWithValue("@userId", user.UserName);
                    SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    Adpt.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();


                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx"); //redirect to main page
            }
           
        }

        protected void personalInfoButton_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            personalInfoButton.CssClass = "btn btn-info";
            SkillsOwnedButton.CssClass = "btn btn-primary";
            
        }

        protected void SkillsOwnedButton_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            personalInfoButton.CssClass = "btn btn-primary";
            SkillsOwnedButton.CssClass = "btn btn-info";
            
        }

     
    }
}