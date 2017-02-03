﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Owin;
using SSH3.Models;


namespace SSH3.Account
{
    public partial class Manage : System.Web.UI.Page
    {
        protected string SuccessMessage
        {
            get;
            private set;
        }

        private bool HasPassword(ApplicationUserManager manager)
        {
            return manager.HasPassword(User.Identity.GetUserId());
        }

        public bool HasPhoneNumber { get; private set; }

        public bool TwoFactorEnabled { get; private set; }

        public bool TwoFactorBrowserRemembered { get; private set; }

        public int LoginsCount { get; set; }

     

        protected void Page_Load()
        {
            //var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            ////HasPhoneNumber = String.IsNullOrEmpty(manager.GetPhoneNumber(User.Identity.GetUserId()));

            //// Enable this after setting up two-factor authentientication
            //?? String.Empty;

            //TwoFactorEnabled = manager.GetTwoFactorEnabled(User.Identity.GetUserId());

            //LoginsCount = manager.GetLogins(User.Identity.GetUserId()).Count;

            //var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            if (Context.User.Identity.IsAuthenticated)
            {
                var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
                var currentUser = manager.FindById(Context.User.Identity.GetUserId());
                string userpassword = currentUser.PasswordHash;
                //string userPhone = currentUser.PhoneNumber;
                TwoFactorEnabled = manager.GetTwoFactorEnabled(User.Identity.GetUserId());
                PhoneNumber.Text = manager.GetPhoneNumber(User.Identity.GetUserId());
                if (!IsPostBack)
                {
                    // Determine the sections to render


                    ChangePassword.Visible = true;



                    //if (!IsPostBack)
                    //{
                    //    // Determine the sections to render
                    //    if (HasPassword(manager))
                    //    {
                    //        ChangePassword.Visible = true;
                    //    }
                    //    else
                    //    {
                    //        CreatePassword.Visible = true;
                    //        ChangePassword.Visible = false;
                    //    }

                    // Render success message
                    var message = Request.QueryString["m"];
                    if (message != null)
                    {
                        // Strip the query string from action
                        Form.Action = ResolveUrl("~/Account/Manage");

                        SuccessMessage =
                            message == "ChangePwdSuccess" ? "Your password has been changed."
                            : message == "SetPwdSuccess" ? "Your password has been set."
                            : message == "RemoveLoginSuccess" ? "The account was removed."
                            : message == "AddPhoneNumberSuccess" ? "Phone number has been added"
                            : message == "RemovePhoneNumberSuccess" ? "Phone number was removed"
                            : message == "ChangePicSuccess" ? "Profile Picture was successfully changed"
                            : message == "AddSkillSuccess" ? "Your new Skill was added."
                            : message == "DeleteSkillSuccess" ? "Skill was deleted."
                            : message == "ChangeParticularsSuccess" ? "Your Particulars was changed successfully"
                            : message == "AddHobbySuccess" ? "Your new Hobby was added"
                            : message == "DeleteHobbySuccess" ? "Your Hobby was deleted"
                            : String.Empty;
                        successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
                    }
                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx"); //redirect to main page
            }
        }


        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        // Remove phonenumber from user
        protected void RemovePhone_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var result = manager.SetPhoneNumber(User.Identity.GetUserId(), null);
            if (!result.Succeeded)
            {
                return;
            }
            var user = manager.FindById(User.Identity.GetUserId());
            if (user != null)
            {
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                Response.Redirect("/Account/Manage?m=RemovePhoneNumberSuccess");
            }
        }

        // DisableTwoFactorAuthentication
        protected void TwoFactorDisable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), false);

            Response.Redirect("/Account/Manage");
        }

        //EnableTwoFactorAuthentication 
        protected void TwoFactorEnable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), true);

            Response.Redirect("/Account/Manage");
        }

        protected void FriendPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Account/FriendProfilePage?m=helloWanitaa");
        }

       
    }
}