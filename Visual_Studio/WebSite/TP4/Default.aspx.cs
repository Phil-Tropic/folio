using System;
using System.Linq;
using TP4.@class;

namespace TP4
{
    public partial class Default : System.Web.UI.Page
    {
        public String img1;
        public String img2;
        public String img3;

        public string titre1, soustitre1, txt1, imgCard1;
        public string titre2, soustitre2, txt2, imgCard2;
        public string titre3, soustitre3, txt3, imgCard3;

        private DataClasses1DataContext db = new DataClasses1DataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

            var res = from info in db.cardInfos
                      select info;

            if (res.Count() > 0)
            {

                foreach (cardInfo element in res)
                {
                    if (element.cardPosition == 1)
                    {
                        titre1 = element.titre;
                        soustitre1 = element.soustitre;
                        txt1 = element.texte;
                        imgCard1 = element.imageUrl;
                    }
                    else if (element.cardPosition == 2)
                    {
                        titre2 = element.titre;
                        soustitre2 = element.soustitre;
                        txt2 = element.texte;
                        imgCard2 = element.imageUrl;
                    }
                    else if (element.cardPosition == 3)
                    {
                        titre3 = element.titre;
                        soustitre3 = element.soustitre;
                        txt3 = element.soustitre;
                        imgCard3 = element.imageUrl;
                    }
                    else
                    {
                        Console.WriteLine("Hello world");
                    }
                }

                var imgList = from image in db.images
                              where image.positionCarrousel != null
                              select image;

                if (imgList.Count() > 0)
                {
                    foreach (image img in imgList)
                    {
                        if (img.positionCarrousel == 1)
                        {
                            img1 = img.imgName;
                        }
                        else if (img.positionCarrousel == 2)
                        {
                            img2 = img.imgName;
                        }
                        else if (img.positionCarrousel == 3)
                        {
                            img3 = img.imgName;
                        }
                    }
                }
            }
        }
    }
}