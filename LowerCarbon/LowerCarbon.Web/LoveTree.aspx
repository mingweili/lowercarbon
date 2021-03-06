﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoveTree.aspx.cs" Inherits="LowerCarbon.Web.LoveTree" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>低碳交易平台-爱心树</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 1100px; height: 180px; float: inherit;">
        <div style="width: 700px; height: 200px; float: left;">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
                AllowPaging="True" PageSize="5" OnPageIndexChanged="GridView1_PageIndexChanged"
                OnPageIndexChanging="GridView1_PageIndexChanging" Width="500px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" HeaderText="选择" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </div>
        <div id="EditTree" runat="server" style="width: 400px; height: 300px; float: left;
            display: none">
            <div style="width: 400px; height: 50px;">
                <div style="width: 100px; height: 50px; float: left;">
                    <asp:Label ID="Label1" runat="server" Text="种植地点"></asp:Label>
                </div>
                <div style="width: 200px; height: 50px; float: left">
                    <asp:TextBox ID="TreePlace" runat="server"></asp:TextBox>
                </div>
                <div style="width: 100px; height: 50px; float: left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Text="种植地点不能为空" runat="server"
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="TreePlace">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div style="width: 400px; height: 50px; float: left;">
                <div style="width: 100px; height: 50px; float: left">
                    <asp:Label ID="Label2" runat="server" Text="种植时间"></asp:Label>
                </div>
                <div style="width: 200px; height: 50px; margin-bottom: 0px; float: left;">
                    <asp:TextBox ID="TreeDate" runat="server"></asp:TextBox>
                </div>
                <div style="width: 100px; height: 50px; float: left">
                    <asp:RequiredFieldValidator Text="时间不能为空" ID="RequiredFieldValidator2" runat="server"
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="TreeDate"></asp:RequiredFieldValidator>
                    <cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Format="yyyy/MM/dd"
                        OnClientShown="dobCalendarShown" TargetControlID="TreeDate">
                    </cc1:CalendarExtender>
                    <script type="text/javascript">
                        function dobCalendarShown(sender, args) {
                            sender._switchMode("years", true);
                        }
                    </script>
                </div>
            </div>
            <div style="width: 400px; height: 50px">
                <div style="width: 300px; height: 50px; float: left;">
                    <div style="width: 80px; height: 50px; float: left">
                        &nbsp</div>
                    <div style="width: 70px; height: 50px; float: left">
                        <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" Height="40px"
                            Width="72px" />
                    </div>
                    <div style="width: 68px; height: 50px; float: left">
                        &nbsp</div>
                </div>
                <div style="width: 100px; height: 50px; display: none">
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </div>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
