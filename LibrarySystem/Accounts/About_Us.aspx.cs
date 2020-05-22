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
    public partial class About_Us : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            sendMesage();
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
                SqlCommand cmd = new SqlCommand("insert into feedback(emails,messages,getme)values(@emails,@messages,@getme) ", con);
                cmd.Parameters.AddWithValue("@emails", txtemail.Text.Trim());
                cmd.Parameters.AddWithValue("@messages", txtmesage.Text.Trim());
                cmd.Parameters.AddWithValue("@getme",DateTime.Today);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Message send Successfully, We will look towards your message.');</script>");
                // GridView1.DataBind();
                txtmesage.Text = "";
                txtemail.Text = "";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Message not send');</script>");
            }
        }

    }
}