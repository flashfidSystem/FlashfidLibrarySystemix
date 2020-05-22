using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibrarySystem
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    LinkButton2.Visible = true;//user login
                    LinkButton3.Visible = true;//user up
                    LinkButton14.Visible = true;//user up
                    LinkButton6.Visible = true;//user login

                    LinkButton13.Visible = false;//user up
                    LinkButton5.Visible = false;//hello user
                    LinkButton4.Visible = false;//log out

                   
                    LinkButton7.Visible = false;//user login
                    LinkButton8.Visible = false;//user login
                    LinkButton9.Visible = false;//user login
                    LinkButton10.Visible = false;//user login
                    LinkButton11.Visible = false;//user login
                    LinkButton12.Visible = false;//user login
                    LinkButton16.Visible = false;
                    LinkButton17.Visible = false;
                }

                else if(Session["role"].Equals("user"))
                {
                    LinkButton2.Visible = false;//user login
                    LinkButton3.Visible = false;//user up

                    LinkButton5.Visible = true;//hello user
                    LinkButton4.Visible = true;//log out

                    LinkButton5.Text = "Hello, "+ Session["fullname"].ToString();
                    LinkButton5.ForeColor = System.Drawing.Color.YellowGreen;
                    LinkButton13.Visible = false;//user up
                    LinkButton6.Visible = false;//user login
                    LinkButton12.Visible = true;//user login
                    LinkButton7.Visible = false;//user login
                    LinkButton8.Visible = false;//user login
                    LinkButton9.Visible = false;//user login
                    LinkButton10.Visible = false;//user login
                    LinkButton11.Visible = false;//user login
                    LinkButton14.Visible = false;
                    LinkButton15.Visible = false;
                    LinkButton16.Visible = true;
                    LinkButton17.Visible = false;
                }


                else if (Session["role"].Equals("admin"))
                {
                    LinkButton2.Visible = false;//user login
                    LinkButton3.Visible = false;//user up

                    LinkButton5.Visible = true;//hello user
                    LinkButton4.Visible = true;//log out

                    
                    LinkButton5.Text= "Hello, Admin " + Session["fullname"].ToString();
                    LinkButton5.ForeColor = System.Drawing.Color.YellowGreen;
                    LinkButton13.Visible = false;//user up
                    LinkButton6.Visible = false;//user login
                    LinkButton7.Visible = true;//user login
                    LinkButton8.Visible = true;//user login
                    LinkButton9.Visible = true;//user login
                    LinkButton10.Visible = true;//user login
                    LinkButton11.Visible = true;//user login
                    LinkButton12.Visible = false;//user login
                    // LinkButton14.Visible = true;
                    LinkButton14.Visible = false;
                    LinkButton15.Visible = false;
                    LinkButton16.Visible = false;
                    LinkButton17.Visible = true;
                }

                else if (Session["role"].Equals("Superadmin"))
                {
                    LinkButton2.Visible = false;//user login
                    LinkButton3.Visible = false;//user up

                    LinkButton5.Visible = true;//hello user
                    LinkButton4.Visible = true;//log out


                    LinkButton5.Text = "Hello, Super Admin " + Session["fullname"].ToString();
                    LinkButton5.ForeColor = System.Drawing.Color.YellowGreen;
                    LinkButton13.Visible = true;//user up
                    LinkButton6.Visible = false;//user login
                    LinkButton7.Visible = true;//user login
                    LinkButton8.Visible = true;//user login
                    LinkButton9.Visible = true;//user login
                    LinkButton10.Visible = true;//user login
                    LinkButton11.Visible = true;//user login
                    LinkButton12.Visible = false;//user login
                                                 // LinkButton14.Visible = true;
                    LinkButton14.Visible = false;
                    LinkButton15.Visible = true;
                    LinkButton16.Visible = false;
                    LinkButton17.Visible = false;
                }

            }
            catch(Exception ex)
            {

            }
           
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Author_Management.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Publisher_Management.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Book_Inventory.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Book_Issuing.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Student_management.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("View_Books.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSignup.aspx");
            
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";
            Session["Superadmin"] = "";

            LinkButton2.Visible = true;//user login
            LinkButton3.Visible = true;//user up
            LinkButton14.Visible = true;//user up
            LinkButton6.Visible = true;//user login

            LinkButton13.Visible = false;//user up
            LinkButton5.Visible = false;//hello user
            LinkButton4.Visible = false;//log out


            LinkButton7.Visible = false;//user login
            LinkButton8.Visible = false;//user login
            LinkButton9.Visible = false;//user login
            LinkButton10.Visible = false;//user login
            LinkButton11.Visible = false;//user login
            LinkButton12.Visible = false;//user login
            LinkButton16.Visible = false;
            LinkButton17.Visible = false;

            Response.Redirect("homepage.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton14_Click(object sender, EventArgs e)
        {
            Response.Redirect("Super_Admin_Login.aspx");
        }

        protected void LinkButton13_Click(object sender, EventArgs e)
        {
            Response.Redirect("DarshBoards.aspx"); 
        }

        protected void LinkButton15_Click(object sender, EventArgs e)
        {
             Response.Redirect("AdminSignUp.aspx"); 
        }

        protected void LinkButton16_Click(object sender, EventArgs e)
        {
            Response.Redirect("Student_Profile.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("Download_PDF.aspx");
        }

        protected void LinkButton17_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_profile.aspx");
        }
    }
}