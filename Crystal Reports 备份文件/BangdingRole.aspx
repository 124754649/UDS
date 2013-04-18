<%@ Page language="c#" Codebehind="BangdingRole.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.UnitiveDocument.DocumentFlow.BangdingRole" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>BangdingRole</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout" topmargin="0" leftmargin="0">
		<form id="BangdingRole" method="post" runat="server">
			<FONT face="宋体">
				<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
					<TR>
						<TD vAlign="top" height="38">
							<TABLE borderColor="#111111" height="1" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TR height="30">
									<TD class="GbText" align="right" width="20" background="../../../Images/treetopbg.jpg" bgColor="#c0d9e6"><FONT color="#003366" size="3"><IMG height="16" src="../../../DataImages/DocFlow.gif" width="16"></FONT></TD>
									<TD class="GbText" align="right" width="120" background="../../../Images/treetopbg.jpg" bgColor="#e8f4ff"><FONT color="#006699">文档流转-环节绑定</FONT></TD>
									<TD class="GbText" align="right" background="../../../Images/treetopbg.jpg" bgColor="#e8f4ff">&nbsp;&nbsp;</TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD align="middle">
							<TABLE class="gbtext" cellSpacing="0" cellPadding="0" width="700" border="0">
								<TR>
									<TD width="150">
										<asp:label id="Label2" runat="server" Height="15px" Width="118px">当前环节角色：</asp:label></TD>
									<TD width="30"></TD>
									<TD width="150">
										<asp:label id="Label1" runat="server" Height="20px" Width="93px">所有角色：</asp:label></TD>
									<TD width="40"></TD>
									<TD width="150">
										<asp:label id="Label3" runat="server">绑定职位</asp:label></TD>
									<TD width="30"></TD>
									<TD width="150">
										<asp:label id="Label4" runat="server">所有职位</asp:label></TD>
								</TR>
								<TR>
									<TD>
										<asp:listbox id="lstCurRole" runat="server" Width="140px" Height="175px"></asp:listbox></TD>
									<TD>
										<asp:button id="cmdAdd" runat="server" Height="24px" Width="26px" CssClass="buttoncss" Text="<<"></asp:button><BR>
										<BR>
										<asp:button id="cmdDelete" runat="server" Height="24px" Width="26px" CssClass="buttoncss" Text=">>"></asp:button></TD>
									<TD><asp:listbox id="lstAllRole" runat="server" Width="140px" Height="175px"></asp:listbox></TD>
									<TD></TD>
									<TD>
										<asp:listbox id="lstCurPosition" runat="server" Height="175px" Width="140px"></asp:listbox></TD>
									<TD>
										<asp:button id="cmdAddPositon" runat="server" Height="24" Width="26" CssClass="buttoncss" Text="<<"></asp:button><BR>
										<BR>
										<asp:button id="cmdDeletePosition" runat="server" Height="24" Width="26" CssClass="buttoncss" Text=">>"></asp:button></TD>
									<TD>
										<asp:listbox id="lstAllPosition" runat="server" Height="175px" Width="140px"></asp:listbox></TD>
								</TR>
								<TR>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<asp:label id="Label8" runat="server">绑定项目：</asp:label></TD>
									<TD></TD>
									<TD>
										<asp:label id="Label5" runat="server">所有项目：</asp:label></TD>
									<TD></TD>
									<TD>
										<asp:label id="Label6" runat="server">绑定人员：</asp:label></TD>
									<TD></TD>
									<TD>
										<asp:label id="Label7" runat="server">所有人员</asp:label></TD>
								</TR>
								<TR>
									<TD>
										<asp:listbox id="lstCurTeam" runat="server" Height="175px" Width="140px"></asp:listbox></TD>
									<TD>
										<asp:button id="cmdAddTeam" runat="server" Height="24" Width="26" CssClass="buttoncss" Text="<<"></asp:button><BR>
										<BR>
										<asp:button id="cmdDeleteTeam" runat="server" Height="24" Width="26" CssClass="buttoncss" Text=">>"></asp:button></TD>
									<TD>
										<asp:listbox id="lstAllTeam" runat="server" Height="175px" Width="140px"></asp:listbox></TD>
									<TD></TD>
									<TD><asp:listbox id="lstCurStaff" runat="server" Width="140px" Height="175px"></asp:listbox></TD>
									<TD>
										<asp:button id="cmdAddStaff" runat="server" Height="24" Width="26" CssClass="buttoncss" Text="<<"></asp:button><BR>
										<BR>
										<asp:button id="cmdDeleteStaff" runat="server" Height="24" Width="26" CssClass="buttoncss" Text=">>"></asp:button></TD>
									<TD>
										<asp:listbox id="lstAllStaff" runat="server" Height="175px" Width="140px"></asp:listbox></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD align="middle" height="40">
							<asp:button id="cmdReturn" runat="server" Width="80px" CssClass="buttoncss" Text="返回"></asp:button></TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
