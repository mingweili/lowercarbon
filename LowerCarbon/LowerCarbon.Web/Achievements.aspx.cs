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
	public partial class Achievements : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            DataTable table = RankDBOperation.GetFeedbackRange();

            int treeQuantity = table.Rows.Count;

            HtmlGenericControl num0DIV = new HtmlGenericControl("div");
            num0DIV.Style[HtmlTextWriterStyle.FontSize] = "200%";
            num0DIV.Style[HtmlTextWriterStyle.FontWeight] = "700";
            num0DIV.Style[HtmlTextWriterStyle.Color] = "Olive";
            num0DIV.Style["float"] = "left";
            num0DIV.InnerHtml = treeQuantity.ToString();

            HtmlGenericControl num1DIV = new HtmlGenericControl("div");
            num1DIV.Style[HtmlTextWriterStyle.FontSize] = "200%";
            num1DIV.Style[HtmlTextWriterStyle.FontWeight] = "700";
            num1DIV.Style[HtmlTextWriterStyle.Color] = "Olive";
            num1DIV.Style["float"] = "left";
            num1DIV.InnerHtml = (5.023 * treeQuantity).ToString() + "KG 二氧化碳, ";

            HtmlGenericControl num2DIV = new HtmlGenericControl("div");
            num2DIV.Style[HtmlTextWriterStyle.FontSize] = "200%";
            num2DIV.Style[HtmlTextWriterStyle.FontWeight] = "700";
            num2DIV.Style[HtmlTextWriterStyle.Color] = "Olive";
            num2DIV.Style["float"] = "left";
            num2DIV.InnerHtml = (3.653 * treeQuantity).ToString() + "KG 氧气。";

            HtmlGenericControl l1 = new HtmlGenericControl("div");
            l1.Style[HtmlTextWriterStyle.FontSize] = "150%";
            l1.Style[HtmlTextWriterStyle.FontWeight] = "700";
            l1.Style["float"] = "left";
            l1.InnerHtml = "共获赠 ";

            HtmlGenericControl l2 = new HtmlGenericControl("div");
            l2.Style[HtmlTextWriterStyle.FontSize] = "150%";
            l2.Style[HtmlTextWriterStyle.FontWeight] = "700";
            l2.Style["float"] = "left";
            l2.InnerHtml = " 棵树，每天吸收 ";

            HtmlGenericControl l3 = new HtmlGenericControl("div");
            l3.Style[HtmlTextWriterStyle.FontSize] = "150%";
            l3.Style[HtmlTextWriterStyle.FontWeight] = "700";
            l3.Style["float"] = "left";
            l3.InnerHtml = "制造 ";

            this.achieDIV.Controls.Add(l1);
            this.achieDIV.Controls.Add(num0DIV);
            this.achieDIV.Controls.Add(l2);
            this.achieDIV.Controls.Add(num1DIV);
            this.achieDIV.Controls.Add(l3);
            this.achieDIV.Controls.Add(num2DIV);

            int numShowed = treeQuantity > 30 ? 30 : treeQuantity;

            for (int index = 0; index < numShowed; ++index)
            {
                //div
                HtmlGenericControl itemDIV = new HtmlGenericControl("div");
                itemDIV.ID = "item" + index;

                //itemDIV.Attributes.Add("class", "category");
                itemDIV.Style[HtmlTextWriterStyle.Height] = "120px";
                itemDIV.Style[HtmlTextWriterStyle.PaddingLeft] = "20px";
                //itemDIV.Style[HtmlTextWriterStyle.PaddingTop] = "20px";
                itemDIV.Style[HtmlTextWriterStyle.MarginLeft] = "auto";
                itemDIV.Style[HtmlTextWriterStyle.MarginRight] = "auto";
                itemDIV.Style[HtmlTextWriterStyle.Width] = "800px";
                itemDIV.Style[HtmlTextWriterStyle.BackgroundImage] = "images/item-back.png";

                //div中的img

                Image img = new Image();
                img.ID = "img" + index;
                img.Width = 90;
                img.Height = 90;
                img.Style["float"] = "left";
                String s = (String)table.Rows[index]["TreeID"];
                img.ImageUrl = "~/ImageHandler.ashx?from=loveTree&id=" + (String)table.Rows[index]["TreeID"];

                //div中的文字描述
                HtmlGenericControl contentDIV = new HtmlGenericControl("div");
                contentDIV.Attributes.Add("class", "categorytxt");

                //文字描述中的标题
                HtmlGenericControl titleDIV = new HtmlGenericControl("h2");
                titleDIV.InnerHtml = (String)table.Rows[index]["ConsumerName"];

                //文字描述中的正文
                HtmlGenericControl desDIV = new HtmlGenericControl("p");

                desDIV.InnerHtml = "个性签名： " + table.Rows[index]["TreeSignature"] + "<br/>";
                desDIV.InnerHtml += "树龄： " + table.Rows[index]["TreeAge"].ToString() + "岁" + "<br/>";
                desDIV.InnerHtml += "地点： " + (String)table.Rows[index]["TreeLocation"] + "<br/>";

                String state = String.Empty;
                switch ((Int16)table.Rows[index]["TreeState"])
                {
                    case 0 :
                        state = "长势良好";
                        break;
                    case 1 :
                        state = "无人照料";
                        break;
                    case 2:
                        state = "枯萎缺水";
                        break;
                    case 3:
                        state = "死亡";
                        break;
                    default :
                        state = "长势良好";
                        break;
                }
                desDIV.InnerHtml += "长势： " + state + "<br/>";
                
                //更改日期格式
                DateTime dt = DateTime.Parse((String)table.Rows[index]["TreePurchasesTime"]);
                String date = dt.Date.ToShortDateString();
                desDIV.InnerHtml += "捐赠时间： " + date + "<br/>";
                dt = DateTime.Parse((String)table.Rows[index]["TreePlantTime"]);
                date = dt.Date.ToShortDateString();
                desDIV.InnerHtml += "种植时间： " + date + "<br/>";

                contentDIV.Controls.Add(titleDIV);
                contentDIV.Controls.Add(desDIV);

                itemDIV.Controls.Add(img);
                itemDIV.Controls.Add(contentDIV);

                this.categoryPanel.Controls.Add(itemDIV);
                for (int i = 0; i < 2; ++i)
                    this.categoryPanel.Controls.Add(new HtmlGenericControl("br"));
            }

		}
	}
}