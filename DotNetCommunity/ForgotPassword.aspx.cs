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
    public partial class ForgotPassword : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btngetpassword_Click(object sender, EventArgs e)
        {
            string uname = txtuser.Text;
            string question = dropquestion.SelectedItem.ToString();
            string answer = txtanswer.Text;
            cmd = new SqlCommand("select password from login where username=@uname and secquestion=@question and answer=@answer", conn);
            cmd.Parameters.AddWithValue("@uname", uname);
            cmd.Parameters.AddWithValue("@question", question);
            cmd.Parameters.AddWithValue("@answer", answer);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string password = dr["password"].ToString();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Get Password", "swal('Your password is...', '" + password + "', 'info')", true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Get Password", "swal('Invalid credentials!', 'Your credentials does not match.', 'error')", true);
            }
            conn.Close();


        }
    }
}