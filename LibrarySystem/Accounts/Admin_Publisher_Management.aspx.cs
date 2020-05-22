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
    public partial class Admin_Publisher_Management : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataBind();
            }
           
        }
        //button Add
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkmemberExists())
            {
                Mesageaa.Text = "Publisher Id Already Exists You can't add two author Id";
                Mesageaa.ForeColor = System.Drawing.Color.Red;
                // Response.Write("<script>alert('Author Id Already Exists You can't add two author Id');</script>");
                //  Response.Write("<script>alert('Author Id Already Exists You can't add two author Id');</script>");
            }
            else
            {
                AddNewPubliser();
            }
           
        }
        //button Update
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkmemberExists())
            {
                UpNewPublisher();

            }
            else
            {
                //mesage.Text = "Author Id Does Not Exists Search For Author Id In the Search Button";
                //mesage.ForeColor = System.Drawing.Color.Red;
                Response.Write("<script>alert('Publisher Id Does Not Exists Search For Author Id In the Search Button');</script>");
            }
        }
        //button delete
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkmemberExists())
            {
                DeletePublisher();

            }
            else
            {
                //mesage.Text = "Author Id Does Not Exists Search For Author Id In the Search Button";
                //mesage.ForeColor = System.Drawing.Color.Red;
                Response.Write("<script>alert('Publisher Id Does Not Exists Search For Publisher Id In the Search Button');</script>");
            }
           // DeleteAuthhor();
        }
        //button Go
        protected void Button1_Click(object sender, EventArgs e)
        {
            getPublisher();
        }


        void UpNewPublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE publisher_master_tbl SET publisher_name=@publisher_name where  publisher_id='" + txtPublisherId.Text.Trim()+"'", con);
                
                cmd.Parameters.AddWithValue("@publisher_name", txtPublisherName.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('publisher Updated Successfully By Admin');</script>");
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






        void AddNewPubliser()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into publisher_master_tbl(publisher_id,publisher_name)values(@publisher_id,@publisher_name) ", con);
                cmd.Parameters.AddWithValue("@publisher_id", txtPublisherId.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", txtPublisherName.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('publisher added Successfully By Admin');</script>");
                GridView1.DataBind();
                cleartxt();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }





        bool checkmemberExists()
        {
            SqlConnection con = new SqlConnection(strcon);
            try
            {

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from publisher_master_tbl where publisher_id ='" + txtPublisherId.Text.Trim() + "';", con);
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



        void getPublisher()
        {
            SqlConnection con = new SqlConnection(strcon);
            try
            {

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from publisher_master_tbl where publisher_id ='" + txtPublisherId.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtPublisherName.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Publisher Id');</script>");
                }


            }
            catch (Exception ex)
            {
                //mesage.Text = (ex.Message);
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void cleartxt()
        {
            txtPublisherId.Text = "";
            txtPublisherName.Text = "";
           // mesage.Text = "";
        }



        void DeletePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM publisher_master_tbl where  publisher_id='" + txtPublisherId.Text.Trim() + "'", con);




                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher Deleted Successfully By Admin');</script>");
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

        protected void Button5_Click(object sender, EventArgs e)
        {
            cleartxt();
        }
    }
}