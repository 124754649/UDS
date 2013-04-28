<%@ Page Language="c#" CodeBehind="TreeView.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.AssginRule.frmAddRight" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>TreeView</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
    <script language="javascript">
        function test() {
            var ret;
            ret = window.showModalDialog("ClassTree.aspx?ClassID=1", window, "dialogHeight:400px;dialogWidth:300px;center:Yes;Help:No;Resizable:yes;Status:Yes;Scroll:auto;Status:no;");

        }
    </script>
</head>
<body leftmargin="0" topmargin="0" ms_positioning="GridLayout">
    <form id="frmAddRight" method="post" runat="server">
        <table id="AutoNumber1" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" height="100%" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td colspan="2">
                    <table id="Table1" bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr height="30">
                            <td class="GbText" width="3%" background="../../Images/treetopbg.jpg" bgcolor="#c0d9e6"><font color="#003366" size="3">
                                <img height="16" src="../../DataImages/scales.gif" width="16"></font></td>
                            <td class="GbText" background="../../Images/treetopbg.jpg" bgcolor="#c0d9e6"><font color="#006699">新增权限</font></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top" align="middle" height="100%" style="WIDTH: 168px">
                    <iframe id="ClassList" src="ClassTree.aspx?SrcID=<%Response.Write(SrcID);%>&DisplayType=<%Response.Write(DisplayType);%>" scrolling="no" style="WIDTH: 100%; HEIGHT: 100%" frameborder="0" border="0"></iframe>
                </td>
                <td valign="top" style="width:auto;height:100%">
                    <iframe style="margin-left:15px" src="RightList.aspx?SrcID=<%Response.Write(SrcID);%>&DisplayType=<%Response.Write(DisplayType);%>" id="RightList" scrolling="no" style="WIDTH: 100%; HEIGHT: 100%" name="RightList" frameborder="0" border="0" framespacing="0"></iframe>
                </td>
            </tr>
        </table>
    </form>

    <script type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../js/quantumcode-elements.js"></script>
    <script type="text/javascript" src="../../js/quantumcode.js"></script>
    <script type="text/javascript" src="../../js/jquery.iframe-auto-height.plugin.1.9.1.min.js"></script>
    <script type="text/javascript">
        /*
        $(function () {
            $("#ClassList").load(function () {
                var height = $(this).contents().find("#WorkArea").height() + 40;
                //这样给以一个最小高度
                $(this).height(height < 400 ? 400 : height);
            });

            $("#RightList").load(function () {
                var height = $(this).contents().find("#WorkArea").height() + 40;
                //这样给以一个最小高度
                $(this).height(height < 400 ? 400 : height);
            });
        });*/
        $(document).ready(function () {
            $("iframe#RightList").iframeAutoHeight({ minHeight: 400 });
        });
    </script>
</body>
</html>
