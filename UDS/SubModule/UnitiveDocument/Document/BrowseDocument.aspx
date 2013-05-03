<%@ Page Language="c#" CodeBehind="BrowseDocument.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.UnitiveDocument.Document.BrowseDocument" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>文档浏览</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
</head>
<body ms_positioning="GridLayout" leftmargin="0" topmargin="0">
    <form id="BrowseDocument" method="post" runat="server">
        <table id="Table1" cellspacing="0" cellpadding="0" width="100%" border="0" align="center">
            <tr>
                <td>
                    <table id="Table2" bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%"
                        border="0">
                        <tr height="30">
                            <td class="GbText" width="3%" background="../../../Images/treetopbg.jpg" bgcolor="#c0d9e6"><font color="#003366" size="3">
                                <img height="16" src="../../../images/283.GIF" width="16"></font></td>
                            <td class="GbText" background="../../../Images/treetopbg.jpg" bgcolor="#c0d9e6"><b><b><b>文档内容</b></b></b></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table border="1" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#cccccc"
                        width="100%" id="AutoNumber2" height="1" class="GbText" align="left">
                        <tr>
                            <td width="25%" height="22">&nbsp;<font face="宋体">文档标题:</font></td>
                            <td width="81%">&nbsp;
									<asp:Label ID="lblDocTitle" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td width="25%" height="22">&nbsp;<font face="宋体">归档人:</font></td>
                            <td width="81%">&nbsp;
									<asp:Label ID="lblDocApprover" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td width="25%" height="22">&nbsp;<font face="宋体">归档日期:</font></td>
                            <td width="81%">&nbsp;
									<asp:Label ID="lblDocApproveDate" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td width="25%" height="22">&nbsp;<font face="宋体">上传人:</font></td>
                            <td width="81%">&nbsp;
									<asp:Label ID="lblAddedBy" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td width="25%" height="22">&nbsp;<font face="宋体">上传日期:</font></td>
                            <td width="81%">&nbsp;
									<asp:Label ID="lblAddedDate" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td width="25%" height="22">&nbsp;<font face="宋体">下载次数:</font></td>
                            <td width="81%">&nbsp;
									<asp:Label ID="lblDocViewedTimes" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td width="25%" height="22">&nbsp;<font face="宋体">所属项目:</font></td>
                            <td width="81%">&nbsp;
									<asp:Label ID="lblClassName" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td width="25%" height="22">&nbsp;<font face="宋体">文件简介:</font></td>
                            <td width="81%"><font face="宋体"></font>&nbsp;
									<asp:Label ID="lblDocContent" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td width="25%" height="22">&nbsp;<font face="宋体">文件下载:</font></td>
                            <td width="81%"><font face="宋体"></font>&nbsp;
									<asp:Label ID="lblFileVisualPath" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="FONT-SIZE: 8pt" valign="middle" align="center">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td style="HEIGHT: 28px" align="right"><font face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><input type="button" value=" 返  回 " onclick="javascript: try { if (parent.frames.length == 0) window.close(); else history.go(-1); } catch (e) { }"
                                class="buttoncss"></td>
                            <td style="HEIGHT: 28px" align="right">
                                <img height="25" src="../../../images/endbott.gif" width="279"></td>
                        </tr>
                    </table>
                    <asp:DataList ID="DataListDocument" runat="server"></asp:DataList>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
