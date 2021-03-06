﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace LowerCarbon
{
    public partial class Login2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            passwordTextBox.Attributes.Add("type", "password");
        }

        protected void t_submit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                if (usernameTextBox.Text.ToString().Equals("gyzz"))
                {
                    Session["username"] = "环保组织";
                    Response.Redirect("./fund.aspx");
                    
                    return;
                }
                string connectString = ConfigurationManager.ConnectionStrings["ImagineCupConnectionString"].ToString();
                SqlConnection sqlConnect = new SqlConnection(connectString);

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.CommandType = CommandType.Text;
                sqlcmd.CommandText = "SELECT CONSUMER_NO,CONSUMER_PASSWD FROM CONSUMER WHERE CONSUMER_NAME = '" + usernameTextBox.Text.ToString() + "'";
                sqlConnect.Open();
                sqlcmd.Connection = sqlConnect;
                SqlDataReader sqlDataReader = sqlcmd.ExecuteReader();
                if (sqlDataReader.Read())
                {
                    string a = sqlDataReader["consumer_passwd"].ToString().Trim();
                    string consumer_id = sqlDataReader["consumer_no"].ToString().Trim();
                    if (a.Equals(passwordTextBox.Text.ToString().Trim()))
                    {

                        TextWriter tw = Response.Output;
                        tw.Write("<script type='text/javascript'>parent.parent.location.href='./Personal.aspx';</script>");
                        tw.Flush();
                        tw.Close();
                        Session["username"] = usernameTextBox.Text.ToString();
                        Session["password"] = passwordTextBox.Text.ToString();
                        Session["consumer_id"] = consumer_id;
                    }
                    else
                    {
                        Label1.Text = "密码错误";
                    }
                }
                else
                {
                    Label1.Text = "用户名不存在";
                }
            }
        }
    }
}