using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Restaurent_Management_System_G3.AdminPages
{
    public partial class AddMenuItem : System.Web.UI.Page
    {
        string connStr = "server=DESKTOP-Q99B2TU\\SQLEXPRESS; database=RMS; integrated security=true";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategories();
            }
            // Only Admin can access
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("/Login.aspx");
            }
        }

        private void BindCategories()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT CategoryId, Name FROM Categories", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlCategory.DataSource = dt;
                ddlCategory.DataTextField = "Name";
                ddlCategory.DataValueField = "CategoryId";
                ddlCategory.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string name = txtName.Text.Trim();
                string description = txtDescription.Text.Trim();
                decimal price;
                if (!decimal.TryParse(txtPrice.Text, out price))
                {
                    lblMessage.Text = "Invalid price format.";
                    return;
                }
                int categoryId = Convert.ToInt32(ddlCategory.SelectedValue);
                bool available = chkAvailable.Checked;

                string imageUrl = null;
                if (fuImage.HasFile)
                {
                    string folderPath = Server.MapPath("~/images/menu/");
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    string fileName = Path.GetFileName(fuImage.PostedFile.FileName);
                    fuImage.SaveAs(Path.Combine(folderPath, fileName));
                    imageUrl = "/images/menu/" + fileName;
                }

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"INSERT INTO MenuItems (Name, Description, Price, CategoryId, Available, ImageUrl)
                                 VALUES (@Name, @Description, @Price, @CategoryId, @Available, @ImageUrl)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@CategoryId", categoryId);
                    cmd.Parameters.AddWithValue("@Available", available);
                    cmd.Parameters.AddWithValue("@ImageUrl", (object)imageUrl ?? DBNull.Value);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                Response.Redirect("MenuManagement.aspx");
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error adding menu item: " + ex.Message;
            }
        }
    
    }
}