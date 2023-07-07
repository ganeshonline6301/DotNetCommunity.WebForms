using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetCommunity
{
    public partial class UploadProject : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                lblprojectid.Text = Generateid();
            }
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            int fileid = Convert.ToInt32(lblprojectid.Text);
            string filename = uploadfile.FileName;
            string filetype = uploadfile.PostedFile.ContentType;
            byte[] filedata = uploadfile.FileBytes;
            int lid = Convert.ToInt32(Session["lid"]);
            string ptype = txtprojecttype.Text;
            if (ptype.Length==0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Upload", "swal('Write your project type before uploading!', '', 'error')", true);
            }
            else if (!uploadfile.HasFile)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Upload", "swal('Please select a file to upload!', '', 'error')", true);
            }
            else if(uploadfile.HasFile)
            {
                cmd = new SqlCommand("insert into project values(@fileid,@ptype,@filename,@filetype,@lid,@filedata)", conn);
                cmd.Parameters.AddWithValue("@fileid",fileid);
                cmd.Parameters.AddWithValue("@ptype",ptype);
                cmd.Parameters.AddWithValue("@filename",filename);
                cmd.Parameters.AddWithValue("@filetype",filetype);
                cmd.Parameters.AddWithValue("@lid",lid);
                cmd.Parameters.AddWithValue("@filedata",filedata);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Upload", " swal('Done!', 'File uploaded successfully!', 'success')", true);
            }
            clear();
        }
        string Generateid()
        {
            cmd = new SqlCommand("select count(*) from project ", conn);
            conn.Open();
            int i =(int)cmd.ExecuteScalar();
            conn.Close();
            string pid = Convert.ToString(i+1);
            return pid;
        }
        void clear()
        {
            lblprojectid.Text = Generateid();
            txtprojecttype.Text = "";
            uploadfile.Attributes.Clear();
            uploadfile.PostedFile.InputStream.Dispose();
            uploadfile.PostedFile.InputStream.Flush();
            uploadfile.PostedFile.InputStream.Close();
            uploadfile.Dispose();
        }
    }
}