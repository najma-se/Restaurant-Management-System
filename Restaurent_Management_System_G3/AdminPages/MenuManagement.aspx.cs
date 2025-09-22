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
    public partial class MenuManagement : System.Web.UI.Page
    {
        string connStr = "server=DESKTOP-Q99B2TU\\SQLEXPRESS; database=RMS; integrated security=true";
        protected void Page_Load(object sender, EventArgs e)
        {
            // Runs only on first page load (not on button clicks, etc.)
            if (!IsPostBack)
            {
                BindCategoriesWithMenuItems();
            }
            // Only Admin can access
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("/Login.aspx");
            }
        }

        private void BindCategoriesWithMenuItems()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                // Get categories
                SqlCommand cmdCat = new SqlCommand("SELECT * FROM Categories ORDER BY CategoryId", conn);
                SqlDataAdapter daCat = new SqlDataAdapter(cmdCat);
                DataTable dtCategories = new DataTable();
                daCat.Fill(dtCategories);

                // Prepare list for repeater
                var categories = new List<CategoryWithMenu>();

                foreach (DataRow row in dtCategories.Rows)
                {
                    int catId = Convert.ToInt32(row["CategoryId"]);
                    string catName = row["Name"].ToString();
                    string catDesc = row["Description"].ToString();

                    // Get menu items for this category
                    SqlCommand cmdMenu = new SqlCommand("SELECT * FROM MenuItems WHERE CategoryId=@CategoryId", conn);
                    cmdMenu.Parameters.AddWithValue("@CategoryId", catId);
                    SqlDataAdapter daMenu = new SqlDataAdapter(cmdMenu);
                    DataTable dtMenu = new DataTable();
                    daMenu.Fill(dtMenu);

                    categories.Add(new CategoryWithMenu
                    {
                        CategoryName = catName,
                        Description = catDesc,
                        MenuItems = dtMenu
                    });
                }

                rptCategories.DataSource = categories;
                rptCategories.DataBind();
            }
        }

        public class CategoryWithMenu
        {
            public string CategoryName { get; set; }
            public string Description { get; set; }
            public DataTable MenuItems { get; set; }
        }

        protected void MenuItem_Command(object sender, CommandEventArgs e)
        {
            int menuId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditDish")
            {
                Response.Redirect("EditMenuItem.aspx?MenuItemId=" + menuId);
            }
            else if (e.CommandName == "DeleteDish")
            {
                DeleteMenuItem(menuId);
            }
            else if (e.CommandName == "ToggleAvailability")
            {
                ToggleAvailability(menuId);
            }

            BindCategoriesWithMenuItems(); // Refresh
        }

        private void DeleteMenuItem(int menuItemId)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM MenuItems WHERE MenuItemId=@MenuItemId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@MenuItemId", menuItemId);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void ToggleAvailability(int menuItemId)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE MenuItems SET Available = CASE WHEN Available = 1 THEN 0 ELSE 1 END WHERE MenuItemId=@MenuItemId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@MenuItemId", menuItemId);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void btnEdit_Command(object sender, CommandEventArgs e)
        {
            int menuId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditDish")
            {
                Response.Redirect("EditMenuItem.aspx?MenuItemId=" + menuId);
            }
            else if (e.CommandName == "DeleteDish")
            {
                DeleteMenuItem(menuId);
                BindCategoriesWithMenuItems();
            }
            else if (e.CommandName == "ToggleAvailability")
            {
                ToggleAvailability(menuId);
                BindCategoriesWithMenuItems();
            }
        }
       
    }
}