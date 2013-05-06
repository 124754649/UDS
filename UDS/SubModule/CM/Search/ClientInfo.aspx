<%@ Page language="c#" Codebehind="ClientInfo.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.CM.Stat.ClientInfo" %>
<%@ Import namespace="System"%>
<%@ Import namespace="System.Data"  %>
<%@ Import namespace="System.Data.SqlClient"  %>
<%@ Import namespace="UDS.Components"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>��ѯ</title>
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
                return (row[0]["realname"].ToString());
            }
            else
                return ("");
        }
    </script>
</head>
<body leftmargin="0" topmargin="0">
    <form id="ClientInfo" method="post" runat="server">
        <font face="����">
            <table bordercolor="#111111" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr height="30">
                    <td class="GbText" width="20" background="../../../Images/treetopbg.jpg" bgcolor="#c0d9e6"
                        align="right"><font color="#003366" size="3">
                            <img height="16" src="../../../DataImages/myLinkman.gif" width="16"></font></td>
                    <td class="GbText" background="../../../Images/treetopbg.jpg" bgcolor="#e8f4ff" width="75"
                        align="right" style="WIDTH: 75px">�ͻ�����</td>
                    <td class="GbText" background="../../../Images/treetopbg.jpg" bgcolor="#e8f4ff" align="left">-��ѯ&nbsp;</td>
                </tr>
            </table>
            <table id="Table1" bordercolor="#93bee2" cellspacing="0" cellpadding="0" width="100%" border="1"
                style="BORDER-COLLAPSE: collapse" class="GbText">
                <tr>
                    <td style="WIDTH: 683px">��ѯ������&nbsp;&nbsp;
							<asp:DropDownList ClientIDMode="Static" ID="ddl_search" runat="server" AutoPostBack="True" Width="130px">
                                <asp:ListItem Value="�ͻ�����">�ͻ�����</asp:ListItem>
                                <asp:ListItem Value="�ͻ�����">�ͻ�����</asp:ListItem>
                                <asp:ListItem Value="�ͻ����">�ͻ����</asp:ListItem>
                                <asp:ListItem Value="��ϵ��">��ϵ��</asp:ListItem>
                                <asp:ListItem Value="�绰">�绰</asp:ListItem>
                                <asp:ListItem Value="������ҵ">������ҵ</asp:ListItem>
                                <asp:ListItem Value="��ҵ����">��ҵ����</asp:ListItem>
                                <asp:ListItem Value="�ͻ���Դ">�ͻ���Դ</asp:ListItem>
                                <asp:ListItem Value="������Ա">������Ա</asp:ListItem>
                                <asp:ListItem Value="�������">�������</asp:ListItem>
                                <asp:ListItem Value="���������ͻ�">���������ͻ�</asp:ListItem>
                                <asp:ListItem Value="���������ͻ�">���������ͻ�</asp:ListItem>
                            </asp:DropDownList><asp:TextBox ClientIDMode="Static" ID="tbx_searchvalue" runat="server" CssClass="inputcss"></asp:TextBox>&nbsp;</td>
                    <td>��ѯ��Χ
							<asp:DropDownList ID="ddl_SearchBound" runat="server">
                                <asp:ListItem Value="1">����������</asp:ListItem>
                                <asp:ListItem Value="2">������</asp:ListItem>
                                <asp:ListItem Value="3">������</asp:ListItem>
                            </asp:DropDownList></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:RadioButtonList ID="rbl_searchvalue" runat="server" Visible="False"></asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btn_addsearch" runat="server" Text="�������" CssClass="redbuttoncss"></asp:Button>&nbsp;
							<asp:Button ID="btn_Del" runat="server" Text="ɾ������" CssClass="redbuttoncss"></asp:Button></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:ListBox ID="lbx_search" runat="server" Height="95px" Width="496px"></asp:ListBox><br>
                        <asp:Button ID="btn_OK" runat="server" Text="��ѯ" CssClass="redbuttoncss"></asp:Button></td>
                </tr>
                <tr>
                    <td colspan="2" height="30">��ѯ��������鵽
							<asp:Literal ID="ltl_Client" runat="server"></asp:Literal>λ���������Ŀͻ�</td>
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
                    <asp:BoundColumn DataField="ID" SortExpression="ID" HeaderText="���"></asp:BoundColumn>
                    <asp:TemplateColumn SortExpression="Name" HeaderText="�ͻ�����">
                        <ItemTemplate>
                            <asp:HyperLink ID="Hyperlink1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Name") %>' NAME="Hyperlink1" Target="_blank" NavigateUrl='<%# "../Client.aspx?ClientID="+DataBinder.Eval(Container,"DataItem.ID")%>'>
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="Linkman" SortExpression="Linkman" HeaderText="��ϵ��"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Linkman_Telephone" SortExpression="Linkman_Telephone" HeaderText="�绰"></asp:BoundColumn>
                    <asp:TemplateColumn SortExpression="UpdateTime" HeaderText="����ʱ��">
                        <ItemTemplate>
                            <asp:Label ID="lbl_UpdateTime" runat="server">
									<%# DataBinder.Eval(Container,"DataItem.UpdateTime")%>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Ŀǰ״̬">
                        <HeaderStyle Font-Size="X-Small"></HeaderStyle>
                        <ItemTemplate>
                            <asp:HyperLink ID="Hyperlink2" runat="server" Text='<%# GetCurStatus(DataBinder.Eval(Container,"DataItem.Curstatus").ToString()) %>' NavigateUrl='<%# "../../../SubModule/CM/ClientContact_thisWeek.aspx?ClientID="+DataBinder.Eval(Container,"DataItem.ID")%>' NAME="Hyperlink2" Target="_blank">
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn SortExpression="AddMan" HeaderText="�����">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# GetAddMan(((DataRowView)Container.DataItem).Row.GetChildRows("ClientAddMan_Staff")) %>' ID="Label1">
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
                <PagerStyle NextPageText="��һҳ" PrevPageText="��һҳ" HorizontalAlign="Right" Mode="NumericPages"></PagerStyle>
            </asp:DataGrid>
        </font>
    </form>
    <script language="javascript" type="text/javascript" src="../../../js/jquery-1.9.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="../../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script language="javascript" type="text/javascript" src="../../../js/jquery.ui.datepicker-zh-CN.js"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            if ("�������" == $("#ddl_search option:selected").text()) {
                $("#tbx_searchvalue").datepicker();
            }
        });
    </script>
</body>
</html>
