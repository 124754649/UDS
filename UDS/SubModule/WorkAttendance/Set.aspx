<%@ Page language="c#" Codebehind="Set.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.WorkAttendance.Set" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>Set</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <link href="../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link type="text/css" rel="Stylesheet" href="../../Css/redmond/jquery-ui-1.10.3.custom.min.css" />
</head>
<body leftmargin="0" topmargin="0" ms_positioning="GridLayout">
    <form id="Set" method="post" runat="server">
        <table id="Table1" bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%"
            border="0">
            <tr height="30">
                <td class="GbText" width="3%" background="../../Images/treetopbg.jpg" bgcolor="#c0d9e6"><font color="#003366" size="3">
                    <img alt="" src="../../DataImages/workadmin2.gif"></font></td>
                <td class="GbText" background="../../Images/treetopbg.jpg" bgcolor="#c0d9e6"><b><b>��������</b></b></td>
            </tr>
        </table>
        <table class="GBText" id="Table1" style="BORDER-COLLAPSE: collapse; HEIGHT: 109px" bordercolor="#93bee2"
            height="109" cellspacing="1" cellpadding="1" width="100%" border="1" designtimedragdrop="56">
            <tr>
                <td style="WIDTH: 130px; HEIGHT: 54px" align="center">����������</td>
                <td style="HEIGHT: 54px">��ʼʱ�䣺
						<asp:TextBox ClientIDMode="Static" ID="txtbegintime" runat="server" Columns="10"
                            CssClass="inputcss"></asp:TextBox>--����ʱ��
						<asp:TextBox ClientIDMode="Static" ID="txtendtime" runat="server" Columns="10"
                            CssClass="inputcss"></asp:TextBox>&nbsp;
						<asp:CompareValidator ID="cvdate" runat="server" ControlToCompare="txtbegintime" Operator="GreaterThanEqual"
                            ErrorMessage="����ʱ��Ӧ�ô��ڿ�ʼʱ��" ControlToValidate="txtendtime" Display="None"></asp:CompareValidator>&nbsp;
						<asp:RadioButton ID="rbtnthisweek" onclick="quickseldate('week');" runat="server" GroupName="quickdate"
                            Text="����"></asp:RadioButton><asp:RadioButton ID="rbtnthismonth" onclick="quickseldate('month');" runat="server" GroupName="quickdate"
                                Text="����"></asp:RadioButton>
                    <input language="javascript" class="buttoncss" id="btnsetdate" title="���ÿ�������" onclick="switch2ShowDay()"
                        type="button" value="��ϸ���" name="btnsetdate" runat="server"></td>
            </tr>
            <tr>
                <td style="WIDTH: 130px" align="center"><font face="����">���ù�˾����ʱ��</font></td>
                <td><font face="����">�ϰ�ʱ��
							<asp:TextBox ID="tbx_OnDutyTime" runat="server" CssClass="inputcss" Width="81px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="�ϰ�ʱ�䲻��Ϊ��" ControlToValidate="tbx_OnDutyTime"
                                Display="Dynamic"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="ʱ���ʽ����" ControlToValidate="tbx_OnDutyTime"
                                    Display="Dynamic" ValidationExpression="(((0|1)[0-9])|(2[0-3])|([0-9])):([0-5][0-9])"></asp:RegularExpressionValidator>�°�ʱ��
							<asp:TextBox ID="tbx_OffDutyTime" runat="server" CssClass="inputcss" Width="79px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="�°�ʱ�䲻��Ϊ��" ControlToValidate="tbx_OffDutyTime"
                                Display="Dynamic"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="ʱ���ʽ����" ControlToValidate="tbx_OffDutyTime"
                                    Display="Dynamic" ValidationExpression="(((0|1)[0-9])|(2[0-3])|([0-9])):([0-5][0-9])"></asp:RegularExpressionValidator><asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="�°�ʱ�䲻�������ϰ�ʱ��" Display="Dynamic"
                                        ClientValidationFunction="checkdutytime"></asp:CustomValidator>��ʱ���ʽ����09:00��9:00��
							<asp:Button ID="btn_SetTime" runat="server" CssClass="buttoncss" Text=" ��  ��"></asp:Button></font></td>
            </tr>
            <tr>
                <td style="WIDTH: 130px" align="center"><font face="����"></font></td>
                <td><font face="����"></font></td>
            </tr>
        </table>
    </form>
    <script language="javascript" type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script language="javascript" type="text/javascript" src="../../js/jquery.ui.datepicker-zh-CN.js"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $("#txtbegintime").datepicker();
            $("#txtendtime").datepicker();
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
            if (navigator.appName == "Netscape") {
                year = 1900 + year;
            }

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

            document.getElementById("txtbegintime").value = begintime;
            document.getElementById("txtendtime").value = endtime;

        }
        function checkdutytime(source, arguments) {
            var ondutytime, offdutytime;
            var begindate, enddate;
            ondutytime = document.getElementById('tbx_OnDutyTime').value;
            offdutytime = document.getElementById('tbx_OffDutyTime').value;
            begindate = Date.parse('1/1/1900 ' + ondutytime);
            enddate = Date.parse('1/1/1900 ' + offdutytime);
            if (enddate < begindate)
                arguments.IsValid = false;
            else
                arguments.IsValid = true;
        }
        function checkdutydate() {
            var begindate, enddate;
            begindate = document.getElementById('txtbegintime').value;
            enddate = document.getElementById('txtendtime').value;
            if (begindate.replace(' ', '') == '' || enddate.replace(' ', '') == '') {
                alert('���ڲ���Ϊ��');
                return false;
            }
            else {
                if (begindate > enddate) {
                    alert('��ʼʱ�䲻�ܴ��ڽ���ʱ��');
                    return false
                }
            }
            return true;
        }
        function switch2ShowDay() {
            var pre_url = '<%= Page.ResolveUrl("ShowDay.aspx") %>';

            if (checkdutydate()) {
                var url = pre_url + '?begintime=' + document.getElementById('txtbegintime').value + '&endtime=' + document.getElementById('txtendtime').value
                parent.navigatemf('���ÿ�������', url, 'WorkAttendance');
            }
        }
    </script>
</body>
</html>
