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
    public partial class QueryList : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;

        void bindgrid()
        {
            cmd = new SqlCommand("select * from forums f inner join login  l on f.loginid=l.loginid", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gridqueries.DataSource = dt;
            gridqueries.DataBind();
        }

        void sortqid(int qid)
        {
            cmd = new SqlCommand("update forums set questionid=questionid-1 where questionid>@qid", conn);
            cmd.Parameters.AddWithValue("@qid", qid);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        void allanswers(int qid)
        {
            cmd = new SqlCommand("delete from forumreply where questionid=@qid", conn);
            cmd.Parameters.AddWithValue("@qid", qid);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        void deletequestion(int qid)
        {
            allanswers(qid);
            cmd = new SqlCommand("delete from forums where questionid=@qid", conn);
            cmd.Parameters.AddWithValue("@qid", qid);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            sortqid(qid);
            bindgrid();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bindgrid();
            }
        }

        protected void gridqueries_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName =="deleting")
            {
                int qid = Convert.ToInt32(e.CommandArgument.ToString());
                {
                    deletequestion(qid);
                }
            }
        }
    }
}