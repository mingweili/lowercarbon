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
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IDBOp.context.Refresh(RefreshMode.KeepChanges);
            Table<LOVE_TREE> loveTreeTable = IDBOp.context.GetTable<LOVE_TREE>();

            IEnumerable<LOVE_TREE> loveTreeGot =
                (from temLoveTree in loveTreeTable
                 where (temLoveTree.CONSUMER_NO == (string)Session["consumer_id"] && temLoveTree.TREE_STATE == 1)
                 select temLoveTree);

            foreach (LOVE_TREE temLoveTree in loveTreeGot)
            {
                int index = 0;
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
                if (temLoveTree.TREE_PIC == null)
                {
                    img.ImageUrl = "~/images/tree1.jpg";
                }
                else
                {
                    img.ImageUrl = "~/ImageHandler.ashx?from=userImage&id=" + temLoveTree.TREE_NO;
                }
                

                //div中的文字描述
                HtmlGenericControl contentDIV = new HtmlGenericControl("div");
                contentDIV.Attributes.Add("class", "categorytxt");

                //文字描述中的标题
                // HtmlGenericControl titleDIV = new HtmlGenericControl("h2");
                //titleDIV.InnerHtml = (String)temLoveTree.TREE_NO;

                //文字描述中的正文
                HtmlGenericControl desDIV = new HtmlGenericControl("p");
                desDIV.InnerHtml = "个性签名： " + temLoveTree.TREE_SLOGAN + "<br/><br/>";
                desDIV.InnerHtml += "树龄： " + temLoveTree.TREE_AGE.ToString() + "<br/><br/>";
                desDIV.InnerHtml += "地点： " + temLoveTree.TREE_LOCATION + "<br/><br/>";
                desDIV.InnerHtml += "状态： " + temLoveTree.TREE_STATE + "<br/><br/>";
                desDIV.InnerHtml += "捐赠时间： " + temLoveTree.TREE_PURCHASES_TIME.ToString() + "<br/><br/>";
                desDIV.InnerHtml += "种植时间： " + temLoveTree.TREE_PLANT_TIME.ToString() + "<br/><br/>";

                // contentDIV.Controls.Add(titleDIV);
                contentDIV.Controls.Add(desDIV);

                itemDIV.Controls.Add(img);
                itemDIV.Controls.Add(contentDIV);

                this.feedbackPanel.Controls.Add(itemDIV);
                for (int i = 0; i < 5; ++i)
                    this.feedbackPanel.Controls.Add(new HtmlGenericControl("br"));

                index++;
            }
        }

        protected void tidSubmit1_Click(object sender, EventArgs e)
        {

        }
    }
}
