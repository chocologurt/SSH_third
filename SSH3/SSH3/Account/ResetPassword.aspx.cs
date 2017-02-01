using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace SSH3.Account
{
    public partial class ResetPassword : Page
    {
        protected string StatusMessage
        {
            get;
            private set;
        }

        protected void Reset_Click(object sender, EventArgs e)
        {
            string code = IdentityHelper.GetCodeFromRequest(Request);
            if (code != null)
            {
                string password = "";
                if (textPassword.Visible == true)
                {
                    password = Password.Text;
                }
                else if (imagePassword.Visible == true)
                {
                    string fileExt = Path.GetExtension(imagePasswordControl.PostedFile.FileName);
                    if (fileExt == ".jpg")
                    {
                        // string filename = Path.GetFileName(imagePasswordControl.FileName);
                        byte[] imgbyte = imagePasswordControl.FileBytes;
                        //convert byte[] to Base64 string
                        string base64ImgString = Convert.ToBase64String(imgbyte);
                        password = base64ImgString;
                    }
                    else
                    {
                        ErrorMessage.Text = "Upload Status: Only JPEG files are available for upload";
                    }
                }

                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

                var user = manager.FindByEmail(Email.Text);
                if (user == null)
                {
                    ErrorMessage.Text = "No user found";
                    return;
                }
                //var result = manager.ResetPassword(user.Id, code, Password.Text);
                var result = manager.ResetPassword(user.Id, code, password);
                if (result.Succeeded)
                {
                    var myPasswordHasher = new PasswordHasher();
                    string hashedpassword = myPasswordHasher.HashPassword(password);

                    string cs = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                    SqlConnection con = new SqlConnection(cs);

                    SqlCommand cmd =
                            new SqlCommand("DELETE FROM pwList WHERE userName = @userId", con);
                    cmd.Parameters.AddWithValue("@userId", user.UserName);

                    SqlCommand cmd2 =
                        new SqlCommand("INSERT INTO pwList (userName, password) VALUES(@username, @password)", con);
                    cmd2.Parameters.AddWithValue("@username", user.UserName);
                    cmd2.Parameters.AddWithValue("@password", hashedpassword);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();
                    con.Close();

                    // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                    //string code2 = manager.GenerateEmailConfirmationToken(user.Id);
                    //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                    manager.SendEmail(user.Id, "Password has been reset", "Your Password has been reset.");


                    Response.Redirect("~/Account/ResetPasswordConfirmation");
                    return;
                }
                ErrorMessage.Text = result.Errors.FirstOrDefault();
                return;
            }

            ErrorMessage.Text = "An error has occurred";
        }

        protected void PasswordSelection_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.PasswordSelection.SelectedValue == "1")
            {
                this.textPassword.Visible = true;
                this.imagePassword.Visible = false;
            }
            else if (this.PasswordSelection.SelectedValue == "2")
            {
                this.textPassword.Visible = false;
                this.imagePassword.Visible = true;
            }
        }
    }
}