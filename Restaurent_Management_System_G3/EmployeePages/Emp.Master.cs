using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Restaurent_Management_System_G3.EmployeePages
{
    public partial class Emp : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string currentPage = Request.Url.AbsolutePath.ToLower();

                HyperLink2.CssClass = currentPage.EndsWith("TakeOrders.aspx") ? "nav-link active" : "nav-link";
                HyperLink3.CssClass = currentPage.EndsWith("ViewOrders.aspx") ? "nav-link active" : "nav-link";
                
                lnkLogout.CssClass = currentPage.EndsWith("logout.aspx") ? "nav-link active" : "nav-link";


                string username = Session["Username"] != null ? Session["Username"].ToString() : "Guest";

                lblUsername.Text = username;
                lblUsernameMobile.Text = username;
            }
        }
    }
}