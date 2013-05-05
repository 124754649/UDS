<%@ Page language="c#" Codebehind="Index.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.UnitiveDocument.Mail.MailList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>Index</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <script language="javascript">

        var ball1 = new Image();
        var ball2 = new Image();
        ball1.src = 'images/ball1.gif';
        ball2.src = 'images/ball2.gif';

        var active = new Image();
        var nonactive = new Image();
        active.src = '../../../images/maillistbutton2.gif';
        nonactive.src = '../../../images/maillistbutton1.gif';

        function onMouseOver(img) {
            document.images[img].src = ball2.src;
        }

        function onMouseOut(img) {
            document.images[img].src = ball1.src;
        }

        function onOverBar(bar) {
            if (bar != null) {
                bar.style.backgroundImage = "url(" + active.src + ")";

            }
        }

        function onOutBar(bar) {
            if (bar != null) {
                bar.style.backgroundImage = "url(" + nonactive.src + ")";
            }
        }

        function selectAll() {
            var len = document.MailList.elements.length;
            var i;
            for (i = 0; i < len; i++) {
                if (document.MailList.elements[i].type == "checkbox") {
                    document.MailList.elements[i].checked = true;
                }
            }
        }

        function unSelectAll() {
            var len = document.MailList.elements.length;
            var i;
            for (i = 0; i < len; i++) {
                if (document.MailList.elements[i].type == "checkbox") {
                    document.MailList.elements[i].checked = false;
                }
            }
        }

    </script>
    <link href="../../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
</head>
<body leftmargin="0" topmargin="0" rightmargin="0" ms_positioning="GridLayout">
    <form id="MailList" method="post" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td valign="top" height="38">
                    <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr height="30">
                            <td class="GbText" width="20" background="../../../Images/treetopbg.jpg" bgcolor="#c0d9e6"
                                align="right"><font color="#003366" size="3">
                                    <img height="16" src="../../../Images/icon/284.GIF" width="16"></font></td>
                            <td class="GbText" background="../../../Images/treetopbg.jpg" bgcolor="#e8f4ff" width="60"
                                align="right">我的邮件</td>
                            <td class="GbText" background="../../../Images/treetopbg.jpg" bgcolor="#e8f4ff" align="right"><font face="宋体">
                                <asp:Label ID="lblMsg" runat="server" Width="88px" Font-Size="X-Small"></asp:Label>&nbsp;
										<asp:Button ID="btnClear" runat="server" Visible="False" Text="清 空" CssClass="redButtonCss"></asp:Button>
                                &nbsp;
										<asp:Button ID="btnDelete" runat="server" Text="删 除" CssClass="redButtonCss"></asp:Button>&nbsp;
										<input class="redButtonCss" onclick="selectAll()" type="button" value="全 选">&nbsp;
										<input class="redButtonCss" onclick="unSelectAll()" type="button" value="取 消">&nbsp;
										<asp:DropDownList ID="listFolderType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="FolderListChange"></asp:DropDownList></font></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="bottom" height="25">
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr height="25">
                            <td style="HEIGHT: 25px" width="1"></td>
                            <td style="BACKGROUND-REPEAT: no-repeat; HEIGHT: 25px" id="bar1" align="center" width="90"
                                background='<% Response.Write(Session["FolderType"].ToString() == "1" ? Page.ResolveUrl("~/images/maillistbutton2.gif") : Page.ResolveUrl("~/images/maillistbutton1.gif")); %>'>
                                &nbsp;<a href='javascript:parent.navigatemf("收件箱", "<%= Page.ResolveUrl("Index.aspx?FolderType=1") %>", "mail")' class="Newbutton">收件箱</a></td>
                            <td style="BACKGROUND-REPEAT: no-repeat; HEIGHT: 25px" id="bar2" align="center" width="90"
                                background='<% Response.Write(Session["FolderType"].ToString() == "2" ? "../../../images/maillistbutton2.gif" : "../../../images/maillistbutton1.gif"); %>'
                                class="Newbutton">
                                &nbsp;<a href='javascript:parent.navigatemf("发件箱", "<%= Page.ResolveUrl("Index.aspx?FolderType=2") %>", "mail")' class="Newbutton">发件箱</a></td>
                            <td style="BACKGROUND-REPEAT: no-repeat; HEIGHT: 25px" id="bar3" align="center" width="90"
                                background='<% Response.Write(Session["FolderType"].ToString() == "3" ? "../../../images/maillistbutton2.gif" : "../../../images/maillistbutton1.gif"); %>'>
                                &nbsp;<a href='javascript:parent.navigatemf("废件箱", "<%= Page.ResolveUrl("Index.aspx?FolderType=3") %>", "mail")' class="Newbutton">废件箱</a></td>
                            <td style="BACKGROUND-REPEAT: no-repeat; HEIGHT: 25px"
                                id="bar4" align="center" width="90" background="../../../images/maillistbutton1.gif">
                                &nbsp;<a href='javascript:parent.navigatemf("撰写新邮件", "<%= Page.ResolveUrl("Compose.aspx?ClassID=0") %>", "mail")' class="Newbutton">撰写新邮件</a></td>
                            <td style="BACKGROUND-REPEAT: no-repeat; HEIGHT: 25px" id="bar5" align="center" width="90"
                                background='<% Response.Write(Session["FolderType"].ToString() == "4" ? "../../../images/maillistbutton2.gif" : "../../../images/maillistbutton1.gif"); %>'>
                                &nbsp;<a href='javascript:parent.navigatemf("外部邮件", "<%= Page.ResolveUrl("Index.aspx?FolderType=4") %>", "mail")' class="Newbutton">外部邮件</a></td>
                            <td style="HEIGHT: 25px" align="right"><font face="宋体">
                                <asp:DropDownList ID="listExtMail" runat="server" Visible="False"></asp:DropDownList>
                                <asp:Button ID="btnBeginReceive" runat="server" CssClass="redButtonCss" Text="开始接收" Visible="False"></asp:Button>
                                &nbsp;
										<asp:Button ID="btnExtPopSetup" runat="server" CssClass="redButtonCss" Text="外部邮箱设置" Visible="False"></asp:Button></font></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <asp:DataGrid ID="dgMailList" runat="server" Width="100%" OnItemDataBound="DataGrid_ItemDataBinding"
                        OnSortCommand="DataGrid_Sort" AllowSorting="True" CellPadding="3" BackColor="White" BorderWidth="1px"
                        BorderStyle="None" BorderColor="#93BEE2" AutoGenerateColumns="False" AllowPaging="True" PagerStyle-Mode="NumericPages"
                        PagerStyle-HorizontalAlign="Right" OnPageIndexChanged="DataGrid_PageChanged" DataKeyField="MailID"
                        PageSize="15">
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
                                    <asp:CheckBox ID="grpMailID" Checked="False" runat="server"></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="邮件主题">
                                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Font-Size="X-Small" HorizontalAlign="Left"></ItemStyle>
                                <ItemTemplate>
                                    <a href='ReadMail.aspx?MailId=<%# DataBinder.Eval(Container.DataItem,"MailID") %>&CurrentPageIndex=<%=CurrentPageIndex%>&FolderType=<%=Session["FolderType"].ToString()%>'>
                                        <%# (DataBinder.Eval(Container.DataItem,"MailSubject").ToString().Length>20)?DataBinder.Eval(Container.DataItem,"MailSubject").ToString().Substring(0,20)+"...":DataBinder.Eval(Container.DataItem,"MailSubject").ToString() %>
                                    </a>
                                    <%# DataBinder.Eval(Container.DataItem,"attnumber").ToString()=="0"?"":"<img src='../../../DataImages/attach.gif' border='0'>" %>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn DataField="MailSender" SortExpression="MailSender" HeaderText="发送者">
                                <HeaderStyle Width="100px"></HeaderStyle>
                                <ItemStyle Font-Size="X-Small"></ItemStyle>
                            </asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="接收者">
                                <HeaderStyle Width="100px"></HeaderStyle>
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# GetRealNameStr(DataBinder.Eval(Container, "DataItem.MailReceiver").ToString()) %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="所有接收者">
                                <HeaderStyle Width="100px"></HeaderStyle>
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# GetRealNameStr(DataBinder.Eval(Container, "DataItem.MailReceiverStr").ToString()) %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="是否已读">
                                <HeaderStyle Width="80px"></HeaderStyle>
                                <ItemStyle Font-Size="X-Small"></ItemStyle>
                                <ItemTemplate>
                                    <%# bool.Parse(DataBinder.Eval(Container.DataItem,"MailReadFlag").ToString())==false?"<img src='../../../Images/mailclose.gif'>":"<img src='../../../Images/mailopen.gif'>" %>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn DataField="ClassName" SortExpression="ClassName" HeaderText="所属项目">
                                <ItemStyle Font-Size="X-Small"></ItemStyle>
                            </asp:BoundColumn>
                            <asp:TemplateColumn SortExpression="attsize" HeaderText="大小(Kb)">
                                <ItemStyle Font-Size="X-Small"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# (DataBinder.Eval(Container, "DataItem.attsize")).ToString()!=""&&(DataBinder.Eval(Container, "DataItem.attsize")).ToString()!="0"?(DataBinder.Eval(Container, "DataItem.attsize")).ToString()+"":"1" %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn SortExpression="MailSendDate" HeaderText="日期">
                                <ItemStyle Font-Size="X-Small"></ItemStyle>
                                <ItemTemplate>
                                    <itemstyle font-size="X-Small"></itemstyle>
                                    <asp:Label runat="server" Text='<%# DateTime.Parse(DataBinder.Eval(Container, "DataItem.MailSendDate").ToString()).ToString("yyyy-MM-dd") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                        <PagerStyle Font-Size="12px" BorderColor="#E0E0E0" BorderStyle="Dotted" HorizontalAlign="Right"
                            BackColor="#E8F4FF" Mode="NumericPages"></PagerStyle>
                    </asp:DataGrid></td>
            </tr>
            <tr>
                <td valign="top">&nbsp;&nbsp;&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
