<%@ Page Title="低碳交易平台" Language="C#" MasterPageFile="~/Mother.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LowerCarbon.Web.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <a name="skipnav"></a>
        <div id="content">
            <h1 class="hidden">
                Carbon Trust Home Page</h1>
            <div id="slideshow">
                <div id="slideshowprev">
                    <img src="images/1.gif" alt="" height="330" width="70" />
                </div>
                <div id="slideshownext">
                    <img src="images/1.gif" alt="" height="330" width="70" />
                </div>
                <div style="position: relative; width: 960px; height: 330px;" id="slideshowcontainer">
                    <a style="position: absolute; top: 0pt; left: 0pt; display: block; z-index: 6;
                        width: 960px; height: 330px;" href="#">
                        <img class="print4 imagefield imagefield-field_slideshow" alt="Homepage Slideshow - Start Garden Party"
                            src="images/4_Carousel_Start_1.png" height="330" width="960" />
                    </a>
                </div>
            </div>
            <div id="buckets">
                <div id="bucketgreen">
                    <h2 align="center">
                        注册</h2>
                    <span style="font-size: small">点击注册，加入低碳行列<br /></span> <a style="font-size: medium;" href="./Register.aspx">
                        注册</a>
                </div>
                <div id="bucketorange">
                    <!-- <img src="/images/get_involved.png" width="171" height="26" alt="Get Involved" /> -->
                    <h2 align="center">
                        碳足迹计算</h2>
                    <span style="font-size: small">点击计算，计算您的碳足迹<br/></span> <a style="font-size: medium;" href="./CarbonCalculator.aspx">
                        计算</a>
                </div>
                <div id="bucketpurple">
                    <!-- <img src="/images/look_for_it.png" width="137" height="26" alt="Look For It" /> -->
                    <h2 align="center">
                        环保交易</h2>
                    <span style="font-size: small">点击买树，为环保做贡献 <br /></span> <a href="http://item.taobao.com/auction/item_detail.htm?item_num_id=8777995574"
                        style="font-size: medium;">买树</a>
                </div>
                <div id="bucketblue">
                    <!-- <img src="/images/the_latest.png" width="137" height="26" alt="The latest" /> -->
                    <h2 align="center">
                        反馈信息</h2>
                    <span style="font-size: small;Text-align:center">查看看低碳主义者的成果<br /></span> <a style="font-size: medium;" href="./Achievements.aspx">
                        查看</a>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="clear20">
            </div>
        </div>
    </div>
</asp:Content>
