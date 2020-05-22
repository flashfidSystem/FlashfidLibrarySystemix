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
    public partial class Admin_Author_Management : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataBind();
            }
           
        }
        //add button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkmemberExists())
            {
                 mesage.Text = "Author Id Already Exists You can't add two author Id";
                mesage.ForeColor = System.Drawing.Color.Red;
               // Response.Write("<script>alert('Author Id Already Exists You can't add two author Id');</script>");
              //  Response.Write("<script>alert('Author Id Already Exists You can't add two author Id');</script>");
            }
            else
            {
                AddNewAuthhor();
            }
        }
        //update button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkmemberExists())
            {
                UpNewAuthhor();
              
            }
            else
            {
                //mesage.Text = "Author Id Does Not Exists Search For Author Id In the Search Button";
                //mesage.ForeColor = System.Drawing.Color.Red;
                Response.Write("<script>alert('Author Id Does Not Exists Search For Author Id In the Search Button');</script>");
            }
        }


        void UpNewAuthhor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE author_master_tbl SET author_name=@author_name where  author_id='" + txtAuthorId.Text.Trim()+"'", con);
                
                cmd.Parameters.AddWithValue("@author_name", txtAuthorName.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Updated Successfully By Admin');</script>");
                GridView1.DataBind();
                cleartxt();
                //Response.Write("<script>alert('Author Updated Successfully By Admin');</script>");
                //mesage.Text = "Author Updated Successfully By Admin";
            }
            catch (Exception ex)
            {
               // mesage.Text = (ex.Message);
               Response.Write("<script>alert('" + ex.Message + "');</script>");
                // Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }




        void AddNewAuthhor()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into author_master_tbl(author_id,author_name)values(@author_id,@author_name) ", con);
                cmd.Parameters.AddWithValue("@author_id", txtAuthorId.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", txtAuthorName.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author added Successfully By Admin');</script>");
                GridView1.DataBind();
                cleartxt();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        //delete button
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkmemberExists())
            {
               DeleteAuthhor();

            }
            else
            {
                //mesage.Text = "Author Id Does Not Exists Search For Author Id In the Search Button";
                //mesage.ForeColor = System.Drawing.Color.Red;
                Response.Write("<script>alert('Author Id Does Not Exists Search For Author Id In the Search Button');</script>");
            }
        }

        void     DeleteAuthhor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM author_master_tbl where  author_id='" + txtAuthorId.Text.Trim() + "'", con);

                


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Deleted Successfully By Admin');</script>");
                cleartxt();
                GridView1.DataBind();
                //Response.Write("<script>alert('Author Updated Successfully By Admin');</script>");
                //mesage.Text = "Author Updated Successfully By Admin";
            }
            catch (Exception ex)
            {
                // mesage.Text = (ex.Message);
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                cleartxt();
                // Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }




        //button go
        protected void btnGo_Click(object sender, EventArgs e)
        {
            getAuthor();
        }


        //function Go
        void getAuthor()
        {
            SqlConnection con = new SqlConnection(strcon);
            try
            {

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from author_master_tbl where author_id ='" + txtAuthorId.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtAuthorName.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Author Id');</script>");
                }


            }
            catch (Exception ex)
            {
                //mesage.Text = (ex.Message);
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                
            }
        }






        //user function
        bool checkmemberExists()
        {
            SqlConnection con = new SqlConnection(strcon);
            try
            {
         
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from author_master_tbl where author_id ='" + txtAuthorId.Text.Trim() + "';", con);
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
                //mesage.Text = (ex.Message);
               Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
           
        }

        protected void txtAuthorId_TextChanged(object sender, EventArgs e)
        {
            mesage.Text = "";
        }

        void cleartxt()
        {
            txtAuthorId.Text = "";
            txtAuthorName.Text = "";
            mesage.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            cleartxt();
        }
    }
}