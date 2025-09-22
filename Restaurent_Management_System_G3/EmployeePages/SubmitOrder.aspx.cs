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
    public partial class SubmitOrder : System.Web.UI.Page
    {
        string connStr = "server=DESKTOP-Q99B2TU\\SQLEXPRESS; database=RMS; integrated security=true";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var selectedItems = (List<TakeOrder.SelectedMenuItem>)Session["SelectedItems"];
                if (selectedItems == null || !selectedItems.Any())
                {
                    lblMessage.Text = "No items selected. Please go back and add dishes.";
                    btnSubmitOrder.Enabled = false;
                    return;
                }

                rptOrderItems.DataSource = selectedItems;
                rptOrderItems.DataBind();

                decimal totalAmount = selectedItems.Sum(x => x.Quantity * x.Price);
                lblTotalAmount.Text = totalAmount.ToString("0.00");
            }
            if (Session["Role"] == null || Session["Role"].ToString() != "Waiter")
            {
                Response.Redirect("/Login.aspx");
            }
        }

        protected void btnSubmitOrder_Click(object sender, EventArgs e)
        {
            string customerName = txtCustomerName.Text.Trim();
            string tableNumber = txtTableNumber.Text.Trim();
            int waiterId = Convert.ToInt32(Session["EmployeeId"]); // Logged-in waiter
            var selectedItems = (List<TakeOrder.SelectedMenuItem>)Session["SelectedItems"];

            decimal totalAmount = selectedItems.Sum(x => x.Quantity * x.Price);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                SqlCommand cmdOrder = new SqlCommand(@"INSERT INTO Orders (WaiterId, CustomerName, TableNumber, TotalAmount) 
                                               VALUES (@WaiterId,@CustomerName,@TableNumber,@TotalAmount);
                                               SELECT SCOPE_IDENTITY();", conn);
                cmdOrder.Parameters.AddWithValue("@WaiterId", waiterId);
                cmdOrder.Parameters.AddWithValue("@CustomerName", customerName);
                cmdOrder.Parameters.AddWithValue("@TableNumber", tableNumber);
                cmdOrder.Parameters.AddWithValue("@TotalAmount", totalAmount);

                int orderId = Convert.ToInt32(cmdOrder.ExecuteScalar());

                foreach (var item in selectedItems)
                {
                    SqlCommand cmdItem = new SqlCommand(@"INSERT INTO OrderItems (OrderId, MenuItemId, Quantity, Price) 
                                                  VALUES (@OrderId,@MenuItemId,@Quantity,@Price)", conn);
                    cmdItem.Parameters.AddWithValue("@OrderId", orderId);
                    cmdItem.Parameters.AddWithValue("@MenuItemId", item.MenuItemId);
                    cmdItem.Parameters.AddWithValue("@Quantity", item.Quantity);
                    cmdItem.Parameters.AddWithValue("@Price", item.Price);
                    cmdItem.ExecuteNonQuery();
                }
            }

            // Clear session
            Session.Remove("SelectedItems");

            Response.Redirect("ViewOrders.aspx");

        }
    }
}