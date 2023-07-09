using QRCoder;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CjQrcodegenerator
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label3.Visible = false;
            Button2.Visible = false;
            Image1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int flag = 0;
            if (TextBox1.Text == "")
            {
                Label3.Visible = true;
                Label3.Text = "This field is required";
                flag = 1;
            }

            if (flag == 0)
            {
                Label3.Visible = false;
                string maincolor = Request.Form["exampleColorInput1"];
                string backcolor = Request.Form["exampleColorInput2"];
                if (File1.HasFile)
                {
                    QRCodeGenerator qrGenerator = new QRCodeGenerator();
                    QRCodeData qrCodeData = qrGenerator.CreateQrCode(TextBox1.Text, QRCodeGenerator.ECCLevel.Q);
                    QRCode qrCode = new QRCode(qrCodeData);
                    Bitmap qrCodeImage = qrCode.GetGraphic(20, ColorTranslator.FromHtml(maincolor), ColorTranslator.FromHtml(backcolor), (Bitmap)Bitmap.FromStream(File1.FileContent));

                    using (MemoryStream ms = new MemoryStream())
                    {
                        qrCodeImage.Save(ms, ImageFormat.Png);
                        byte[] imageBytes = ms.ToArray();
                        string base64String = Convert.ToBase64String(imageBytes);
                        Image1.ImageUrl = "data:image/png;base64," + base64String;
                    }
                    Button2.Visible = true;
                    Image1.Visible = true;
                }
                else
                {
                    QRCodeGenerator qrGenerator = new QRCodeGenerator();
                    QRCodeData qrCodeData = qrGenerator.CreateQrCode(TextBox1.Text, QRCodeGenerator.ECCLevel.Q);
                    QRCode qrCode = new QRCode(qrCodeData);
                    Bitmap qrCodeImage = qrCode.GetGraphic(20, maincolor, backcolor);

                    using (MemoryStream ms = new MemoryStream())
                    {
                        qrCodeImage.Save(ms, ImageFormat.Png);
                        byte[] imageBytes = ms.ToArray();
                        string base64String = Convert.ToBase64String(imageBytes);
                        Image1.ImageUrl = "data:image/png;base64," + base64String;
                    }
                    Button2.Visible = true;
                    Image1.Visible = true;
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string base64Image = Image1.ImageUrl;

            // Remove the "data:image/png;base64," prefix if present
            if (base64Image.StartsWith("data:image/png;base64,"))
            {
                base64Image = base64Image.Replace("data:image/png;base64,", "");
            }


            byte[] imageBytes = Convert.FromBase64String(base64Image);

            Response.Clear();
            Response.ContentType = "image/png";
            Response.AddHeader("content-disposition", "attachment;filename=qrcode.png");
            Response.BinaryWrite(imageBytes);
            Response.End();
        }
    }
}