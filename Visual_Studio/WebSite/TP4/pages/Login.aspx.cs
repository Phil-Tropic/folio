using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using TP4.@class;

namespace TP4
{
    public partial class Login : System.Web.UI.Page
    {
        DataClasses1DataContext db = new DataClasses1DataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtboxUsername.Text;
            string password = txtboxPassword.Text;

            var res = from u in db.users
                      where u.username == username && u.password == password
                      select u;

            if (res.Count() > 0)
            {
                Session["admin"] = "OK";
                Response.Redirect("Admin.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid username or password')</script>");
                txtboxPassword.Text = "";
            }
        }
    }
}