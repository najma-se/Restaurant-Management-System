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
    public partial class Report : System.Web.UI.Page
    {
        string connStr = "server=DESKTOP-Q99B2TU\\SQLEXPRESS; database=RMS; integrated security=true";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDailySales();
                LoadMonthlySales();
                LoadTopItems();
                LoadWaiterPerformance();
            }
            // Only Admin can access
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("/Login.aspx");
            }
        }

        private void LoadDailySales()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT 
                        CONVERT(date, OrderDate) AS [Date],
                        COUNT(OrderId) AS [TotalOrders],
                        SUM(TotalAmount) AS [TotalAmount],
                        AVG(TotalAmount) AS [AverageOrderValue]
                    FROM Orders
                    GROUP BY CONVERT(date, OrderDate)
                    ORDER BY [Date] DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvDailySales.DataSource = dt;
                gvDailySales.DataBind();
            }
        }

        private void LoadMonthlySales()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT 
                        DATENAME(MONTH, MIN(OrderDate)) + ' ' + CAST(YEAR(OrderDate) AS NVARCHAR) AS [Month],
                        SUM(TotalAmount) AS [TotalSales],
                        COUNT(OrderId) AS [TotalOrders]
                    FROM Orders
                    GROUP BY YEAR(OrderDate), MONTH(OrderDate)
                    ORDER BY YEAR(OrderDate) DESC, MONTH(OrderDate) DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvMonthlySales.DataSource = dt;
                gvMonthlySales.DataBind();
            }
        }


        private void LoadTopItems()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT TOP 10 
                        M.Name AS [MenuItem],
                        SUM(OI.Quantity) AS [TotalQuantity],
                        SUM(OI.Quantity * OI.Price) AS [TotalRevenue]
                    FROM OrderItems OI
                    INNER JOIN MenuItems M ON OI.MenuItemId = M.MenuItemId
                    GROUP BY M.Name
                    ORDER BY [TotalRevenue] DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvTopItems.DataSource = dt;
                gvTopItems.DataBind();
            }
        }

        private void LoadWaiterPerformance()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT 
                        U.Name AS [Waiter],
                        COUNT(O.OrderId) AS [TotalOrders],
                        SUM(O.TotalAmount) AS [TotalRevenue]
                    FROM Orders O
                    INNER JOIN Users U ON O.WaiterId = U.Id
                    GROUP BY U.Name
                    ORDER BY [TotalRevenue] DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvWaiterPerformance.DataSource = dt;
                gvWaiterPerformance.DataBind();
            }
        }
    }
}
