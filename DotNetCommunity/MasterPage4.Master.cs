using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetCommunity
{
    public partial class MasterPage41 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkLogout_Click(object sender, EventArgs e)
        {
            Session["fullname"] = "";
            Session["role"] = "";
            Response.Redirect("HomePage.aspx");
        }
    }
}