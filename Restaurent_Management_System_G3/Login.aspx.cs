using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Restaurent_Management_System_G3.PublicPages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = TextBox1username.Text.Trim();
            string password = TextBox2password.Text.Trim();

            // Directly store your connection string here
            string connStr = "Server=DESKTOP-Q99B2TU\\SQLEXPRESS; Database=RMS; Integrated Security=True;";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                string query = "SELECT Id, Role FROM Users WHERE Username=@Username AND Password=@Password";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            int userId = Convert.ToInt32(reader["Id"]);
                            string role = reader["Role"].ToString();

                            Session["EmployeeId"] = userId; // store Id
                            Session["Username"] = username;
                            Session["Role"] = role;

                            if (role == "Admin")
                                Response.Redirect("~/AdminPages/Dashboard.aspx");
                            else if (role == "Waiter")
                                Response.Redirect("~/EmployeePages/TakeOrder.aspx");
                        }
                        else
                        {
                            lblMessage.Text = "Invalid username or password!";
                        }
                    }
                }
            }
        }
    }
}
