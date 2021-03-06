﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Mother.Master" AutoEventWireup="true" CodeBehind="Personal.aspx.cs" Inherits="LowerCarbon.Web.Personal" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>低碳交易平台-个人主页</title>
<meta name="viewport" content="width=960"/>
<meta name="keywords" content="carbon emissions Carbon Reduction Label carbon footprint"/>
<meta name="description" content=""/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>

<script type="text/javascript">
<!--    //--><![CDATA[//><!--
    jQuery.extend(Drupal.settings, { "basePath": "/" });
    //--><!]]>
</script
<script src="js/menu.js" type="text/javascript"></script>

<link type="text/css" rel="stylesheet" media="all" href="css/node.css"/>
<link type="text/css" rel="stylesheet" media="all" href="css/defaults.css"/>
<link type="text/css" rel="stylesheet" media="all" href="css/system.css"/>
<link type="text/css" rel="stylesheet" media="all" href="css/system-menus.css"/>
<link type="text/css" rel="stylesheet" media="all" href="css/user.css"/>
<link type="text/css" rel="stylesheet" media="all" href="css/content-module.css"/>
<link type="text/css" rel="stylesheet" media="all" href="css/date.css"/>
<link type="text/css" rel="stylesheet" media="all" href="css/datepicker.css"/>
<link type="text/css" rel="stylesheet" media="all" href="css/jquery.timeentry.css"/>
<link type="text/css" rel="stylesheet" media="all" href="css/filefield.css"/>
<link type="text/css" rel="stylesheet" media="all" href="css/fieldgroup.css"/>
<link type="text/css" rel="stylesheet" media="all" href="css/views.css"/>
<link rel="stylesheet" type="text/css" href="css/reset.css" media="screen, projection"/>
<link rel="stylesheet" class="stylesheet" type="text/css" href="css/style.css" media="screen, projection"/>
<link rel="stylesheet" href="css/print.css" type="text/css" media="print"/>
<link rel="shortcut icon" href="http://www.carbon-label.com/favicon.ico"/>
<link rel="apple-touch-icon" href="http://www.carbon-label.com/images/apple-touch-icon.png"/>
<!--[if IE 7]>
	<link rel="stylesheet" type="text/css" href="/css/ie7.css" />
<![endif]-->
<!--[if IE 6]>
	<link rel="stylesheet" type="text/css" href="/css/ie6.css" />
	<script src="/js/pngFix/jquery.pngFix.js" type="text/javascript"></script>
	<script type="text/javascript"> 
	    $(document).ready(function(){ 
	        $(document).pngFix(); 
	    }); 
	</script>	
<![endif]-->
<script type="text/javascript">

    $(document).ready(function () {
        if ($.cookie("carbontrust")) {
            if ($.cookie("carbontrust") == "/css/monochrome.css") {
                $('#contrast_icon').attr('src', '/images/contrast_colour.gif');
            } else if ($.cookie("carbontrust") == "/css/style.css") {
                $('#contrast_icon').attr('src', '/images/contrast_bw.gif');
            }

        }
        $("#contrast a").click(function () {
            if ($.browser.msie == false) {
                if ($(".stylesheet").attr('href').indexOf("monochrome") != -1) {
                    $(this).attr('rel', '/css/style.css');
                    $('#contrast_icon').attr('src', '/images/contrast_bw.gif');
                } else if ($(".stylesheet").attr('href').indexOf("style") != -1) {
                    $(this).attr('rel', '/css/monochrome.css');
                    $('#contrast_icon').attr('src', '/images/contrast_colour.gif');
                }
            }
            $(".stylesheet").attr("href", $(this).attr('rel'));
            $.cookie("carbontrust", $(this).attr('rel'), { expires: 365, path: '/' });
            if ($.browser.msie) {
                location.reload();
            }
            return false;
        });
    }); 
</script> 
<style type="text/css">
     
       .modalBackground {

        background-color:#000;

        filter:alpha(opacity=80);

        opacity:0.8;
     }

    .modalPopup img {

        border:solid 5px #fff;
     }

    .modalPopup-text {

        display:block;

        color:#000;

        background-color:#E6EEF7;

        text-align:center;

        border:solid 1px #73A2D6;

        padding:10px;
     }

    .modalPopup-text input {
    }

    .feedback
    {
        color: #00cc00;

        font-weight: 700;
     }
</style>
<style type="text/css">#yddContainer{display:block;font-family:Microsoft YaHei;position:relative;width:100%;height:100%;top:-4px;left:-4px;font-size:12px;border:1px solid}#yddTop{display:block;height:22px}#yddTopBorderlr{display:block;position:static;height:17px;padding:2px 28px;line-height:17px;font-size:12px;color:#5079bb;font-weight:bold;border-style:none solid;border-width:1px}#yddTopBorderlr .ydd-sp{position:absolute;top:2px;height:0;overflow:hidden}.ydd-icon{left:5px;width:17px;padding:0px 0px 0px 0px;padding-top:17px;background-position:-16px -44px}.ydd-close{right:5px;width:16px;padding-top:16px;background-position:left -44px}#yddKeyTitle{float:left;text-decoration:none}#yddMiddle{display:block;margin-bottom:10px}.ydd-tabs{display:block;margin:5px 0;padding:0 5px;height:18px;border-bottom:1px solid}.ydd-tab{display:block;float:left;height:18px;margin:0 5px -1px 0;padding:0 4px;line-height:18px;border:1px solid;border-bottom:none}.ydd-trans-container{display:block;line-height:160%}.ydd-trans-container a{text-decoration:none;}#yddBottom{position:absolute;bottom:0;left:0;width:100%;height:22px;line-height:22px;overflow:hidden;background-position:left -22px}.ydd-padding010{padding:0 10px}#yddWrapper{color:#252525;z-index:10001;background:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ab20.png);}#yddContainer{background:#fff;border-color:#4b7598}#yddTopBorderlr{border-color:#f0f8fc}#yddWrapper .ydd-sp{background-image:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ydd-sprite.png)}#yddWrapper a,#yddWrapper a:hover,#yddWrapper a:visited{color:#50799b}#yddWrapper .ydd-tabs{color:#959595}.ydd-tabs,.ydd-tab{background:#fff;border-color:#d5e7f3}#yddBottom{color:#363636}#yddWrapper{min-width:250px;max-width:400px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="submenu"><div id="block-menu_block-1" class="clear-block block block-menu_block">

  <div class="menu-block-1 menu-name-menu-carbontrust parent-mlid-0 menu-level-3">
  <ul class="menu">
 <li class="leaf first menu-mlid-1925"><a href="Personal.aspx" title="我的主页">我的主页</a></li>
<li class="leaf menu-mlid-1924"><a href="PurchasesHistory.aspx" title="低碳购物历程">低碳购物历程</a></li>
<li class="leaf last menu-mlid-1923"><a href="Feedback.aspx" title="低碳树反馈">低碳树反馈</a></li>
</ul></div>
  
</div>
<div class="clear"></div></div><div class="clear"></div>	<div class="container">
		<a name="skipnav"></a>
  <div id="content">
				<h1>我的主页</h1>

		<div class="youtube_right">
		
			<ul class="actions">
				
			</ul>
			
			
<%--<div class="share">
<h3 class="friends">分享该网站</h3>
<p>和你的朋友们一起开始低碳旅程吧。</p>
<p>分享到：
	<a target="_blank" href="http://v.t.qq.com/share/share.php?title=低碳交易平台&url=http://localhost:4032/Default.aspx&source=1000012&site=www.jiathis.com&pic="><img src="images/qq.ico" alt="Share on Delicious" height="21" width="21"/></a>
	<a target="_blank" href="http://twitter.com/home?status=Currently%20reading%20http://localhost:4032/Default.aspx"><img src="images/twitter.ico" alt="Share on Twitter" height="21" width="21"/></a>
	<a target="_blank" href="http://share.renren.com/share/buttonshare.do?link=http://localhost:4032/Default.aspx&title=低碳交易平台"><img src="images/renren.ico" alt="Share on RenRen" height="21" width="21"/></a>
	<a target="_blank" href="http://www.douban.com/recommend/?url=http://localhost:4032/Default.aspx&title=低碳交易平台"><img src="images/douban.ico" alt="Share on DouBan" height="21" width="21"/></a>
</p>
</div>	--%>	
						
	</div>

		<div class="banner_left" height="340" width="720">
        <div  class="ar_r_t">
        <img src="images/avatar.jpg" alt="Tennie" width="120">
        </div>

<div class="composer">
<h3 class="index_name">
    <asp:Label ID="consumerName" runat="server" Text=""></asp:Label>
</h3>
<P>

</P>
<DIV class="current_status" id="mystate">
    我的邮箱：<asp:Label ID="consumerEmail" runat="server" Text=""></asp:Label>
<br/>
<br/>
注册日期：<asp:Label ID="registrationTime" runat="server" Text=""></asp:Label>
</DIV>

</DIV>
<DIV class="ar_l_t">
<UL class="u_setting">
<LI>
    <asp:LinkButton ID="changePassowrdLinkButton" runat="server">修改密码</asp:LinkButton></LI>
<LI>　　　</LI>
<LI>　　　</LI><LI>　　　</LI><LI>　　　</LI>
<LI><asp:LinkButton ID="changeEmailLinkButton" runat="server">修改邮箱</asp:LinkButton></LI>
</UL>
</div>
</DIV></div>		</div>
		
		<div class="clear10"></div>
		
		<div id="content_left">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
			<div class="contentbox_left">
				<h2>低碳树</h2>
				<div class="clear"></div>
				<img class="imagefield imagefield-field_box_1_image" alt="Picture of mother and child in supermarket" src="images/tree1.jpg" height="105" width="130"/>				<p>
以生长50年的一棵普通的树为例，经过研究，每年可生产出价值31250美元的一吨氧气，若每年有3个季度可以进行光合作用，则： 
一棵普通的树，平均每天产生氧气为： 
1000000/(365×3/4)=约3653克/天， 
平均吸收二氧化碳为 约5023克/天</p> <p><A href="http://item.taobao.com/auction/item_detail.htm?item_num_id=8777995574" target="_blank" " title="点击购买">点击购买</A></p><DIV id="mood_form" style="display:block">
<div id="tidDiv1" style="display:block">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br/>
            <asp:Label ID="Label2" runat="server" Text="请在此确认订单号：" Font-Size="Medium"></asp:Label>
            <br/>
            <asp:TextBox ID="tidTextBox1" runat="server" Width="220px"></asp:TextBox>
 　          <asp:Button ID="tidSubmit1" runat="server" Text="确定" onclick="tidSubmit1_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
</DIV>
			</div>

			<div class="contentbox_left">
				<h2>环保Ｔ恤</h2>
				<div class="clear"></div>
				<img class="imagefield imagefield-field_box_2_image" alt="Picture of girl looking at windmill" src="images/Tshirt1.jpg" height="105" width="130"/>				<p>这是灰常环保的T恤这是灰常环保的T恤这是灰常环保的T恤这是灰常环保的T恤这是灰常环保的T恤这是灰常环保的T恤这是灰常环保的T恤这是灰常环保的T恤这是灰常环保的T恤这是灰常环保的T恤这是灰常环保的T恤这是灰常环保的T恤这是灰常环保的T恤</p><p><a href="http://item.taobao.com/auction/item_detail.htm?item_num_id=8846002070" target="_blank">点击购买</a></p>
                <div id="Div1" style="display:block">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <br/>
            <asp:Label ID="Label1" runat="server" Text="请在此确认订单号：" Font-Size="Medium"></asp:Label>
            <br/>
            <asp:TextBox ID="tidTextBox2" runat="server" Width="220px"></asp:TextBox>
 　          <asp:Button ID="tidSubmit2" runat="server" Text="确定" onclick="tidSubmit2_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
			</div>

		
		</div>
		
		<div class="content_right">
			<div class="contentbox_orange">
			<h2>本网站的盈利用于：</h2>
			<p >　　　　　　　　　　　　　　　　　　买树,买树，环保，环保，环保，环保，环保买树,买树，环保，环保，环保，环保，环保买树,买树，环保，环保，环保，环保，环保买树,买树，环保，环保，环保，环保，环保买树,买树，环保，环保，环保，环保，环保买树,买树，环保，环保，环保，环保，环保买树,买树，环保，环保，环保，环保，环保买树,买树，环保，环保，环保，环保，环保</p>
			<p></p>
			</div>
		</div>
		
		<div>		<div class="clear20"></div>
		</div>
		<div id="footer">
		</div>
	</div>
	<div class="clear"></div>
	<div class="clear"></div>

<script type="text/javascript">
    function openTaobao() {
        window.open('http://container.open.taobao.com/container?appkey=12177007&encode=utf-8')
    }
</script>

<asp:Panel ID="PasswordPanel" runat="server" CssClass="modalPopup" Style="display: none">

    <div class="modalPopup-text">

        请输入您的新密码：<asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="142px" 
            TextMode="Password"></asp:TextBox>
        <br />
        <br />
        再次输入您的密码：<asp:TextBox ID="TextBox2" runat="server" Height="16px" Width="142px" 
            TextMode="Password"></asp:TextBox>

        <br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ErrorMessage="两次输入的密码不一致请重新输入" ControlToCompare="TextBox1" 
            ControlToValidate="TextBox2"></asp:CompareValidator><br/>
        <asp:Button ID="YesButton" runat="server" Text="确定" onclick="YesButton_Click"/>&nbsp;&nbsp;
        　　　　　　　　　　　　
        <asp:Button ID="NoButton" runat="server" Text="取消" />

    </div>

</asp:Panel>

<asp:Panel ID="EmailPanel" runat="server" CssClass="modalPopup" Style="display: none">

    <div class="modalPopup-text">

        请输入您的新邮箱：<asp:TextBox ID="TextBox3" runat="server" Height="16px" Width="142px" 
            TextMode="Password"></asp:TextBox>
        <br />
        <br />
        再次输入您的邮箱：<asp:TextBox ID="TextBox4" runat="server" Height="16px" Width="142px" 
            TextMode="Password"></asp:TextBox>

        <br />
        <asp:CompareValidator ID="CompareValidator2" runat="server" 
            ErrorMessage="两次输入的邮箱不一致请重新输入" ControlToCompare="TextBox1" 
            ControlToValidate="TextBox2"></asp:CompareValidator><br/>
        <asp:Button ID="Button1" runat="server" Text="确定" onclick="YesButton1_Click"/>&nbsp;&nbsp;
        　　　　　　　　　　　　
        <asp:Button ID="Button2" runat="server" Text="取消" />

    </div>

</asp:Panel>

    <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" 
            TargetControlID="changePassowrdLinkButton"
            PopupControlID="PasswordPanel"
             BackgroundCssClass="modalBackground">

    </asp:ModalPopupExtender>

        <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" 
            TargetControlID="changeEmailLinkButton"
            PopupControlID="EmailPanel"
             BackgroundCssClass="modalBackground">

    </asp:ModalPopupExtender>



</asp:Content>

