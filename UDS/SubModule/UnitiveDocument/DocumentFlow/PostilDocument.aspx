<%@ Page language="c#" Codebehind="PostilDocument.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.UnitiveDocument.DocumentFlow.PostilDocument" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>PostilDocument</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<base target="_self">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="PostilDocument" method="post" runat="server">
			<FONT face="宋体">
				<asp:label id="labTitle" style="Z-INDEX: 101; LEFT: 14px; POSITION: absolute; TOP: 14px" runat="server">批注：</asp:label><asp:textbox id="txtPostil" style="Z-INDEX: 102; LEFT: 97px; POSITION: absolute; TOP: 12px" runat="server" Width="454px" Height="160px"></asp:textbox><asp:button id="cmdOK" style="Z-INDEX: 103; LEFT: 218px; POSITION: absolute; TOP: 182px" runat="server" Width="67px" Height="24px" Text="确定"></asp:button><INPUT style="Z-INDEX: 104; LEFT: 300px; WIDTH: 67px; POSITION: absolute; TOP: 182px; HEIGHT: 24px" onclick="javascript:window.close();" type="button" value="取消"></FONT></form>
	</body>
</HTML>
