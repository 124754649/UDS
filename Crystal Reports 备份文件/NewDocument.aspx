<%@ Page language="c#" Codebehind="NewDocument.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.UnitiveDocument.DocumentFlow.NewDocument" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>NewDocument</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../css/BasicLayout.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body leftMargin="0" topMargin="0" MS_POSITIONING="GridLayout">
		<form id="NewDocument" method="post" encType="multipart/form-data" runat="server">
			<input id="PID" type="hidden" value="0" runat="server">
			<asp:table id="ht" style="Z-INDEX: 101; LEFT: 8px; POSITION: absolute; TOP: 100px; BORDER-COLLAPSE: collapse"
				runat="server" CellSpacing="1" CellPadding="1" CssClass="GbText" BorderWidth="1px" bordercolor="#CCCCCC"
				BorderStyle="Solid" GridLines="Both" Height="33px" Width="100%"></asp:table><asp:requiredfieldvalidator id="RequiredFieldValidator1" style="Z-INDEX: 102; LEFT: 615px; POSITION: absolute; TOP: 287px"
				runat="server" ControlToValidate="TextBox2"></asp:requiredfieldvalidator><asp:textbox id="TextBox2" style="Z-INDEX: 103; LEFT: 533px; POSITION: absolute; TOP: 292px"
				runat="server" Height="23px" Width="76px" Visible="False">为了验证加的冗余控件</asp:textbox><select id="ddlProject" onchange="document.all.PID.value=this.options[this.selectedIndex].value;"
				runat="server"></select><asp:button id="cmdSave" accessKey="S" runat="server" CssClass="buttoncss" Width="66px" EnableViewState="False"
				Text="保存"></asp:button><asp:button id="cmdSend" accessKey="T" runat="server" CssClass="buttoncss" Width="66px" EnableViewState="False"
				Text="发送"></asp:button><asp:button id="cmdDelete" accessKey="D" runat="server" CssClass="ButtonCss" Width="66px" EnableViewState="False"
				Text="删除" CausesValidation="False"></asp:button><asp:button id="cmdReturn" accessKey="R" runat="server" CssClass="ButtonCss" Width="66px" EnableViewState="False"
				Text="返回" CausesValidation="False"></asp:button></form>
	</body>
</HTML>
