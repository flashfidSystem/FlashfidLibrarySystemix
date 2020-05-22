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
    public partial class AdminSignUp : System.Web.UI.Page
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
                Response.Write("<script>alert('Member ID Already Exist');</script>");
            }
            else
            {
                signupuser();

            }
        }

            bool checkmemberExists()
        {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("select * from librarian where librarian_id ='" + txtLIbID.Text.Trim() + "';", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count >= 1)
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
                SqlCommand cmd = new SqlCommand("insert into librarian(full_name,dob,contact_no,email,state,city,pincode,full_address,librarian_id,password)values(@full_name,@dob,@contact_no,@email,@state,@city,@pincode,@full_address,@librarian_id,@password) ", con);
                cmd.Parameters.AddWithValue("@full_name", txtFullname.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", txtDOB.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropState.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", txtCode.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", txtAdess.Text.Trim());
                cmd.Parameters.AddWithValue("@librarian_id", txtLIbID.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
   

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Librarian Sign Up Successful by Admin');</script>");
                cleartxt();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Unable to Sign Up');</script>");
            }
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
               DropState.DataSource = dt;
                DropState.DataValueField = "state";
                DropState.DataBind();

                con.Close();

            }
            catch (Exception ex)
            {
                //  messagew.Text = ex.Message;
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void cleartxt()
        {
            txtPhone.Text = "";
            txtPassword.Text = "";
            txtLIbID.Text = "";
            txtFullname.Text = "";
            txtEmail.Text = "";
            txtDOB.Text = "";
            txtCode.Text = "";
            txtCity.Text = "";
            txtAdess.Text = "";
            DropState.Text = "";
        }

    }
}