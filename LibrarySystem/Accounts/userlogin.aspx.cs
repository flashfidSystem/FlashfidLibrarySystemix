using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace LibrarySystem
{
    public partial class userlogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //user login
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from student_master_tbl where matric_no='"+txtmatric.Text.Trim()+ "' and password='"+txtpass.Text.Trim()+"' ", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if(dr.HasRows)
                {
                    while (dr.Read()) 
                    {

                        Response.Write("<script>alert('Login Succcessfull  "+dr.GetValue(8).ToString()+"');</script>");
                        Session["username"] = dr.GetValue(8).ToString();
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
                        Session["Student_img_link"] = dr.GetValue(11).ToString();
                        Session["last_update"] = dr.GetValue(12).ToString();

                        Session["role"] =  "user";
                        Session["status"] = dr.GetValue(10).ToString();
                    }
                    Response.Redirect("Student_Profile.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Matric No Not Register Yet or invalid Password');</script>");
                }


            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
           // Response.Write("<script>alert('');</script>");
        }
    }
}