using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Linq;
using ImagineCupDB;
using LowerCarbon.DBOp;


namespace LowerCarbon.Web
{
    public partial class Personal : System.Web.UI.Page
    {
        Table<CONSUMER> consumerTable;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                tidSubmit1.Attributes.Add("OnClick", "return openTaobao();");
                tidSubmit2.Attributes.Add("OnClick", "return openTaobao();");
            }

            IDBOp.context.Refresh(RefreshMode.KeepChanges);
            consumerTable = IDBOp.context.GetTable<CONSUMER>();
            CONSUMER currentConsumer =
               (from temConsumer in consumerTable
                where temConsumer.CONSUMER_NO == (string)Session["consumer_id"]
                select temConsumer).First();


            consumerName.Text = currentConsumer.CONSUMER_NAME;
            consumerEmail.Text = currentConsumer.CONSUMER_MAIL_BOX;
            registrationTime.Text = currentConsumer.REGISTER_TIME.ToString("D");
        }

        protected void tidSubmit1_Click(object sender, EventArgs e)
        {
            Session["tid"] = tidTextBox1.Text.Trim();
            Session["refresh"] = "0";
            //string 
        }

        protected void tidSubmit2_Click(object sender, EventArgs e)
        {
            Session["tid"] = tidTextBox2.Text.Trim();
            Session["refresh"] = "0";
        }

        protected void YesButton_Click(object sender, EventArgs e)
        {
            IDBOp.context.Refresh(RefreshMode.KeepChanges);
            consumerTable = IDBOp.context.GetTable<CONSUMER>();
            CONSUMER currentConsumer =
               (from temConsumer in consumerTable
                where temConsumer.CONSUMER_NO == (string)Session["consumer_id"]
                select temConsumer).First();
            currentConsumer.CONSUMER_PASSWD = TextBox1.Text;
            IDBOp.context.SubmitChanges();
        }

        protected void YesButton1_Click(object sender, EventArgs e)
        {
            IDBOp.context.Refresh(RefreshMode.KeepChanges);
            consumerTable = IDBOp.context.GetTable<CONSUMER>();
            CONSUMER currentConsumer =
               (from temConsumer in consumerTable
                where temConsumer.CONSUMER_NO == (string)Session["consumer_id"]
                select temConsumer).First();
            currentConsumer.CONSUMER_MAIL_BOX = TextBox3.Text;
            IDBOp.context.SubmitChanges();
        }

    }
}