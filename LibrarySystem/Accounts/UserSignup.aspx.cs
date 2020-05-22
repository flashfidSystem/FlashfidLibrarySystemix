using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace LibrarySystem
{
    public partial class UserSignup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            FileAuthorPublisherValues();
        }
        //sign up button
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkmemberExists())
            {
                Response.Write("<script>alert('Matric No Already Exist,Go to the Library For Complians');</script>");
            }
            else
            {
                signupuser();
          
            }
        }


        //bool for check
        bool checkmemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from student_master_tbl where matric_no ='" + txtmatric.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >=1)
                {
                    return true;
                }
                else
                {
                    return false;

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;

            }  
        }



        //user method
        void signupuser()
        {
            
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into student_master_tbl(full_name,dob,contact_no,email,state,city,pincode,full_address,matric_no,password,account_status)values(@full_name,@dob,@contact_no,@email,@state,@city,@pincode,@full_address,@matric_no,@password,@account_status) ", con);
                cmd.Parameters.AddWithValue("@full_name", txtfullname.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", txtdob.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", txtphoneno.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());
                cmd.Parameters.AddWithValue("@state", Dropstate.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", txtcity.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", txtcode.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", txtadress.Text.Trim());
                cmd.Parameters.AddWithValue("@matric_no", txtmatric.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txtpassword.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending");

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sign Up Successful,Click on student login to login');</script>");
                cleartxt();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void cleartxt()
        {
            txtadress.Text = "";
            txtcity.Text = "";
            txtcode.Text = "";
            txtdob.Text = "";
            txtemail.Text = "";
            txtfullname.Text = "";
            txtmatric.Text = "";
            txtpassword.Text = "";
            txtphoneno.Text = "";
            Dropstate.Text = "";
        }
        void FileAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select state from language_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Dropstate.DataSource = dt;
                Dropstate.DataValueField = "state";
                Dropstate.DataBind();

                con.Close();

            }
            catch (Exception ex)
            {
                //  messagew.Text = ex.Message;
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void txtcode_TextChanged(object sender, EventArgs e)
        {

        }
    }
}