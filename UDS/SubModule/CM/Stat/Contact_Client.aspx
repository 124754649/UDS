<%@ Page language="c#" Codebehind="Contact_Client.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.CM.Stat.Contact_Client" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>Contact_Client</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
    <link type="text/css" rel="Stylesheet" href="../../../Css/redmond/jquery-ui-1.10.3.custom.min.css" />
</head>
<body ms_positioning="GridLayout">
    <form id="Contact_Client" method="post" runat="server">
        <font face="����">
            <table id="Table1" cellspacing="1" cellpadding="1" width="100%" border="1">
                <tr>
                    <td>��ʼʱ��
							<asp:TextBox ClientIDMode="Static" ID="tbx_begintime" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;
							<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbx_begintime" Display="Dynamic"
                                ErrorMessage="*"></asp:RequiredFieldValidator>����ʱ��
							<asp:TextBox ClientIDMode="Static" ID="tbx_endtime" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;
							<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbx_endtime" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RadioButton ID="rbtn_thisweek" onclick="quickseldate('week');" runat="server" GroupName="quickselect"
                                Text="����"></asp:RadioButton><asp:RadioButton ID="rbtn_thismonth" onclick="quickseldate('month');" runat="server" GroupName="quickselect"
                                    Text="����"></asp:RadioButton>&nbsp;
							<asp:Button ID="btn_OK" runat="server" Text="ȷ��" CssClass="redbuttoncss" Width="48px"></asp:Button></td>
                </tr>
                <tr>
                    <td align="center">
                        <table id="Table2" cellspacing="1" cellpadding="1" width="100%" border="1">
                            <tr>
                                <td style="WIDTH: 248px" align="center" bgcolor="beige">��ϸ</td>
                                <td align="center" bgcolor="#f5f5dc" colspan="" rowspan="">������ֲ鿴����</td>
                                <td style="WIDTH: 274px" align="center" bgcolor="#f5f5dc" colspan="" rowspan="">��ϸ</td>
                                <td align="center" bgcolor="#f5f5dc" colspan="" rowspan="">������ֲ鿴����</td>
                            </tr>
                            <tr>
                                <td style="WIDTH: 248px">��ӽӴ���¼��������Ա����</td>
                                <td><a onclick="javascript:window.open('sellman.aspx?begintime='+document.Contact_Client.tbx_begintime.value+'&amp;endtime='+document.Contact_Client.tbx_endtime.value),'_blank'"
                                    href="#">
                                    <asp:Literal ID="ltl_AddContactSellman" runat="server"></asp:Literal></a>
                                </td>
                                <td style="WIDTH: 274px">�Ӵ�������
                                </td>
                                <td><a onclick="javascript:window.open('contactedclient.aspx?type=ac&amp;begintime='+document.Contact_Client.tbx_begintime.value+'&amp;endtime='+document.Contact_Client.tbx_endtime.value),'_blank'"
                                    href="#">
                                    <asp:Literal ID="ltl_Contact" runat="server"></asp:Literal></a></td>
                            </tr>
                            <tr>
                                <td style="WIDTH: 248px">�ݷÿͻ�������
                                </td>
                                <td><a onclick="javascript:window.open('contactedclient.aspx?type=cc&amp;begintime='+document.Contact_Client.tbx_begintime.value+'&amp;endtime='+document.Contact_Client.tbx_endtime.value),'_blank'"
                                    href="#">
                                    <asp:Literal ID="ltl_CallinContact" runat="server"></asp:Literal></a></td>
                                <td style="WIDTH: 274px">�·��ֿͻ�����</td>
                                <td><a onclick="javascript:window.open('contactedclient.aspx?type=nc&amp;begintime='+document.Contact_Client.tbx_begintime.value+'&amp;endtime='+document.Contact_Client.tbx_endtime.value),'_blank'"
                                    href="#">
                                    <asp:Literal ID="ltl_NewClient" runat="server"></asp:Literal></a></td>
                            </tr>
                            <tr>
                                <td style="WIDTH: 248px">��������̸�еĿͻ������£���</td>
                                <td><a onclick="javascript:window.open('contactedclient.aspx?type=neonc&amp;begintime='+document.Contact_Client.tbx_begintime.value+'&amp;endtime='+document.Contact_Client.tbx_endtime.value),'_blank'"
                                    href="#">
                                    <asp:Literal ID="ltl_NegotiateClient_New" runat="server"></asp:Literal></a></td>
                                <td style="WIDTH: 274px">3�����ϵĿͻ��������£���</td>
                                <td><a onclick="javascript:window.open('contactedclient.aspx?type=n3c&amp;begintime='+document.Contact_Client.tbx_begintime.value+'&amp;endtime='+document.Contact_Client.tbx_endtime.value),'_blank'"
                                    href="#">
                                    <asp:Literal ID="ltl_New3Client_New" runat="server"></asp:Literal></a></td>
                            </tr>
                            <tr>
                                <td style="WIDTH: 248px">��������̸�еĿͻ������ܣ���</td>
                                <td><a onclick="javascript:window.open('contactedclient.aspx?type=neoc&amp;begintime='+document.Contact_Client.tbx_begintime.value+'&amp;endtime='+document.Contact_Client.tbx_endtime.value),'_blank'"
                                    href="#">
                                    <asp:Literal ID="ltl_NegotiateClient_Total" runat="server"></asp:Literal></a></td>
                                <td style="WIDTH: 274px">3�����ϵĿͻ��������ܣ���</td>
                                <td><a onclick="javascript:window.open('contactedclient.aspx?type=3c&amp;begintime='+document.Contact_Client.tbx_begintime.value+'&amp;endtime='+document.Contact_Client.tbx_endtime.value),'_blank'"
                                    href="#">
                                    <asp:Literal ID="ltl_New3Client_Total" runat="server"></asp:Literal></a></td>
                            </tr>
                            <tr>
                                <td style="WIDTH: 248px">��������������</td>
                                <td><a onclick="javascript:window.open('fee.aspx?type=client&amp;begintime='+document.Contact_Client.tbx_begintime.value+'&amp;endtime='+document.Contact_Client.tbx_endtime.value),'_blank'"
                                    href="#">
                                    <asp:Literal ID="ltl_Fee" runat="server"></asp:Literal></a></td>
                                <td style="WIDTH: 274px">�������ô�����</td>
                                <td><a onclick="javascript:window.open('fee.aspx?type=sellman&amp;begintime='+document.Contact_Client.tbx_begintime.value+'&amp;endtime='+document.Contact_Client.tbx_endtime.value),'_blank'"
                                    href="#">
                                    <asp:Literal ID="ltl_FeeTimes" runat="server"></asp:Literal></a></td>
                            </tr>
                            <tr>
                                <td style="WIDTH: 248px">�������ÿͻ�����</td>
                                <td><a onclick="javascript:window.open('fee.aspx?type=client&amp;begintime='+document.Contact_Client.tbx_begintime.value+'&amp;endtime='+document.Contact_Client.tbx_endtime.value),'_blank'"
                                    href="#">
                                    <asp:Literal ID="ltl_FeeClient" runat="server"></asp:Literal></a></td>
                                <td style="WIDTH: 274px">��������������Ա����</td>
                                <td><a onclick="javascript:window.open('fee.aspx?type=sellman&amp;begintime='+document.Contact_Client.tbx_begintime.value+'&amp;endtime='+document.Contact_Client.tbx_endtime.value),'_blank'"
                                    href="#">
                                    <asp:Literal ID="ltl_FeeSellman" runat="server"></asp:Literal></a></td>
                            </tr>
                        </table>
                        &nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </font>
    </form>
    <script type="text/javascript" language="javascript" src="../../../js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" language="javascript" src="../../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" language="javascript" src="../../../js/jquery.ui.datepicker-zh-CN.js"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $("#tbx_begintime").datepicker();
            $("#tbx_endtime").datepicker();
        });

        function fillstring(str) {
            if (str.length == 1) {
                str = "0" + str;
            }
            return (str);
        }

        function quickseldate(type) {
            var begintime, endtime;
            var oneminute = 60 * 1000;
            var onehour = 60 * oneminute;
            var oneday = 24 * onehour;
            var oneweek = 7 * oneday;

            var todayDate = new Date();
            var date = todayDate.getDate();
            var month = todayDate.getMonth() + 1;
            var year = todayDate.getFullYear();
            var day = todayDate.getDay();

            //-->

            if (type == "day") {
                begintime = year.toString() + "-" + fillstring(month.toString()) + "-" + fillstring(date.toString());
                endtime = begintime;
            }
            else if (type == "week") {
                var daytoMon = day - 1;
                if (day == 0)
                    daytoMon = 6;

                todayDate.setTime(todayDate.getTime() - daytoMon * oneday);
                date = todayDate.getDate();
                month = todayDate.getMonth() + 1;
                year = todayDate.getFullYear();
                day = todayDate.getDay();

                begintime = year.toString() + "-" + fillstring(month.toString()) + "-" + fillstring(date.toString());

                todayDate.setTime(todayDate.getTime() + 6 * oneday);

                date = todayDate.getDate();
                month = todayDate.getMonth() + 1;
                year = todayDate.getFullYear();

                endtime = year.toString() + "-" + fillstring(month.toString()) + "-" + fillstring(date.toString());
            }
            else if (type == "month") {
                var dateto1 = date - 1;

                todayDate.setTime(todayDate.getTime() - dateto1 * oneday);
                date = todayDate.getDate();
                month = todayDate.getMonth() + 1;
                year = todayDate.getFullYear();
                day = todayDate.getDay();

                begintime = year.toString() + "-" + fillstring(month.toString()) + "-" + fillstring(date.toString());

                todayDate.setMonth(month);
                todayDate.setTime(todayDate.getTime() - oneday);

                date = todayDate.getDate();
                month = todayDate.getMonth() + 1;
                year = todayDate.getFullYear();

                endtime = year.toString() + "-" + fillstring(month.toString()) + "-" + fillstring(date.toString());

            }

            document.getElementById("tbx_begintime").value = begintime;
            document.getElementById("tbx_endtime").value = endtime;

        }
    </script>
</body>
</html>
