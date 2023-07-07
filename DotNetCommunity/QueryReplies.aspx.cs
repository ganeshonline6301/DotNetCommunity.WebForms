using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DotNetCommunity
{
    public partial class QueryReplies : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                lblquestion.Text = Session["question"].ToString();
            }

        }
        int replyid()
        {
            cmd = new SqlCommand("select count(*) from forumreply", conn);
            conn.Open();
            int i = (int)cmd.ExecuteScalar();
            conn.Close();
            return i+1;
        }
        int questionid()
        {
            string question = lblquestion.Text;
            cmd = new SqlCommand("select questionid from forums where question=@question", conn);
            cmd.Parameters.AddWithValue("@question", question);
            conn.Open();
            int i = (int)cmd.ExecuteScalar();
            conn.Close();
            return i;
        }

        protected void btnreplysubmit_Click(object sender, EventArgs e)
        {
            int rid = replyid();
            int qid = questionid();
            int lid = Convert.ToInt32(Session["lid"]);
            string answer = txtanswer.Text;
            cmd = new SqlCommand("insert into forumreply values(@rid,@qid,@answer,@lid)", conn);
            cmd.Parameters.AddWithValue("@rid", rid);
            cmd.Parameters.AddWithValue("@qid", qid);
            cmd.Parameters.AddWithValue("@answer", answer);
            cmd.Parameters.AddWithValue("@lid", lid);
            conn.Open();
            int i = cmd.ExecuteNonQuery();
            conn.Close();
            if(i==1)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Post Reply", " swal('Done!', 'Reply submitted.', 'success')", true);
            }
        }
    }
}