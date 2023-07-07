using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Reflection;

namespace DotNetCommunity
{
    public partial class ViewAllQueries : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;
        string selectedquestion = "";
        void bindgrid()
        {
            cmd = new SqlCommand("SELECT f.questionid, f.question, l.name FROM forums f INNER JOIN login l ON f.loginid = l.loginid", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Queries");
            gridallqueries.DataSource = ds.Tables["Queries"];
            gridallqueries.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindgrid();
            }
        }

        protected void gridallqueries_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "reply")
            {
                selectedquestion = e.CommandArgument.ToString();
                Session["question"] = selectedquestion;
                Response.Redirect("QueryReplies.aspx");
            }
            //if (e.CommandName == "reply")
            //{
            //    int index;
            //    if (!int.TryParse(e.CommandArgument.ToString(), out index))
            //    {
            //        return;
            //    }
            //    GridViewRow row = gridallqueries.Rows[index - 1];
            //    Label questionLabel = (Label)row.FindControl("lblquestion");
            //    selectedquestion = questionLabel.Text;
            //}
            //string question = selectedquestion;
            //cmd = new SqlCommand("select question from forums where question=@question", conn);
            //cmd.Parameters.AddWithValue("@question", question);
            //conn.Open();
            //SqlDataReader dr  = cmd.ExecuteReader();
            //if(dr.HasRows)
            //{
            //    while(dr.Read())
            //    {
            //        Session["question"] = selectedquestion;
            //    }
            //    Response.Redirect("QueryReplies.aspx");
            //}

        }
        
    }
}