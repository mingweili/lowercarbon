﻿<%@ Page Title="低碳交易平台-环保成果" Language="C#" MasterPageFile="~/Mother.Master" AutoEventWireup="true"
    CodeBehind="Achievements.aspx.cs" Inherits="LowerCarbon.Web.Achievements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" media="all" href="./css/style.css" />
    <style type="text/css">
        .style1
        {
            color: #003300;
            font-size: xx-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="style1">
        <strong>我们的环保成果</strong></h1>
    <br />
    <br />
    <br />
    <div id="achieDIV" runat="server">
        <asp:Label ID="SumLabel" runat="server" Text="我们的成果：" Style="font-weight: 700; font-size: 150%;
            float: left"></asp:Label>
    </div>
    <br />
    <br />
    <br />
    <br />
    <asp:Panel ID="categoryPanel" runat="server">
    </asp:Panel>
    <div style="font-size:200%; display:table-cell; float:left; margin-right:60px; width: 140px;">
        <asp:HyperLink ID="submit" NavigateUrl="~/Register.aspx" runat="server">我要注册</asp:HyperLink>
        
    </div>
    <div style="font-size:200%; display:table-cell">
        <asp:HyperLink ID="HyperLink1" NavigateUrl="#" runat="server">我要买树</asp:HyperLink>
    </div>
    <br />
    <br />
    <br />
</asp:Content>
