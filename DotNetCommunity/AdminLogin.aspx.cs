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
    public partial class AdminLogin : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnadminlogin_Click(object sender, EventArgs e)
        {
            string uname = txtuser.Text;
            string password = txtpwd.Text;
            cmd = new SqlCommand("select * from admin where name=@uname and password=@password", conn);
            cmd.Parameters.AddWithValue("@uname", uname);
            cmd.Parameters.AddWithValue("@password", password);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    Session["fullname"] = dr.GetValue(0).ToString();
                    Session["role"] = "admin";
                }
                Response.Redirect("AdminHome.aspx");
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Login", " swal('Invalid credentials!', 'Please check your username and paswword!', 'error')", true);
            }
        }
    }
}