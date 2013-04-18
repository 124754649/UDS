<%@ Page language="c#" Codebehind="ManageStyle.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.UnitiveDocument.DocumentFlow.ManageStyle" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>ManageStyle</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
		<script language="javascript">
			function delete_confirm(e) {
				if (event.srcElement.outerText == "删除")
				event.returnValue =confirm("您确认要删除?");
			}
			document.onclick=delete_confirm;		
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout" leftmargin="0" rightmargin="0">
		<form id="ManageStyle" method="post" runat="server">
			&nbsp;
			<TABLE id="Table1" style="Z-INDEX: 105; LEFT: 0px; POSITION: absolute; TOP: 0px" cellSpacing="0"
				cellPadding="1" width="100%" border="0">
				<TR>
					<td align="left" style="HEIGHT: 30px" background="../../../Images/treetopbg.jpg"><span style="FONT-SIZE:10pt">表单管理</span></td>
					<TD align="right" style="HEIGHT: 30px" background="../../../Images/treetopbg.jpg"><asp:button id="cmdNewStyle" runat="server" CssClass="redbuttoncss" Text="新增表单"></asp:button><INPUT class="redbuttoncss" style="WIDTH: 71px" onclick="location.href='Listview.aspx';"
							type="button" value="返回"></TD>
				</TR>
				<TR>
					<TD vAlign="top" colspan="2"><FONT face="宋体"></FONT><FONT face="宋体"><asp:datagrid id="dgStyleList" runat="server" Width="100%" Font-Size="X-Small" PageSize="15" OnPageIndexChanged="DataGrid_PageChanged"
								AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyField="Style_ID" BorderColor="#93BEE2" BorderStyle="None" BorderWidth="1px"
								BackColor="White" CellPadding="3" OnDeleteCommand="MyDataGrid_Delete">
								<SelectedItemStyle Font-Bold="True" ForeColor="#CCFF99" BackColor="#009999"></SelectedItemStyle>
								<AlternatingItemStyle Font-Size="X-Small" BackColor="#E8F4FF"></AlternatingItemStyle>
								<ItemStyle Font-Size="X-Small" ForeColor="#003399" BackColor="White"></ItemStyle>
								<HeaderStyle Font-Bold="True" HorizontalAlign="Left" ForeColor="White" VerticalAlign="Middle"
									BackColor="#337FB2"></HeaderStyle>
								<FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
								<Columns>
									<asp:TemplateColumn HeaderText="ID">
										<HeaderStyle Width="2%"></HeaderStyle>
										<ItemTemplate>
											<asp:CheckBox id="cboStyleID" runat="server"></asp:CheckBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:HyperLinkColumn DataNavigateUrlField="Style_ID" DataNavigateUrlFormatString="EditStyle.aspx?StyleID={0}"
										DataTextField="Style_Name" HeaderText="表单名">
										<HeaderStyle Font-Size="X-Small" Width="20%"></HeaderStyle>
										<ItemStyle Font-Size="X-Small"></ItemStyle>
									</asp:HyperLinkColumn>
									<asp:BoundColumn DataField="Style_Remark" HeaderText="表单介绍">
										<HeaderStyle Width="40%"></HeaderStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="Template" HeaderText="模板">
										<HeaderStyle HorizontalAlign="Left" Width="25%"></HeaderStyle>
										<ItemStyle HorizontalAlign="Left"></ItemStyle>
										<FooterStyle HorizontalAlign="Left"></FooterStyle>
									</asp:BoundColumn>
									<asp:HyperLinkColumn Text="管理" DataNavigateUrlField="Style_ID" DataNavigateUrlFormatString="DefineStyle.aspx?StyleID={0}"
										HeaderText="管理">
										<HeaderStyle HorizontalAlign="Center" Width="6%"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
									</asp:HyperLinkColumn>
									<asp:ButtonColumn Text="删除" HeaderText="删除" CommandName="Delete">
										<HeaderStyle HorizontalAlign="Center" Width="5%"></HeaderStyle>
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
									</asp:ButtonColumn>
								</Columns>
								<PagerStyle NextPageText="" HorizontalAlign="Right" BackColor="#E8F4FF" Mode="NumericPages"></PagerStyle>
							</asp:datagrid></FONT></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
