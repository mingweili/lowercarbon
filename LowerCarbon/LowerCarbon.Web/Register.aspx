<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="LowerCarbon.Web.Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>低碳交易平台-注册新用户</title>
    <script type="text/javascript" src="./Scripts/jquery-1.4.1.js" ></script>
    <script type="text/javascript" src="./Scripts/Register.js"></script>
    <link rel="Stylesheet" type="text/css" href="./Styles/LoginPageStyle.css" media="all">

    <style type="text/css">
        // autocomplete css
        .completionListElement 
        {  
            background-color : inherit; 
            color : black; 
            cursor : pointer; 
            font-family : Verdana;
        } 
        .listItem 
        { 
            background-color: white; 
            padding : 1px;
           
        }      
        .highlightedListItem 
        { 
            background-color: #c3ebf9; 
            padding : 1px; 
        }
    </style>
</head>
<body>
    <form runat="Server" id="form1">

    <!-- ////////////script manager///////////// -->
    <div class="cloud">
    </div>
    <div class="MIB_guide">
        <a href="#" class="guidelink"></a>
        <div class="MIB_guide_t">
        </div>
        <div class="MIB_guideb">
            <div class="toptip1">
                <p>
                    立即注册，开始低碳生活！</p>
            </div>
            <!--fuen 内容框-->
            <div class="stepbg2">
                <div class="make_login">
                    <div class="login_left">
                        <div class="new_construct">
                            <!--  //////////新增加用户名///////////// -->
                            <div class="new_item">
                                <div class="tit">
                                    用户名</div>
                                <div class="bdmain">
                                    <div class="jh_yanzheng" positionleft="7" id="reg_username_div">
                                        <strong>
                                                <asp:TextBox runat="Server" CssClass="textinp" 
                                            Style="width: 230px; color: rgb(153, 153, 153);" id="reg_username"
                                                    onfocus="reg_username_onfocus();" onblur="reg_username_onblur();"></asp:TextBox>
                                                </strong></div>
                                </div>
                                <div class="new_plus" id="red_reg_username" style="">
                                    <!-- 这里通过服务器端将密码的错误提交到服务器端 -->
                                </div>
                            </div>
                            <div class="new_item">
                                <div class="tit">
                                    邮箱</div>
                                <div class="bdmain">
                                    <div class="jh_yanzheng" positionleft="3" id="reg_mail_div">
                                        <strong>
                                            <asp:TextBox ID="reg_mail" runat="server" CssClass="textinp" Style="width: 230px;
                                                color: rgb(153, 153, 153);"  onfocus="reg_mail_onfocus();" 
                                            onblur="reg_mail_onblur();"></asp:TextBox>
                                        </strong>
                                    </div>
                                </div>
                                <div class="new_plus" id="red_reg_mail" style="">
                                    <!-- 这里通过服务器端将html传递到前台 -->
                                </div>
                            </div>
                             
                            <div class="new_item">
                                <div class="tit">
                                    确认密码</div>
                                <div class="bdmain">
                                    <div class="jh_yanzheng" positionleft="7" id="reg_password_div">
                                        <strong>
                                                <asp:TextBox TextMode="password" runat="Server" CssClass="textinp" Style="width: 230px; color: rgb(153, 153, 153);" id="reg_password"
                                                    onfocus="reg_password_onfocus();" onblur="reg_password_onblur();"></asp:TextBox>
                                                </strong></div>
                                </div>
                                <div class="new_plus" id="red_reg_password" style="">
                                    <!-- 这里通过服务器端将密码的错误提交到服务器端 -->
                                </div>
                            </div>
                            <div class="new_item">
                                <div class="tit">
                                    密码确认</div>
                                <div class="bdmain">
                                    <div class="jh_yanzheng" positionleft="7" id="reg_password2_div">
                                        <strong>
                                                <asp:TextBox TextMode="password" runat="Server" style="width: 230px; color: rgb(51, 51, 51);" id="reg_password2" CssClass="textinp"
                                                    onfocus="reg_password2_onfocus();" onblur="reg_password2_onblur();"></asp:TextBox>
                                                </strong></div>
                                </div>
                                <div class="new_plus" id="red_reg_password2" style="">
                                    <!-- /////////js添加/////////////// -->
                                </div>
                            </div>
                            <div class="new_item">
                                <div class="tit">
                                </div>
                                <div class="bdmain">
                                    <div class="lf">
                                        <label
                                            for="after"><a target="_top" href="#"></a></label></div>
                                </div>
                                <div class="new_plus" id="red_after" style="display: none;">
                                </div>
                            </div>
                            <div class="btdiv padding_less">
                                <asp:LinkButton ID="registerBtn" runat="server" CssClass="btn_ljzc" 
                                    onclick="registerBtn_Click"></asp:LinkButton>
                                
                            </div>
                        </div>
                    </div>
                    <div class="login_right">
                        <div class="r_tit">
                            已经拥有低碳帐号？<br>
                            请直接登录</div> 
                        <asp:LinkButton ID="loginBtn" runat="server" CssClass="r_loginbtn" onclick="loginBtn_Click" 
                                    >登陆系统</asp:LinkButton>
                    </div>
                    <div class="clear">
                    </div>
                </div>
            </div>
      
        </div>
        <div class="MIB_guide_bt">
            <div class="MIB_guide_btb">
                <div class="MIB_foot_new ">
                    <div class="lf">
                        <p>
                            &nbsp;</p>
                    </div>
                    <div class="clearit">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- SUDA_CODE_START -->
    <div style="position: absolute; top: 0pt; left: 0pt; width: 0pt; height: 0pt; z-index: 1;">
        <div style="position: absolute; top: 0pt; left: 0pt;">
        </div>
        <div style="position: absolute; top: 0pt; left: 0pt; width: 0pt; height: 0pt; visibility: hidden;"
            id="SUDA_CS_DIV">
            <img src="a.gif" alt="" border="0" height="0" width="0">
        </div>
    </div>
    <noscript>
        <div style='position: absolute; top: 0; left: 0; width: 0; height: 0; visibility: hidden'>
            <img width="0" height="0" dynamic-src='http://beacon.sina.com.cn/a.gif?noScript'
                border='0' alt='' />
        </div>
    </noscript>
    <!-- SUDA_CODE_END -->
    <div style="position: absolute; display: none; z-index: 9999;" id="livemargins_control">
        <img src="chrome://livemargins/skin/monitor-background-horizontal.png" style="position: absolute;
            left: -77px; top: -5px;" height="5" width="77">
        <img src="chrome://livemargins/skin/monitor-background-vertical.png" style="position: absolute;
            left: 0pt; top: -5px;">
        <img id="monitor-play-button" src="chrome://livemargins/skin/monitor-play-button.png"
            onmouseover="this.style.opacity=1" onmouseout="this.style.opacity=0.5" style="position: absolute;
            left: 1px; top: 0pt; opacity: 0.5; cursor: pointer;">
    </div>
    
    <div>
        <ul class="passCard" id="sinaNote" style="display: none;">
        </ul>
    </div>
    </form>
</body>
</html>
