<%@ Register TagPrefix="uc1" TagName="ControlClientContactHistory_thisWeek" Src="../../Inc/ControlClientContactHistory_thisWeek.ascx" %>
<%@ Page language="c#" Codebehind="ClientContact_thisWeek.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.CM.ClientContact_thisWeek" %>
<%@ Register TagPrefix="uc1" TagName="ControlClientContactHistory" Src="../../Inc/ControlClientContactHistory.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>�ͻ��Ӵ�</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
    <link type="text/css" rel="Stylesheet" href="../../Css/redmond/jquery-ui-1.10.3.custom.min.css" />

    <script language="javascript">
        function changein()
        {
            var removeindexs = new Array();
            var j = 0;

            for(var i=0;i<document.getElementById("lbx_Staff").options.length;i++)
            {
                if(document.getElementById("lbx_Staff").options[i].selected)
                {
                    document.getElementById("lbx_Cooperater").options.add(new Option(document.getElementById("lbx_Staff").options[i].text,document.getElementById("lbx_Staff").options[i].value));
                    removeindexs[j++] = i;
                }
			
            }
            for(var i=0;i<j;i++)
            {
                //alert(removeindexs[i].valueOf());
                document.getElementById("lbx_Staff").options.remove(removeindexs[i].valueOf());
                for(var k=i;k<removeindexs.length;k++)
                {
                    removeindexs[k] = removeindexs[k]-1;
                }			
            }
		
        }
		
        function changeout()
        {
            var removeindexs = new Array();
            var j = 0;

            for(var i=0;i<document.getElementById("lbx_Cooperater").options.length;i++)
            {
                if(document.getElementById("lbx_Cooperater").options[i].selected)
                {
                    document.getElementById("lbx_Staff").options.add(new Option(document.getElementById("lbx_Cooperater").options[i].text,document.getElementById("lbx_Cooperater").options[i].value));
                    removeindexs[j++] = i;
                }
			
            }
            for(var i=0;i<j;i++)
            {
                //alert(removeindexs[i].valueOf());
                document.getElementById("lbx_Cooperater").options.remove(removeindexs[i].valueOf());
                for(var k=i;k<removeindexs.length;k++)
                {
                    removeindexs[k] = removeindexs[k]-1;
                }			
            }
        }
        function changelinkmanin()
        {
            var removeindexs = new Array();
            var j = 0;

            for(var i=0;i<document.getElementById("lbx_ClientLinkman").options.length;i++)
            {
                if(document.getElementById("lbx_ClientLinkman").options[i].selected)
                {
                    document.getElementById("lbx_Linkman").options.add(new Option(document.getElementById("lbx_ClientLinkman").options[i].text,document.getElementById("lbx_ClientLinkman").options[i].value));
                    removeindexs[j++] = i;
                }
			
            }
            for(var i=0;i<j;i++)
            {
                //alert(removeindexs[i].valueOf());
                document.getElementById("lbx_ClientLinkman").options.remove(removeindexs[i].valueOf());
                for(var k=i;k<removeindexs.length;k++)
                {
                    removeindexs[k] = removeindexs[k]-1;
                }			
            }
		
        }
        function changelinkmanout()
        {
            var removeindexs = new Array();
            var j = 0;

            for(var i=0;i<document.getElementById("lbx_Linkman").options.length;i++)
            {
                if(document.getElementById("lbx_Linkman").options[i].selected)
                {
                    document.getElementById("lbx_ClientLinkman").options.add(new Option(document.getElementById("lbx_Linkman").options[i].text,document.getElementById("lbx_Linkman").options[i].value));
                    removeindexs[j++] = i;
                }
			
            }
            for(var i=0;i<j;i++)
            {
                //alert(removeindexs[i].valueOf());
                document.getElementById("lbx_Linkman").options.remove(removeindexs[i].valueOf());
                for(var k=i;k<removeindexs.length;k++)
                {
                    removeindexs[k] = removeindexs[k]-1;
                }			
            }
		
        }
    </script>
</head>
<body leftmargin="0" topmargin="0">
    <form id="ClientContact" method="post" enctype="multipart/form-data" runat="server">
        <font face="����">
            <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr height="30">
                    <td class="GbText" width="24" background="../../Images/treetopbg.jpg" bgcolor="#c0d9e6"><font color="#003366" size="3">
                        <img height="16" src="../../DataImages/ClientManage.gif" width="16"></font></td>
                    <td class="GbText" align="right" width="60" background="../../Images/treetopbg.jpg"
                        bgcolor="#c0d9e6"><font color="#006699">�ͻ�����</font></td>
                    <td class="GbText" align="right" background="../../Images/treetopbg.jpg" bgcolor="#c0d9e6"><font face="����">&nbsp;
                    </font>&nbsp;</td>
                </tr>
            </table>
            <table class="gbtext" id="Table4" style="BORDER-COLLAPSE: collapse" bordercolor="#93bee2"
                cellspacing="0" cellpadding="0" width="100%" align="center" border="1">
                <tr>
                    <td width="76" bgcolor="#e8f4ff" height="34" style="WIDTH: 76px; HEIGHT: 34px" valign="middle"
                        align="center" colspan="1" rowspan="1">�ͻ�����</td>
                    <td colspan="2" style="HEIGHT: 34px">
                        <asp:Literal ID="ltl_ClientName" runat="server" Visible="False"></asp:Literal><asp:Panel ID="pnl_clientselect" runat="server">
                            <asp:DropDownList ID="ddl_ClientName" runat="server" AutoPostBack="True"></asp:DropDownList>
                            <asp:TextBox ID="tbx_quicksearch" runat="server" CssClass="inputcss"></asp:TextBox>
                            <asp:Button ID="btn_search" runat="server" CssClass="redbuttoncss" Text="��ѯ"></asp:Button>
                        </asp:Panel>
                    </td>
                    <td style="HEIGHT: 34px">�ͻ����&nbsp;&nbsp;<asp:Literal ID="ltl_ClientShortName" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                    <td style="WIDTH: 76px; HEIGHT: 24px" bgcolor="#e8f4ff" height="24" align="center">�����д�Ӵ�ʱ��</td>
                    <td style="WIDTH: 274px; HEIGHT: 24px" bgcolor="#e8f4ff">&nbsp;
							<asp:Literal ID="ltl_UpdateTime" runat="server"></asp:Literal></td>
                    <td style="HEIGHT: 24px" width="90" bgcolor="#e8f4ff" align="center" colspan="1" rowspan="1">����ʱ��</td>
                    <td style="HEIGHT: 24px" bgcolor="#e8f4ff">&nbsp;
							<asp:Literal ID="ltl_Birthday" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                    <td bgcolor="#e8f4ff" height="24" style="WIDTH: 76px" align="center">��Ǣ����(�ϼ�)</td>
                    <td style="WIDTH: 274px" bgcolor="#e8f4ff">&nbsp;<asp:Literal ID="ltl_ContactTimes" runat="server"></asp:Literal></td>
                    <td bgcolor="#e8f4ff" align="center" colspan="1" rowspan="1">���۽׶�(����)</td>
                    <td bgcolor="#e8f4ff">&nbsp;
							<asp:Literal ID="ltl_sellphase" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                    <td bgcolor="#e8f4ff" height="24" style="WIDTH: 76px" align="center" colspan="1" rowspan="1">�ɽ�Ԥ��(����)</td>
                    <td style="WIDTH: 274px" bgcolor="#e8f4ff">&nbsp;<asp:Label ID="lbl_BargainPrognosis" runat="server"></asp:Label></td>
                    <td bgcolor="#e8f4ff" align="center">��������(�ϼ�)</td>
                    <td bgcolor="#e8f4ff">&nbsp;
							<asp:Literal ID="ltl_fee" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                    <td style="WIDTH: 76px" align="center" bgcolor="#e8f4ff" height="24">������Ա</td>
                    <td style="WIDTH: 274px" bgcolor="#e8f4ff">
                        <asp:DropDownList ID="ddl_SellMan" runat="server" Visible="False"></asp:DropDownList>
                        <asp:Literal ID="ltl_AddMan" runat="server"></asp:Literal></td>
                    <td align="center" bgcolor="#e8f4ff"></td>
                    <td bgcolor="#e8f4ff"></td>
                </tr>
                <tr>
                    <td style="WIDTH: 76px; HEIGHT: 20px" align="center" bgcolor="#8af2ff" height="20"><font style="BACKGROUND-COLOR: #e8f4ff"></font></td>
                    <td style="WIDTH: 274px; HEIGHT: 20px" align="center" bgcolor="#8af2ff"></td>
                    <td style="HEIGHT: 20px" align="center" bgcolor="#8af2ff" colspan="1" rowspan="1"></td>
                    <td style="HEIGHT: 20px" align="center" bgcolor="#8af2ff" colspan="1" rowspan="1"></td>
                </tr>
                <tr>
                    <td bgcolor="#e8f4ff" height="24" style="WIDTH: 76px" align="center" colspan="1" rowspan="1">���νӴ�ʱ��</td>
                    <td style="WIDTH: 274px">&nbsp;<asp:TextBox ClientIDMode="Static" ID="tbx_contacttime" runat="server" Width="88px"></asp:TextBox></td>
                    <td align="center" bgcolor="#e8f4ff" colspan="1" rowspan="1">Ԥ���´νӴ�ʱ��</td>
                    <td>&nbsp;
							<asp:TextBox ID="tbx_nextcontacttime" runat="server" ClientIDMode="Static" Width="88px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td bgcolor="#e8f4ff" height="65" style="WIDTH: 76px" align="center" colspan="1" rowspan="1">Эͬ��Ա</td>
                    <td colspan="3" height="65">
                        <table id="Table1" cellspacing="0" cellpadding="0" width="380" border="0">
                            <tr>
                                <td align="center">
                                    <asp:ListBox ID="lbx_Cooperater" runat="server" Width="150px" SelectionMode="Multiple"></asp:ListBox></td>
                                <td align="center">
                                    <p align="center">
                                        <asp:Button ID="btn_in" runat="server" CssClass="redbuttoncss" Text="<<<"></asp:Button><br>
                                        <br>
                                        <asp:Button ID="btn_out" runat="server" CssClass="redbuttoncss" Text=">>>"></asp:Button>
                                    </p>
                                </td>
                                <td align="center">
                                    <asp:ListBox ID="lbx_Staff" runat="server" Width="150px" SelectionMode="Multiple"></asp:ListBox></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#e8f4ff" height="67" style="WIDTH: 76px" align="center" colspan="1" rowspan="1">�Ӵ�����<br>
                        <br>
                        <input class="redbuttoncss" id="btn_addlinkman" style="WIDTH: 65px; HEIGHT: 20px;display:none" onclick="window.open('Linkman.aspx?ClientID=<%=clientid.ToString()%>    ')" type="button" alt="�����ϵ��" value="�����ϵ��&#13;&#10;&#13;&#10;&#13;&#10;"></td>
                    <td colspan="3" height="67">
                        <table id="Table3" cellspacing="0" cellpadding="0" width="380" border="0">
                            <tr>
                                <td align="center">
                                    <asp:ListBox ID="lbx_Linkman" runat="server" Width="150px" SelectionMode="Multiple"></asp:ListBox></td>
                                <td align="center">
                                    <p align="center">
                                        <asp:Button ID="btn_inlinkman" runat="server" CssClass="redbuttoncss" Text="<<<"></asp:Button><br>
                                        <br>
                                        <asp:Button ID="btn_outlinkman" runat="server" CssClass="redbuttoncss" Text=">>>"></asp:Button>
                                    </p>
                                </td>
                                <td align="center">
                                    <asp:ListBox ID="lbx_ClientLinkman" runat="server" Width="150px" SelectionMode="Multiple"></asp:ListBox></td>
                            </tr>
                        </table>
                        <table id="Table4" cellspacing="0" cellpadding="0" width="400" border="0">
                            <tr>
                                <td align="center"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#e8f4ff" height="33" style="WIDTH: 76px" align="center" colspan="1" rowspan="1">�Ӵ�Ŀ��</td>
                    <td colspan="3" height="33">&nbsp;
							<asp:TextBox ID="tbx_contactaim" runat="server" Width="400px" TextMode="MultiLine" Height="36px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="WIDTH: 76px" align="center" bgcolor="#e8f4ff" colspan="1" height="24" rowspan="1">���ڱ��</td>
                    <td style="WIDTH: 274px" valign="middle" colspan="1" height="24" rowspan="1">&nbsp;<asp:TextBox ID="tbx_sellmoney" runat="server" Width="112px">0</asp:TextBox>Ԫ(RMB)<asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="tbx_sellmoney" MaximumValue="9999999999"
                        MinimumValue="0" ErrorMessage="����������"></asp:RangeValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbx_sellmoney" ErrorMessage="����������"></asp:RequiredFieldValidator></td>
                    <td bgcolor="#e8f4ff" height="24">&nbsp;�ɽ�Ԥ��</td>
                    <td height="24">&nbsp;<asp:DropDownList ID="ddl_bargainprognosis" runat="server">
                        <asp:ListItem Value="*">*</asp:ListItem>
                        <asp:ListItem Value="**">**</asp:ListItem>
                        <asp:ListItem Value="***">***</asp:ListItem>
                        <asp:ListItem Value="****">****</asp:ListItem>
                        <asp:ListItem Value="*****">*****</asp:ListItem>
                    </asp:DropDownList>(�Ǽ�Խ��,�ɹ�������Խ��)</td>
                </tr>
                <tr>
                    <td bgcolor="#e8f4ff" height="24" style="WIDTH: 76px" align="center" colspan="1" rowspan="1">�Ӵ���ʽ</td>
                    <td colspan="3">
                        <asp:CheckBox ID="cbx_telephone" runat="server" Text="�绰"></asp:CheckBox><asp:CheckBox ID="cbx_fax" runat="server" Text="����"></asp:CheckBox><asp:CheckBox ID="cbx_email" runat="server" Text="�ʼ�"></asp:CheckBox><asp:CheckBox ID="cbx_mail" runat="server" Text="�ź�"></asp:CheckBox><asp:CheckBox ID="cbx_meeting" runat="server" Text="����"></asp:CheckBox><asp:CheckBox ID="cbx_interview" runat="server" Text="�߷�"></asp:CheckBox><asp:CheckBox ID="cbx_callin" runat="server" Text="����"></asp:CheckBox><asp:CheckBox ID="cbx_sms" runat="server" Text="����Ϣ"></asp:CheckBox></td>
                </tr>
                <tr>
                    <td bgcolor="#e8f4ff" height="24" style="WIDTH: 76px" align="center" colspan="1" rowspan="1">�Ӵ�״̬</td>
                    <td colspan="3">
                        <asp:CheckBox ID="cbx_trace" runat="server" Visible="False" Text="����"></asp:CheckBox><asp:CheckBox ID="cbx_boot" runat="server" Visible="False" Text="����"></asp:CheckBox><asp:CheckBox ID="cbx_commend" runat="server" Visible="False" Text="��Ʒ�Ƽ�"></asp:CheckBox><asp:CheckBox ID="cbx_requirement" runat="server" Visible="False" Text="������"></asp:CheckBox><asp:CheckBox ID="cbx_submit" runat="server" Visible="False" Text="�����ύ"></asp:CheckBox><asp:CheckBox ID="cbx_negotiate" runat="server" Visible="False" Text="����̸��"></asp:CheckBox><asp:CheckBox ID="cbx_actualize" runat="server" Visible="False" Text="��Ŀʵʩ"></asp:CheckBox><asp:CheckBox ID="cbx_traceservice" runat="server" Visible="False" Text="���ٷ���"></asp:CheckBox><asp:CheckBox ID="cbx_last" runat="server" Visible="False" Text="��β��"></asp:CheckBox><asp:RadioButton ID="rbtn_trace" runat="server" Text="����" Checked="True" GroupName="contactstatus"></asp:RadioButton><asp:RadioButton ID="rbtn_boot" runat="server" Text="����" GroupName="contactstatus"></asp:RadioButton><asp:RadioButton ID="rbtn_commend" runat="server" Text="��Ʒ�Ƽ�" GroupName="contactstatus"></asp:RadioButton><asp:RadioButton ID="rbtn_requirement" runat="server" Text="������" GroupName="contactstatus"></asp:RadioButton><asp:RadioButton ID="rbtn_submit" runat="server" Text="�����ύ" GroupName="contactstatus"></asp:RadioButton><asp:RadioButton ID="rbtn_negotiate" runat="server" Text="����̸��" GroupName="contactstatus"></asp:RadioButton><asp:RadioButton ID="rbtn_actualize" runat="server" Text="��Ŀʵʩ" GroupName="contactstatus"></asp:RadioButton><asp:RadioButton ID="rbtn_traceservice" runat="server" Text="���ٷ���" GroupName="contactstatus"></asp:RadioButton><asp:RadioButton ID="rbtn_last" runat="server" Text="��β��" GroupName="contactstatus"></asp:RadioButton></td>
                </tr>
                <tr>
                    <td bgcolor="#e8f4ff" height="24" style="WIDTH: 76px" align="center" colspan="1" rowspan="1">���η���</td>
                    <td style="WIDTH: 278px" valign="middle">&nbsp;<asp:TextBox ID="tbx_thisfee" runat="server" Width="112px">0</asp:TextBox>Ԫ(RMB)<asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="tbx_thisfee" MaximumValue="999999"
                        MinimumValue="0" ErrorMessage="����������"></asp:RangeValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbx_thisfee" ErrorMessage="����������"></asp:RequiredFieldValidator></td>
                    <td bgcolor="#e8f4ff">&nbsp;������;</td>
                    <td valign="middle">
                        <asp:CheckBox ID="cbx_travel" runat="server" Text="����"></asp:CheckBox><asp:CheckBox ID="cbx_food" runat="server" Text="����"></asp:CheckBox><asp:CheckBox ID="cbx_gift" runat="server" Text="��Ʒ"></asp:CheckBox><asp:CheckBox ID="cbx_out" runat="server" Text="����"></asp:CheckBox></td>
                </tr>
                <tr>
                    <td bgcolor="#e8f4ff" height="61" style="WIDTH: 76px" align="center" colspan="1" rowspan="1">�Ӵ�����</td>
                    <td colspan="3" height="61">&nbsp;<asp:TextBox ID="tbx_contactcontent" runat="server" Width="632px" TextMode="MultiLine" Height="57px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td bgcolor="#e8f4ff" height="24" style="WIDTH: 76px" align="center">�´νӴ�Ŀ��</td>
                    <td style="WIDTH: 278px">&nbsp;<asp:TextBox ID="tbx_nextcontactaim" runat="server" Width="272px"></asp:TextBox></td>
                    <td bgcolor="#e8f4ff"></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td valign="middle" bgcolor="#e8f4ff" height="24" style="WIDTH: 76px" align="center"
                        colspan="1" rowspan="1">����</td>
                    <td colspan="3">
                        <input class="inputCss" id="File1" style="WIDTH: 400px; HEIGHT: 19px" type="file" size="81"
                            name="File1" runat="server">
                        <br>
                        <input class="inputCss" id="File2" style="WIDTH: 400px; HEIGHT: 19px" type="file" size="81"
                            name="File2" runat="server">
                        <br>
                        <input class="inputCss" id="File3" style="WIDTH: 400px; HEIGHT: 19px" type="file" size="81"
                            name="File3" runat="server"></td>
                </tr>
                <tr>
                    <td align="center" colspan="4" height="36">
                        <asp:Button ID="btn_OK" runat="server" CssClass="buttoncss" Text=" ȷ �� " Width="60px"></asp:Button><asp:Label ID="lbl_Message" runat="server" Width="70px"></asp:Label></td>
                </tr>
                <tr>
                    <td style="HEIGHT: 16px" align="center" bgcolor="#8af2ff" colspan="4">һ������ӵĽӴ���¼:</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <uc1:ControlClientContactHistory_thisWeek ID="ControlClientContactHistory1" runat="server"></uc1:ControlClientContactHistory_thisWeek>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4"><a href="javascript:parent.navigatemf('�ͻ�����', '<%= Page.ResolveUrl("ClientListView.aspx") %>', 'CM');">���ؿͻ�����</a></td>
                </tr>
            </table>
        </font>
    </form>
    <script language="javascript" type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script language="javascript" type="text/javascript" src="../../js/jquery.ui.datepicker-zh-CN.js"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function(){
            $("#tbx_contacttime").datepicker({
                dateFormat: "yy/mm/dd"
            });
            $("#tbx_nextcontacttime").datepicker({
                dateFormat: "yy/mm/dd"
            });
        });
    </script>
</body>
</html>
