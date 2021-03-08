using System;
using System.Collections;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Expressions;
using TP4.@class;

namespace TP4
{
    public partial class Admin : System.Web.UI.Page
    {
        private DataClasses1DataContext db = new DataClasses1DataContext();

        ArrayList msgSend = new ArrayList();
        static int msgSend_index;

        protected String name { get; set; }
        protected String email { get; set; }
        protected String phone { get; set; }
        protected String msg { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {

                var res = from msg in db.messageries
                          where msg.answered == false
                          select msg;

                foreach (messagerie element in res)
                {
                    msgSend.Add(element);
                }

                if (res.Count() > 0)
                {
                    messagerie msg1 = (messagerie)msgSend[msgSend_index];
                    name = msg1.nom.ToString();
                    email = msg1.email.ToString();
                    phone = msg1.tel.ToString();
                    userMessage.Value = msg1.message.ToString();
                }


                if(!IsPostBack)
                {
                    fillGridViewImg();
                    fillGridViewVoy();
                }
            }
        }

        private void sendMail(String destinationEmail, String msgToSend)
        {


            String subject = "Reply to your query @safari.com";

            try
            {
                String mailsender = "PhilippeArcaini@teccart.online";
                String mailpw = " ******** ";

                SmtpClient smptclient = new SmtpClient("smtp.office365.com", 587);

                smptclient.EnableSsl = true;
                smptclient.Timeout = 1000000;
                smptclient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smptclient.UseDefaultCredentials = false;
                smptclient.Credentials = new NetworkCredential(mailsender, mailpw);

                MailMessage mailmsg = new MailMessage(mailsender, destinationEmail, subject, msgToSend);

                mailmsg.BodyEncoding = System.Text.UTF8Encoding.UTF8;

                smptclient.Send(mailmsg);


                messagerie msgUser = (messagerie)msgSend[msgSend_index];

                var msgtoUpdate = from msg in db.messageries
                                  where msg.Id == msgUser.Id
                                  select msg;

                foreach (messagerie msg in msgtoUpdate)
                {
                    msg.answered = true;
                }

                try { db.SubmitChanges(); }
                catch (Exception e) { Response.Write("<script>alert('echec de la mise a jour')</script>"); }

                Page.Response.Redirect(Page.Request.Url.ToString(), true);

            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }
        }

        protected void GridViewImg_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int position = 0;

            if (e.CommandName == "set1") { position = 1; }
            else if (e.CommandName == "set2") { position = 2; }
            else if (e.CommandName == "set3") { position = 3; }

            if (position != 0)
            {

                int rowIndex = Convert.ToInt32(e.CommandArgument);


                GridViewRow row = GridViewImg.Rows[rowIndex];

                //Fetch value of Name.
                string imgName = row.Cells[0].Text;


                if (updateImgCarrouselPosition(position, imgName))
                {
                    fillGridViewImg();
                }
                else
                {
                    Response.Write("<script>alert(echec de la mise a jour</script>");
                }
            }
        }
        private void fillGridViewImg()
        {
            var images = from image in db.images
                         select image;

            GridViewImg.DataSource = images;
            GridViewImg.DataBind();
        }
        private bool updateImgCarrouselPosition(int position, String nom)
        {


            try
            {
                var imgToNull = from img in db.images
                                where img.positionCarrousel == position
                                select img;

                if (imgToNull.Count() > 0)
                {
                    foreach (image img in imgToNull)
                    {
                        img.positionCarrousel = null;
                    }
                }
                var imgToSetPosition = from img in db.images
                                       where img.imgName == nom
                                       select img;

                if (imgToSetPosition.Count() > 0)
                {
                    foreach (image img in imgToSetPosition)
                    {
                        img.positionCarrousel = position;
                    }
                }

                db.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return false;
            }
        }


        protected void GridViewVoy_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int position = 0;

            if (e.CommandName == "Voy1") { position = 1; }
            else if (e.CommandName == "Voy2") { position = 2; }
            else if (e.CommandName == "Voy3") { position = 3; }

            if (position != 0)
            {

                int rowIndex = Convert.ToInt32(e.CommandArgument);

                GridViewRow row = GridViewVoy.Rows[rowIndex];

                int id = Convert.ToInt32(row.Cells[0].Text);


                if (updateVoyagePositionInCard(position, id))
                {
                    fillGridViewVoy();
                }
                else
                {
                    Response.Write("<script>alert(echec de la mise a jour</script>");
                }
            }
        }

        private bool updateVoyagePositionInCard(int position, int id)
        {

            try
            {
                var voyToNull = from voy in db.cardInfos
                                where voy.cardPosition == position
                                select voy;

                if (voyToNull.Count() > 0)
                {
                    foreach (cardInfo voy in voyToNull)
                    {
                        voy.cardPosition = null;
                    }
                }

                var voyToSetPosition = from voy in db.cardInfos
                                       where voy.Id == id
                                       select voy;

                if (voyToSetPosition.Count() > 0)
                {
                    foreach (cardInfo voy in voyToSetPosition)
                    {
                        voy.cardPosition = position;
                    }
                }

                db.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return false;
            }
        }
        private void fillGridViewVoy()
        {
            var cInfo = from info in db.cardInfos
                        select info;

            GridViewVoy.DataSource = cInfo;
            GridViewVoy.DataBind();
        }




        protected void btnNext_ServerClick(object sender, EventArgs e)
        {

            if(msgSend.Count > 0)
            {
                if (msgSend_index == msgSend.Count - 1)
                {
                    msgSend_index = 0;
                }
                else { msgSend_index = msgSend_index + 1; }

                messagerie msgNext = (messagerie)msgSend[msgSend_index];
                name = msgNext.nom.ToString();
                email = msgNext.email.ToString();
                phone = msgNext.tel.ToString();
                userMessage.Value = msgNext.message.ToString();
            }
        }
        protected void btnPrev_ServerClick(object sender, EventArgs e)
        {

            if (msgSend.Count > 0)
            {
                if (msgSend_index == 0) { msgSend_index = msgSend.Count; }
                msgSend_index = msgSend_index - 1;

                messagerie msgNext = (messagerie)msgSend[msgSend_index];
                name = msgNext.nom.ToString();
                email = msgNext.email.ToString();
                phone = msgNext.tel.ToString();
                userMessage.Value = msgNext.message.ToString();
            }

        }
        protected void btnSend_ServerClick(object sender, EventArgs e)
        {
            sendMail(email,inputRep.Value);
        }
        

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if ((btnFile.PostedFile != null) && (btnFile.PostedFile.ContentLength > 0))
            {
                string nomImg = System.IO.Path.GetFileName(btnFile.PostedFile.FileName);
                string SaveLocation = Server.MapPath("images") + "\\" + nomImg;

                image newimg = new image { imgName = nomImg.ToString(), url = "~/images/" + nomImg };
                db.images.InsertOnSubmit(newimg);
                db.SubmitChanges();

                try
                {
                    btnFile.PostedFile.SaveAs(SaveLocation);
                    Console.WriteLine("mise a jour des images réussi !");
                    fillGridViewImg();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("echec de la mise a jour de la bd");
                }
            }
        }
       
       

        protected void btnAddVoyage_ServerClick(object sender, EventArgs e)
        {


            if ((btnImgFile.PostedFile != null) && (btnImgFile.PostedFile.ContentLength > 0))
            {
                string nomImg = System.IO.Path.GetFileName(btnImgFile.PostedFile.FileName);
                string SaveLocation = Server.MapPath("images") + "\\" + nomImg;

                image newimg = new image { imgName = nomImg.ToString(), url = "~/images/" + nomImg };
                db.images.InsertOnSubmit(newimg);
                db.SubmitChanges();


                string titre = newtitre.Value;
                string soustitre = newsoustitre.Value;
                string texte = newtexte.Value;

                if(titre != null && soustitre != null && texte != null && nomImg != null)
                {
                    cardInfo voyage = new cardInfo { titre = titre, soustitre = soustitre,texte = texte, imageUrl = "./images/" + nomImg };
                    db.cardInfos.InsertOnSubmit(voyage);
                    db.SubmitChanges();

                    try
                    {
                        btnImgFile.PostedFile.SaveAs(SaveLocation);
                        Console.WriteLine("L'image a bien été ajouté !");
                        fillGridViewImg();
                        fillGridViewVoy();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Erreur lors de l'ajout de l'image à la BD");
                    }
                }


            }
        }
    }
}