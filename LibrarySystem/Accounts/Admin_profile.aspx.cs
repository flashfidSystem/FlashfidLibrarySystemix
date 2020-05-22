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
    public partial class Admin_profile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string globa_filepath;
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
                    if (Session["role"].Equals("admin"))
                    {
                      //  Label1.Text = "" + Session["status"].ToString();
                        Label5.Text = "Hello," + Session["fullname"].ToString();
                        txtFullName.Text = "" + Session["fullname"].ToString();
                        //Label3.Text = "" + Session["status"].ToString();
                        txtMatric.Text = "" + Session["librarian_id"].ToString();

                        txtDOB.Text = "" + Session["dob"].ToString();
                        txtNumner.Text = "" + Session["contact_no"].ToString();
                        txtEmail.Text = "" + Session["email"].ToString();
                        DropState.SelectedValue = "" + Session["state"].ToString();
                        txtCity.Text = "" + Session["city"].ToString();
                        txtCode.Text = "" + Session["pincode"].ToString();
                        txtAddress.Text = "" + Session["full_address"].ToString();
                        Image1.ImageUrl = "" + Session["librarian_img_link"].ToString();
                        Label6.Text = "" + Session["last_update"].ToString();
                        Label3.Text = "Online";
                        Label4.Text = ".";
                        
                        // im.DataBind();
                        //Myimages();

                        FileAuthorPublisherValues();
                       // BindGridView();

                    }
                }
                catch (Exception ex)
                {
                    Label3.Text = "Ofline";
                    Label4.Text = "";
                    Response.Redirect("AdminLogin.aspx");
                }

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


                //cmd = new SqlCommand("select * from book_issue_tbl where member_id='"+txtMatric+"' ;", con);
                //da = new SqlDataAdapter(cmd);
                //dt = new DataTable();
                //da.Fill(dt);
                //GridView1.DataSource = dt;
                //GridView1.DataValueField = "language";
                //DropLanguage.DataBind();
                //cmd = new SqlCommand("select * from book_issue_tbl where member_id='" + Session["username"].ToString() + "' ;", con);

                //  da = new SqlDataAdapter();

                //        cmd.Connection = con;
                //        con.Open();
                //        da.SelectCommand = cmd;

                //        DataSet ds = new DataSet();
                //        da.Fill(ds);

                //    // BIND DATABASE WITH THE GRIDVIEW.
                //    GridView1.DataSource = ds;
                //    GridView1.DataBind();

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
                cmd.CommandText = "SP_AdminLIBRAUPDATE";
                cmd.Parameters.AddWithValue("@full_name", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", txtDOB.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", txtNumner.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropState.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", txtCode.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@librarian_id", txtMatric.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());

                cmd.ExecuteNonQuery();

               // GridView1.DataBind();
                con.Close();
                Response.Write("<script>alert('Profile Updated Successfully');</script>");
                // cleartxt();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }


        }

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
                SqlCommand cmd = new SqlCommand("select * from librarian   where librarian_id='" + txtMatric.Text.Trim() + "';", con);
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
                    txtMatric.Text = dt.Rows[0]["librarian_id"].ToString().Trim();
                    txtNumner.Text = dt.Rows[0]["contact_no"].ToString().Trim();
                    DropState.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
                    // DropLanguage.Text = dt.Rows[0]["language"].ToString();
                    // DropAuthorName.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();
                    // DropPublisherName.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();

                    globa_filepath = dt.Rows[0]["Student_img_link"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid librarian ID');</script>");
                }

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

                // string department = "";
                //  foreach (int i in ListBoxDepartment.GetSelectedIndices())
                //  {
                //     department = department + ListBoxDepartment.Items[i] + ",";
                //     }
                //    department = department.Remove(department.Length - 1);

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

                SqlCommand cmd = new SqlCommand("update librarian set librarian_img_link=@librarian_img_link where librarian_id ='" + txtMatric.Text.Trim() + "';", con);

                cmd.Parameters.AddWithValue("@librarian_img_link", filepath);
                cmd.ExecuteNonQuery();
                //    GridView1.DataBind();
                Image1.ImageUrl = filepath;
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
    }
}