using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using SSH3.Models;
using System;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;

namespace SSH3.Account
{
    public partial class Register : Page
    {
        protected string dbConn = "DefaultConnection";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Default.aspx");
            }
            if (IsPostBack)
            {
                Password.Attributes.Add("value", Password.Text);
                ConfirmPassword.Attributes.Add("value", ConfirmPassword.Text);
            }
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager2 = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            var user2 = manager2.FindByName(Username.Text);
            if (user2 == null)
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
                if (imagePassword.Visible == true && textPassword.Visible == true)
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
                        
                        ErrorMessage.Text = "Please Upload soemething..";
                    }
                }
                else if (textPassword.Visible == true && imagePassword.Visible == false)
                {
                    password = Password.Text;
                }

                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var user = new ApplicationUser() { UserName = Username.Text, Email = Email.Text, PhoneNumber = userPhoneNumber.Text };

                IdentityResult result = manager.Create(user, password);

                if (result.Succeeded)
                {
                    string cs = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd =
                        new SqlCommand("INSERT INTO users (userID, userInstitution, userMode, userDesignation, userFieldOfIndustry, FullName) VALUES(@userId, @institution,@registrationMode, @designation, @userFOI, @fullname )", con);
                    cmd.Parameters.AddWithValue("@userId", Username.Text);
                    cmd.Parameters.AddWithValue("@institution", userInstitution.Text);
                    cmd.Parameters.AddWithValue("@registrationMode", 1);
                    cmd.Parameters.AddWithValue("@designation", "Student");
                    cmd.Parameters.AddWithValue("@userFOI", Convert.ToString(userFOI.SelectedValue));
                    cmd.Parameters.AddWithValue("@fullname", fullName.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    var myPasswordHasher = new PasswordHasher();
                    string hashedpassword = myPasswordHasher.HashPassword(password);

                    string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings[dbConn].ConnectionString;
                    SqlConnection con2 = new SqlConnection(cs2);
                    SqlCommand cmd2 =
                        new SqlCommand("INSERT INTO pwList (userName, password) VALUES(@username, @password)", con2);
                    cmd2.Parameters.AddWithValue("@username", Username.Text);
                    cmd2.Parameters.AddWithValue("@password", hashedpassword);
                    con2.Open();
                    cmd2.ExecuteNonQuery();
                    con2.Close();

                    //    // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                    string code = manager.GenerateEmailConfirmationToken(user.Id);
                    string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                    manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                    //Configurating the Email Body using Created HTML Template
                    //string body = this.PopulateBody(user.UserName, callbackUrl);

                    var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                    var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                    //authenticationManager.SignIn(new AuthenticationProperties() { }, userIdentity);
                    Response.Redirect("/Account/EmailBeingSent.aspx");
                    //manager.SendEmail(user.Id, "Confirm your account", body);
                    //Response.Redirect("/Account/NewAccountCheckEmail");
                    //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                }
            }
            else
            {
                string username2 = user2.UserName;
                string email2 = user2.Email;
                if (Username.Text == username2 && Email.Text == email2)
                {
                    ErrorMessage.Text = "UserName is already taken, please choose a different user name. <br /> This email that you have provided is already associated with another account, please give another email.";
                }
                else if (Email.Text == email2)
                {
                    ErrorMessage.Text = "This email that you have provided is already associated with another account, please give another email.";
                }
                else if (Username.Text == username2)
                {
                    ErrorMessage.Text = "UserName is already taken, please choose a different user name. ";
                }
            }
        }

        protected void YesOrNoImage_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (YesOrNoImage.SelectedValue == "Yes")
            {
                imagePassword.Visible = true;
            }
            else if (YesOrNoImage.SelectedValue == "No")
            {
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