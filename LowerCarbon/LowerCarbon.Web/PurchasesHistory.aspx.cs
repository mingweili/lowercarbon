using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.Linq;
using ImagineCupDB;
using LowerCarbon.DBOp;

namespace LowerCarbon.Web
{
    public partial class PurchasesHistory : System.Web.UI.Page
    {
        string topSession;
        WebServices.topServices topServices1 = new WebServices.topServices();

        protected void Page_Load(object sender, EventArgs e)
        {
            topSession = Request.QueryString["top_session"];
            if (topSession != null)
            {
                if (((string)Session["refresh"]).Equals("0"))
                {
                    string tem = (string)Session["tid"];
                    //Label1.Text = tem;
                    //long a = long.Parse(tem);
                    Label1.Text = topServices1.confirmTid((string)Session["tid"], topSession, (string)Session["consumer_id"]);
                }
                else
                {
                    topServices1.refreshTid(topSession, (string)Session["consumer_id"]);
                }
  
            }


            IDBOp.context.Refresh(RefreshMode.KeepChanges);
            Table<PURCHASES_HISTORY> purchasesHistoryTable = IDBOp.context.GetTable<PURCHASES_HISTORY>();
            IEnumerable<PURCHASES_HISTORY> purchasesHistoryGot =
                (from temPurchasesHistory in purchasesHistoryTable
                 where temPurchasesHistory.CONSUMER_NO == (string)Session["consumer_id"]
                 select temPurchasesHistory);
            if (purchasesHistoryGot != null)
            {
                int index = 0;
                foreach (PURCHASES_HISTORY temPurchasesHistory in purchasesHistoryGot)
                {
                    //div
                    HtmlGenericControl itemDIV = new HtmlGenericControl("div");
                    itemDIV.ID = "item" + index;
                    itemDIV.Attributes.Add("class", "category");

                    //div中的img
                    Image img = new Image();
                    img.ID = "img" + index;
                    img.Width = 150;
                    img.Height = 120;
                    //img.ImageUrl = (String)table.Rows[index]["TreePictureAddr"];
                    if (temPurchasesHistory.GOODS_NO == "1c3585e5057a4943957a29cffdf1018c")
                    {
                        img.ImageUrl = "~/images/tree1.jpg";
                    }
                    else
                    {
                        img.ImageUrl = "~/images/Tshirt1.jpg";
                    }


                    //div中的文字描述
                    HtmlGenericControl contentDIV = new HtmlGenericControl("div");
                    contentDIV.Attributes.Add("class", "categorytxt");

                    //文字描述中的标题
                    // HtmlGenericControl titleDIV = new HtmlGenericControl("h2");
                    //titleDIV.InnerHtml = (String)temLoveTree.TREE_NO;

                    //文字描述中的正文
                    HtmlGenericControl desDIV = new HtmlGenericControl("p");
                    if (temPurchasesHistory.GOODS_NO == "1c3585e5057a4943957a29cffdf1018c")
                    {
                        desDIV.InnerHtml = "<br/>    商品名称： 低碳树<br/><br/>";
                    }
                    else
                    {
                        desDIV.InnerHtml = "<br/>    商品名称： 环保T恤<br/><br/>";
                    }
                    desDIV.InnerHtml += "    交易数量： " + temPurchasesHistory.CONSUMPTION.ToString() + "<br/><br/>";
                    if(temPurchasesHistory.TRANSACTIONS_STATE == 0)
                    {
                        desDIV.InnerHtml += "    交易状态: 暂未付款" +  "<br/><br/>";
                    }
                    else
                    {
                        desDIV.InnerHtml += "    交易状态: 已付款" + "<br/><br/>";
                    }
                    
                    desDIV.InnerHtml += "    交易时间： " + temPurchasesHistory.CONSUMER_TIME.ToString() + "<br/><br/>";
                    //desDIV.InnerHtml += "地点： " + temLoveTree.TREE_LOCATION + "<br/>";
                    //desDIV.InnerHtml += "状态： " + temLoveTree.TREE_STATE + "<br/>";
                    // desDIV.InnerHtml += "捐赠时间： " + temLoveTree.TREE_PURCHASES_TIME.ToString() + "<br/>";
                    // desDIV.InnerHtml += "种植时间： " + temLoveTree.TREE_PLANT_TIME.ToString() + "<br/>";

                    // contentDIV.Controls.Add(titleDIV);
                    contentDIV.Controls.Add(desDIV);

                    itemDIV.Controls.Add(img);
                    itemDIV.Controls.Add(contentDIV);

                    this.historyPanel.Controls.Add(itemDIV);
                    for (int i = 0; i < 5; ++i)
                        this.historyPanel.Controls.Add(new HtmlGenericControl("br"));

                    index++;
                }
                // tradeGridView.DataBind();
            }
        }

        protected void tidSubmit1_Click(object sender, EventArgs e)
        {

        }

        protected void ImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Session["refresh"] = "1";
            Response.Redirect("http://container.open.taobao.com/container?appkey=12177007&encode=utf-8");
        }
    }
}