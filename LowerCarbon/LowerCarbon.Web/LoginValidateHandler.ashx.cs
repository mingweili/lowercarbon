using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using LowerCarbon.Data;
using ImagineCupDB;

namespace LowerCarbon.Web
{
    /// <summary>
    /// Summary description for LoginValidateHandler
    /// </summary>
    public class LoginValidateHandler : IHttpHandler
    {

        /// <summary>
        /// 如果返回'y'表示该email能够注册，返回'n'的话，不能注册
        /// </summary>
        /// <param name="context"></param>
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            // 添加数据库逻辑
            string username = context.Request.QueryString["username"];
            RegisterService service = new RegisterService();
            bool isValidate = service.IsValidateUserName(username);


            if(isValidate == true)  
            {
                context.Response.Write("y");
            }
            else if(isValidate == false)
            {
                context.Response.Write("n");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}