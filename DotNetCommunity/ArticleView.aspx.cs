using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetCommunity
{
    public partial class ArticleView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                lblarticle.Text = (string)Session["ArticleDesc"];
            }

        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Session["ArticleDesc"] = "";
            Response.Redirect("SearchArticles.aspx");
        }

        protected void btnbackview_Click(object sender, EventArgs e)
        {
            Session["ArticleDesc"] = "";
            Response.Redirect("ViewArticles.aspx");
        }
    }
}