<%@ Import namespace="UDS.Components"  %>
<%@ Import namespace="System.Data.SqlClient"  %>
<%@ Import namespace="System.Data"  %>
<%@ Import namespace="System"%>
<%@ Page language="c#" Codebehind="ClientListView.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.CM.ClientListView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>客户列表</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
    <script runat="server" id="Script1">
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

            switch (curstatus.Split(',')[0])
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
                return (row[0]["Realname"].ToString());
            }
            else
                return ("");
        }
        private string GetLinkmanTel(DataRow[] row)
        {
            if (row.Length != 0)
            {
                return (row[0]["Mobile"].ToString());
            }
            else
                return ("");
        }
        private string GetClientNameUrl(string clientid)
        {
            if (ViewState["NowTab"].ToString() == "client")
            {
                return ("Client.aspx?ClientID=" + clientid);
            }
            else
            {
                return ("#");
            }

        }
        private string GetContactUrl(string clientid)
        {
            if ((ViewState["NowTab"].ToString() == "client") && (Session["cm_permission"] == "administrator"))
            {
                return ("ClientContact_thisWeek.aspx?ClientID=" + clientid);
            }
            else
            {
                return ("ClientHistoryContact.aspx?ClientID=" + clientid);
            }
        }
    </script>
</head>
<body leftmargin="0" topmargin="0">
    <form id="ClientListView" method="post" runat="server">
        <font face="宋体">
            <table class="gbtext" id="Table1" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td valign="top" height="38">
                        <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0"
                            id="Table2">
                            <tr height="30">
                                <td class="GbText" align="right" width="20" background="../../Images/treetopbg.jpg"
                                    bgcolor="#c0d9e6"><font color="#003366" size="3">
                                        <img height="16" src="../../DataImages/ClientManage.gif" width="16"></font></td>
                                <td class="GbText" align="right" width="60" background="../../Images/treetopbg.jpg"
                                    bgcolor="#e8f4ff"><font color="#006699">我的客户</A></font></td>
                                <td class="GbText" style="WIDTH: 146px; HEIGHT: 20px" align="right" background="../../Images/treetopbg.jpg"
                                    bgcolor="#e8f4ff"><font color="#006699">查看视角</A>
											<asp:DropDownList ID="ddl_MySubordinate" runat="server" AutoPostBack="True"></asp:DropDownList>&nbsp;</font></td>
                                <td class="GbText" align="right" background="../../Images/treetopbg.jpg" bgcolor="#e8f4ff"><font face="宋体">
                                    <asp:Panel ID="pnl" runat="server" Height="8px" Width="499px" Visible="true">
                                        <input id="Button2" class="redbuttoncss" name="Button1" onclick="window.open('Stat/Contact_Client.aspx', '_blank')" type="button" value=" 汇 总">&nbsp;<input id="Button1" class="redbuttoncss" name="Button1" onclick="window.open('Search/ClientInfo.aspx', '_blank')" type="button" value=" 查 询">&nbsp;<input class="redbuttoncss" onclick="selectAll()" type="button" value="全 选">
                                        <asp:Button ID="btn_Del" runat="server" CssClass="redbuttoncss" Text="删 除" OnClick="btn_Del_Click" />
                                        <asp:Button ID="btn_AddClient" runat="server" CssClass="redbuttoncss" Text="添加客户" />
                                        <input type="button" class="redButtonCss" onclick='parent.navigatemf("添加客户", "<%= Page.ResolveUrl("Client.aspx") %>", "CM")' value="添加客户" />
                                        <asp:Button ID="btn_AddLinkman" runat="server" CssClass="redbuttoncss" Text="添加联络人" />
                                        <input type="button" class="redButtonCss" onclick="getSelectedIDs(1)" value="添加联络人" />
                                        <asp:Button ID="btn_AddContact" runat="server" CssClass="redbuttoncss" Text="添加接触" />
                                        <input type="button" class="redButtonCss" onclick="getSelectedIDs(2)" value="添加接触" />
                                        </input></input></input></asp:Panel>
                                </font></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="gbtext" id="Table3" cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                                <td id="TD1" valign="middle" align="center" width="90" background="../../images/maillistbutton2.gif"
                                    runat="server">&nbsp;<asp:LinkButton ID="lbtn_MyClient" runat="server" CssClass="Newbutton">我的客户</asp:LinkButton><a href="ClientListView.aspx"></a></td>
                                <td id="TD2" valign="middle" align="center" width="90" background="../../images/maillistbutton1.gif"
                                    runat="server">&nbsp;<asp:LinkButton ID="lbtn_coClient" runat="server" CssClass="Newbutton">我的协同客户</asp:LinkButton></td>
                                <td style="HEIGHT: 25px" align="right">&nbsp;</td>
                                <td style="HEIGHT: 25px" align="right">
                                    <asp:Panel ID="pnl_ClientInfo" runat="server">
                                        &nbsp;共 
            <asp:Literal ID="ltl_ClientCount" runat="server"></asp:Literal>位客户, 
            一个月内共接触 
                                        <asp:Literal ID="ltl_ContactTimes" runat="server"></asp:Literal>次 
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataGrid ID="dgd_Client" runat="server" Width="100%" AutoGenerateColumns="False" AllowSorting="True"
                            AllowPaging="True" BorderColor="#93BEE2" BorderWidth="1px" CellPadding="3" PageSize="15" DataKeyField="ID">
                            <AlternatingItemStyle BackColor="#E8F4FF"></AlternatingItemStyle>
                            <ItemStyle Font-Size="X-Small"></ItemStyle>
                            <HeaderStyle ForeColor="White" BackColor="#337FB2"></HeaderStyle>
                            <Columns>
                                <asp:TemplateColumn>
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" ID="cbx1" CssClass="cmCheckBox" data-id='<%# DataBinder.Eval(Container, "DataItem.ID") %>'></asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn Visible="False" DataField="ID" SortExpression="ID" HeaderText="编号"></asp:BoundColumn>
                                <asp:TemplateColumn SortExpression="Name" HeaderText="客户名称">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hlk_ClientName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Name") %>' NavigateUrl='<%# GetClientNameUrl(DataBinder.Eval(Container,"DataItem.ID").ToString())%>' Target="_blank">
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="Linkman" SortExpression="Linkman" HeaderText="联系人">
                                    <ItemStyle Font-Size="X-Small"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="电话">
                                    <HeaderStyle Font-Size="X-Small"></HeaderStyle>
                                    <ItemStyle Font-Size="X-Small"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# GetLinkmanTel(((DataRowView)Container.DataItem).Row.GetChildRows("ClientLinkmanID_Linkman")) %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="updatetime1" SortExpression="updatetime1" HeaderText="更新时间"></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="目前状态">
                                    <HeaderStyle Font-Size="X-Small"></HeaderStyle>
                                    <ItemStyle Font-Size="X-Small"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# GetCurStatus(DataBinder.Eval(Container,"DataItem.Curstatus").ToString()) %>' Target="_blank" NavigateUrl='<%# GetContactUrl(DataBinder.Eval(Container,"DataItem.ID").ToString())%>'>
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn SortExpression="AddManID" HeaderText="添加人">
                                    <HeaderStyle HorizontalAlign="Right"></HeaderStyle>
                                    <ItemStyle Font-Size="X-Small" HorizontalAlign="Right"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# GetAddMan(((DataRowView)Container.DataItem).Row.GetChildRows("ClientAddMan_Staff")) %>' ID="Label1">
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                            <PagerStyle NextPageText="上一页" PrevPageText="下一页" HorizontalAlign="Right" BackColor="#E8F4FF"
                                Mode="NumericPages"></PagerStyle>
                        </asp:DataGrid></td>
                </tr>
            </table>
        </font>
    </form>
    <script language="javascript" type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="../../js/jqBrowser.js"></script>
    <script language="javascript" type="text/javascript">
        function selectAll() {
            $('.cmCheckBox :checkbox').each(function () {
                if (this.checked) {
                    //this.checked = false;
                }
                else {
                    this.checked = true;
                }
            });
        }

        function getSelectedIDs(type) {
            var ids = [];
            var index = 0;

            var pre_url = null;
            if(1 == type)
            {
                pre_url = '<%= Page.ResolveUrl("LinkMan.aspx?ClientID=") %>';
            }
            else if(2 == type)
            {
                pre_url = '<%= Page.ResolveUrl("ClientContact_thisWeek.aspx?ClientID=") %>';
            }
            $('.cmCheckBox :checkbox').each(function () {
                if (this.checked) {
                    ids[index] = $(this).parent().data("id");
                    //index++;
                }
            });

            if (0 == ids.length) {
                alert("没有选择客户");
            }
            else {
                var url = pre_url + ids[0] + "&from=ClientList";
                if(1 == type)
                {
                    parent.navigatemf("添加联系人", url, "CM");
                }
                else if(2 == type)
                {
                    parent.navigatemf("添加接触", url, "CM");
                }
            }
        }
    </script>
</body>
</html>
