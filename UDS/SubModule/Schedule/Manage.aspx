<%@ Page language="c#" Codebehind="Manage.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.Schedule.Manage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>任务管理</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
    <link type="text/css" rel="Stylesheet" href="../../Css/redmond/jquery-ui-1.10.3.custom.min.css" />
</head>
<body topmargin="0" rightmargin="0" ms_positioning="GridLayout">
    <form id="Manage" method="post" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td valign="top" height="30">
                    <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr height="30">
                            <td class="GbText" width="20" background="../../Images/treetopbg.jpg" bgcolor="#c0d9e6"
                                align="right"><font color="#003366" size="3">
                                    <img height="16" src="../../DataImages/MyTask.gif" width="16"></font></td>
                            <td class="GbText" background="../../Images/treetopbg.jpg" bgcolor="#e8f4ff" width="60"
                                align="right">我的任务</td>
                            <td class="GbText" background="../../Images/treetopbg.jpg" bgcolor="#e8f4ff" align="right"><font face="宋体">&nbsp;&nbsp;&nbsp;</font></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        &nbsp;<table id="Table2" style="WIDTH: 765px; BORDER-COLLAPSE: collapse; HEIGHT: 546px" bordercolor="#003399"
            cellspacing="0" cellpadding="0" width="765" border="1" height="546">
            <tr>
                <td valign="top">
                    <font face="宋体">
                        <p>
                            <img alt="" src="../../Images/Schedule_logo.gif">
                            <asp:Label ID="Label9" runat="server" Height="22px" Width="109px" Font-Size="X-Small" Font-Bold="True">任务新增</asp:Label>
                        </p>
                        <table class="gbtext" id="Table3" style="BORDER-COLLAPSE: collapse" bordercolor="#003399"
                            cellspacing="0" cellpadding="0" width="500" border="1">
                            <tr>
                                <td style="WIDTH: 339px" width="339" height="26">&nbsp;<asp:Label ID="Label6" runat="server">任 务 主 题</asp:Label></td>
                                <td style="WIDTH: 187px">&nbsp;
										<asp:TextBox ID="txtSubject" runat="server" CssClass="input2" Width="99px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Font-Size="X-Small" ErrorMessage="*"
                                            ControlToValidate="txtSubject"></asp:RequiredFieldValidator></td>
                                <td style="WIDTH: 124px" width="124">&nbsp;<asp:Label ID="Label7" runat="server">创 建 人 员</asp:Label></td>
                                <td>&nbsp;
										<asp:Label ID="lblArrangedBy" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="WIDTH: 339px; HEIGHT: 42px" height="42">&nbsp;<asp:Label ID="Label2" runat="server">所 属 项 目</asp:Label></td>
                                <td style="WIDTH: 187px; HEIGHT: 42px">&nbsp;
                                    <input class="InputCss" style="WIDTH: 120px; HEIGHT: 22px" readonly type="text" size="14" value="<%=GetClassName() %>" name="txtProjectName"
                                        width="20">
                                    <input class="greenbuttoncss" style="WIDTH: 18px; HEIGHT: 17px" onclick="ProjectSelect()"
                                        type="button" value="▼"></td>
                                <td style="WIDTH: 124px; HEIGHT: 42px">&nbsp;<asp:Label ID="Label1" runat="server">任 务 属 性</asp:Label></td>
                                <td style="HEIGHT: 42px">
                                    <asp:RadioButtonList ID="rbAttribute" runat="server" Height="20px" Width="166px" Font-Size="X-Small"
                                        AutoPostBack="True" RepeatDirection="Horizontal">
                                    </asp:RadioButtonList></td>
                            </tr>
                            <tr>
                                <td style="WIDTH: 339px; HEIGHT: 36px" height="36">&nbsp;<asp:Label ID="Label3" runat="server">开 始 时 间</asp:Label></td>
                                <td style="WIDTH: 187px; HEIGHT: 36px">&nbsp;<asp:TextBox ClientIDMode="Static" ID="txtBeginDate" runat="server" CssClass="input2" Width="68px"></asp:TextBox>
                                    <asp:DropDownList ID="listBeginTime" runat="server"></asp:DropDownList></td>
                                <td style="WIDTH: 124px; HEIGHT: 36px">&nbsp;<asp:Label ID="Label4" runat="server">结 束 时 间</asp:Label></td>
                                <td style="HEIGHT: 36px">&nbsp;<asp:TextBox ClientIDMode="Static" ID="txtEndDate" runat="server" CssClass="input2" Width="68px"></asp:TextBox>
                                    <asp:DropDownList ID="listEndTime" runat="server"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="WIDTH: 339px" height="26"></td>
                                <td colspan="3">
                                    <asp:CheckBox ID="cbIsAllDay" runat="server" Text="全天事件" AutoPostBack="True"></asp:CheckBox><asp:CheckBox ID="cbIsRepeat" runat="server" Text="循环此时段" AutoPostBack="True"></asp:CheckBox>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="WIDTH: 339px" height="26">&nbsp;<asp:Label ID="lblType" runat="server">任 务 类 型</asp:Label></td>
                                <td colspan="3">
                                    <asp:RadioButtonList ID="rbType" runat="server" Width="285px" Font-Size="X-Small" RepeatDirection="Horizontal"
                                        RepeatColumns="4">
                                    </asp:RadioButtonList></td>
                            </tr>
                            <tr>
                                <td style="WIDTH: 339px" height="26">&nbsp;<asp:Label ID="Label5" runat="server">执 行 人 员</asp:Label></td>
                                <td colspan="3">
                                    <table class="gbtext" id="Table4" cellspacing="0" cellpadding="0" width="396" border="0"
                                        style="WIDTH: 396px; HEIGHT: 25px">
                                        <tr>
                                            <td align="center" width="80">
                                                <asp:CheckBox ID="cbNeedCo" runat="server" Text="需要协同" AutoPostBack="True"></asp:CheckBox></td>
                                            <td align="center" width="115" style="WIDTH: 115px">
                                                <asp:ListBox ID="listCooperator" runat="server" CssClass="inputcss" Height="80px" Width="120px"
                                                    Visible="False" SelectionMode="Multiple"></asp:ListBox></td>
                                            <td align="center" width="143" style="WIDTH: 143px">
                                                <asp:Button ID="btnAddUser" runat="server" CssClass="redbuttoncss" Text=">>" Visible="False"></asp:Button><br>
                                                <asp:CheckBox ID="cbRemind" runat="server" Text="站内短消息提醒" Font-Size="X-Small" Visible="False"></asp:CheckBox></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="WIDTH: 339px" height="26">&nbsp;<asp:Label ID="Label14" runat="server">提 醒 功 能</asp:Label></td>
                                <td colspan="3">&nbsp;提前
										<asp:DropDownList ID="listAheadMin" runat="server">
                                            <asp:ListItem Value="10分钟" Selected="True">10分钟</asp:ListItem>
                                            <asp:ListItem Value="15分钟">15分钟</asp:ListItem>
                                            <asp:ListItem Value="20分钟">20分钟</asp:ListItem>
                                            <asp:ListItem Value="30分钟">30分钟</asp:ListItem>
                                            <asp:ListItem Value="60分钟">60分钟</asp:ListItem>
                                        </asp:DropDownList>提醒</td>
                            </tr>
                            <tr>
                                <td style="WIDTH: 339px">&nbsp;<asp:Label ID="Label10" runat="server">任 务 详 情</asp:Label></td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtDetail" runat="server" Height="120px" Width="400px" TextMode="MultiLine"></asp:TextBox></td>
                            </tr>
                        </table>
                        <p>
                    </font><font face="宋体">
                        <asp:Label ID="lblMsg" runat="server" Font-Size="Smaller" ForeColor="Red"></asp:Label><input
                            class="InputCss" style="WIDTH: 29px; HEIGHT: 22px" type="hidden" size="1"
                            value="<%=ClassID %>" name="hdnProjectID"
                            designtimedragdrop="490" width="20"><input type="hidden"
                                value="<%=UnameStr%>" name="unamestr"></font> </P>
						<p>
                            <font face="宋体">
                                <asp:Button ID="btnSubmit" runat="server" Width="80px" Text="提      交" Height="22px" CssClass="blueButtonCss"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;
								<asp:Button ID="btnCheck" runat="server" Width="80px" Text="检测冲突" Height="22px" CssClass="blueButtonCss"></asp:Button></font>
                    </p>
                </td>
                <td valign="top">
                    <input type="hidden" value="schedule" name="actflag"><iframe id="DayTaskFrm" frameborder="0" width="100%" scrolling="auto" height="100%" runat="server"
                        style="WIDTH: 91.48%; HEIGHT: 480px"> </iframe>
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.ui.datepicker-zh-CN.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#txtBeginDate").datepicker({
                onClose: function (selectedDate) {
                    $("#txtEndDate").datepicker("option", "minDate", selectedDate);
                }
            });

            $("#txtEndDate").datepicker({
                onClose: function (selectedDate) {
                    $("#txtBeginDate").datepicker("option", "maxDate", selectedDate);
                }
            });
        });

        function ProjectSelect() {
            var ret;
            ret = window.showModalDialog("../UnitiveDocument/Mail/TreeView.aspx", window, "dialogHeight:400px;dialogWidth:300px;center:Yes;Help:No;Resizable:No;Status:Yes;Scroll:auto;Status:no;");
            if (ret > 0)
                return false;
        }
    </script>
</body>
</html>
