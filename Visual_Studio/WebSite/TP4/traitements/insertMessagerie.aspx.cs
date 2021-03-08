using System;
using TP4.@class;

namespace TP4
{
    public partial class InsertMessagerie : System.Web.UI.Page
    {
        private DataClasses1DataContext db = new DataClasses1DataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            string[] request1;
            string[] request2;

            string nom = Request["nom"].ToString();
            request1 = nom.Split('?');
            nom = request1[0];

            request2 = request1[1].Split('=');
            string tel = request2[1];

            request2 = request1[2].Split('=');
            string email = request2[1];

            request2 = request1[3].Split('=');
            string msg = request2[1];

            messagerie m = new messagerie {nom=nom,tel=tel,email=email,message=msg,answered=false };
            db.messageries.InsertOnSubmit(m);
            db.SubmitChanges();
            Response.Write("Message Received");
        }
    }
}