using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Diagnostics;

namespace DotNetCommunity
{
    public partial class UsersList : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;

        void bindgrid()
        {
            cmd = new SqlCommand("select * from login", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gridusers.DataSource = dt;
            gridusers.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bindgrid();
            }
        }

        protected void gridusers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "block" || e.CommandName == "approve")
            {
                int loginid = Convert.ToInt32(e.CommandArgument);
                string newStatus;
                if (e.CommandName == "block")
                {
                    newStatus = "pending";
                }
                else
                {
                    newStatus = "approved";
                }

                conn.Open();
                cmd = new SqlCommand("update login set status=@status where loginid=@loginid", conn);
                cmd.Parameters.AddWithValue("@status", newStatus);
                cmd.Parameters.AddWithValue("@loginid", loginid);
                cmd.ExecuteNonQuery();
                conn.Close();
                bindgrid();
            }
        }
    }
}