<%@ Page language="c#" Codebehind="ClientInfo.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.CM.Stat.ClientInfo" %>
<%@ Import namespace="System"%>
<%@ Import namespace="System.Data"  %>
<%@ Import namespace="System.Data.SqlClient"  %>
<%@ Import namespace="UDS.Components"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>查询</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
    <link href="../../../Css/redmond/jquery-ui-1.10.3.custom.min.css" type="text/css" rel="Stylesheet" />
    <script runat="server">
        private string GetUpdateTime(DataRow[] row)
        {
            if (row.Length != 0)
            {
                return (row[0]["UpdateTime"].ToString());
            }
            else
                return ("");
        }
        private string GetCurStatus(string curstatus)
        {
            switch (curstatus.Split(',')[0].ToString())
            {
                case "trace":
                    return ("跟踪");
                    break;
                case "boot":
                    return ("启动");
                    break;
                case "commend":
                    return ("产品推荐");
                    break;
                case "requirement":
                    return ("需求定义");
                    break;
                case "submit":
                    return ("方案提交");
                    break;
                case "negotiate":
                    return ("商务谈判");
                    break;
                case "actualize":
                    return ("项目实施");
                    break;
                case "traceservice":
                    return ("跟踪服务");
                    break;
                case "last":
                    return ("收尾款");
                    break;

            }
            return ("");
        }
        private string GetAddMan(DataRow[] row)
        {
            if (row.Length != 0)
            {
                return (row[0]["realname"].ToString());
            }
            else
                return ("");
        }
    </script>
</head>
<body leftmargin="0" topmargin="0">
    <form id="ClientInfo" method="post" runat="server">
        <font face="宋体">
            <table bordercolor="#111111" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr height="30">
                    <td class="GbText" width="20" background="../../../Images/treetopbg.jpg" bgcolor="#c0d9e6"
                        align="right"><font color="#003366" size="3">
                            <img height="16" src="../../../DataImages/myLinkman.gif" width="16"></font></td>
                    <td class="GbText" background="../../../Images/treetopbg.jpg" bgcolor="#e8f4ff" width="75"
                        align="right" style="WIDTH: 75px">客户管理</td>
                    <td class="GbText" background="../../../Images/treetopbg.jpg" bgcolor="#e8f4ff" align="left">-查询&nbsp;</td>
                </tr>
            </table>
            <table id="Table1" bordercolor="#93bee2" cellspacing="0" cellpadding="0" width="100%" border="1"
                style="BORDER-COLLAPSE: collapse" class="GbText">
                <tr>
                    <td style="WIDTH: 683px">查询条件：&nbsp;&nbsp;
							<asp:DropDownList ClientIDMode="Static" ID="ddl_search" runat="server" AutoPostBack="True" Width="130px">
                                <asp:ListItem Value="客户名称">客户名称</asp:ListItem>
                                <asp:ListItem Value="客户分类">客户分类</asp:ListItem>
                                <asp:ListItem Value="客户编号">客户编号</asp:ListItem>
                                <asp:ListItem Value="联系人">联系人</asp:ListItem>
                                <asp:ListItem Value="电话">电话</asp:ListItem>
                                <asp:ListItem Value="所处行业">所处行业</asp:ListItem>
                                <asp:ListItem Value="企业性质">企业性质</asp:ListItem>
                                <asp:ListItem Value="客户来源">客户来源</asp:ListItem>
                                <asp:ListItem Value="销售人员">销售人员</asp:ListItem>
                                <asp:ListItem Value="添加日期">添加日期</asp:ListItem>
                                <asp:ListItem Value="本周新增客户">本周新增客户</asp:ListItem>
                                <asp:ListItem Value="本月新增客户">本月新增客户</asp:ListItem>
                            </asp:DropDownList><asp:TextBox ClientIDMode="Static" ID="tbx_searchvalue" runat="server" CssClass="inputcss"></asp:TextBox>&nbsp;</td>
                    <td>查询范围
							<asp:DropDownList ID="ddl_SearchBound" runat="server">
                                <asp:ListItem Value="1">本人与下属</asp:ListItem>
                                <asp:ListItem Value="2">仅本人</asp:ListItem>
                                <asp:ListItem Value="3">仅下属</asp:ListItem>
                            </asp:DropDownList></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:RadioButtonList ID="rbl_searchvalue" runat="server" Visible="False"></asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btn_addsearch" runat="server" Text="添加条件" CssClass="redbuttoncss"></asp:Button>&nbsp;
							<asp:Button ID="btn_Del" runat="server" Text="删除条件" CssClass="redbuttoncss"></asp:Button></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:ListBox ID="lbx_search" runat="server" Height="95px" Width="496px"></asp:ListBox><br>
                        <asp:Button ID="btn_OK" runat="server" Text="查询" CssClass="redbuttoncss"></asp:Button></td>
                </tr>
                <tr>
                    <td colspan="2" height="30">查询结果：共查到
							<asp:Literal ID="ltl_Client" runat="server"></asp:Literal>位符合条件的客户</td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                </tr>
            </table>
            <asp:DataGrid ID="dgrd_clientlist" runat="server" Width="100%" AllowSorting="True" AllowPaging="True"
                AutoGenerateColumns="False">
                <HeaderStyle ForeColor="White" BackColor="#337FB2"></HeaderStyle>
                <Columns>
                    <asp:TemplateColumn></asp:TemplateColumn>
                    <asp:BoundColumn DataField="ID" SortExpression="ID" HeaderText="编号"></asp:BoundColumn>
                    <asp:TemplateColumn SortExpression="Name" HeaderText="客户名称">
                        <ItemTemplate>
                            <asp:HyperLink ID="Hyperlink1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Name") %>' NAME="Hyperlink1" Target="_blank" NavigateUrl='<%# "../Client.aspx?ClientID="+DataBinder.Eval(Container,"DataItem.ID")%>'>
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="Linkman" SortExpression="Linkman" HeaderText="联系人"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Linkman_Telephone" SortExpression="Linkman_Telephone" HeaderText="电话"></asp:BoundColumn>
                    <asp:TemplateColumn SortExpression="UpdateTime" HeaderText="更新时间">
                        <ItemTemplate>
                            <asp:Label ID="lbl_UpdateTime" runat="server">
									<%# DataBinder.Eval(Container,"DataItem.UpdateTime")%>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="目前状态">
                        <HeaderStyle Font-Size="X-Small"></HeaderStyle>
                        <ItemTemplate>
                            <asp:HyperLink ID="Hyperlink2" runat="server" Text='<%# GetCurStatus(DataBinder.Eval(Container,"DataItem.Curstatus").ToString()) %>' NavigateUrl='<%# "../../../SubModule/CM/ClientContact_thisWeek.aspx?ClientID="+DataBinder.Eval(Container,"DataItem.ID")%>' NAME="Hyperlink2" Target="_blank">
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn SortExpression="AddMan" HeaderText="添加人">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# GetAddMan(((DataRowView)Container.DataItem).Row.GetChildRows("ClientAddMan_Staff")) %>' ID="Label1">
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
                <PagerStyle NextPageText="上一页" PrevPageText="下一页" HorizontalAlign="Right" Mode="NumericPages"></PagerStyle>
            </asp:DataGrid>
        </font>
    </form>
    <script language="javascript" type="text/javascript" src="../../../js/jquery-1.9.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="../../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script language="javascript" type="text/javascript" src="../../../js/jquery.ui.datepicker-zh-CN.js"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            if ("添加日期" == $("#ddl_search option:selected").text()) {
                $("#tbx_searchvalue").datepicker();
            }
        });
    </script>
</body>
</html>
