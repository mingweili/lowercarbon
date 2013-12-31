using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LowerCarbon.Web
{
    public partial class Mohter : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                IsLogin.Text = Session["username"].ToString().Trim()+" ";
                logout.Style["display"] = "block";
            }
            else
            {
                IsLogin.Text = "<a href='#' onclick='check();'>登录</a>";
            }
        }
    }
}