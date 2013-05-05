<%@ Page language="c#" Codebehind="TreeView.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.UnitiveDocument.Mail.TreeView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TreeView</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio 7.0">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
    <base target="_self">
</head>
<body ms_positioning="GridLayout">
    <form id="TreeView" method="post" runat="server">
        <table width="33%" border="0">
            <tr>
                <td>&nbsp;
					<asp:TreeView ID="TreeView1" runat="server" ImageSet="XPFileExplorer" NodeIndent="15">
                        <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                        <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px" NodeSpacing="0px" VerticalPadding="2px" />
                        <ParentNodeStyle Font-Bold="False" />
                        <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px" VerticalPadding="0px" />
                    </asp:TreeView>
                </td>
            </tr>
            <tr>
                <td>&nbsp;<font face="����">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</font><input class="ButtonCss" type="button" value="ȷ��" onclick="confirmSelect()"></td>
            </tr>
        </table>
    </form>
    <script language="javascript" type="text/javascript" src="../../../js/jquery-1.9.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="../../../js/jqBrowser.js"></script>
    <script language="javascript" type="text/javascript">
        var parwin = null;

        $(document).ready(function () {
            // IE����� ���������ύ��window.dialogArguments���ᶪʧ��ͬʱwindow.opener���Բ����ڣ�
            if ($.browser.msie) {
                parwin = window.dialogArguments;
            }
            else {
                // Firefox��������������ύ��window.dialogArguments�ᶪʧ��ͬʱwindow.opener���Դ��ڣ���  
                if (window.opener.callBack == undefined) {
                    window.opener.callBack = window.dialogArguments;
                }
                parwin = window.opener.callBack;
            }
        });

        function confirmSelect() {
            tdText = '<%= CurrentText %>';
            tdID = '<%= CurrentID %>';

            if (tdText == '' || tdID == '') {
                alert("�����ѡ��һ���ڵ�");
                return;
            }

            if (parwin.ReadMail != null) {
                if (confirm("��ȷ��Ҫѡ�� <<" + tdText + ">> ?")) {
                    $.ajax({
                        url: 'ReadMail.aspx?Action=3&ClassID=' + tdID + '&MailID=' + parwin.ReadMail.hdnMailID.value,
                        type: 'GET',
                        dataType: 'html',
                        cache: false,
                        success: function (data, textStatus, jqXHR) {
                            alert(data);
                            window.close();
                        },
                        error: function (jqXHR, textStatus, err) {
                            alert("�鵵��������" + jqXHR.responseText);
                        }
                    });
                }

            }
            if (confirm("��ȷ��Ҫѡ�� <<" + tdText + ">> ?")) {
                parwin.document.all.txtProjectName.value = tdText;
                parwin.document.all.hdnProjectID.value = tdID;
                window.close();
            }
        }

    </script>
</body>
</html>
