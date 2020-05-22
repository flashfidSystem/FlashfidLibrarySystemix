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
    public partial class Download_PDF : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            GridBindFile();
        }

        //protected void btnUploadImage_Click(object sender, EventArgs e)
        //{
        //    string FN = "";
        //    FN = Path.GetFileName(fuimage.PostedFile.FileName);
        //    string contentType = fuimage.PostedFile.ContentType;
        //    Stream fs = fuimage.PostedFile.InputStream;
        //    BinaryReader br = new BinaryReader(fs);
        //    byte[] bytes = br.ReadBytes((Int32)fs.Length);

        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("sp_tblFileUpload_Insert", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    //cmd.Parameters.AddWithValue("@empid", btnUploadImage.Text == "Save" ? 0 : ViewState["Eid"]);



        //    if (FN != "")
        //    {
        //        fuimage.SaveAs(Server.MapPath("book_inventory" + "\\" + FN));

        //        cmd.Parameters.AddWithValue("@Image", FN);
        //        cmd.Parameters.AddWithValue("@ContentType", contentType);
        //        cmd.Parameters.AddWithValue("@Data", bytes);
        //    }

        //    cmd.ExecuteNonQuery();
        //    con.Close();
        //    Response.Write("<script>alert('Successfully');</script>");
        //    GridBindFile();
        //}

        public void GridBindFile()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblFileUpload_Get", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                grdBindFiles.DataSource = ds;
                grdBindFiles.DataBind();
            }
        }

        protected void linkDownloadFile_Click(object sender, EventArgs e)
        {

            int ImageId = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_fileDownload", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ImageId", ImageId);
            SqlDataReader sdr = cmd.ExecuteReader();
            sdr.Read();
            fileName = sdr["Image"].ToString();
            bytes = (byte[])sdr["Data"];
            contentType = sdr["ContentType"].ToString();
            con.Close();
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();

        }
    }
}