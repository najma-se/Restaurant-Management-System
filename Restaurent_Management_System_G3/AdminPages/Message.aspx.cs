using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Restaurent_Management_System_G3.AdminPages
{
    
    public partial class Message : System.Web.UI.Page
    {
        private string connStr = "Server=DESKTOP-Q99B2TU\\SQLEXPRESS; Database=RMS; Integrated Security=True;";
        private void LoadMessages()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                string select = "SELECT * FROM ContactMessages ORDER BY MessageId DESC";
                SqlDataAdapter da = new SqlDataAdapter(select, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Only Admin can access
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("../Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadMessages();
            }
        }

        protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if(e.CommandName == "MarkRead")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE ContactMessages SET Status='Read' WHERE MessageId=@MessageId", con);
                    cmd.Parameters.AddWithValue("@MessageId", id);
                    cmd.ExecuteNonQuery();
                }
                LoadMessages(); // Refresh the table
            }
        }
    }
}