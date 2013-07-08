<%@ Page language="c#" Codebehind="Index.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.SM.Index" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>消息主页</title>
    <link href="../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
    <link href="../../Css/redmond/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />
    <script language="javascript">
        function selectAll() {
            $(':checkbox').each(function () {
                if (this.checked) {
                    //this.checked = false;
                }
                else {
                    this.checked = true;
                }
            });

        }

        function unSelectAll() {
            $(':checkbox').each(function () {
                if (this.checked) {
                    this.checked = false;
                }
                //else {
                //    this.checked = true;
                //}
            });
        }
        function SendMsg(username, realname) {
            window.opener.parent.parent.MainFrame.location = '../SM/MsgSend.aspx?SendTo=' + username + '&SendToRealName=' + realname;
            window.close();
        }
    </script>
</head>
<body ms_positioning="GridLayout" topmargin="0" leftmargin="0">
    <form id="Index" method="post" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
            width="100%" height="1">
            <tr height="30">
                <td width="3%" bgcolor="#c0d9e6" class="GbText" background="../../Images/treetopbg.jpg"><font color="#003366" size="3">
                    <img src="../../DataImages/message2.gif" width="16" height="16"></font></td>
                <td bgcolor="#c0d9e6" class="GbText" background="../../Images/treetopbg.jpg"><font color="#006699">短讯管理</font></td>
            </tr>
        </table>
        <font face="宋体">
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr height="20">
                    <td id="bar1"
                        style="BACKGROUND-REPEAT: no-repeat; HEIGHT: 25px"
                        align="center" width="90"
                        background='<% Response.Write(Session["MsgDispType"].ToString() == "1" ? "../../images/maillistbutton2.gif" : "../../images/maillistbutton1.gif"); %>'>&nbsp;<a href="Index.aspx?DispType=1" class="Newbutton">我的消息</a></td>
                    <td id="bar2"
                        style="BACKGROUND-REPEAT: no-repeat; HEIGHT: 25px"
                        align="center" width="90"
                        background='<% Response.Write(Session["MsgDispType"].ToString() == "2" ? "../../images/maillistbutton2.gif" : "../../images/maillistbutton1.gif"); %>'>&nbsp;<a href="Index.aspx?DispType=2" class="Newbutton">已发送消息</a></td>
                    <td id="bar4" style="BACKGROUND-REPEAT: no-repeat; HEIGHT: 25px"
                        align="center" width="90" background="../../images/maillistbutton1.gif">&nbsp;<a href="MsgSend.aspx" class="Newbutton">写新消息</a></td>
                    <td style="HEIGHT: 25px" align="right"><font face="宋体">&nbsp;&nbsp;&nbsp;</font></td>
                </tr>
            </table>
            <table class="GbText" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td valign="top" colspan="3">
                        <asp:DataGrid ID="dgMsgList" runat="server" PageSize="15" DataKeyField="ID" OnPageIndexChanged="DataGrid_PageChanged"
                            PagerStyle-HorizontalAlign="Right" PagerStyle-Mode="NumericPages" AllowPaging="True" AutoGenerateColumns="False" BorderColor="#93BEE2"
                            BorderStyle="None" BorderWidth="1px" BackColor="White" CellPadding="3" AllowSorting="True" Width="100%">
                            <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
                            <AlternatingItemStyle BackColor="#E8F4FF"></AlternatingItemStyle>
                            <ItemStyle Font-Size="X-Small" HorizontalAlign="Center" ForeColor="Black" VerticalAlign="Middle"
                                BackColor="White"></ItemStyle>
                            <HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Height="10px" ForeColor="White" VerticalAlign="Top"
                                BackColor="#337FB2"></HeaderStyle>
                            <FooterStyle Font-Size="XX-Small" HorizontalAlign="Center" Height="10px" ForeColor="Black" VerticalAlign="Bottom"
                                BackColor="#93BEE2"></FooterStyle>
                            <Columns>
                                <asp:TemplateColumn HeaderText="选择">
                                    <HeaderStyle HorizontalAlign="Center" Width="40px"></HeaderStyle>
                                    <ItemStyle Font-Size="X-Small" HorizontalAlign="Center" Height="20px" Width="60px"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="grpMsgID" Checked="False" runat="server"></asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="发送者">
                                    <HeaderStyle Width="15%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                    <ItemTemplate>
                                        <a href='../SM/MsgSend.aspx?SendTo=<%# DataBinder.Eval(Container, "DataItem.Sender") %>&SendToRealName=<%# DataBinder.Eval(Container,"DataItem.SenderRealName") %>&Type=<%# DataBinder.Eval(Container,"DataItem.type") %>'>
                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SenderRealName") %>'>
                                            </asp:Label></a>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="接收者">
                                    <HeaderStyle Width="15%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                    <ItemTemplate>
                                        <a href='../SM/MsgSend.aspx?SendTo=<%# DataBinder.Eval(Container, "DataItem.Receiver") %>&SendToRealName=<%# DataBinder.Eval(Container, "DataItem.ReceiverRealName") %>&Type=<%# DataBinder.Eval(Container,"DataItem.type") %>'>
                                            <asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ReceiverRealName") %>'>
                                            </asp:Label></a>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="Content" HeaderText="内容">
                                    <HeaderStyle Width="40%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="短讯类型">
                                    <HeaderStyle Width="10%"></HeaderStyle>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.typeDetail") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="是否已读">
                                    <HeaderStyle Width="10%"></HeaderStyle>
                                    <ItemTemplate>
                                        <%# (bool)DataBinder.Eval(Container.DataItem,"IsRead")==false?"<img src='../../Images/mailclose.gif'>":"<img src='../../Images/mailopen.gif'>" %>
											</asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="Sendtime" HeaderText="发送时间">
                                    <HeaderStyle Width="20%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundColumn>
                            </Columns>
                            <PagerStyle HorizontalAlign="Right" Mode="NumericPages"></PagerStyle>
                        </asp:DataGrid><br>
                        <input class="redButtonCss" onclick="selectAll()" type="button" value="全 选">&nbsp;
							<input class="redButtonCss" onclick="unSelectAll()" type="button" value="取 消">&nbsp;
							<asp:Button ID="btnRead" runat="server" CssClass="redButtonCss" Text="已阅"></asp:Button>&nbsp;
							<asp:Button ID="btnDelete" runat="server" CssClass="redButtonCss" Text="删除" Visible="False"></asp:Button></td>
                </tr>
            </table>
        </font>
    </form>
    <script type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
</body>
</html>
