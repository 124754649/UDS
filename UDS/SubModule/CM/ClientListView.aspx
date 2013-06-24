<%@ Import namespace="UDS.Components"  %>
<%@ Import namespace="System.Data.SqlClient"  %>
<%@ Import namespace="System.Data"  %>
<%@ Import namespace="System"%>
<%@ Page language="c#" Codebehind="ClientListView.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.CM.ClientListView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>�ͻ��б�</title>
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
                    return ("����");
                    break;
                case "boot":
                    return ("����");
                    break;
                case "commend":
                    return ("��Ʒ�Ƽ�");
                    break;
                case "requirement":
                    return ("������");
                    break;
                case "submit":
                    return ("�����ύ");
                    break;
                case "negotiate":
                    return ("����̸��");
                    break;
                case "actualize":
                    return ("��Ŀʵʩ");
                    break;
                case "traceservice":
                    return ("���ٷ���");
                    break;
                case "last":
                    return ("��β��");
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
        <font face="����">
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
                                    bgcolor="#e8f4ff"><font color="#006699">�ҵĿͻ�</A></font></td>
                                <td class="GbText" style="WIDTH: 146px; HEIGHT: 20px" align="right" background="../../Images/treetopbg.jpg"
                                    bgcolor="#e8f4ff"><font color="#006699">�鿴�ӽ�</A>
											<asp:DropDownList ID="ddl_MySubordinate" runat="server" AutoPostBack="True"></asp:DropDownList>&nbsp;</font></td>
                                <td class="GbText" align="right" background="../../Images/treetopbg.jpg" bgcolor="#e8f4ff"><font face="����">
                                    <asp:Panel ID="pnl" runat="server" Height="8px" Width="499px" Visible="true">
                                        <input id="Button2" class="redbuttoncss" name="Button1" onclick="window.open('Stat/Contact_Client.aspx', '_blank')" type="button" value=" �� ��">&nbsp;<input id="Button1" class="redbuttoncss" name="Button1" onclick="window.open('Search/ClientInfo.aspx', '_blank')" type="button" value=" �� ѯ">&nbsp;<input class="redbuttoncss" onclick="selectAll()" type="button" value="ȫ ѡ">
                                        <asp:Button ID="btn_Del" runat="server" CssClass="redbuttoncss" Text="ɾ ��" OnClick="btn_Del_Click" />
                                        <asp:Button ID="btn_AddClient" runat="server" CssClass="redbuttoncss" Text="��ӿͻ�" />
                                        <input type="button" class="redButtonCss" onclick='parent.navigatemf("��ӿͻ�", "<%= Page.ResolveUrl("Client.aspx") %>", "CM")' value="��ӿͻ�" />
                                        <asp:Button ID="btn_AddLinkman" runat="server" CssClass="redbuttoncss" Text="���������" />
                                        <input type="button" class="redButtonCss" onclick="getSelectedIDs(1)" value="���������" />
                                        <asp:Button ID="btn_AddContact" runat="server" CssClass="redbuttoncss" Text="��ӽӴ�" />
                                        <input type="button" class="redButtonCss" onclick="getSelectedIDs(2)" value="��ӽӴ�" />
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
                                    runat="server">&nbsp;<asp:LinkButton ID="lbtn_MyClient" runat="server" CssClass="Newbutton">�ҵĿͻ�</asp:LinkButton><a href="ClientListView.aspx"></a></td>
                                <td id="TD2" valign="middle" align="center" width="90" background="../../images/maillistbutton1.gif"
                                    runat="server">&nbsp;<asp:LinkButton ID="lbtn_coClient" runat="server" CssClass="Newbutton">�ҵ�Эͬ�ͻ�</asp:LinkButton></td>
                                <td style="HEIGHT: 25px" align="right">&nbsp;</td>
                                <td style="HEIGHT: 25px" align="right">
                                    <asp:Panel ID="pnl_ClientInfo" runat="server">
                                        &nbsp;�� 
            <asp:Literal ID="ltl_ClientCount" runat="server"></asp:Literal>λ�ͻ�, 
            һ�����ڹ��Ӵ� 
                                        <asp:Literal ID="ltl_ContactTimes" runat="server"></asp:Literal>�� 
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
                                <asp:BoundColumn Visible="False" DataField="ID" SortExpression="ID" HeaderText="���"></asp:BoundColumn>
                                <asp:TemplateColumn SortExpression="Name" HeaderText="�ͻ�����">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hlk_ClientName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Name") %>' NavigateUrl='<%# GetClientNameUrl(DataBinder.Eval(Container,"DataItem.ID").ToString())%>' Target="_blank">
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="Linkman" SortExpression="Linkman" HeaderText="��ϵ��">
                                    <ItemStyle Font-Size="X-Small"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="�绰">
                                    <HeaderStyle Font-Size="X-Small"></HeaderStyle>
                                    <ItemStyle Font-Size="X-Small"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# GetLinkmanTel(((DataRowView)Container.DataItem).Row.GetChildRows("ClientLinkmanID_Linkman")) %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="updatetime1" SortExpression="updatetime1" HeaderText="����ʱ��"></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="Ŀǰ״̬">
                                    <HeaderStyle Font-Size="X-Small"></HeaderStyle>
                                    <ItemStyle Font-Size="X-Small"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# GetCurStatus(DataBinder.Eval(Container,"DataItem.Curstatus").ToString()) %>' Target="_blank" NavigateUrl='<%# GetContactUrl(DataBinder.Eval(Container,"DataItem.ID").ToString())%>'>
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn SortExpression="AddManID" HeaderText="�����">
                                    <HeaderStyle HorizontalAlign="Right"></HeaderStyle>
                                    <ItemStyle Font-Size="X-Small" HorizontalAlign="Right"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# GetAddMan(((DataRowView)Container.DataItem).Row.GetChildRows("ClientAddMan_Staff")) %>' ID="Label1">
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                            <PagerStyle NextPageText="��һҳ" PrevPageText="��һҳ" HorizontalAlign="Right" BackColor="#E8F4FF"
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
                alert("û��ѡ��ͻ�");
            }
            else {
                var url = pre_url + ids[0] + "&from=ClientList";
                if(1 == type)
                {
                    parent.navigatemf("�����ϵ��", url, "CM");
                }
                else if(2 == type)
                {
                    parent.navigatemf("��ӽӴ�", url, "CM");
                }
            }
        }
    </script>
</body>
</html>
