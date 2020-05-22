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
    public partial class Contact_us : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FileAuthorPublisherValues();
            }
           
        }

      


        void sendMesage()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into Contact_us(full_name,email,contact_no,country,subject,message,getme)values(@full_name,@email,@contact_no,@country,@subject,@message,@getme) ", con);
                cmd.Parameters.AddWithValue("@full_name", txtfullname.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtemaill.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", txtnumber.Text.Trim());
                cmd.Parameters.AddWithValue("@country", DropDownList1.Text.Trim());
                cmd.Parameters.AddWithValue("@subject", txtSubject.Text.Trim());
                cmd.Parameters.AddWithValue("@message", txtMesage.Text.Trim());
                cmd.Parameters.AddWithValue("@getme", DateTime.Now);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Message send Successfully, We will look towards your message.');</script>");
                // GridView1.DataBind();
                txtSubject.Text = "";
                txtnumber.Text = "";
                txtMesage.Text = "";
                txtfullname.Text = "";
                txtemaill.Text = "";
                DropDownList1.Text = "";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            sendMesage();
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
                SqlCommand cmd = new SqlCommand("select country from country_tb;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList1.DataSource = dt;
                DropDownList1.DataValueField = "country";
                DropDownList1.DataBind();

               
            }
            catch (Exception ex)
            {
                //  messagew.Text = ex.Message;
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }



    }

}