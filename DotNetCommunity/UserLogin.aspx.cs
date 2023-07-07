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
    public partial class UserLogin1 : System.Web.UI.Page
    {
        SqlConnection conn= new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void checkuser()
        {
            cmd = new SqlCommand("select status from login where username=@uname", conn);
            cmd.Parameters.AddWithValue("@uname",txtuser.Text);
            conn.Open();
            string check = (string)cmd.ExecuteScalar();
            conn.Close();
            if(check=="pending")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Login", " swal('Login Approval is pending!', 'Wait until admin approve your login!', 'warning')", true);
            }
            else
            {
                string uname = txtuser.Text;
                string password = txtpwd.Text;
                cmd = new SqlCommand("select * from login where username=@uname and password=@password", conn);
                cmd.Parameters.AddWithValue("@uname", uname);
                cmd.Parameters.AddWithValue("@password", password);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["username"] = dr.GetValue(2).ToString();
                        Session["lid"] = dr.GetValue(0).ToString();
                        Session["fullname"] = dr.GetValue(1).ToString();
                        Session["role"] = "user";
                        Session["status"] = dr.GetValue(6).ToString();
                    }
                    Response.Redirect("UserHome.aspx");
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Login", " swal('Invalid credentials!', 'Please check your username and paswword!', 'error')", true);
                }
                conn.Close();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            checkuser();
        }
    }
}