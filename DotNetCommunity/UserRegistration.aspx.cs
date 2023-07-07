using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace DotNetCommunity
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;
        private string GenerateID()
        {
            cmd = new SqlCommand("sp_loginid", conn);
            conn.Open();
            int loginid = (int)cmd.ExecuteScalar() +1;
            conn.Close();
            string id = Convert.ToString(loginid);
            return id;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
                lblloginid.Text= GenerateID();
            }

        }

        internal void clear()
        {
            lblloginid.Text = "";
            txtfullname.Text = "";
            txtuser.Text = "";
            txtpwd.Text = "";
            dropquestion.SelectedIndex=0 ;
            txtanswer.Text = "";
            lblloginid.Text = GenerateID();

        }
        internal void signupnewuser()
        {
            
            string login = lblloginid.Text;
            string name = txtfullname.Text;
            string uname = txtuser.Text;
            string password = txtpwd.Text;
            string question = dropquestion.SelectedItem.ToString();
            string answer = txtanswer.Text;
            cmd = new SqlCommand("insert into Login values(@loginid,@name,@uname,@password,@question,@answer,@status)", conn);
            cmd.Parameters.AddWithValue("@loginid", login);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@uname", uname);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@question", question);
            cmd.Parameters.AddWithValue("@answer", answer);
            cmd.Parameters.AddWithValue("@status", "pending");
            conn.Open();
            int i =cmd.ExecuteNonQuery();
            conn.Close();
            if (i == 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Signup", " swal('Registration failed!', 'Need proper credentials to register!', 'success')", true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Signup", " swal('Registration successfull!', 'Go to login page!', 'success')", true);
            }
            clear();
            
        }

        internal bool checkusername()
        {
            string uname = txtuser.Text;
            cmd = new SqlCommand("select count(*) from login where username=@uname", conn);
            cmd.Parameters.AddWithValue("@uname", uname);
            conn.Open();
            int i= (int)cmd.ExecuteScalar();
            conn.Close();
            if(i==1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void btnsingup_Click(object sender, EventArgs e)
        {
            if(checkusername())
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Signup", " swal('User already exists!', 'Try another user name!', 'warning')",true);
            }
            else if(txtfullname.Text==""||txtuser.Text==""||txtpwd.Text==""||txtanswer.Text==""||dropquestion.SelectedIndex==0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Signup", " swal('Registration Failed!', 'Need proper credentials to register!', 'error')", true);
            }
            else
            {
                signupnewuser();
            }

        }
    }
}