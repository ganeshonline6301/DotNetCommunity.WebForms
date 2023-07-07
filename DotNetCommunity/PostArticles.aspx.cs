using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetCommunity
{
    public partial class PostArticles : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                lblarticleid.Text = Generateid();
            }
        }

        protected void btnpostarticle_Click(object sender, EventArgs e)
        {
            int aid = Convert.ToInt32(lblarticleid.Text);
            string atype = droparticletype.SelectedItem.ToString();
            string adesc = txtarticledesc.Text;
            DateTime currentdate = DateTime.Now;
            string cdate = currentdate.ToString("yyyy-MM-dd");
            int lid = Convert.ToInt32(Session["lid"].ToString());
            if (adesc.Length == 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Post Article", "swal('Write your article before posting!', '', 'error')", true);
            }
            else if(droparticletype.SelectedIndex==0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Post Article", "swal('Select your article type before posting!', '', 'error')", true);
            }
            else
            {
                cmd = new SqlCommand("insert into article values(@aid,@atype,@adesc,@date,@lid)", conn);
                cmd.Parameters.AddWithValue("@aid", aid);
                cmd.Parameters.AddWithValue("@atype", atype);
                cmd.Parameters.AddWithValue("@adesc", adesc);
                cmd.Parameters.AddWithValue("@date", cdate);
                cmd.Parameters.AddWithValue("@lid", lid);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                clear();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Post Question", "swal('Done!', 'Article submitted.', 'success')", true);
            }
        }
        internal string Generateid()
        {
            cmd = new SqlCommand("select count(*) from Article", conn);
            conn.Open();
            int i = (int)cmd.ExecuteScalar();
            conn.Close();
            string id = Convert.ToString(i+1);
            return id;
        }
        internal void clear()
        {
            lblarticleid.Text = Generateid();
            txtarticledesc.Text = "";
            droparticletype.SelectedIndex = 0;
        }

    }
}