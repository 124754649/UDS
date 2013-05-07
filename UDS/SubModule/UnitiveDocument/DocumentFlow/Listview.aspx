<%@ Page language="c#" Codebehind="Listview.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.UnitiveDocument.Flow.Listview" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>Listview</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
    <script language="javascript">
        function delete_confirm(e) {
            if (event.srcElement.outerText == "ɾ��")
                event.returnValue = confirm("��ȷ��Ҫɾ��?");
        }
        document.onclick = delete_confirm;
    </script>
</head>
<body leftmargin="0" topmargin="0" rightmargin="0" ms_positioning="GridLayout">
    <form id="Listview" method="post" runat="server">
        <font face="����">
            <table id="Table1" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td valign="top" height="38">
                        <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr height="30">
                                <td class="GbText" width="20" background="../../../Images/treetopbg.jpg" bgcolor="#c0d9e6"
                                    align="right"><font color="#003366" size="3">
                                        <img height="16" src="../../../DataImages/DocFlow.gif" width="16"></font></td>
                                <td class="GbText" background="../../../Images/treetopbg.jpg" bgcolor="#e8f4ff" width="60"
                                    align="right"><font color="#006699">�ĵ���ת</font></td>
                                <td class="GbText" background="../../../Images/treetopbg.jpg" bgcolor="#e8f4ff" align="right"><font face="����">
                                    <asp:Button ID="cmdNewFlow" runat="server" CssClass="redbuttoncss" Height="21px" Text="�½�����"
                                        Width="66px"></asp:Button>&nbsp;&nbsp; <font face="����">
                                            <asp:Button ID="cmdDeleteFlow" runat="server" CssClass="redbuttoncss" Height="20px" Text="ɾ������"
                                                Width="69px"></asp:Button>&nbsp; </font>
                                    <asp:Button ID="cmdManageStyle" runat="server" CssClass="redbuttoncss" Text="������"></asp:Button>&nbsp;</font></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="gbtext" id="Table3" height="24" cellspacing="0" cellpadding="0" width="100%"
                            border="0">
                            <tr>
                                <td align="center" width="90" background="../../../Images/maillistbutton1.gif">&nbsp;
										<asp:LinkButton ID="lbMyApprove" runat="server" CssClass="Newbutton">�ҵ�����</asp:LinkButton></td>
                                <td align="center" width="90" background="../../../Images/maillistbutton1.gif">&nbsp;
										<asp:LinkButton ID="LinkButton1" runat="server" CssClass="Newbutton">�ҵ�����</asp:LinkButton></td>
                                <td align="center" width="90" background="../../../Images/maillistbutton1.gif">&nbsp;
										<asp:LinkButton ID="lbMyApproved" runat="server" CssClass="Newbutton">�Ѿ�����</asp:LinkButton></td>
                                <td align="center" width="90" background="../../../Images/maillistbutton1.gif">&nbsp;
										<asp:LinkButton ID="lbMyDraft" runat="server" CssClass="Newbutton">�����</asp:LinkButton></td>
                                <%if (bManageFlow == true)
                                  {%>
                                <td align="center" width="90" background="../../../Images/maillistbutton2.gif">&nbsp;
										<asp:LinkButton ID="lbManageFlow" runat="server" CssClass="Newbutton">���̹���</asp:LinkButton></td>
                                <%}
                                  else
                                  {%>
                                <td align="right">&nbsp;&nbsp;<font face="����">&nbsp;</font></td>
                                <%}%>
                                <td align="right">&nbsp;&nbsp;<font face="����">&nbsp;</font></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataGrid ID="dgFlowList" runat="server" Width="100%" AutoGenerateColumns="False" AllowSorting="True"
                            AllowPaging="True" Font-Size="X-Small" OnPageIndexChanged="DataGrid_PageChanged" BorderColor="#93BEE2"
                            BorderStyle="None" BorderWidth="1px" BackColor="White" CellPadding="4" PageSize="15" DataKeyField="Flow_ID"
                            OnDeleteCommand="MyDataGrid_Delete">
                            <SelectedItemStyle ForeColor="#CCFF99" BackColor="#009999"></SelectedItemStyle>
                            <AlternatingItemStyle Font-Size="X-Small" BackColor="#E8F4FF"></AlternatingItemStyle>
                            <ItemStyle Font-Size="X-Small" ForeColor="#003399" BackColor="White"></ItemStyle>
                            <HeaderStyle HorizontalAlign="Left" ForeColor="White" VerticalAlign="Middle"
                                BackColor="#337FB2"></HeaderStyle>
                            <FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
                            <Columns>
                                <asp:TemplateColumn HeaderText="ID">
                                    <HeaderStyle Width="2%"></HeaderStyle>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="FlowID" runat="server"></asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:HyperLinkColumn DataNavigateUrlField="Flow_ID" DataNavigateUrlFormatString="ManageFlow.aspx?FlowID={0}"
                                    DataTextField="Flow_Name" HeaderText="������">
                                    <HeaderStyle Font-Size="X-Small" Width="15%"></HeaderStyle>
                                    <ItemStyle Font-Size="X-Small"></ItemStyle>
                                </asp:HyperLinkColumn>
                                <asp:BoundColumn DataField="Remark" HeaderText="���̼��">
                                    <HeaderStyle Width="30%"></HeaderStyle>
                                </asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="����ͼ��">
                                    <HeaderStyle HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <a href='javascript:navigate2("ͼ��", "<%= Page.ResolveUrl("DisplayFlow.aspx") %>", "FlowID=<%#DataBinder.Eval(Container,"DataItem.Flow_ID")%>")'>ͼ��</a>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:HyperLinkColumn DataNavigateUrlField="Style_ID" DataNavigateUrlFormatString="DisplayStyle.aspx?StyleID={0}"
                                    DataTextField="Style_Name" HeaderText="���/����">
                                    <HeaderStyle HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:HyperLinkColumn>
                                <asp:BoundColumn DataField="Build_Date" HeaderText="����ʱ��">
                                    <HeaderStyle HorizontalAlign="Center" Width="10%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="�༭">
                                    <HeaderStyle HorizontalAlign="Center" Width="6%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <a href='EditFlow.aspx?FlowID=<%# DataBinder.Eval(Container, "DataItem.Flow_ID") %>'>�༭</a>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                    </EditItemTemplate>
                                </asp:TemplateColumn>
                                <asp:ButtonColumn Text="ɾ��" HeaderText="ɾ��" CommandName="Delete">
                                    <HeaderStyle HorizontalAlign="Center" Width="6%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:ButtonColumn>
                            </Columns>
                            <PagerStyle NextPageText="" HorizontalAlign="Right" ForeColor="#003399" BackColor="#E8F4FF"
                                Mode="NumericPages"></PagerStyle>
                        </asp:DataGrid></td>
                </tr>
            </table>
        </font>
    </form>
    <script language="javascript" type="text/javascript">
        function navigate2(title, url, params) {
            var fullurl = url + "?" + params;
            parent.navigatemf(title, fullurl, "DF");
        }
    </script>
</body>
</html>
