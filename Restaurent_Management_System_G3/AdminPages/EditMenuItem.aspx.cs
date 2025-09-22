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
    public partial class EditMenuItem : System.Web.UI.Page
    {
        string connStr = "server=DESKTOP-Q99B2TU\\SQLEXPRESS; database=RMS; integrated security=true";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategories();
                int menuId;
                if (int.TryParse(Request.QueryString["MenuItemId"], out menuId))
                {
                    LoadMenuItem(menuId);
                }
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

        private void LoadMenuItem(int menuId)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM MenuItems WHERE MenuItemId=@MenuItemId", conn);
                cmd.Parameters.AddWithValue("@MenuItemId", menuId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    hfMenuItemId.Value = menuId.ToString();
                    txtName.Text = reader["Name"].ToString();
                    txtDescription.Text = reader["Description"].ToString();
                    txtPrice.Text = reader["Price"].ToString();
                    chkAvailable.Checked = Convert.ToBoolean(reader["Available"]);
                    ddlCategory.SelectedValue = reader["CategoryId"].ToString();
                    imgPreview.ImageUrl = reader["ImageUrl"] == DBNull.Value ? "" : reader["ImageUrl"].ToString();
                }
                reader.Close();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                int menuId = Convert.ToInt32(hfMenuItemId.Value);
                string name = txtName.Text.Trim();
                string description = txtDescription.Text.Trim();
                decimal price = Convert.ToDecimal(txtPrice.Text);
                bool available = chkAvailable.Checked;
                int categoryId = Convert.ToInt32(ddlCategory.SelectedValue);
                string imageUrl = imgPreview.ImageUrl;

                if (fuImage.HasFile)
                {
                    string fileName = Path.GetFileName(fuImage.PostedFile.FileName);
                    string folderPath = Server.MapPath("~/images/menu/");
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }
                    fuImage.SaveAs(Path.Combine(folderPath, fileName));
                    imageUrl = "/images/menu/" + fileName;
                }

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"UPDATE MenuItems
                         SET Name=@Name, Description=@Description, Price=@Price,
                             Available=@Available, CategoryId=@CategoryId, ImageUrl=@ImageUrl
                         WHERE MenuItemId=@MenuItemId";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@Available", available);
                    cmd.Parameters.AddWithValue("@CategoryId", categoryId);
                    cmd.Parameters.AddWithValue("@ImageUrl", imageUrl);
                    cmd.Parameters.AddWithValue("@MenuItemId", menuId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                Response.Redirect("MenuManagement.aspx"); // Go back to admin menu page
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error saving changes: " + ex.Message;
            }

        }
    }
}