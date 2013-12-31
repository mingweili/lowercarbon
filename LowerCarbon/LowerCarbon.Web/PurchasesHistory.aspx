<%@ Page Title="" Language="C#" MasterPageFile="~/Mother.Master" AutoEventWireup="true" CodeBehind="PurchasesHistory.aspx.cs" Inherits="LowerCarbon.Web.PurchasesHistory" %>
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
</script>

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
				<h1>低碳购物历程<asp:ImageButton ID="ImageButton" 
                        runat="server" ImageUrl="~/Images/refresh.png" onclick="ImageButton_Click" />
                </h1>

		<div class="banner_left" height="340" width="720">
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            <br/>
            <asp:Panel ID="historyPanel" runat="server"/>

         </div>
      
		<div class="clear10"></div>
		
		<div id="content_left">
		


		
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
			<div class="clear"></div>
		</div>
	</div>


<script type="text/javascript">
    function openTaobao() {
        window.open('http://container.open.taobao.com/container?appkey=12177007&encode=utf-8')
    }
</script>
        </div>
</asp:Content>
