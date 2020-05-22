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
    public partial class Admin_Book_Issuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataBind();
            }
            
        }

        protected void btnIssue_Click(object sender, EventArgs e)
        {
            if (checkBookExists() && checkStuExists())
            {

                if (checkIfIsueExist())
                {
                    Response.Write("<script>alert('The Student has Already Issue This Book on');</script>");
                }
                else
                {
                    if (checkStatus())
                    {
                        DateTime inputDateTime = Convert.ToDateTime(txtEnd.Text);
                        if (inputDateTime < DateTime.Now)
                        {
                            Label1.Text = "invalid date";
                           // Response.Write("<script>alert('you can't choose previous date for due date');</script>");
                
                        }
                        else
                        {
                            IssueBook();
                        }
                       
                       
                    }
                    else
                    {
                        Response.Write("<script>alert('The Student status is not active to issue a book yet');</script>");
                    }
                 
                }            
            }
            else
            {
                Response.Write("<script>alert('Invalid Matric No Or Book ID Please Check Your Input');</script>");
            }
        }

        void IssueBook()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into book_issue_tbl(member_id,member_name,book_id,book_name,issue_date,due_date)values(@member_id,@member_name,@book_id,@book_name,@issue_date,@due_date) ", con);
                cmd.Parameters.AddWithValue("@member_id", txtMatric.Text.Trim());
                cmd.Parameters.AddWithValue("@member_name", txtStuName.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", txtBookName.Text.Trim());
                cmd.Parameters.AddWithValue("@issue_date", DateTime.Now);
                cmd.Parameters.AddWithValue("@due_date", txtEnd.Text.Trim());


                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("update book_master_tbl set current_stock=current_stock-1 where book_id='"+txtBookID.Text.Trim()+"'",con);

                cmd.ExecuteNonQuery();
                GridView1.DataBind();
                con.Close();
         
                Response.Write("<script>alert('Book Issue Successfully By Admin');</script>");



               cleartxt();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }



        protected void btnGo_Click(object sender, EventArgs e)
        {
            txtAmount.Text = "0";
            txtDaily.Text = "20";
            txtLate.Text = "0";
            getBooKNAme();
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            if (checkBookExists() && checkStuExists())
            {

                if (checkIfIsueExist())
                {
                    returnBook();
                }
                else
                {
                    Response.Write("<script>alert('This Entry Does Not Exists');</script>");
                }


            }
            else
            {
                Response.Write("<script>alert('Invalid Matric No Or Book ID Please Check Your Input');</script>");
            }
        }


        void returnBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SpIssueMaster";
                cmd.Parameters.Add(new SqlParameter("@matric_no", SqlDbType.VarChar)).Value = txtMatric.Text.Trim();
                cmd.Parameters.Add(new SqlParameter("@book_id", SqlDbType.VarChar)).Value = txtBookID.Text.Trim();
                cmd.Parameters.Add(new SqlParameter("@issue_date", SqlDbType.VarChar)).Value = txtIssueDate.Text.Trim();
                cmd.Parameters.Add(new SqlParameter("@due_date", SqlDbType.VarChar)).Value = txtEnd.Text.Trim();
                cmd.Parameters.Add(new SqlParameter("@Daily_fine", SqlDbType.VarChar)).Value = txtDaily.Text.Trim();
                cmd.Parameters.Add(new SqlParameter("@Late_Day", SqlDbType.VarChar)).Value = txtLate.Text.Trim();
                cmd.Parameters.Add(new SqlParameter("@Fine_Amount", SqlDbType.VarChar)).Value = txtAmount.Text.Trim();
                cmd.ExecuteNonQuery();
                GridView1.DataBind();
                con.Close();
                cleartxt();
                Response.Write("<script>alert('Book return Successfully');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }



        //function
        void getBooKNAme()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select book_name from book_master_tbl   where  book_id='" + txtBookID.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtBookName.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID');</script>");
                }

                cmd = new SqlCommand("select full_name from student_master_tbl  where matric_no='"+txtMatric.Text.Trim()+"' ;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count>=1)
                {
                    txtStuName.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Matric No');</script>");
                }

               
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Sp_pomp";
                cmd.Parameters.Add(new SqlParameter("@book", SqlDbType.VarChar)).Value = txtBookID.Text.Trim();
                cmd.Parameters.Add(new SqlParameter("@member_id", SqlDbType.VarChar)).Value = txtMatric.Text.Trim();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txtIssueDate.Text = dr.GetValue(0).ToString();
                        txtEnd.Text = dr.GetValue(1).ToString();
                        txtLate.Text = dr.GetValue(2).ToString();
                        double A;
                        double B;
                        if (double.TryParse(txtLate.Text, out A) == true)
                        {
                            if (double.TryParse(txtDaily.Text, out B) == true)
                            {
                                txtAmount.Text = (A * B).ToString();
                            }
                        }

                        double c;
                        double d;
                        if (double.TryParse(txtLate.Text, out c) == true)
                        {
                            if (double.TryParse(txtDaily.Text, out d) == true)
                            {
                                txtAmount.Text = (c * d).ToString();
                            }
                        }
                    }
                }
                else
                {
                    txtIssueDate.Text = "";
                    txtEnd.Text = "";
                    
                }
                con.Close();
                dr.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

          bool checkBookExists()
        {
           
            try
            {
 SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from book_master_tbl where book_id ='" + txtBookID.Text.Trim() + "'and current_stock > 0 ", con);
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
               
                return false;
              //  Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }


        bool checkStatus()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from student_master_tbl where matric_no ='" + txtMatric.Text.Trim() + "'and account_status ='active'", con);
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

                return false;
                //  Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }










        bool checkStuExists()
        {
            SqlConnection con = new SqlConnection(strcon);
            try
            {

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select full_name from student_master_tbl  where matric_no='" + txtMatric.Text.Trim() + "' ;", con);
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

                return false;
                //  Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        void cleartxt()
        {
            txtBookID.Text = "";
            txtBookName.Text = "";
            txtEnd.Text = "";
            txtIssueDate.Text = "";
            txtMatric.Text = "";
            txtStuName.Text = "";
            txtAmount.Text = "0";
            txtDaily.Text = "20";
            txtLate.Text = "0";
            Label1.Text = "";
        }

        bool checkIfIsueExist()
        {
            SqlConnection con = new SqlConnection(strcon);
            try
            {

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from book_issue_tbl  where member_id='" + txtMatric.Text.Trim() + "' AND book_id='" + txtBookID.Text.Trim()+"'", con);
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

                return false;
                //  Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType==DataControlRowType.DataRow)
                {
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.Red;
                        e.Row.ForeColor = System.Drawing.Color.White;
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void txtDaily_TextChanged(object sender, EventArgs e)
        {
            double A;
            double B;
            if (double.TryParse(txtLate.Text, out A) == true)
            {
                if (double.TryParse(txtAmount.Text, out B) == true)
                {
                    txtAmount.Text = (A * B).ToString();
                }
            }
        }

        protected void txtLate_TextChanged(object sender, EventArgs e)
        {
            double A;
            double B;
            if (double.TryParse(txtLate.Text, out A) == true)
            {
                if (double.TryParse(txtAmount.Text, out B) == true)
                {
                    txtAmount.Text = (A * B).ToString();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            cleartxt();
        }

        protected void txtEnd_TextChanged(object sender, EventArgs e)
        {
          
        }
    }


}