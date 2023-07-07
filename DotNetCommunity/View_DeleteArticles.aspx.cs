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
    public partial class View_DeleteArticles : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlCommand cmd;
        
        void bindgrid()
        {
            cmd = new SqlCommand("select * from article a inner join login l on a.loginid=l.loginid", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gridarticles.DataSource = dt;
            gridarticles.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bindgrid();
            }

        }
        void sortaid(int aid)
        {
            cmd = new SqlCommand("update article set articleid=articleid-1 where articleid>@aid", conn);
            cmd.Parameters.AddWithValue("@aid", aid);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
         void deletearticle(int aid)
        {
            cmd = new SqlCommand("delete from article where articleid=@aid", conn);
            cmd.Parameters.AddWithValue("@aid", aid);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            sortaid(aid);
            bindgrid();
        }

        protected void gridarticles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="deleting")
            {
                int aid = Convert.ToInt32(e.CommandArgument.ToString());
                deletearticle(aid);
            }
        }
    }
}