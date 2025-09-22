using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Restaurent_Management_System_G3.PublicPages
{
    public partial class ContactPage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("server=DESKTOP-Q99B2TU\\SQLEXPRESS; database=RMS; integrated security=true");

        public void cleardata()
        {
            TextBoxMessage.Text = "";
            TextBoxName.Text = "";
            TextBoxEmail.Text = "";
            TextBoxWebsite.Text = "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBoxName.Text == "" || TextBoxEmail.Text == "" || TextBoxMessage.Text == "")
                {
                    LabelMessage.Text = "Please fill all required fields.";
                }
                else
                {
                    // Step two: Prepare insert command
                    string ins = "INSERT INTO ContactMessages (Name, Email, Website, Message) " +
                                 "VALUES ('" + TextBoxName.Text + "', '" + TextBoxEmail.Text + "', '" + TextBoxWebsite.Text + "', '" + TextBoxMessage.Text + "')";

                    SqlCommand cmd = new SqlCommand(ins, con);

                    // Open connection
                    con.Open();

                    // Execute the command
                    cmd.ExecuteNonQuery();

                    // Close connection
                    con.Close();

                    cleardata();
                    LabelMessage.Text = "Your message has been sent successfully!";
                    
                }
            }
            catch (Exception ex)
            {
                LabelMessage.Text = "There is an error: " + ex.Message;
            }
            finally
            {
                con.Close();
            }

        }
    }
}