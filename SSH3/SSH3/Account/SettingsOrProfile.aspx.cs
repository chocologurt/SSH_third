using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SSH3.Account
{
    public partial class SettingsOrProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Context.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Account/Login.aspx"); //redirect to main page
            }
        }

        protected void settingsButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Account/Manage.aspx"); //redirect to main page
        }

        protected void profilePageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Account/ProfilePage.aspx"); //redirect to main page
        }
    }
}