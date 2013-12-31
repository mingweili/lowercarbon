<%@ Page Title="低碳交易平台-碳排放量计算器" Language="C#" MasterPageFile="~/Mother.Master" AutoEventWireup="true"
    CodeBehind="CarbonCalculator.aspx.cs" Inherits="LowerCarbon.Web.CarbonCalculator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .contentbox_quote_text
        {
            background-image: url("./images/quote_bg.png");
            background-repeat: repeat-y;
            height: 100%;
            padding: 0 20px;
        }
        #silverlightControlHost
        {
            height: 720px;
            text-align: center;
            width:700px;
            
        }
    </style>
    <script type="text/javascript" src="./js/Silverlight.js"></script>
    <script type="text/javascript">
        function onSilverlightError(sender, args) {
            var appSource = "";
            if (sender != null && sender != 0) {
                appSource = sender.getHost().Source;
            }

            var errorType = args.ErrorType;
            var iErrorCode = args.ErrorCode;

            if (errorType == "ImageError" || errorType == "MediaError") {
                return;
            }

            var errMsg = "Unhandled Error in Silverlight Application " + appSource + "\n";

            errMsg += "Code: " + iErrorCode + "    \n";
            errMsg += "Category: " + errorType + "       \n";
            errMsg += "Message: " + args.ErrorMessage + "     \n";

            if (errorType == "ParserError") {
                errMsg += "File: " + args.xamlFile + "     \n";
                errMsg += "Line: " + args.lineNumber + "     \n";
                errMsg += "Position: " + args.charPosition + "     \n";
            }
            else if (errorType == "RuntimeError") {
                if (args.lineNumber != 0) {
                    errMsg += "Line: " + args.lineNumber + "     \n";
                    errMsg += "Position: " + args.charPosition + "     \n";
                }
                errMsg += "MethodName: " + args.methodName + "     \n";
            }

            throw new Error(errMsg);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <a name="skipnav"></a>
        <div id="content">
            <h1 class="list_title">
                </h1>
            <div id="content_left">
                <div class="category">
                  
                <!-- 替换成silverlight控件 -->
                <div>
                    <div id="silverlightControlHost">
                        <object data="data:application/x-silverlight-2," type="application/x-silverlight-2"
                            width="100%" height="100%">
                            <param name="source" value="ClientBin/LowerCarbon.Web.Controls.xap" />
                            <param name="onError" value="onSilverlightError" />
                            <param name="background" value="white" />
                            <param name="minRuntimeVersion" value="4.0.50826.0" />
                            <param name="autoUpgrade" value="true" />
                            <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=4.0.50826.0" style="text-decoration: none">
                                <img src="http://go.microsoft.com/fwlink/?LinkId=161376" alt="获得Silverlight"
                                    style="border-style: none" />
                            </a>
                        </object>
                        <iframe id="_sl_historyFrame" style="visibility: hidden; height: 0px; width: 0px;
                            border: 0px"></iframe>
                    </div>
                </div>
            </div>
            <div class="clear20">
            </div>
        </div>
        <!-- 右部 -->
        <div class="content_right">
            <div class="leftborder">
                <ul class="actions">
                    <li id="printlink"><a href="#" onclick="window.print(); return false;">打印此页</a></li>
                </ul>
                <div class="share">
                    <h3 class="friends">
                        告诉你周围的人</h3>
                    <p>
                        告诉你周围的人，通过你的经历告诉更多的人将环保进行到底！</p>
                    <p>
                        <!-- ///////////////增加qq，校内的链接///////////////// -->
                        和朋友分享 <a href="http://www.delicious.com/save" onclick="window.open('http://www.delicious.com/save?v=5&amp;noui&amp;jump=close&amp;url='+encodeURIComponent(location.href)+'&amp;title='+encodeURIComponent(document.title), 'delicious','toolbar=no,width=550,height=550'); return false;">
                            <img src="./images/icon_delicious.png" alt="Share on Delicious" height="21" width="21"></a>
                        <a target="_top" href="http://twitter.com/home?status=Currently%20reading%20http://www.carbon-label.com/whos-reducing">
                            <img src="./images/icon_twitter.png" alt="Share on Twitter" height="21" width="21"></a>
                        <a target="_top" href="http://digg.com/submit?url=http://www.carbon-label.com/whos-reducing">
                            <img src="./images/icon_digg.png" alt="Share on Digg" height="21" width="21"></a>
                        <a target="_top" href="http://reddit.com/submit?url=http://www.carbon-label.com/whos-reducing">
                            <img src="./images/icon_reddit.png" alt="Share on Reddit" height="21" width="21"></a>
                    </p>
                </div>
            </div>
            <div class="contentbox_quote">
                <img src="./images/quote_top.png" alt=""><div class="contentbox_quote_text">
                    <h3>
                        我们可以改变很多...</h3>
                    <span class="subheading"></span>
                    <p>
                        通过我们自身的行动，我们可以减缓地球变暖步伐，更多的人将从中受益！</p>
                </div>
                <img src="./images/quote_bottom.png" alt="">
            </div>
        </div>
        <div class="clear20">
        </div>
    </div>
    <!-- /////////////////底部////////////// -->
    <div id="footer">
        <div class="clear">
        </div>
    </div>
    </div>
</asp:Content>
