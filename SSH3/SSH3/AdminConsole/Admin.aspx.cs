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

namespace SSH3.AdminConsole
{
    public partial class Admin : System.Web.UI.Page
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

                    string cs = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand("select UserName,LockoutEndDateUtc, AccessFailedCount from AspNetUsers", con);
                    SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    Adpt.Fill(dt);
                    AspNetGridView.DataSource = dt;
                    AspNetGridView.DataBind();


                    SqlCommand cmd2 = new SqlCommand("select * from userDeactivate", con);
                    SqlDataAdapter Adpt2 = new SqlDataAdapter(cmd2);
                    DataTable dt2 = new DataTable();
                    Adpt2.Fill(dt2);
                    userDeactivateGridView.DataSource = dt2;
                    userDeactivateGridView.DataBind();

                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx"); //redirect to main page
            }

        }

        //protected void sort_by_SelectedIndexChanged(object sender, EventArgs e)
        //{
            
        //       string sort_by_command = sort_by.SelectedValue;

        //    string cs = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
        //    SqlConnection con = new SqlConnection(cs);
        //    SqlCommand cmd = new SqlCommand("select UserName,LockoutEndDateUtc, AccessFailedCount from AspNetUsers order by @commandSort", con);

        //    SqlDataAdapter Adpt = new SqlDataAdapter(cmd);
        //    DataTable dt = new DataTable();
        //    Adpt.Fill(dt);
        //    AspNetGridView.DataSource = dt;
        //    AspNetGridView.DataBind();
        //}
    }
}