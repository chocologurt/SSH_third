using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using SSH3.Models;
using System;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;

namespace SSH3.Account
{
    public partial class AddorChangeProfilePic : System.Web.UI.Page
    {
        private string filename = "";
        private string imgPath = "";

        protected string SuccessMessage
        {
            get;
            private set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {


                var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
                var currentUser = manager.FindById(Context.User.Identity.GetUserId());
                var username = currentUser.UserName;

                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd =
                    new SqlCommand("SELECT imageName FROM userProfilePics WHERE Username = @userName", con);
                cmd.Parameters.AddWithValue("@userName", username);
                con.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        filename = Convert.ToString(reader["imageName"]);
                    }
                }

                con.Close();

                if (!String.IsNullOrEmpty(filename))
                {
                    string path = Server.MapPath("~/UserProfilePics/");
                    imgPath = username + "_" + filename;
                    System.Drawing.Image img = System.Drawing.Image.FromFile(string.Concat(path, imgPath));

                    img = resizeImage(img);
                    imgDemo.ImageUrl = @"~\UserProfilePics\" + imgPath;
                }
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx"); //redirect to main page
            }
        }

        protected void btnPreview_Click(object sender, EventArgs e)
        {
            var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            var user = manager.FindByName(Context.User.Identity.GetUserName());
            string username = user.UserName;
            if (FileUpload1.PostedFile != null)
            {// Check the extension of image
                string extension = Path.GetExtension(FileUpload1.FileName);
                if (extension.ToLower() == ".jpg")
                {
                    Stream strm = FileUpload1.PostedFile.InputStream;
                    using (var image = System.Drawing.Image.FromStream(strm))
                    {
                        int newWidth = 320; // New Width of Image in Pixel
                        int newHeight = 240; // New Height of Image in Pixel
                        var thumbImg = new Bitmap(newWidth, newHeight);
                        var thumbGraph = Graphics.FromImage(thumbImg);
                        thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                        thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                        thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        var imgRectangle = new Rectangle(0, 0, newWidth, newHeight);
                        thumbGraph.DrawImage(image, imgRectangle);
                        filename = FileUpload1.FileName;
                        imgPath = username + "_" + FileUpload1.FileName;
                        // Save the file
                        string targetPath = Server.MapPath(@"~\UserProfilePics\") + imgPath;
                        thumbImg.Save(targetPath, image.RawFormat);
                        //Show Image
                        imgDemo.ImageUrl = @"~\UserProfilePics\" + imgPath;
                    }

                    string data = "";

                    string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                    SqlConnection con2 = new SqlConnection(cs2);
                    SqlCommand cmd2 =
                        new SqlCommand("SELECT imageName FROM userProfilePics WHERE Username = @userName", con2);
                    cmd2.Parameters.AddWithValue("@userName", username);
                    con2.Open();

                    using (SqlDataReader reader = cmd2.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            data = Convert.ToString(reader["imageName"]);
                        }
                    }

                    con2.Close();

                    if (!String.IsNullOrEmpty(data))
                    {
                        //string cs = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                        //SqlConnection con = new SqlConnection(cs);
                        //SqlCommand cmd =
                        //    new SqlCommand("INSERT INTO userProfilePics (Username, imageName) VALUES(@userId, @image)", con);
                        //cmd.Parameters.AddWithValue("@userId", username);
                        //cmd.Parameters.AddWithValue("@image", filename);
                        //con.Open();
                        //cmd.ExecuteNonQuery();
                        //con.Close();
                        //string cs3 = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                        //SqlConnection con3 = new SqlConnection(cs3);
                        //SqlCommand cmd3 =
                        //    new SqlCommand("DELETE TOP(1) FROM userProfilePics WHERE Username = @username ", con3);
                        //cmd3.Parameters.AddWithValue("@username", username);
                        //con3.Open();
                        //cmd3.ExecuteNonQuery();
                        //con3.Close();

                        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                        SqlConnection con = new SqlConnection(cs);
                        SqlCommand cmd =
                            new SqlCommand("UPDATE userProfilePics SET imageName = @image WHERE Username = @userId", con);
                        cmd.Parameters.AddWithValue("@image", filename);
                        cmd.Parameters.AddWithValue("@userId", username);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                        Response.Redirect("~/Account/Manage?m=ChangePicSuccess");
                    }
                    else if (String.IsNullOrEmpty(data))
                    {
                        string cs4 = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                        SqlConnection con4 = new SqlConnection(cs4);
                        SqlCommand cmd4 =
                            new SqlCommand("INSERT INTO userProfilePics (Username, imageName) VALUES(@userId, @image)", con4);
                        cmd4.Parameters.AddWithValue("@userId", username);
                        cmd4.Parameters.AddWithValue("@image", filename);
                        con4.Open();
                        cmd4.ExecuteNonQuery();
                        con4.Close();
                        Response.Redirect("~/Account/Manage?m=ChangePicSuccess");
                    }
                }
                else
                {
                    ErrorMessage.Text = "Please only upload JPEG images.";
                }
            }
        }

        private static System.Drawing.Image resizeImage(System.Drawing.Image imgToResize, Size size)
        {
            //Get the image current width
            int sourceWidth = imgToResize.Width;
            //Get the image current height
            int sourceHeight = imgToResize.Height;

            float nPercent = 0;
            float nPercentW = 0;
            float nPercentH = 0;
            //Calulate  width with new desired size
            nPercentW = ((float)size.Width / (float)sourceWidth);
            //Calculate height with new desired size
            nPercentH = ((float)size.Height / (float)sourceHeight);

            if (nPercentH < nPercentW)
                nPercent = nPercentH;
            else
                nPercent = nPercentW;
            //New Width
            int destWidth = (int)(sourceWidth * nPercent);
            //New Height
            int destHeight = (int)(sourceHeight * nPercent);

            Bitmap b = new Bitmap(destWidth, destHeight);
            Graphics g = Graphics.FromImage((System.Drawing.Image)b);
            g.InterpolationMode = InterpolationMode.HighQualityBicubic;
            // Draw image with new width and height
            g.DrawImage(imgToResize, 0, 0, destWidth, destHeight);
            g.Dispose();
            return (System.Drawing.Image)b;
        }

        private System.Drawing.Image resizeImage(System.Drawing.Image img)
        {
            Bitmap b = new Bitmap(img);
            System.Drawing.Image i = resizeImage(b, new Size(100, 100));
            return i;
        }
    }
}