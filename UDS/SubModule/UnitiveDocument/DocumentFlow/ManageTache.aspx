<%@ Page language="c#" Codebehind="ManageTache.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.UnitiveDocument.DocumentFlow.ManageTache" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>ManageTache</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body leftMargin="0" topMargin="0" MS_POSITIONING="GridLayout">
		<form id="ManageTache" method="post" runat="server">
			<FONT face="宋体">
				<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
					<tr>
						<td vAlign="top" height="38">
							<TABLE borderColor="#111111" height="1" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TR height="30">
									<TD class="GbText" align="right" width="20" background="../../../Images/treetopbg.jpg" bgColor="#c0d9e6"><FONT color="#003366" size="3"><IMG height="16" src="../../../DataImages/DocFlow.gif" width="16"></FONT></TD>
									<TD class="GbText" align="right" width="60" background="../../../Images/treetopbg.jpg" bgColor="#e8f4ff"><font color="#006699">文档流转</font></TD>
									<TD class="GbText" align="right" background="../../../Images/treetopbg.jpg" bgColor="#e8f4ff"><FONT face="宋体"><asp:button id="cmdNewTache" runat="server" CssClass="redbuttoncss" Text="新建环节"></asp:button><asp:button id="cmdDeleteTache" runat="server" CssClass="redbuttoncss" Text="删除环节"></asp:button><INPUT class="redbuttoncss" style="WIDTH: 66px; HEIGHT: 20px" onclick="javascript:location.href='Listview.aspx'" type="button" value="返回"></FONT></TD>
								</TR>
							</TABLE>
						</td>
					</tr>
					<TR>
						<TD>
							<TABLE id="Table2" height="24" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TR>
									<TD align="middle" width="90" background="../../../Images/maillistbutton2.gif"><FONT size="2">环节管理</FONT></TD>
									<TD align="right">&nbsp; <FONT face="宋体"></FONT>
									</TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD><asp:datagrid id="dgTacheList" runat="server" PageSize="15" OnPageIndexChanged="DataGrid_PageChanged" Font-Size="X-Small" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" Height="101px" Width="100%" DataKeyField="Tache_ID" BorderColor="#93BEE2" BorderStyle="None" BorderWidth="1px" BackColor="White" CellPadding="3">
								<SelectedItemStyle Font-Bold="True" ForeColor="#CCFF99" BackColor="#009999"></SelectedItemStyle>
								<AlternatingItemStyle Font-Size="X-Small" BackColor="#E8F4FF"></AlternatingItemStyle>
								<ItemStyle Font-Size="X-Small" ForeColor="#003399" BackColor="White"></ItemStyle>
								<HeaderStyle Font-Bold="True" HorizontalAlign="Left" ForeColor="White" VerticalAlign="Middle" BackColor="#337FB2"></HeaderStyle>
								<FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
								<Columns>
									<asp:TemplateColumn HeaderText="ID">
										<HeaderStyle Width="2%"></HeaderStyle>
										<ItemTemplate>
											<asp:CheckBox id="cboTacheID" runat="server"></asp:CheckBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:HyperLinkColumn DataNavigateUrlField="Tache_ID" DataNavigateUrlFormatString="EditTache.aspx?TacheID={0}" DataTextField="Tache_Name" HeaderText="环节名">
										<HeaderStyle Font-Size="X-Small" Width="20%"></HeaderStyle>
										<ItemStyle Font-Size="X-Small"></ItemStyle>
									</asp:HyperLinkColumn>
									<asp:BoundColumn DataField="Tache_Remark" HeaderText="环节介绍">
										<HeaderStyle Width="40%"></HeaderStyle>
									</asp:BoundColumn>
									<asp:TemplateColumn HeaderText="结束权">
										<HeaderStyle HorizontalAlign="Center" Width="8%"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
										<ItemTemplate>
											<asp:Label runat="server" Text='<%# TranslateRightToFinish(DataBinder.Eval(Container, "DataItem.RightToFinish").ToString()) %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.RightToFinish") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="呈送规则">
										<HeaderStyle HorizontalAlign="Center" Width="10%"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
										<ItemTemplate>
											<asp:Label runat="server" Text='<%#TranslateFlowRule(DataBinder.Eval(Container, "DataItem.Flow_Rule").ToString()) %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Flow_Rule") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="会签">
										<HeaderStyle HorizontalAlign="Center" Width="12%"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
										<ItemTemplate>
											<asp:Label id="PassNum" runat="server">
												<%#TranslatePassNum(DataBinder.Eval(Container, "DataItem.PassNum").ToString()) %>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:HyperLinkColumn Text="绑定" DataNavigateUrlField="Tache_ID" DataNavigateUrlFormatString="BangdingRole.aspx?TacheID={0}" HeaderText="绑定">
										<HeaderStyle HorizontalAlign="Center" Width="8%"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
									</asp:HyperLinkColumn>
								</Columns>
								<PagerStyle NextPageText="" HorizontalAlign="Right" BackColor="#E8F4FF" Mode="NumericPages"></PagerStyle>
							</asp:datagrid></TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
