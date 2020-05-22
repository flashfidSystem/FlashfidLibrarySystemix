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
    public partial class Admin_Book_Inventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string globa_filepath;
        static int global_actual_stock, global_Curent_stock, global_Issue_stock;

        protected void Page_Load(object sender, EventArgs e)
        {
          if (!IsPostBack)
           {
              
                FileAuthorPublisherValues();
              //  DropAuthorName.Text = "Please Select";
              //  DropLanguage.Text = "Please Select";
              //  DropPublisherName.Text = "Please Select";
                GridView1.DataBind();
            }
           
        }
        //Add button
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkBookExists())
            {
                //messagew.Text = "Book Alredy EExists";
                Response.Write("<script>alert('Book Alredy Exists');</script>");

            }
            else
            {
                addnewBook();
            }
        }
      //  update button
        protected void Button2_Click(object sender, EventArgs e)
        {
            updateBook();
        }

        //function
        
       


        void updateBook()
        {
            if (checkBookExists())
            {
                try
                {
                    int actual_stock = Convert.ToInt32(txtActualStock.Text.Trim());
                    int current_stock = Convert.ToInt32(txtCureentStock.Text.Trim());
                    if (global_actual_stock==actual_stock)
                    {

                    }
                    else
                    {
                        if (actual_stock < global_Issue_stock)
                        {
                            Response.Write("<script>alert('Actual Stock Value cannot be less than issued books');</script>");
                            return;
                        }
                        else
                        {
                            current_stock = actual_stock - global_Issue_stock;
                            txtCureentStock.Text = "" + current_stock;
                        }
                    }
                  


                    string department = "";
                    foreach (int i in ListBoxDepartment.GetSelectedIndices())
                    {
                        department = department + ListBoxDepartment.Items[i] + ",";
                    }
                    department = department.Remove(department.Length - 1);

                    string filepath = "~/book_inventory/images%20(5).jpg";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename=="" || filename==null)
                    {
                        filepath = globa_filepath;
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                        filepath = "~/Accounts/book_inventory/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("Update book_master_tbl SET book_name=@book_name,department=@department,author_name=@author_name,publisher_name=@publisher_name,publish_date=@publish_date,language=@language,edition=@edition,book_cost=@book_cost,no_of_pages=@no_of_pages,book_description=@book_description,actual_stock=@actual_stock,current_stock=@current_stock,book_img_link=@book_img_link where book_id='"+txtbookId.Text.Trim()+"'",con);
                    cmd.Parameters.AddWithValue("@book_name",txtBookNamae.Text.Trim());
                    cmd.Parameters.AddWithValue("@department", department);
                    cmd.Parameters.AddWithValue("@author_name",DropAuthorName.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", DropPublisherName.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publish_date", txtPublicationDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", DropLanguage.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@edition", txtEdition.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", txtBookCost.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_of_pages", txtBookPages.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_description", txtBooDesc.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
                    cmd.Parameters.AddWithValue("@book_img_link",filepath );

                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();

                    Response.Write("<script>alert('Book  Updated Successfully By Admin');</script>");
                    cleartxt();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }

            else
            {
                Response.Write("<script>alert('Invalid Book ID');</script>");
            }

        }




        //delete button
        protected void Button6_Click(object sender, EventArgs e)
        {
            DeleteStudent();
        }

        void DeleteStudent()
        {
            if (checkBookExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE FROM book_master_tbl where  book_id='" + txtbookId.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book Deleted Successfully By Admin');</script>");
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
            else
            {
                Response.Write("<script>alert('Invalid Book ID');</script>");
            }
        }






        // user function
        void FileAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select author_name from author_master_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropAuthorName.DataSource = dt;
                DropAuthorName.DataValueField = "author_name";
                DropAuthorName.DataBind();

                cmd = new SqlCommand("select publisher_name from publisher_master_tbl ;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropPublisherName.DataSource = dt;
                DropPublisherName.DataValueField = "publisher_name";
                DropPublisherName.DataBind();

                cmd = new SqlCommand("select language from language_tbl ;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropLanguage.DataSource = dt;
                DropLanguage.DataValueField = "language";
                DropLanguage.DataBind();

                cmd = new SqlCommand("select department from language_tbl ;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                ListBoxDepartment.DataSource = dt;
                ListBoxDepartment.DataValueField = "department";
                ListBoxDepartment.DataBind();
            }
            catch (Exception ex)
            {
              //  messagew.Text = ex.Message;
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void addnewBook()
        {
            try
            {

                string department = "";
                foreach (int i in ListBoxDepartment.GetSelectedIndices())
                {
                    department = department + ListBoxDepartment.Items[i] + ",";
                }
                department = department.Remove(department.Length - 1);

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

                SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tbl (book_id,book_name,department,author_name,publisher_name,publish_date,language,edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link) VALUES (@book_id,@book_name,@department,@author_name,@publisher_name,@publish_date,@language,@edition,@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock,@book_img_link)", con);
                cmd.Parameters.AddWithValue("@book_id", txtbookId.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", txtBookNamae.Text.Trim());

                cmd.Parameters.AddWithValue("@department", department);
                cmd.Parameters.AddWithValue("@author_name", DropAuthorName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", DropPublisherName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", txtPublicationDate.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropLanguage.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", txtEdition.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", txtBookCost.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", txtBookPages.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", txtBooDesc.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", txtActualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", txtActualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);
                cmd.ExecuteNonQuery();
                con.Close();
                //  messagew.Text = "Book Added Successfully";
                Response.Write("<script>alert('Book Added Successfully');</script>");
                GridView1.DataBind();
                cleartxt();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkBookExists()
        {
            SqlConnection con = new SqlConnection(strcon);
            try
            {

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from book_master_tbl where book_id ='" + txtbookId.Text.Trim() + "'OR book_name='"+txtBookNamae.Text.Trim()+"';", con);
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
        // button Go
        protected void Button3_Click(object sender, EventArgs e)
        {
            getById();
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            cleartxt();
        }

        protected void txtPublicationDate_Load(object sender, EventArgs e)
        {

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
                SqlCommand cmd = new SqlCommand("select * from book_master_tbl  where book_id='" + txtbookId.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtBookNamae.Text = dt.Rows[0]["book_name"].ToString();
                    txtPublicationDate.Text = dt.Rows[0]["publish_date"].ToString();
                    txtEdition.Text = dt.Rows[0]["edition"].ToString();
                    txtBookCost.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                    txtBookPages.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
                    txtActualStock.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    txtCureentStock.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    txtBooDesc.Text = dt.Rows[0]["book_description"].ToString();
                    DropLanguage.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    // DropLanguage.Text = dt.Rows[0]["language"].ToString();
                    DropAuthorName.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();
                    DropPublisherName.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();

                    ListBoxDepartment.ClearSelection();
                    string[] deparment = dt.Rows[0]["department"].ToString().Trim().Split(',');
                    for (int i = 0; i < deparment.Length; i++)
                    {
                        for (int j = 0; j < ListBoxDepartment.Items.Count; j++)
                        {
                            if (ListBoxDepartment.Items[j].Text.ToString() == deparment[i])
                            {
                                ListBoxDepartment.Items[j].Selected = true;
                            }
                        }
                    }

                       string Astock = dt.Rows[0]["actual_stock"].ToString();
                       string Cstock = dt.Rows[0]["current_stock"].ToString();

                        if (Astock == string.Empty | Astock.Trim().ToString() == "")
                        {
                            Astock = "0";
                        }
                        if (Cstock == string.Empty | Cstock.Trim().ToString() == "")
                        {
                           Cstock = "0";
                       }

                     txtIssueBook.Text = "" + (Convert.ToInt32(Astock) - Convert.ToInt32(Cstock));

                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_Curent_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_Issue_stock = global_actual_stock - global_Curent_stock;
                    globa_filepath = dt.Rows[0]["book_img_link"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Book Id Search For Book Id At Your Right Hand Side');</script>");
                }
            
            }
            catch (Exception ex)
            {
                //  messagew.Text = ex.Message;
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void cleartxt()
        {
            txtbookId.Text = "";
            txtActualStock.Text = "";
            txtBooDesc.Text = "";
            txtBookCost.Text = "";
            txtbookId.Text = "";
            txtBookNamae.Text = "";
            txtBookPages.Text = "";
            txtCureentStock.Text = "";
            txtEdition.Text = "";
            txtIssueBook.Text = "";
            txtPublicationDate.Text = "";
         //   DropAuthorName.Text = "";
           // DropLanguage.Text = "";
         //   DropPublisherName.Text = "";
        }

    }
}