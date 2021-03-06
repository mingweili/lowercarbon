﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using LowerCarbon.DBOp.Operations;

namespace LowerCarbon.Web
{
	public partial class Rank : System.Web.UI.Page
	{
        private DataTable table = RankDBOperation.GetUserScoreRange();

		protected void Page_Load(object sender, EventArgs e)
		{
            //按照购买次数排名
            createListByTrade();

            //按照低碳环保指数排名
            createListByEnv();

		}

        private void createListByEnv()
        {
            DataView v = new DataView(table);
            v.Sort = "UserScore desc";

            int numShowed = v.Count > 30 ? 30 : v.Count;
            for (int index = 0; index < numShowed; ++index)
            {
                //div
                HtmlGenericControl itemDIV = new HtmlGenericControl("div");
                itemDIV.ID = "itemByEnv" + index;
                //itemDIV.Style[HtmlTextWriterStyle.PaddingBottom] = "120px";
                itemDIV.Style[HtmlTextWriterStyle.Height] = "120px";
                itemDIV.Style["border-bottom"] = "1px solid #2a5caa";
                itemDIV.Style[HtmlTextWriterStyle.BackgroundImage] = "images/item-back1.png";
                //itemDIV.Attributes.Add("class", "category");

                //div中的img
                HtmlGenericControl imgDIV = new HtmlGenericControl("div");
                imgDIV.Style["float"] = "left";
                imgDIV.Style[HtmlTextWriterStyle.MarginRight] = "10px";

                Image img = new Image();
                img.ID = "imgByEnv" + index;
                img.Width = 90;
                img.Height = 90;
                img.ImageUrl = "~/ImageHandler.ashx?from=userImage&id=" + (String)v[index]["UserID"];
                imgDIV.Controls.Add(img);

                //div中的文字描述
                HtmlGenericControl contentDIV = new HtmlGenericControl("div");
                //contentDIV.Attributes.Add("class", "categorytxt");
                //contentDIV.Style[HtmlTextWriterStyle.Width] = "200";
                //contentDIV.Style[HtmlTextWriterStyle.MarginLeft] = "0px";
                //contentDIV.Style[HtmlTextWriterStyle.FontSize] = "120%";
                //contentDIV.Style[HtmlTextWriterStyle.Position] = "relative";
                //contentDIV.Style[HtmlTextWriterStyle.Left] = "30px";

                //文字描述中的标题
                HtmlGenericControl titleDIV = new HtmlGenericControl("h2");
                titleDIV.InnerHtml = (index + 1).ToString() + "." + (String)v[index]["UserName"] + "<br/>" + "<br/>";

                //文字描述中的正文
                HtmlGenericControl desDIV = new HtmlGenericControl("p");
                desDIV.InnerHtml = "<div style='font-size:105%'><b>" + "环保积分： " + v[index]["UserScore"].ToString() + "</b></div>" + "<br/>";
                desDIV.InnerHtml += "活跃度： " + v[index]["UserTradeTimes"].ToString() + "<br/>";
                String sex = (String)v[index]["UserSex"] == "True" ? "男" : "女";
                desDIV.InnerHtml += "性别： " + sex + "<br/>";

                contentDIV.Controls.Add(titleDIV);
                contentDIV.Controls.Add(desDIV);

                itemDIV.Controls.Add(imgDIV);
                itemDIV.Controls.Add(contentDIV);

                this.userListByScore.Controls.Add(itemDIV);
                for (int i = 0; i < 2; ++i)
                    this.userListByScore.Controls.Add(new HtmlGenericControl("br"));
            }
        }

        private void createListByTrade()
        {
            DataTable table = RankDBOperation.GetUserScoreRange();

            int numShowed = table.Rows.Count > 30 ? 30 : table.Rows.Count;
            for (int index = 0; index < numShowed; ++index)
            {
                //div
                HtmlGenericControl itemDIV = new HtmlGenericControl("div");
                itemDIV.ID = "itemByEnv" + index;
                //itemDIV.Style[HtmlTextWriterStyle.PaddingBottom] = "120px";
                itemDIV.Style[HtmlTextWriterStyle.Height] = "120px";
                itemDIV.Style["border-bottom"] = "1px solid #2a5caa";
                itemDIV.Style[HtmlTextWriterStyle.BackgroundImage] = "images/item-back1.png";
                //itemDIV.Attributes.Add("class", "category");

                //div中的img
                HtmlGenericControl imgDIV = new HtmlGenericControl("div");
                imgDIV.Style["float"] = "left";
                imgDIV.Style[HtmlTextWriterStyle.MarginRight] = "10px";

                Image img = new Image();
                img.ID = "imgByEnv" + index;
                img.Width = 90;
                img.Height = 90;
                img.ImageUrl = "~/ImageHandler.ashx?from=userImage&id=" + (String)table.Rows[index]["UserID"];
                imgDIV.Controls.Add(img);

                //div中的文字描述
                HtmlGenericControl contentDIV = new HtmlGenericControl("div");
                //contentDIV.Attributes.Add("class", "categorytxt");
                //contentDIV.Style[HtmlTextWriterStyle.Width] = "200";
                //contentDIV.Style[HtmlTextWriterStyle.MarginLeft] = "0px";
                //contentDIV.Style[HtmlTextWriterStyle.FontSize] = "120%";
                //contentDIV.Style[HtmlTextWriterStyle.Position] = "relative";
                //contentDIV.Style[HtmlTextWriterStyle.Left] = "30px";

                //文字描述中的标题
                HtmlGenericControl titleDIV = new HtmlGenericControl("h2");
                titleDIV.InnerHtml = (index + 1).ToString() + "." + (String)table.Rows[index]["UserName"] + "<br/>" + "<br/>";

                //文字描述中的正文
                HtmlGenericControl desDIV = new HtmlGenericControl("p");
                desDIV.InnerHtml = "<div style='font-size:105%'><b>" + "活跃度： " + table.Rows[index]["UserTradeTimes"].ToString() + "</b></div>" + "<br/>";
                desDIV.InnerHtml += "环保积分： " + table.Rows[index]["UserScore"].ToString() + "<br/>";
                String sex = (String)table.Rows[index]["UserSex"] == "True" ? "男" : "女";
                desDIV.InnerHtml += "性别： " + sex + "<br/>";

                contentDIV.Controls.Add(titleDIV);
                contentDIV.Controls.Add(desDIV);

                itemDIV.Controls.Add(imgDIV);
                itemDIV.Controls.Add(contentDIV);

                this.userListByTrade.Controls.Add(itemDIV);
                for (int i = 0; i < 2; ++i)
                    this.userListByTrade.Controls.Add(new HtmlGenericControl("br"));
            }
        }
	}
}