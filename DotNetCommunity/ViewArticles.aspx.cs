using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetCommunity
{
    public partial class ViewArticles : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;

        void bindgrid()
        {
            cmd = new SqlCommand("SELECT a.articleid, a.articletype, a.articledesc, a.cdate, l.name FROM article a INNER JOIN login l ON a.loginid = l.loginid", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gridallarticles.DataSource = dt;
            gridallarticles.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bindgrid();
            }
        }

        protected void gridallarticles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "read")
            {
                // Get the article description from the CommandArgument of the button clicked
                string articleDesc = e.CommandArgument.ToString();

                // Store the article description in a session variable, so that it can be accessed on the ArticleView page
                Session["ArticleDesc"] = articleDesc;

                // Redirect to the ArticleView page
                Response.Redirect("ArticleView.aspx");
            }
        }
    }
}