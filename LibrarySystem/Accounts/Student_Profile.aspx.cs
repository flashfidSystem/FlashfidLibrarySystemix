using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace LibrarySystem.Accounts
{
    public partial class Student_Profile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
       // string str;

   

        static string globa_filepath;
        //static int global_actual_stock, global_Curent_stock, global_Issue_stock;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //  DropAuthorName.Text = "Please Select";
                //  DropLanguage.Text = "Please Select";
                //  DropPublisherName.Text = "Please Select";
                // getById();
                try
                {
                    if (Session["role"].Equals("user"))
                    {
                        Label1.Text = "" + Session["status"].ToString();
                        Label5.Text = "Hello," + Session["fullname"].ToString();
                        txtFullName.Text = "" + Session["fullname"].ToString();
                        //Label3.Text = "" + Session["status"].ToString();
                        txtMatric.Text = "" + Session["username"].ToString();

                        txtDOB.Text = "" + Session["dob"].ToString();
                        txtNumner.Text = "" + Session["contact_no"].ToString();
                        txtEmail.Text = "" + Session["email"].ToString();
                        DropState.SelectedValue = "" + Session["state"].ToString();
                        txtCity.Text = "" + Session["city"].ToString();
                        txtCode.Text = "" + Session["pincode"].ToString();
                        txtAddress.Text = "" + Session["full_address"].ToString();
                     Image1.ImageUrl = "" + Session["Student_img_link"].ToString();
                        Label6.Text = "" + Session["last_update"].ToString();
                        Label3.Text = "Online";
                        Label4.Text = ".";
                      


                        FileAuthorPublisherValues();
                        BindGridView();
                        getBooKNAme();
                    }
                }
                catch (Exception ex)
                {
                    Label3.Text = "Ofline";
                    Label4.Text = "";
                    Response.Redirect("userlogin.aspx");
                }
                
            }
        }


        void getBooKNAme()
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

                cmd.CommandText = "Sp_pompStu";
                
                cmd.Parameters.Add(new SqlParameter("@member_id", SqlDbType.VarChar)).Value = txtMatric.Text.Trim();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    
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
                con.Close();
                dr.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text.Trim()==txtConfirmPass.Text.Trim())
            {
                updateProfile();
            }
            else
            {
                Response.Write("<script>alert('password and confirm password does not match');</script>");
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

        protected void btnGo_Click(object sender, EventArgs e)
        {
            getById();
        }

        void updateProfile()
        {
               try
                {
        
                 
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                  //  SqlCommand cmd = new SqlCommand("Update student_master_tbl SET full_name=@full_name,dob=@dob,contact_no=@contact_no,email=@email,state=@state,city=@city,pincode=@pincode,full_address=@full_address,password=@password,book_description=@book_description,actual_stock=@actual_stock,current_stock=@current_stock,book_img_link=@book_img_link where book_id='" + txtbookId.Text.Trim() + "'", con);
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "SP_LIBRAUPDATE";
                    cmd.Parameters.AddWithValue("@full_name", txtFullName.Text.Trim());
                    cmd.Parameters.AddWithValue("@dob", txtDOB.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_no", txtNumner.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@state", DropState.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim());
                    cmd.Parameters.AddWithValue("@pincode", txtCode.Text.Trim());
                    cmd.Parameters.AddWithValue("@full_address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@matric_no", txtMatric.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                  
                    cmd.ExecuteNonQuery();
                
                    GridView1.DataBind();
                    con.Close();
                    Response.Write("<script>alert('Profile Updated Successfully');</script>");
                   // cleartxt();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            

        }


        //bool checkStudentExists()
        //{
        //    SqlConnection con = new SqlConnection(strcon);
        //    try
        //    {

        //        if (con.State == ConnectionState.Closed)
        //        {
        //            con.Open();
        //        }
        //        SqlCommand cmd = new SqlCommand("select * from student_master_tbl where matric_no ='" + txtMatric.Text.Trim() + "';", con);
        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        DataTable dt = new DataTable();
        //        da.Fill(dt);
        //        if (dt.Rows.Count >= 1)
        //        {
        //            return true;
        //        }
        //        else
        //        {
        //            return false;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("<script>alert('" + ex.Message + "');</script>");
        //        return false;
        //    }

        //}

        protected void btnUpload_Click(object sender, EventArgs e)
        {
                UploadImage(); 
          
           
        }

        void getById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from student_master_tbl  where matric_no='" + txtMatric.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtAddress.Text = dt.Rows[0]["full_address"].ToString().Trim();
                    txtCity.Text = dt.Rows[0]["city"].ToString().Trim();
                    txtCode.Text = dt.Rows[0]["pincode"].ToString().Trim();
                    txtDOB.Text = dt.Rows[0]["dob"].ToString().Trim();
                    txtEmail.Text = dt.Rows[0]["email"].ToString().Trim();
                    txtFullName.Text = dt.Rows[0]["full_name"].ToString().Trim();
                    txtMatric.Text = dt.Rows[0]["matric_no"].ToString().Trim();
                    txtNumner.Text = dt.Rows[0]["contact_no"].ToString().Trim();
                    DropState.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
                    // DropLanguage.Text = dt.Rows[0]["language"].ToString();
                   // DropAuthorName.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();
                   // DropPublisherName.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
                       
                    globa_filepath = dt.Rows[0]["Student_img_link"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Invalid Matric Number');</script>");
                }
                con.Close();
            }
            catch (Exception ex)
            {
                //  messagew.Text = ex.Message;
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }



        void UploadImage()
        {
            try
            {

             

                string filepath = "~/book_inventory/images%20(5).jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath = "~/Accounts/book_inventory/" + filename;
                //C:\Users\OLORUNFEMI ADEDOYIN\documents\visual studio 2015\Projects\LibrarySystem\LibrarySystem\Accounts\book_inventory\images (5).jpg
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("update student_master_tbl set Student_img_link=@Student_img_link where matric_no ='" + txtMatric.Text.Trim() + "';", con);
             
                cmd.Parameters.AddWithValue("@Student_img_link", filepath);
                cmd.ExecuteNonQuery();
                //    GridView1.DataBind();
                Image1.ImageUrl =filepath;
                con.Close();
                //  messagew.Text = "Book Added Successfully";
                Response.Write("<script>alert('Image Uploaded Successfully');</script>");
              
              //  cleartxt();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGridView();
        }


        private void BindGridView()
        {
            // SET THE CONNECTION STRING.
             

            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("select * from book_issue_tbl where member_id='" +txtMatric.Text.Trim() + "' ;",con))
                {
                    SqlDataAdapter sda = new SqlDataAdapter();
                    try
                    {
                        cmd.Connection = con;
                        con.Open();
                        sda.SelectCommand = cmd;

                        DataSet ds = new DataSet();
                        sda.Fill(ds);

                        // BIND DATABASE WITH THE GRIDVIEW.
                        GridView1.DataSource = ds;
                        GridView1.DataBind();
                        con.Close();
                    }
                    catch (Exception ex)
                    {
                        //
                    }
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
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
            catch (Exception ex)
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
    }


}
