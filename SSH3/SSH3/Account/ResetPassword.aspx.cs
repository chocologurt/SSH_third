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
        protected string dbConn = "DefaultConnection";
        protected string StatusMessage
        {
            get;
            private set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Context.User.Identity.IsAuthenticated)
            {
                Password.Attributes.Add("value", Password.Text);
                ConfirmPassword.Attributes.Add("value", ConfirmPassword.Text);
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        private string PopulateBody(string userName)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("ResetPasswordConfirmationEmail.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{UserName}", userName);
           
            return body;
        }
        protected void Reset_Click(object sender, EventArgs e)
        {
            string code = IdentityHelper.GetCodeFromRequest(Request);
            if (code != null)
            {

                if (String.IsNullOrEmpty(Password.Text) && String.IsNullOrEmpty(ConfirmPassword.Text))
                {
                    ErrorMessage.Text = " Please fill in the Password textboxes";
                }
                else if (String.IsNullOrEmpty(Password.Text))
                {
                    ErrorMessage.Text = "Your password is empty";
                }
                else if (String.IsNullOrEmpty(ConfirmPassword.Text))
                {
                    ErrorMessage.Text = "Your Confirm Password is empty.";
                }
                if (YesOrNoImage.TabIndex == 0)
                {
                    ErrorMessage.Text = "Please select something in the radio buttons";
                }

                string password = "";
                if (textPassword.Visible == true && imagePassword.Visible == false)
                {
                    password = Password.Text;
                }
                else if (imagePassword.Visible == true && textPassword.Visible == true)
                {
                    if (imagePasswordControl.HasFile)
                        {
                    string fileExt = Path.GetExtension(imagePasswordControl.PostedFile.FileName);
                    if (fileExt == ".jpg")
                    {
                        
                            // string filename = Path.GetFileName(imagePasswordControl.FileName);
                            byte[] imgbyte = imagePasswordControl.FileBytes;
                            //convert byte[] to Base64 string
                            string base64ImgString = Convert.ToBase64String(imgbyte);
                            password = Password.Text + base64ImgString;
                        }
                        else
                        {
                            ErrorMessage.Text = "Upload Status: Only JPEG files are available for upload";
                        }
                    }
                    else
                    {
                        
                        ErrorMessage.Text = "Please Upload something.";
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

                    string cs = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
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
                    //manager.SendEmail(user.Id, "Password has been reset", "Your Password has been reset.");


                    // Configurating the Email body Using Created HTML Template
                    string body = this.PopulateBody(user.UserName);


                    manager.SendEmail(user.Id, "Confirm your account", body);


                    Response.Redirect("~/Account/ResetPasswordConfirmation");
                    return;
                }
                ErrorMessage.Text = result.Errors.FirstOrDefault();
                return;
            }

            ErrorMessage.Text = "An error has occurred";
        }

        protected void YesOrNoImage_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (YesOrNoImage.SelectedValue == "Yes")
            {
                imagePassword.Visible = true;
            }
            else if (YesOrNoImage.SelectedValue == "No"){
                imagePassword.Visible = false;
            }
        }

        protected void showorhidepassword_Click(object sender, ImageClickEventArgs e)
        {
            if (Password.TextMode.Equals(System.Web.UI.WebControls.TextBoxMode.Password))
            {
                Password.TextMode = System.Web.UI.WebControls.TextBoxMode.SingleLine;
                showorhidepassword.ImageUrl = "/Imagesss/eye_close-01-512.png";
            }
            else if (Password.TextMode.Equals(System.Web.UI.WebControls.TextBoxMode.SingleLine))
            {
                Password.TextMode = System.Web.UI.WebControls.TextBoxMode.Password;
                showorhidepassword.ImageUrl = "/Imagesss/eye3-01-128.png";
            }


        }
    }
}