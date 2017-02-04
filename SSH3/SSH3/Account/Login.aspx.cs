using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using SSH3.Models;
using System.IO;

namespace SSH3.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Context.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Default.aspx"); //redirect to main page
            }

            RegisterHyperLink.NavigateUrl = "Register";
            // Enable this once you have account confirmation enabled for password reset functionality
            ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            //OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
            if (IsPostBack)
            {
                Password.Attributes.Add("value", Password.Text);
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                if (String.IsNullOrEmpty(Password.Text) )
                {
                    
                    FailureText.Text = " Please fill in the Password textboxes";
                    ErrorMessage.Visible = true;
                    return;
                }
                if (YesOrNoImage.SelectedValue != "Yes" && YesOrNoImage.SelectedValue != "No")
                {
                    FailureText.Text = "Please select something in the radio buttons";
                    ErrorMessage.Visible = true;
                    return;
                }

                string password = "";
                if (textPassword.Visible == true && imagePassword.Visible == false)
                {
                    password = Password.Text;
                }

                else if (imagePassword.Visible == true && imagePassword.Visible == true)
                {
                    if (imagePasswordControl.HasFile)
                        {

                    string fileExt = Path.GetExtension(imagePasswordControl.PostedFile.FileName);

                        if (fileExt == ".jpg" || fileExt == ".png")
                    {
                        
                            // string filename = Path.GetFileName(imagePasswordControl.FileName);
                            byte[] imgbyte = imagePasswordControl.FileBytes;
                            //convert byte[] to Base64 string
                            string base64ImgString = Convert.ToBase64String(imgbyte);
                            password = Password.Text + base64ImgString;
                        }

                        else
                        {
                            FailureText.Text = "Upload Status: Only JPEG files are available for upload";
                            return;
                        }
                    }

                    else
                    {
                        
                        FailureText.Text = "Please uplaod something.";
                    }
                }




                // Validate the user password
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();


                // Require the user to have a confirmed email before they can log on.
                var user = manager.FindByName(userName.Text);
                if (user != null)
                {
                    if (!user.EmailConfirmed)
                    {
                        FailureText.Text = "Invalid login attempt. You must have a confirmed email address.";
                        ErrorMessage.Visible = true;
                        ResendConfirm.Visible = true;
                    }
                    else
                    {
                        manager.UpdateSecurityStamp(user.Id);
                        // This doen't count login failures towards account lockout
                        // To enable password failures to trigger lockout, change to shouldLockout: true
                        var result = signinManager.PasswordSignIn(userName.Text, password, RememberMe.Checked, shouldLockout: true);

                        switch (result)
                        {
                            case SignInStatus.Success:
                                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                                break;
                            case SignInStatus.LockedOut:
                                Response.Redirect("/Account/Lockout");
                                break;
                            case SignInStatus.RequiresVerification:
                                Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
                                                                Request.QueryString["ReturnUrl"],
                                                                RememberMe.Checked),
                                                  true);
                                break;
                            case SignInStatus.Failure:
                            default:
                                FailureText.Text = "Invalid login attempt";
                                ErrorMessage.Visible = true;
                                break;
                        }
                      
                    }
                }
            }
        }


        protected void SendEmailConfirmationToken(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = manager.FindByName(userName.Text);
            if (user != null)
            {
                if (!user.EmailConfirmed)
                {
                    string code = manager.GenerateEmailConfirmationToken(user.Id);
                    string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                    manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                    FailureText.Text = "Confirmation email sent. Please view the email and confirm your account.";
                    ErrorMessage.Visible = true;
                    ResendConfirm.Visible = false;
                }
            }
        }

        protected void YesOrNoImage_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (YesOrNoImage.SelectedValue == "Yes")
            {
                imagePassword.Visible = true;
            }
            else if(YesOrNoImage.SelectedValue == "No")
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