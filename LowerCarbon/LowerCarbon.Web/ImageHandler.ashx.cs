using System;
using System.Collections.Generic;
using System.Web;
using System.Data.Linq;
using ImagineCupDB;
using System.Linq;

namespace LowerCarbon.Web
{
    /// <summary>
    /// ImageHandler 的摘要说明
    /// </summary>
    public class ImageHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            switch (context.Request.Params["from"])
            {
                case "userImage":
                    getUserImage(context, context.Request.Params["id"]);
                    break;
                case "loveTree":
                    getLoveTreeImg(context, context.Request.Params["id"]);
                    break;
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        void getUserImage(HttpContext context, String id)
        {
            context.Response.ContentType = "image/*";
            ImagineCupDBDataContext dbcontext = new ImagineCupDBDataContext();

            Table<CONSUMER> table = dbcontext.CONSUMER;

            var image = from user in table
                        where user.CONSUMER_NO == id
                        select user.C_HEAD_PORTRAIT;

            context.Response.BinaryWrite(image.Single().ToArray());
            context.Response.End();
        }

        void getLoveTreeImg(HttpContext context, String id)
        {
            context.Response.ContentType = "image/*";
            ImagineCupDBDataContext dbcontext = new ImagineCupDBDataContext();

            Table<LOVE_TREE> table = dbcontext.LOVE_TREE;

            var image = from tree in table
                        where tree.TREE_NO == id
                        select tree.TREE_PIC;

            context.Response.BinaryWrite(image.Single().ToArray());
            context.Response.End();
        }
    }
}