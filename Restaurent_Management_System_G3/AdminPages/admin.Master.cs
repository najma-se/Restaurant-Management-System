using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Restaurent_Management_System_G3.AdminPages
{
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string currentPage = Request.Url.AbsolutePath.ToLower();

                lnkDashboard.CssClass = currentPage.EndsWith("dashboard.aspx") ? "nav-link active" : "nav-link";
                lnkEmployees.CssClass = currentPage.EndsWith("employees.aspx") ? "nav-link active" : "nav-link";
                lnkMenu.CssClass = currentPage.EndsWith("menuitems.aspx") ? "nav-link active" : "nav-link";
                lnkOrders.CssClass = currentPage.EndsWith("orders.aspx") ? "nav-link active" : "nav-link";
                lnkMessages.CssClass = currentPage.EndsWith("message.aspx") ? "nav-link active" : "nav-link";
                lnkReports.CssClass = currentPage.EndsWith("reports.aspx") ? "nav-link active" : "nav-link";
                lnkLogout.CssClass = currentPage.EndsWith("logout.aspx") ? "nav-link active" : "nav-link";


                string username = Session["Username"] != null ? Session["Username"].ToString() : "Guest";

                lblUsername.Text = username;
                lblUsernameMobile.Text = username;
            }

            
        }
    }
}