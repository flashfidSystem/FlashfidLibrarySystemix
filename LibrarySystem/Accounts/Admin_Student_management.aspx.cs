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
    public partial class Admin_management : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView2.DataBind();
            }
           
        }
        //button Delete
        protected void Button6_Click(object sender, EventArgs e)
        {
            DeleteStudent();
        }
        //primary
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            UpdateStatus("active");
        }
        //warning
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            UpdateStatus("pending");
        }
        //danger
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            UpdateStatus("deactive");
        }
        //button Go
        protected void btnGo_Click(object sender, EventArgs e)
        {
            getStudent();
        }

        void DeleteStudent()
        {
            if (checkmemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE FROM student_master_tbl where  matric_no='" + txtMatric.Text.Trim() + "'", con);




                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Student Deleted Successfully By Admin');</script>");
                    cleartxt();
                    GridView2.DataBind();
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
            else
            {
                    Response.Write("<script>alert('Invalid Matric No');</script>");
                }
            }
        

        void   cleartxt()
        {
            txtMatric.Text = "";
            txtMtCity.Text = "";
            txtPhone.Text = "";
            txtState.Text = "";
            txtStatus.Text = "";
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtDOB.Text = "";
            txtCode.Text = "";
            txtAddress.Text = "";
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
                SqlCommand cmd = new SqlCommand("select * from student_master_tbl where matric_no ='" + txtMatric.Text.Trim() + "';", con);
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



        //function
        void getStudent()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from student_master_tbl where matric_no ='" + txtMatric.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtFullName.Text= dr.GetValue(0).ToString();
                        txtStatus.Text = dr.GetValue(10).ToString();
                        txtDOB.Text = dr.GetValue(1).ToString();
                        txtPhone.Text = dr.GetValue(2).ToString();
                        txtEmail.Text = dr.GetValue(3).ToString();
                        txtState.Text = dr.GetValue(4).ToString();
                        txtMtCity.Text = dr.GetValue(5).ToString();
                        txtCode.Text = dr.GetValue(6).ToString();
                        txtAddress.Text = dr.GetValue(7).ToString();

                    }
                   
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


        void UpdateStatus(String statuss)
        {
            if (checkmemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("Update student_master_tbl SET account_status='" + statuss + "' where matric_no ='" + txtMatric.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    GridView2.DataBind();
                    con.Close();
                 
                    Response.Write("<script>alert('Member Status Updated By Admin');</script>");
                   
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }

            else
            {
                Response.Write("<script>alert('Invalid Matric No');</script>");
            }



        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            cleartxt();
        }

        
    }
    }
