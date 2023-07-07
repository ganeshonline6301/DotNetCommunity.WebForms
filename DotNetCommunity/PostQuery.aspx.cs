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
    public partial class PostQuery : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;
        int login;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"].Equals("user"))
            {
                string id = Session["lid"].ToString();
                login = Convert.ToInt32(id);
            }
            if(!IsPostBack)
            {
                lblquestionid.Text=GenerateID();
            }
        }
        private string GenerateID()
        {
            cmd = new SqlCommand("sp_questionid", conn);
            conn.Open();
            int qid = (int)cmd.ExecuteScalar() + 1;
            conn.Close();
            string id = Convert.ToString(qid);
            return id;
        }

        protected void btnpostquestion_Click(object sender, EventArgs e)
        {
            int qid = Convert.ToInt32(lblquestionid.Text);
            string question = txtquestion.Text;
            int id = login; 
            if(question.Length==0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Post Question", "swal('Write your query before posting!', '', 'error')", true);
            }
            else
            {
                cmd = new SqlCommand("insert into forums values(@qid,@question,@loginid)", conn);
                cmd.Parameters.AddWithValue("@qid", qid);
                cmd.Parameters.AddWithValue("@question", question);
                cmd.Parameters.AddWithValue("@loginid", id);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                clear();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Post Question", "swal('Done!', 'Question submitted.', 'success')", true);
            }
        }

        internal void clear()
        {
            lblquestionid.Text=GenerateID();
            txtquestion.Text = "";
        }
    }
}