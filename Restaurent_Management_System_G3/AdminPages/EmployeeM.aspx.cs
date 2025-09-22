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
    public partial class EmployeeM : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("server=DESKTOP-Q99B2TU\\SQLEXPRESS; database=RMS; integrated security=true");

        public void ClearData()
        {
            txtId.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtName.Text = "";
            txtEmail.Text = "";
            ddlRole.SelectedIndex = 0;
        }

        public void DisplayData()
        {
            string select = "SELECT Id, Name, Username, Email, Role FROM Users";
            SqlDataAdapter da = new SqlDataAdapter(select, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayData();
            }
            // Only Admin can access
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("/Login.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtUsername.Text == "" || txtPassword.Text == "" || ddlRole.SelectedValue == "")
                {
                    lblMessage.Text = "Please fill in all required fields.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    string ins = "INSERT INTO Users (Name, Username,  Email, Password, Role) VALUES (@Name, @Username,  @Email, @Password, @Role)";
                    SqlCommand cmd = new SqlCommand(ins, con);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);
                    
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    DisplayData();
                    ClearData();
                    lblMessage.Text = "Employee registered successfully.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string upd = "UPDATE Users SET Name=@Name, Username=@Username, Email=@Email, Password=@Password, Role=@Role WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(upd, con);
                cmd.Parameters.AddWithValue("@Id", txtId.Text);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);
                

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                
                DisplayData();
                ClearData();
                lblMessage.Text = "Employee updated successfully.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string del = "DELETE FROM Users WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(del, con);
                cmd.Parameters.AddWithValue("@Id", txtId.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                DisplayData();
                ClearData();
                lblMessage.Text = "Employee deleted successfully.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtId.Text = GridView1.SelectedRow.Cells[1].Text;
            txtUsername.Text = GridView1.SelectedRow.Cells[2].Text;
            txtName.Text = GridView1.SelectedRow.Cells[3].Text;
            txtEmail.Text = GridView1.SelectedRow.Cells[4].Text;
            ddlRole.SelectedValue = GridView1.SelectedRow.Cells[5].Text;
        }
    }
}