<%@ Page language="c#" Codebehind="ListView.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.Linkman.ListView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>��ϵ���б�</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
</head>
<body ms_positioning="GridLayout" topmargin="0" leftmargin="0">
    <form id="ListView" method="post" runat="server">
        <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr height="30">
                <td class="GbText" width="24" background="../../Images/treetopbg.jpg" bgcolor="#c0d9e6"
                    style="HEIGHT: 29px"><font color="#003366" size="3">
                        <img height="16" src="../../DataImages/myLinkMan.GIF" width="16"></font></td>
                <td class="GbText" background="../../Images/treetopbg.jpg" bgcolor="#c0d9e6" width="80"
                    align="right" style="HEIGHT: 29px"><font color="#006699">�ҵ���ϵ��</font></td>
                <td class="GbText" background="../../Images/treetopbg.jpg" bgcolor="#c0d9e6" align="right"
                    style="HEIGHT: 29px">
                    <asp:DropDownList ID="ddl_CustomLinkmanType" runat="server" Visible="False" AutoPostBack="True" Width="100px"></asp:DropDownList>&nbsp;<input type="button" value="�� ѯ" class="redbuttoncss" onclick="location.href = 'Search/index.aspx'">
                    <input id="btn_SelAll" onclick="selectAll()" type="button" value="ȫ ѡ" class="redbuttoncss">&nbsp;
						<asp:Button ID="btn_Del" runat="server" Text="ɾ ��" CssClass="redbuttoncss"></asp:Button></td>
            </tr>
            <tr>
                <td height="8" colspan="3"></td>
                <tr>
                </tr>
        </table>
        <font face="����">
            <table id="Table2" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td>
                        <table class="gbtext" id="Table6" cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                                <td align="center" width="90" background="../../images/maillistbutton1.gif" height="24"
                                    id="td_Staff" runat="server">&nbsp;&nbsp;<asp:LinkButton ID="lbtn_Staff" runat="server" CommandArgument="1" CssClass="Newbutton">Ա����ϵ��</asp:LinkButton></td>
                                <td align="center" width="90" background="../../images/maillistbutton1.gif" height="24"
                                    id="td_Client" runat="server">&nbsp;<asp:LinkButton ID="lbtn_Client" runat="server" CommandArgument="2" CssClass="Newbutton">�ͻ���ϵ��</asp:LinkButton></td>
                                <td align="center" width="90" background="../../images/maillistbutton1.gif" height="24"
                                    id="td_Custom" runat="server">&nbsp;<asp:LinkButton ID="lbtn_Custom" runat="server" CommandArgument="3" CssClass="Newbutton">�Զ�����ϵ��</asp:LinkButton></td>
                                <td align="center" width="90" background="../../images/maillistbutton1.gif" height="24"
                                    id="td_Add" runat="server">&nbsp;<asp:HyperLink ID="lbtn_AddLinkman" runat="server" NavigateUrl="AddLinkman.aspx"
                                        CssClass="Newbutton">�����ϵ��</asp:HyperLink></td>
                                <td align="right">&nbsp;</td>
                            </tr>
                        </table>
                        <asp:DataGrid ID="dgrd_CustomLinkman" runat="server" Width="100%" AutoGenerateColumns="False"
                            AllowPaging="True" BorderColor="#93BEE2" BorderWidth="1px" CellPadding="3" PageSize="15">
                            <AlternatingItemStyle BackColor="#E8F4FF"></AlternatingItemStyle>
                            <ItemStyle Font-Size="X-Small"></ItemStyle>
                            <HeaderStyle Font-Size="X-Small" ForeColor="#FFFFFF" BackColor="#337FB2"></HeaderStyle>
                            <Columns>
                                <asp:TemplateColumn>
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                    <ItemTemplate>
                                        <asp:CheckBox name="cbx_" runat="server"></asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="����">
                                    <ItemTemplate>
                                        <asp:HyperLink runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.name") %>' NavigateUrl='<%# "CustomLinkmanInfo.aspx?ID="+DataBinder.Eval(Container,"DataItem.ID") %>' Target="_blank">
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="sexname" HeaderText="�Ա�"></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="�ֻ�">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.mobile") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.mobile") %>'>
                                        </asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="email" HeaderText="Email"></asp:BoundColumn>
                                <asp:BoundColumn DataField="unitaddress" HeaderText="��λ��ַ"></asp:BoundColumn>
                                <asp:BoundColumn DataField="unittelephone" HeaderText="��λ�绰"></asp:BoundColumn>
                                <asp:HyperLinkColumn Text="��ϸ" Target="_blank" DataNavigateUrlField="ID" DataNavigateUrlFormatString="CustomLinkmanInfo.aspx?ID={0}">
                                    <HeaderStyle Width="10px"></HeaderStyle>
                                </asp:HyperLinkColumn>
                            </Columns>
                            <PagerStyle HorizontalAlign="Right" BackColor="#E8F4FF" Mode="NumericPages"></PagerStyle>
                        </asp:DataGrid>
                        <asp:DataGrid ID="dgrd_ClientLinkman" runat="server" Width="100%" AutoGenerateColumns="False"
                            AllowPaging="True" BorderColor="#93BEE2" BorderWidth="1px" CellPadding="3" PageSize="15">
                            <AlternatingItemStyle BackColor="#E8F4FF"></AlternatingItemStyle>
                            <ItemStyle Font-Size="X-Small"></ItemStyle>
                            <HeaderStyle Font-Size="X-Small" ForeColor="#FFFFFF" BackColor="#337FB2"></HeaderStyle>
                            <Columns>
                                <asp:TemplateColumn>
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                    <ItemTemplate>
                                        <asp:CheckBox name="cbx_" runat="server"></asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="����">
                                    <ItemTemplate>
                                        <asp:HyperLink runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.name") %>' NavigateUrl='<%# "../CM/Linkman.aspx?LinkmanID="+DataBinder.Eval(Container,"DataItem.ID")+"&from=mylinkman"%>' Target="_blank">
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="�ֻ�">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.mobile") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.mobile") %>'>
                                        </asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="telephone" HeaderText="�绰"></asp:BoundColumn>
                                <asp:BoundColumn DataField="email" HeaderText="Email"></asp:BoundColumn>
                                <asp:BoundColumn DataField="unitname" HeaderText="��λ"></asp:BoundColumn>
                                <asp:BoundColumn DataField="position" HeaderText="ְ��"></asp:BoundColumn>
                                <asp:BoundColumn DataField="address" HeaderText="��ͥ��ַ"></asp:BoundColumn>
                                <asp:HyperLinkColumn Text="��ϸ" Target="_blank" DataNavigateUrlField="ID" DataNavigateUrlFormatString="../CM/Linkman.aspx?LinkmanID={0}&amp;from=mylinkman">
                                    <HeaderStyle Width="10px"></HeaderStyle>
                                </asp:HyperLinkColumn>
                            </Columns>
                            <PagerStyle HorizontalAlign="Right" BackColor="#E8F4FF" Mode="NumericPages"></PagerStyle>
                        </asp:DataGrid><asp:DataGrid ID="dgrd_StaffLinkman" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            Width="100%" BorderColor="#93BEE2" BorderWidth="1px" CellPadding="3" PageSize="15">
                            <AlternatingItemStyle BackColor="#E8F4FF"></AlternatingItemStyle>
                            <ItemStyle Font-Size="X-Small"></ItemStyle>
                            <HeaderStyle Font-Size="X-Small" ForeColor="White" BackColor="#337FB2"></HeaderStyle>
                            <Columns>
                                <asp:TemplateColumn>
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                    <ItemTemplate>
                                        <asp:CheckBox name="cbx_" runat="server"></asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="��ʵ����">
                                    <ItemTemplate>
                                        <asp:HyperLink runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.realname") %>' NavigateUrl='<%# "../UnitiveDocument/Mail/Compose.aspx?Action=3&ClassID=0&Username="+ DataBinder.Eval(Container.DataItem,"staff_Name")+"&Name="+DataBinder.Eval(Container,"DataItem.RealName") %>' Target="_blank">
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="�ֻ�">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.mobile") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="Age" HeaderText="����"></asp:BoundColumn>
                                <asp:BoundColumn DataField="SexName" HeaderText="�Ա�"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Email" HeaderText="Email"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Position_Name" HeaderText="����ְλ"></asp:BoundColumn>
                                <asp:BoundColumn DataField="RQ" HeaderText="ע������"></asp:BoundColumn>
                                <asp:HyperLinkColumn Text="��ϸ" Target="_blank" DataNavigateUrlField="staff_id" DataNavigateUrlFormatString="StaffInfo.aspx?Staff_ID={0}">
                                    <HeaderStyle Width="10px"></HeaderStyle>
                                </asp:HyperLinkColumn>
                            </Columns>
                            <PagerStyle HorizontalAlign="Right" Mode="NumericPages"></PagerStyle>
                        </asp:DataGrid>
                    </td>
                </tr>
            </table>
        </font>
    </form>
    <script type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        function selectAll() {
            $(":checkbox").each(function () {
                if (!this.checked) {
                    this.checked = true;
                }
            });

            //var len = document.ListView.elements.length;
            //var i;
            //for (i = 0; i < len; i++) {
            //    if (document.ListView.elements[i].type == "checkbox") {
            //        document.ListView.elements[i].checked = !document.ListView.elements[i].checked;
            //    }
            //}
        }
    </script>
</body>
</html>
