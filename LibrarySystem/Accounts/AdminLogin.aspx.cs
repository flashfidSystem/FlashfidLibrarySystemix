using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace LibrarySystem.Accounts
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from librarian where librarian_id ='" + txtUsename.Text.Trim()+"' and password='" + txtPass.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Succcessfull  " + dr.GetValue(0).ToString() + "');</script>");
                        Session["librarian_id"] = dr.GetValue(8).ToString();
                        Session["fullname"] = dr.GetValue(0).ToString();
                        Session["dob"] = dr.GetValue(1).ToString();
                        Session["contact_no"] = dr.GetValue(2).ToString();
                        Session["email"] = dr.GetValue(3).ToString();
                        Session["state"] = dr.GetValue(4).ToString();
                        Session["city"] = dr.GetValue(5).ToString();
                        Session["pincode"] = dr.GetValue(6).ToString();
                        Session["full_address"] = dr.GetValue(7).ToString();
                        //  Session["matric_no"] = dr.GetValue(8).ToString();
                        Session["password"] = dr.GetValue(9).ToString();
                        Session["librarian_img_link"] = dr.GetValue(10).ToString();
                        Session["last_update"] = dr.GetValue(11).ToString();

                        Session["role"] = "admin";
                        Session["status"] = dr.GetValue(10).ToString();
                        //Session["status"] = dr.GetValue(10).ToString();
                    }
                    Response.Redirect("Admin_profile.aspx");
                }
                else
                {
                   

                    Response.Write("<script>alert('Not Register Yet');</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            // Response.Write("<script>alert('');</script>");
        }
    }
    }
