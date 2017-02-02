using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using SSH3.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SSH3.Account
{
    public partial class ChangeSkill : System.Web.UI.Page
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

        protected void DeleteSelected_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "deleteSelectedSkill", "confirmDeleteModal();", true);
        }

        protected void Deletebtn_Click(object sender, EventArgs e)
        {
           
            if (GridView1.SelectedIndex != -1)
            {
                string skill_name = GridView1.SelectedRow.Cells[1].Text;



                var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
                var user = manager.FindByName(Context.User.Identity.GetUserName());

                string cs3 = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                SqlConnection con3 = new SqlConnection(cs3);
                SqlCommand cmd3 =
                    new SqlCommand("DELETE FROM userSkillSet WHERE userName = @username AND NameOfSkill = @skill ", con3);
                cmd3.Parameters.AddWithValue("@username", user.UserName);
                cmd3.Parameters.AddWithValue("@skill", skill_name);
                con3.Open();
                cmd3.ExecuteNonQuery();
                con3.Close();

                Response.Redirect("~/Account/Manage?m=DeleteSkillSuccess");
            }
            else
            {
                ErrorMessage.Text = "Nothing was deleted. Please select a row to delete it.";
               
            }
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
       

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowIndex == GridView1.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }
    }
}
