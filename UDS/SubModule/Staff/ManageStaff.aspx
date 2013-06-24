<%@ Page language="c#" Codebehind="ManageStaff.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.Staff.ManageStaff" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>ManageStaff</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <script type="text/javascript" language="javascript">

        var ball1 = new Image();
        var ball2 = new Image();
        ball1.src = 'images/ball1.gif';
        ball2.src = 'images/ball2.gif';

        var active = new Image();
        var nonactive = new Image();
        active.src = '../../images/maillistbutton2.gif';
        nonactive.src = '../../images/maillistbutton1.gif';

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
    <link href="../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="WorkArea" method="post" runat="server">
        <table id="Table1" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td valign="top">
                    <table style="border-color: #111111; height: 1px" cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tboday>
                            <tr style="height:30px">
                                <td class="GbText" width="20" background="../../Images/treetopbg.jpg" bgcolor="#c0d9e6" align="right"><font color="#003366" size="3">
                                    <img height="16" src="../../DataImages/staff.gif" width="16"></font></td>
                                <td class="GbText" background="../../Images/treetopbg.jpg" bgcolor="#e8f4ff" width="60"
                                    align="right"><font color="#006699">人员管理</font></td>
                                <td class="GbText" background="../../Images/treetopbg.jpg" bgcolor="#e8f4ff" align="right" width="85%"></td>
                            </tr>
                        </tboday>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="gbtext" id="Table2" cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td align="center" width="90" background='../../images/maillistbutton<%Response.Write(GetSelectImage("1", "2", DisplayType, 0));%>.gif' height="24">
                                <asp:LinkButton ID="lbOnline" runat="server" CssClass="Newbutton">在职员工</asp:LinkButton></td>
                            <td align="center" width="90" background='../../images/maillistbutton<%Response.Write(GetSelectImage("1", "2", DisplayType, 1));%>.gif' height="24">
                                <asp:LinkButton ID="lbOffLine" runat="server" CssClass="Newbutton">离职员工</asp:LinkButton></td>
                            <td align="right">
                                <asp:CheckBox ID="cbRemind" runat="server" Text="提醒公司全体员工" Width="240px" Font-Size="X-Small" Height="16px"></asp:CheckBox>&nbsp;&nbsp;&nbsp;<asp:Button ID="cmdNewStaff" runat="server" Text="新员工" CssClass="redbuttoncss"></asp:Button>
                                <asp:Button ID="cmdDimission" runat="server" Text="离职" CssClass="redbuttoncss"></asp:Button><asp:Button ID="cmdRehab" runat="server" Text="复职" CssClass="redbuttoncss"></asp:Button>
                                <asp:Button ID="cmdChangePosition" runat="server" Text="调职" CssClass="redbuttoncss"></asp:Button>
                                <asp:Button ID="btn_Search" runat="server" CssClass="redbuttoncss" Text="查询"></asp:Button></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DataGrid ID="dbStaffList" runat="server" OnPageIndexChanged="DataGrid_PageChanged" BorderColor="#93BEE2"
                        BorderStyle="None" BorderWidth="1px" BackColor="White" CellPadding="3" PageSize="15" AllowPaging="True"
                        AutoGenerateColumns="False" DataKeyField="Staff_ID" Width="100%">
                        <SelectedItemStyle Font-Bold="True" ForeColor="#CCFF99" BackColor="#009999"></SelectedItemStyle>
                        <AlternatingItemStyle Font-Size="X-Small" BackColor="#E8F4FF"></AlternatingItemStyle>
                        <ItemStyle Font-Size="X-Small"></ItemStyle>
                        <HeaderStyle Font-Size="X-Small" Font-Bold="True" ForeColor="White" BackColor="#337FB2"></HeaderStyle>
                        <FooterStyle Font-Size="X-Small" HorizontalAlign="Right" BackColor="#E8F4FF"></FooterStyle>
                        <Columns>
                            <asp:TemplateColumn HeaderText="ID">
                                <HeaderStyle Width="20px"></HeaderStyle>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkStaff_ID" runat="server"></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:HyperLinkColumn Text="真实姓名" DataNavigateUrlField="staff_id" DataNavigateUrlFormatString="../position/NewStaff.aspx?StaffID={0}&amp;ReturnPage=1"
                                DataTextField="RealName" HeaderText="真实姓名">
                                <HeaderStyle Width="100px"></HeaderStyle>
                            </asp:HyperLinkColumn>
                            <asp:BoundColumn DataField="Mobile" HeaderText="手机">
                                <HeaderStyle Width="60px"></HeaderStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="Age" HeaderText="年龄">
                                <HeaderStyle HorizontalAlign="Center" Width="30px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="SexName" HeaderText="性别">
                                <HeaderStyle HorizontalAlign="Center" Width="30px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="Email" HeaderText="EMAIL">
                                <HeaderStyle Width="100px"></HeaderStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="position_Name" HeaderText="所在部门">
                                <HeaderStyle Width="150px"></HeaderStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="RQ" HeaderText="注册日期">
                                <HeaderStyle HorizontalAlign="Right" Width="80px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                            </asp:BoundColumn>
                        </Columns>
                        <PagerStyle Font-Size="X-Small" HorizontalAlign="left" BackColor="#E8F4FF" Mode="NumericPages"></PagerStyle>
                    </asp:DataGrid></td>
            </tr>
            <tr>
                <td></td>
            </tr>
        </table>
    </form>
</body>
</html>
