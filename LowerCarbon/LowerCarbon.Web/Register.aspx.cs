﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using LowerCarbon.Data;
using ImagineCupDB;

namespace LowerCarbon.Web
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// 用户注册
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void registerBtn_Click(object sender, EventArgs e)
        {

            string username = this.reg_username.Text;
            string password = this.reg_password.Text;
            string mail = this.reg_mail.Text;

            RegisterService registerService = new RegisterService();
            registerService.Register(username, mail, password, DateTime.Now);

            // 跳转到相应页面中
            Response.Redirect("~/Default.aspx");
        }

        /// <summary>
        /// 跳转到login页面
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void loginBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}