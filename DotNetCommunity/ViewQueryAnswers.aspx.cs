using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Reflection;
using System.Data;

namespace DotNetCommunity
{
    public partial class ViewQueryAnswers : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;
        void bindgrid()
        {
            cmd = new SqlCommand("SELECT f.question, fr.reply, l.name FROM forums " +
                "f INNER JOIN forumreply fr " +
                "ON f.questionid = fr.questionid INNER JOIN login l ON fr.loginid = l.loginid", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gridallanswers.DataSource= dt;
            gridallanswers.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bindgrid();
            }
        }
    }
}