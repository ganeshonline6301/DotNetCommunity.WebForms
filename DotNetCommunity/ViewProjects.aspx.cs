using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Reflection;

namespace DotNetCommunity
{
    public partial class ViewProjects : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;
        void bindgrid()
        {
            cmd = new SqlCommand("select p.projecttype, p.filename, p.filetype,p.filedata, l.name from project p inner join login l on l.loginid=p.loginid ", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gridallfiles.DataSource = dt;
            gridallfiles.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridallfiles_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "download")
            {
                string fileName = e.CommandArgument.ToString();
                cmd = new SqlCommand("select filedata, filetype from project where filename = @fileName", conn);
                cmd.Parameters.AddWithValue("@fileName", fileName);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    byte[] fileBytes = (byte[])dr["filedata"]; 
                    string fileType = dr["filetype"].ToString();
                    // Download the file
                    Response.Clear();
                    Response.ContentType = fileType;
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName);
                    Response.BinaryWrite(fileBytes);
                    Response.End();
                }
                dr.Close();
            }
        }
        void bindsearch()
        {
            string text = txtsearchfile.Text;
            char l = text.Substring(0, 1)[0];
            text = l.ToString();
            string searchquery = "select p.projecttype, p.filename, p.filetype,p.filedata, l.name from project p inner join login l on l.loginid=p.loginid where p.ProjectType like @text+'%' or p.projecttype like '%'+@text or p.projecttype like '%'+@text+'%' ";
            cmd = new SqlCommand(searchquery, conn);
            cmd.Parameters.AddWithValue("@text", text);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if(dr.HasRows)
            {
                gridallfiles.DataSource = dr;
                gridallfiles.DataBind();
            }  
            conn.Close();
            
        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            string text = txtsearchfile.Text;
            if (text.Length == 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Search", "swal('Please enter a search term.', '', 'warning')", true);
            }
            else
            {
                bindsearch();
            }
              
        }

        protected void btnviewall_Click(object sender, EventArgs e)
        {
            bindgrid();
        }
    }
}