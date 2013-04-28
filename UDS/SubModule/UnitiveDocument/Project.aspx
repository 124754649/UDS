<%@ Page Language="c#" CodeBehind="Project.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.UnitiveDocument.Project" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>Project</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
    <script language="javascript">
        function MoveToTeam(a) {
            var ret;
            ret = window.showModalDialog("MoveTeam/TreeView.aspx?FromID=<%=classID%>", window, "dialogHeight:400px;dialogWidth:300px;center:Yes;Help:No;Resizable:No;Status:Yes;Scroll:auto;Status:no;");


	if (ret > 0)
	    //	frmAddRight.ObjID.value = ret;
	    return false;
}
    </script>
    <script language="JavaScript" src="../../Css/tr.js"></script>
    <style type="text/css">
        TD {
            FONT-SIZE: 9pt;
        }
    </style>
</head>
<body>
    <div id="WorkArea">
        <form id="Project" method="post" runat="server">
            <table cellspacing="0" cellpadding="1" width="100%" align="right" border="0">
                <tbody>
                    <tr>
                        <td class="text" valign="top" width="100%" height="57">
                            <table class="GbText" height="68" cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                    <td width="60">
                                        <img height="68" src="../../Images/p_leftbg.gif" width="60"></td>
                                    <td align="middle" width="200" background="../../Images/p_leftcenterbg.gif">
                                        <table height="66" cellspacing="0" cellpadding="0" width="100%" border="0">
                                            <tr>
                                                <td align="middle"><strong><font size="4">
                                                    <asp:Label ID="lblClassName" runat="server" BorderColor="Transparent" Font-Size="Medium" Font-Names="楷体_GB2312"></asp:Label></font></strong></td>
                                            </tr>
                                            <tr>
                                                <td align="middle">
                                                    <asp:Label ID="lblMember" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="43" background="../../Images/p_leftrightrbg.gif">
                                        <table height="66" cellspacing="0" cellpadding="0" width="100%" border="0">
                                            <tr>
                                                <td align="middle"><a href="ProjectDetail.aspx?classID=<%=classID%>">
                                                    <img height="19" src="../../Images/p_more.gif" width="22" border="0"></a></td>
                                            </tr>
                                            <tr>
                                                <td align="middle"><a href="ProjectDetail.aspx?classID=<%=classID%>">
                                                    <img height="19" src="../../Images/p_more2.gif" width="20" border="0"></a></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="middle" background="../../Images/p_centerbg.gif">
                                        <table height="66" cellspacing="0" cellpadding="0" width="96%" align="left" border="0">
                                            <tr>
                                                <td valign="center" align="middle" width="22">
                                                    <asp:Image ID="imgComposeMail" runat="server" ImageUrl="../../Images/icon/284.GIF" Height="16px" Width="16px"></asp:Image></td>
                                                <td valign="center"><a href="Mail/Compose.aspx?classID=<%=classID%>">
                                                    <asp:Label ID="lblComposeMail" runat="server" Font-Size="X-Small"> 撰写邮件</asp:Label></a></td>
                                                <td valign="center" align="middle" width="22">
                                                    <asp:Image ID="imgDeliveryDoc" runat="server" ImageUrl="../../Images/icon/278.GIF" Height="16px" Width="16px"></asp:Image></td>
                                                <td valign="center"><a href="Switch.aspx?Action=0&amp;ClassID=<%=classID%>">
                                                    <asp:Label ID="lblDeliveryDoc" runat="server" Font-Size="X-Small">投递文档</asp:Label></a><a href="MemberListView.aspx?TeamID=<%=classID%>"></a></td>
                                                <td valign="center" align="middle" width="22">
                                                    <asp:Image ID="imgManageDirectory" runat="server" ImageUrl="../../Images/icon/001.GIF" Height="16px" Width="16px"></asp:Image>&nbsp;</td>
                                                <td valign="center"><a href="oClassNode.aspx?Action=1&amp;classID=<%=classID%>">
                                                    <asp:Label ID="lblManageDirectory" runat="server" Font-Size="X-Small"> 目录管理</asp:Label></a></td>
                                                <td valign="center" align="middle" width="22">
                                                    <asp:Image ID="imgManageProject" runat="server" ImageUrl="../../Images/icon/273.GIF" Height="16px" Width="16px"></asp:Image></td>
                                                <td valign="center"><a href="ManageProject.aspx?Action=3&amp;classID=<%=classID%>">
                                                    <asp:Label ID="lblManageProject" runat="server" Font-Size="X-Small"> 管理项目</asp:Label></a></td>
                                            </tr>
                                            <tr>
                                                <td valign="center" align="middle">
                                                    <asp:Image ID="imgSubscribe" runat="server" ImageUrl="../../Images/Icon/mydoc.gif" Height="16px" Width="16px"></asp:Image></td>
                                                <td valign="center"><a href="Project.aspx?classID=<%=classID%>&amp;Action=5">
                                                    <asp:Label ID="lblSubscribe" runat="server" Font-Size="X-Small"> 订阅项目</asp:Label></a></td>
                                                <td valign="center" align="middle">
                                                    <asp:Image ID="imgManagePermission" runat="server" ImageUrl="../../Images/icon/118.gif" Height="16px" Width="16px"></asp:Image></td>
                                                <td valign="center"><a
                                                    href="../AssignRule/RightListView.aspx?ObjID=<%=classID%>&amp;displayType=1">
                                                    <asp:Label ID="lblManagePermission" runat="server" Font-Size="X-Small"> 权限管理</asp:Label></a><a href="Switch.aspx?Action=0&amp;ClassID=<%=classID%>"></a></td>
                                                <td valign="center" align="middle">
                                                    <asp:Image ID="imgShowMember" runat="server" ImageUrl="../../Images/admin_ico2.gif" Height="16px" Width="16px"></asp:Image></td>
                                                <td valign="center"><a href="MemberListView.aspx?TeamID=<%=classID%>">
                                                    <asp:Label ID="lblShowMember" runat="server" Font-Size="X-Small">显示组员</asp:Label></a><a onclick="MoveToTeam()" href="#"></a></td>
                                                <td valign="center" align="middle">
                                                    <asp:Image ID="imgRemove" runat="server" ImageUrl="../../Images/Icon/03.gif" Height="16px" Width="16px"></asp:Image>&nbsp;</td>
                                                <td valign="center"><a onclick="MoveToTeam()" href="#">
                                                    <asp:Label ID="lblRemove" runat="server" Font-Size="X-Small"> 项目移动</asp:Label></a><a href="../AssignRule/RightListView.aspx?ObjID=<%=classID%>&amp;displayType=1"></a></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" width="84">
                                        <img height="68" src="../../Images/p_rightbg.gif" width="84"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="tr1" runat="server">
                        <td class="text" valign="top" width="100%" height="120">
                            <img src="../../Images/line1.gif" runat="server" id="line1"><br>
                            <a href="Document/Listview.aspx?ClassID=<%=classID%>">
                                <img id="IMG1" src="../../Images/newmain_r4_c1.jpg" border="0" runat="server"></a>&nbsp;<font face="宋体">
                                    <br>
                                    <asp:DataGrid ID="dgDocList" runat="server" BorderColor="#E8F4FF" Font-Names="Arial" Width="100%" GridLines="Horizontal" CellPadding="2" BorderWidth="1px" AllowSorting="True" AutoGenerateColumns="False" AllowPaging="True" PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right" DataKeyField="DocID" PageSize="5">
                                        <ItemStyle Font-Size="X-Small" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                        <HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Height="20px" VerticalAlign="Middle" BackColor="#E8F4FF"></HeaderStyle>
                                        <FooterStyle Font-Size="XX-Small" HorizontalAlign="Center" Height="10px" VerticalAlign="Bottom"></FooterStyle>
                                        <Columns>
                                            <asp:TemplateColumn HeaderText="文档标题">
                                                <HeaderStyle HorizontalAlign="Left" Width="30%"></HeaderStyle>
                                                <ItemStyle Font-Size="X-Small" HorizontalAlign="Left"></ItemStyle>
                                                <ItemTemplate>
                                                    <a href='Document/BrowseDocument.aspx?DocId=<%# DataBinder.Eval(Container.DataItem,"DocID") %>'>
                                                        <%# (DataBinder.Eval(Container.DataItem,"DocTitle").ToString().Length>20)?DataBinder.Eval(Container.DataItem,"DocTitle").ToString().Substring(0,20)+"...":DataBinder.Eval(Container.DataItem,"DocTitle").ToString() %>
                                                    </a>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="审批人">
                                                <HeaderStyle Width="15%"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# GetRealName(DataBinder.Eval(Container, "DataItem.DocApprover").ToString()) %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="上传人">
                                                <HeaderStyle Width="15%"></HeaderStyle>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# GetRealName(DataBinder.Eval(Container, "DataItem.DocAddedBy").ToString()) %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="DocViewedTimes" HeaderText="浏览次数">
                                                <HeaderStyle HorizontalAlign="Left" Width="15%"></HeaderStyle>
                                                <ItemStyle Font-Size="X-Small" HorizontalAlign="Left"></ItemStyle>
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="上传日期">
                                                <HeaderStyle HorizontalAlign="Right" Width="20%"></HeaderStyle>
                                                <ItemStyle Font-Size="X-Small" HorizontalAlign="Right"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# DateTime.Parse(DataBinder.Eval(Container, "DataItem.DocAddedDate").ToString()).ToString("yyyy-MM-dd") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                        </Columns>
                                        <PagerStyle Visible="False" Font-Size="12px" BorderColor="#E0E0E0" BorderStyle="Dotted" HorizontalAlign="Right" PageButtonCount="5" Mode="NumericPages"></PagerStyle>
                                    </asp:DataGrid></font></td>
                    </tr>
                    <tr id="tr2" runat="server">
                        <td class="text" valign="bottom" width="100%" height="120">
                            <img src="../../Images/line1.gif"><br>
                            <a href="Mail/Index.aspx?classID=<%=classID%>">
                                <img id="IMG2" src="../../Images/newmain_r4_c2.jpg" border="0" runat="server"></a>
                            &nbsp;
							    <asp:DataGrid ID="dgMailList" runat="server" BorderColor="#E8F4FF" Font-Names="Arial" Width="100%" GridLines="Horizontal" CellPadding="2" BorderWidth="1px" AllowSorting="True" AutoGenerateColumns="False" AllowPaging="True" PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right" DataKeyField="MailID" PageSize="5">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                    <HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Height="10px" VerticalAlign="Top" BackColor="#E8F4FF"></HeaderStyle>
                                    <FooterStyle Font-Size="XX-Small" HorizontalAlign="Center" Height="10px" VerticalAlign="Bottom"></FooterStyle>
                                    <Columns>
                                        <asp:TemplateColumn HeaderText="邮件主题">
                                            <HeaderStyle HorizontalAlign="Left" Width="35%"></HeaderStyle>
                                            <ItemStyle Font-Size="X-Small" HorizontalAlign="Left"></ItemStyle>
                                            <ItemTemplate>
                                                <a href='Mail/ReadMail.aspx?MailId=<%# DataBinder.Eval(Container.DataItem,"MailID") %>'>
                                                    <%# (DataBinder.Eval(Container.DataItem,"MailSubject").ToString().Length>30)?DataBinder.Eval(Container.DataItem,"MailSubject").ToString().Substring(0,30)+"...":DataBinder.Eval(Container.DataItem,"MailSubject").ToString() %>
                                                </a>
                                                <%# DataBinder.Eval(Container.DataItem,"attnumber").ToString()=="0"?"":"<img src='../../DataImages/attach.gif' border='0'>" %>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="MailSender" HeaderText="发送者">
                                            <HeaderStyle HorizontalAlign="Left" Width="15%"></HeaderStyle>
                                            <ItemStyle Font-Size="X-Small" HorizontalAlign="Left"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="MailReceiver" HeaderText="接收者">
                                            <HeaderStyle HorizontalAlign="Left" Width="15%"></HeaderStyle>
                                            <ItemStyle Font-Size="X-Small" HorizontalAlign="Left"></ItemStyle>
                                            <FooterStyle Font-Size="X-Small"></FooterStyle>
                                        </asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="是否已读">
                                            <HeaderStyle HorizontalAlign="Left" Width="15%"></HeaderStyle>
                                            <ItemStyle Font-Size="X-Small" HorizontalAlign="Left"></ItemStyle>
                                            <ItemTemplate>
                                                <%# (string)DataBinder.Eval(Container.DataItem,"MailReadFlag")=="False"?"<img src='../../Images/mailclose.gif'>":"<img src='../../Images/mailopen.gif'>" %>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="接收日期">
                                            <HeaderStyle HorizontalAlign="Right" Width="20%"></HeaderStyle>
                                            <ItemStyle Font-Size="X-Small" HorizontalAlign="Right"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# DateTime.Parse(DataBinder.Eval(Container, "DataItem.MailSendDate").ToString()).ToString("yyyy-MM-dd") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                    </Columns>
                                    <PagerStyle Visible="False" Font-Size="12px" BorderColor="#E0E0E0" BorderStyle="Dotted" HorizontalAlign="Right" PageButtonCount="5" Mode="NumericPages"></PagerStyle>
                                </asp:DataGrid>
                            <p></p>
                            <table id="tblMailList" style="BORDER-COLLAPSE: collapse" bordercolor="#cccccc" height="36" cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">
                            </table>
                        </td>
                    </tr>
                    <tr id="tr3" runat="server">
                        <td class="text" valign="bottom" width="100%" height="120">
                            <img id="line2" src="../../Images/line1.gif" runat="server"><br>
                            <a href="Approve/ListView.aspx?ClassID=<%=classID%>&amp;DisplayType=1">
                                <img id="IMG3" src="../../Images/newmain_r9_c2.jpg" border="0" runat="server"></a>&nbsp;
							    <a href="#"></a>
                            <asp:Label ID="lblApp" runat="server" Visible="False">审批文档</asp:Label><br>
                            <asp:DataGrid ID="dgAppDocList" runat="server" BorderColor="#E8F4FF" Font-Names="Arial" Width="100%" CellPadding="2" BorderWidth="1px" AllowSorting="True" AutoGenerateColumns="False" AllowPaging="True" PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right" DataKeyField="DocID" PageSize="5">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                <HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Height="20px" VerticalAlign="Middle" BackColor="#E8F4FF"></HeaderStyle>
                                <FooterStyle Font-Size="XX-Small" HorizontalAlign="Center" Height="10px" VerticalAlign="Bottom"></FooterStyle>
                                <Columns>
                                    <asp:TemplateColumn HeaderText="文档标题">
                                        <HeaderStyle HorizontalAlign="Left" Width="35%"></HeaderStyle>
                                        <ItemStyle Font-Size="X-Small" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <a href='Document/BrowseDocument.aspx?DocId=<%# DataBinder.Eval(Container.DataItem,"DocID") %>'>
                                                <%# (DataBinder.Eval(Container.DataItem,"DocTitle").ToString().Length>20)?DataBinder.Eval(Container.DataItem,"DocTitle").ToString().Substring(0,20)+"...":DataBinder.Eval(Container.DataItem,"DocTitle").ToString() %>
                                            </a>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="DocAddedBy" HeaderText="上传人">
                                        <HeaderStyle HorizontalAlign="Left" Width="20%"></HeaderStyle>
                                        <ItemStyle Font-Size="X-Small" HorizontalAlign="Left"></ItemStyle>
                                        <FooterStyle Font-Size="X-Small"></FooterStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="DocViewedTimes" HeaderText="浏览次数">
                                        <HeaderStyle HorizontalAlign="Left" Width="20%"></HeaderStyle>
                                        <ItemStyle Font-Size="X-Small" HorizontalAlign="Left"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:TemplateColumn HeaderText="上传日期">
                                        <HeaderStyle HorizontalAlign="Right" Width="25%"></HeaderStyle>
                                        <ItemStyle Font-Size="X-Small" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# DateTime.Parse(DataBinder.Eval(Container, "DataItem.DocAddedDate").ToString()).ToString("yyyy-MM-dd") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                                <PagerStyle Visible="False" Font-Size="12px" BorderColor="#E0E0E0" BorderStyle="Dotted" HorizontalAlign="Right" PageButtonCount="5" Mode="NumericPages"></PagerStyle>
                            </asp:DataGrid></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
</body>
</html>
