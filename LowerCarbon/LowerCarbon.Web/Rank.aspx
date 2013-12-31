<%@ Page Title="低碳交易平台-用户排名" Language="C#" MasterPageFile="~/Mother.Master" AutoEventWireup="true" CodeBehind="Rank.aspx.cs" Inherits="LowerCarbon.Web.Rank" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" media="all" href="./css/style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="font-family:@微软雅黑; font-size:300%; color:Olive; margin-left:100px; margin-top:100px"><strong>买家积分排名<br />
            <br />
            <br />
            </strong></div>
    <asp:Panel ID="userListByTrade" runat="server" Style="float:left; width:400px; margin-right:150px; margin-left:150px; border-right: 5px solid #2a5caa">
    <div style="font-family:@微软雅黑; font-size:200%">By 用户活跃度</div>
    <br />
    <br />
    </asp:Panel>
    <asp:Panel ID="userListByScore" runat="server" Style="width:400px; margin-left:705px;">
    <div style="font-family:@微软雅黑; font-size:200%">By 环保低碳贡献</div>
    <br />
    <br />
    </asp:Panel>

</asp:Content>
