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
    public partial class ViewOrders : System.Web.UI.Page
    {
        string connStr = "server=DESKTOP-Q99B2TU\\SQLEXPRESS; database=RMS; integrated security=true";
        private readonly object waiterId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOrders();
            }
            if (Session["Role"] == null || Session["Role"].ToString() != "Waiter")
            {
                Response.Redirect("/Login.aspx");
            }

        }
        private void BindOrders()
        {
            int waiterId = Convert.ToInt32(Session["EmployeeId"]); // logged-in waiter ID
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT o.OrderId, o.CustomerName, o.TableNumber, o.OrderDate, o.TotalAmount, 
                                u.Username AS WaiterName
                                FROM Orders o
                                INNER JOIN Users u ON o.WaiterId = u.Id
                                WHERE o.WaiterId = @WaiterId
                                ORDER BY o.OrderDate DESC";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@WaiterId", waiterId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptOrders.DataSource = dt;
                rptOrders.DataBind();
            }
        }

        protected void rptOrders_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string orderId = DataBinder.Eval(e.Item.DataItem, "OrderId").ToString();

                Repeater rptOrderItems = (Repeater)e.Item.FindControl("rptOrderItems");

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"SELECT oi.Quantity, oi.Price, m.Name
                                     FROM OrderItems oi
                                     INNER JOIN MenuItems m ON oi.MenuItemId = m.MenuItemId
                                     WHERE oi.OrderId = @OrderId";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@OrderId", orderId);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptOrderItems.DataSource = dt;
                    rptOrderItems.DataBind();
                }
            }
        }
    }
}