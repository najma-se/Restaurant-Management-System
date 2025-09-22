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
    public partial class Orders : System.Web.UI.Page
    {
        string connStr = "server=DESKTOP-Q99B2TU\\SQLEXPRESS; database=RMS; integrated security=true";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
            // Only Admin can access
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("/Login.aspx");
            }
        }
        private void LoadOrders()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Get all orders along with waiter name
                string query = @"
                    SELECT o.OrderId, o.CustomerName, o.TableNumber, o.OrderDate, o.TotalAmount,
                           u.Name AS WaiterName
                    FROM Orders o
                    INNER JOIN Users u ON o.WaiterId = u.Id
                    ORDER BY o.OrderDate DESC";

                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dtOrders = new DataTable();
                da.Fill(dtOrders);

                // Prepare list for repeater with order items
                var ordersList = new List<OrderWithItems>();

                foreach (DataRow row in dtOrders.Rows)
                {
                    int orderId = Convert.ToInt32(row["OrderId"]);

                    // Get items for this order
                    SqlCommand cmdItems = new SqlCommand(@"
                        SELECT oi.Quantity, oi.Price, m.Name
                        FROM OrderItems oi
                        INNER JOIN MenuItems m ON oi.MenuItemId = m.MenuItemId
                        WHERE oi.OrderId = @OrderId", conn);
                    cmdItems.Parameters.AddWithValue("@OrderId", orderId);
                    SqlDataAdapter daItems = new SqlDataAdapter(cmdItems);
                    DataTable dtItems = new DataTable();
                    daItems.Fill(dtItems);

                    ordersList.Add(new OrderWithItems
                    {
                        OrderId = orderId,
                        CustomerName = row["CustomerName"].ToString(),
                        TableNumber = row["TableNumber"].ToString(),
                        OrderDate = Convert.ToDateTime(row["OrderDate"]),
                        TotalAmount = Convert.ToDecimal(row["TotalAmount"]),
                        WaiterName = row["WaiterName"].ToString(),
                        OrderItems = dtItems
                    });
                }

                rptOrders.DataSource = ordersList;
                rptOrders.DataBind();
            }
        }

        public class OrderWithItems
        {
            public int OrderId { get; set; }
            public string CustomerName { get; set; }
            public string TableNumber { get; set; }
            public DateTime OrderDate { get; set; }
            public decimal TotalAmount { get; set; }
            public string WaiterName { get; set; }
            public DataTable OrderItems { get; set; }
        }
    }
}