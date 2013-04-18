<%@ Page language="c#" Codebehind="SelectProject.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.UnitiveDocument.DocumentFlow.SelectProject" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>SelectProject</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
		<base target="_self">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="SelectProject" method="post" runat="server">
			<FONT face="宋体">
				<asp:label id="Label1" style="Z-INDEX: 101; LEFT: 12px; POSITION: absolute; TOP: 12px" runat="server">请选择一个项目：</asp:label><asp:listbox id="lbProject" style="Z-INDEX: 102; LEFT: 15px; POSITION: absolute; TOP: 35px" runat="server" Height="237px" Width="159px"></asp:listbox><asp:button id="cmdOK" style="Z-INDEX: 103; LEFT: 31px; POSITION: absolute; TOP: 277px" runat="server" Text="确 定" CssClass="buttoncss" Width="60px"></asp:button><asp:button id="cmdCancel" style="Z-INDEX: 104; LEFT: 100px; POSITION: absolute; TOP: 277px" runat="server" Text="取 消" CssClass="buttoncss" Width="60px"></asp:button></FONT></form>
	</body>
</HTML>
