using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetCommunity
{
    public partial class SearchArticles : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;
        string atype = "";

        void bindgrid()
        {
            cmd = new SqlCommand("SELECT a.articletype, a.articledesc, a.cdate, l.name FROM article a INNER JOIN login l ON a.loginid = l.loginid where a.ArticleType=@atype", conn);
            cmd.Parameters.AddWithValue("@atype", atype);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gridallarticles.DataSource = dt;
            gridallarticles.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void bindsearch()
        {
            string text = txtsearcharticle.Text;
            char l = text.Substring(0, 1)[0];
            text = l.ToString();
            string searchquery = "select a.articletype, a.articledesc, a.cdate, l.name from article a  inner join login l on l.loginid=a.loginid where a.articletype like @text+'%' or a.articletype like '%'+@text or a.articletype like '%'+@text+'%' ";
            cmd = new SqlCommand(searchquery, conn);
            cmd.Parameters.AddWithValue("@text", text);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                gridallarticles.DataSource = dr;
                gridallarticles.DataBind();
            }
            conn.Close();
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            string text = txtsearcharticle.Text;
            if (text.Length == 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Search", "swal('Please enter a search term.', '', 'warning')", true);
            }
            else
            {
                bindsearch();
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