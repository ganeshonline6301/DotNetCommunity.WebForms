using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace DotNetCommunity
{
    public partial class View_DeleteProjects : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;

        void bindgrid()
        {
            cmd = new SqlCommand("select * from project p inner join login l on p.loginid=l.loginid", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gridprojects.DataSource = dt;
            gridprojects.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bindgrid();
            }
        }

        void sortpid(int pid)
        {
            cmd = new SqlCommand("update project set projectid=projectid-1 where projectid>@pid", conn);
            cmd.Parameters.AddWithValue("@pid", pid);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        void deletearticle(int pid)
        {
            cmd = new SqlCommand("delete from project where projectid = @pid", conn);
            cmd.Parameters.AddWithValue("@pid", pid);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            sortpid(pid);
            bindgrid();
        }

        protected void gridprojects_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="deleting")
            {
                int pid = Convert.ToInt32(e.CommandArgument.ToString());
                deletearticle(pid);
            }
            else if (e.CommandName == "download")
            {
                string fileName = e.CommandArgument.ToString(); // Get the file name from the CommandArgument

                // Retrieve file data from SQL server
                cmd = new SqlCommand("select filedata, filetype from project where filename = @fileName", conn);
                cmd.Parameters.AddWithValue("@fileName", fileName);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    byte[] fileBytes = (byte[])dr["filedata"]; // Get file data as byte array
                    string fileType = dr["filetype"].ToString(); // Get file type

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
    }
}