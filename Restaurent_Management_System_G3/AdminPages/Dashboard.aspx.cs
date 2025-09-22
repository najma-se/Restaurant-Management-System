using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

namespace Restaurent_Management_System_G3.AdminPages
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only Admin can access
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("/Login.aspx");
            }
        }

    }
}