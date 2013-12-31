<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="LowerCarbon.Login2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <!--STATUS OK-->
    <meta content="text/html; charset=gb2312" http-equiv="content-type">
    <title>百度个人中心登录 </title>
    <script language="javascript">
        function G(id) { return document.getElementById(id); }
    </script>
    <meta content="no-cache" http-equiv="Pragma">
    <style type="text/css">
        form
        {
            margin: 0px;
            padding: 0px;
        }
        body
        {
            margin: 0;
            padding: 0;
            width: 362px;
            background-color: #FFFFFF;
            color: #333333;
        }
        #main
        {
            width: 362px;
            margin: 0;
            margin: 0;
        }
        div
        {
            font-size: 12px;
            line-height: 18px;
        }
        a:link
        {
            color: #0033CC;
        }
        a:visited
        {
            color: #800080;
        }
        .lg
        {
            margin-bottom: 20px;
        }
        .b2
        {
            padding: 10px;
            line-height: 22px;
            font-size: 14px;
        }
        .b2
        {
            margin-bottom: 12px;
            border: 1px solid #AAAAAA;
            background: #F9F9F9;
        }
        .hl
        {
            clear: both;
            margin-bottom: 10px;
            color: #666666;
        }
        a.tlk
        {
            line-height: 24px;
            color: #FFFFFF;
            font-size: 14px;
            font-weight: bold;
        }
        a.tlk:visited
        {
            color: #FFFFFF;
        }
        .ip
        {
            width: 120px;
            height: 22px;
            font-size: 14px;
        }
        .f12
        {
            font-size: 12px;
        }
        .f13
        {
            font-size: 12px;
        }
        .f14
        {
            font-size: 14px;
        }
        .f14b
        {
            font-size: 14px;
            font-weight: bold;
        }
        .mespasstip
        {
            color: #7C7C7C;
        }
        .gry
        {
            color: #666666;
        }
        .line
        {
            margin-bottom: 5px;
            line-height: 1px;
            border-top: 1px solid #CCC;
        }
        .ip
        {
            width: 120px;
            height: 22px;
            font-size: 14px;
        }
        .item
        {
            color: #FF0000;
            display: none;
        }
        .tab
        {
            margin-top: -13px;
            margin-bottom: 12px;
        }
        .tab ul, .tab li
        {
            margin: 0;
            padding: 0;
            list-style: none;
            overflow: hidden;
        }
        .tab li
        {
            float: left;
            width: 181px;
            height: 28px;
            line-height: 28px;
            text-align: center;
            border: 1px solid #aaa;
        }
        .tab li.secure
        {
            background-image: url(/img/passport/lock.gif);
            background-position: 10px center;
            background-repeat: no-repeat;
        }
        .tab li.on
        {
            border-top: 1px solid #f9f9f9;
            background-color: #f9f9f9;
            margin-top: -1px;
            height: 29px;
            line-height: 29px;
        }
        .tab li.secure a
        {
            margin-left: 15px;
        }
        .tab li a:link, .tab li a:visited, .tab li a:hover, .tab li a:active
        {
            color: #03c;
        }
        .tab li.on a:link, .tab li.on a:visited, .tab li.on a:hover
        {
            text-decoration: none;
            font-weight: 700;
            color: #000;
        }
        .tab li.secure span
        {
            color: #b0b0b0;
            text-decoration: none;
        }
        .tab li.secure span a
        {
            margin: 0;
            text-decoration: none;
        }
        a.red:link, .red
        {
            color: #f00;
        }
        
        #login_tit
        {
            padding-left: 24px;
            font-size: 14px;
        }
        #errortd
        {
            padding-left: 24px;
        }
        .item2
        {
            clear: both;
        }
        .tit
        {
            width: 78px;
            overflow: hidden;
            float: left;
            font-size: 14px;
            padding: 4px;
            padding-left: 24px;
            line-height: 24px;
        }
        .desc
        {
            padding: 4px;
        }
        #div_reg strong
        {
            padding-left: 24px;
        }
        #vcodeTr .tit
        {
            padding-top: 20px;
        }
        #vcodeTr .desc
        {
            height: 40px;
            margin: 0;
            padding: 0;
        }
        #vcodeTr .desc input
        {
            margin-top: 20px;
        }
        #verifypic
        {
            width: 100px;
            height: 40px;
            vertical-align: bottom;
        }
        .sc-ns a
        {
            color: red;
            display: block;
            text-decoration: none;
        }
        .sc-ns
        {
            border: 1px solid red;
            color: red;
            display: inline-block;
            font-size: 12px;
            height: 22px;
            line-height: 22px;
            text-align: center;
            width: 120px;
        }
    </style>
    <script>

        bdShowVcode = false;

        var tpl = 'ik';
        var ctrlVersion = '1,0,0,8';
        var vcode = "vcodeTr";
        var vimgs = "verifypic";
    </script>
    <script src="/js/login.js?v=1.3"></script>
    <style>
        .sc-ns a
        {
            color: red;
            display: block;
            text-decoration: none;
        }
        .sc-ns
        {
            border: 1px solid red;
            color: red;
            display: inline-block;
            font-size: 12px;
            height: 22px;
            line-height: 22px;
            text-align: center;
            width: 120px;
        }
    </style>
</head>
<body>
    <div align="left" id="main">
        <div class="b2">
            <div id="div_login">
                <div id="login_tit">
                    <strong>注册用户请直接登录</strong></div>
                <form id="form1" runat="server">
                <div style="color: red;" class="item2" id="errortd">
                </div>
                <div class="item2">
                    <div class="tit">
                        用户名:</div>
                    <div class="desc">
                        <asp:TextBox runat="server" type="text" class="ip" value="" ID="usernameTextBox" name="username"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username is required"
                            Text="请输入用户名" ControlToValidate="usernameTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div style="" id="trPassNorm" class="item2">
                    <div class="tit">
                        密 码:
                    </div>
                    <div class="desc">
                        <asp:TextBox type="password" runat="server" class="ip" value="" 
                            ID="passwordTextBox" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required"
                            Text="请输入密码" ControlToValidate="passwordTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div style="display: none;" id="trPassSafe" class="item2">
                    <div class="tit">
                        密 码:</div>
                    <div class="desc" id="tdSafeCont">
                    </div>
                </div>
                <div id="trRem1" class="item2">
                    <div class="desc">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div id="trRem2" class="item2">
                </div>
                <div class="item2">
                    <div id="mem" class="tit">
                    </div>
                    <div id="t_desc" class="desc">
                        <asp:Button ID="t_submit" runat="server" Text="登录" OnClick="t_submit_Click" />
                    </div>
                </div>
                <div style="clear: both;">
                </div>
                </form>
            </div>
        </div>
    </div>
    </div>
</body>
</html>
