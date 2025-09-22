using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Restaurent_Management_System_G3.EmployeePages
{
    public partial class TakeOrder : System.Web.UI.Page
    {
        string connStr = "server=DESKTOP-Q99B2TU\\SQLEXPRESS; database=RMS; integrated security=true";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategoriesWithMenuItems();
            }
            if (Session["Role"] == null || Session["Role"].ToString() != "Waiter")
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

                var categories = new List<CategoryWithMenu>();

                foreach (DataRow row in dtCategories.Rows)
                {
                    int catId = Convert.ToInt32(row["CategoryId"]);
                    string catName = row["Name"].ToString();
                    string catDesc = row["Description"].ToString();

                    // Get menu items in this category (only available ones)
                    SqlCommand cmdMenu = new SqlCommand(
                        "SELECT MenuItemId, Name, Description, Price, ImageUrl, Available " +
                        "FROM MenuItems WHERE CategoryId=@CategoryId AND Available=1", conn);
                    cmdMenu.Parameters.AddWithValue("@CategoryId", catId);

                    SqlDataAdapter daMenu = new SqlDataAdapter(cmdMenu);
                    DataTable dtMenu = new DataTable();
                    daMenu.Fill(dtMenu);

                    if (dtMenu.Rows.Count > 0) // Only add if category has available dishes
                    {
                        categories.Add(new CategoryWithMenu
                        {
                            CategoryName = catName,
                            Description = catDesc,
                            MenuItems = dtMenu
                        });
                    }
                }

                rptCategories.DataSource = categories;
                rptCategories.DataBind();
            }
        }


        protected void btnNext_Click(object sender, EventArgs e)
        {
            var selectedItems = new List<SelectedMenuItem>();

            foreach (RepeaterItem catItem in rptCategories.Items)
            {
                Repeater rptMenuItems = (Repeater)catItem.FindControl("rptMenuItems");

                foreach (RepeaterItem menuItem in rptMenuItems.Items)
                {
                    HiddenField hdnMenuId = (HiddenField)menuItem.FindControl("hdnMenuId");
                    Label lblName = (Label)menuItem.FindControl("lblName");
                    HiddenField hdnPrice = (HiddenField)menuItem.FindControl("hdnPrice");
                    TextBox txtQty = (TextBox)menuItem.FindControl("txtQuantity");

                    int qty;
                    if (txtQty != null && int.TryParse(txtQty.Text, out qty) && qty > 0)
                    {
                        selectedItems.Add(new SelectedMenuItem
                        {
                            MenuItemId = Convert.ToInt32(hdnMenuId.Value),
                            Name = lblName.Text,
                            Quantity = qty,
                            Price = Convert.ToDecimal(hdnPrice.Value)
                        });
                    }
                }
            }

            if (selectedItems.Count == 0)
            {
                lblMessage.Text = "Please select at least one menu item.";
                return;
            }

            Session["SelectedItems"] = selectedItems;
            Response.Redirect("SubmitOrder.aspx");
        }
        // Helper class
        // Helper classes
        public class CategoryWithMenu
        {
            public string CategoryName { get; set; }
            public string Description { get; set; }
            public DataTable MenuItems { get; set; }
        }

        public class SelectedMenuItem
        {
            public int MenuItemId { get; set; }
            public string Name { get; set; }
            public int Quantity { get; set; }
            public decimal Price { get; set; }
        }
    }
}