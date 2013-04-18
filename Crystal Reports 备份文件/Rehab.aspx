<%@ Page language="c#" Codebehind="Rehab.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.Staff.Rehab" %>
<%@ Import namespace="System"%>
<%@ Import namespace="System.Data"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<TITLE>ListView</TITLE>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
		<script language="javascript">
			//全选checkbox
			function SelectItem()
			{
				var i = 0;
				var e;

				for( i = 0 ; i < ListView.elements.length ; i ++ )
				{
					e = ListView.elements[ i ];
					if( e.type == "checkbox" )	e.checked = !e.checked;
				}
			}
			
			// 高亮背景
			function high( which )
			{ 
				which.style.background = "#C0D9E6";
				which.style.font.color = "red";
			} 

			// 取消背景高亮
			function low( which )
			{ 
				which.style.background = "#FFFFFF";
				which.style.font.color = "black";
			}
			
		</script>
		<script language="csharp" runat="server">
		public string GetSex(string sex,string id)
		{	
			if(id!="")
				return((sex=="True")?"女":"男");
			else
				return("");			
		}
		public string GetAge(string birthday)
		{
			if((birthday!="")&&(DateTime.Parse(birthday)!=DateTime.Parse("1900-1-1")))
				return(((int)(DateTime.Now.Year-(DateTime.Parse(birthday)).Year)+1).ToString());
			else
				return("");
		}
		</script>
	</HEAD>
	<body text="#000000" leftMargin="2" topMargin="0" rightMargin="0" marginwidth="0" marginheight="0">
		<form id="ListView" runat="server">
			<table id="AutoNumber1" style="BORDER-COLLAPSE: collapse" borderColor="#ccccc" height="13" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<td style="HEIGHT: 185px" width="100%" colSpan="8" height="185">
						<table id="AutoNumber2" style="BORDER-COLLAPSE: collapse" borderColor="#cccccc" height="55" cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tr>
								<td width="100%" colSpan="8">
									<table id="AutoNumber4" style="BORDER-COLLAPSE: collapse" borderColor="#111111" height="1" cellSpacing="0" cellPadding="0" width="100%" border="0">
										<tr>
											<td class="GbText" width="3%" bgColor="#c0d9e6"><IMG height="16" src="../../Images/icon/07.gif" width="16"></td>
											<td class="GbText" width="16%" bgColor="#c0d9e6" height="1"><b><A title="刷新" href="javascript:location.reload()">人力资源列表</A>
												</b>
											</td>
											<td class="GbText" width="5%" bgColor="#c0d9e6"><b><A title="返回主界面" href="../UnitiveDocument/index.asp" target="main">返回</A></b></td>
											<td width="21%" background="../../images/line1.gif" height="1">&nbsp;
											</td>
											<td width="96%" height="1">
												<table id="AutoNumber5" style="BORDER-COLLAPSE: collapse" borderColor="#111111" height="1" cellSpacing="0" cellPadding="0" width="100%" border="0">
													<tr>
														<td align="middle" width="8%"><FONT face="宋体"></FONT>
														</td>
														<td align="middle" width="8%" height="1"><FONT face="宋体"></FONT>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr bgcolor="#c0d9e6">
								<td width="100%" colSpan="8"><asp:datagrid id="StaffList" runat="server" DataKeyField="Staff_ID" AllowPaging="True" Width="100%" AutoGenerateColumns="False" PageSize="20">
										<ItemStyle Font-Size="Smaller" ForeColor="Black"></ItemStyle>
										<HeaderStyle Font-Size="Smaller" Font-Names="宋体" HorizontalAlign="Center" ForeColor="Blue" VerticalAlign="Bottom" BackColor="LightBlue"></HeaderStyle>
										<Columns>
											<asp:TemplateColumn HeaderText="◎">
												<HeaderStyle Width="5%"></HeaderStyle>
												<ItemTemplate>
													<asp:CheckBox id="cb_StaffID" Checked="False" Runat="server"></asp:CheckBox>
												</ItemTemplate>
												<FooterTemplate>
													<FONT face="宋体"></FONT>
												</FooterTemplate>
												<EditItemTemplate>
													<FONT face="宋体"></FONT>
												</EditItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="Staff_ID" HeaderText="ID">
												<HeaderStyle Width="8%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="RealName" HeaderText="真实姓名">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="Mobile" HeaderText="手机">
												<HeaderStyle Width="10%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="年龄">
												<ItemTemplate>
													<asp:Literal ID="old" Runat="server" Text='<%# GetAge(((DataRowView)Container.DataItem)["Birthday"].ToString()) %>'>
													</asp:Literal>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="性别">
												<ItemTemplate>
													<asp:Literal ID="sex" Runat="server" Text='<%# GetSex(((DataRowView)Container.DataItem)["sex"].ToString(),((DataRowView)Container.DataItem)["Staff_ID"].ToString()) %>'>
													</asp:Literal>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="Email" HeaderText="EMAIL">
												<HeaderStyle Width="10%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="Department_Name" HeaderText="所在部门"></asp:BoundColumn>
											<asp:BoundColumn DataField="RegistedDate" HeaderText="注册日期"></asp:BoundColumn>
										</Columns>
										<PagerStyle Visible="False" Font-Size="Smaller" Font-Names="宋体" HorizontalAlign="Right" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr bgColor="#c0d9e6">
					<td class="GbText" style="HEIGHT: 31px" width="83%" bgColor="#c0d9e6" height="31"><input class="ButtonCss" id="selectbutton" style="WIDTH: 40px; HEIGHT: 21px" onclick="SelectItem();" type="button" value="选择" runat="server" NAME="selectbutton">
						<input class="ButtonCss" id="btn_Go" style="WIDTH: 36px; HEIGHT: 20px" type="button" value="转到" runat="server" NAME="btn_Go">
						第<asp:textbox id="txb_PageNo" Width="20" TextMode="SingleLine" CssClass="BORDER-RIGHT: #ffffff 1px solid; BORDER-TOP: #fffffb 1px solid; BORDER-LEFT: #ffffff 1px solid; COLOR: #5e5e5e; BORDER-BOTTOM: #ffffff 1px solid; TEXT-ALIGN: center" Runat="server"></asp:textbox>
						页,每页显示<asp:textbox id="txb_ItemPerPage" onmouseover="high( this );" onmouseout="low( this );" Width="20" TextMode="SingleLine" CssClass="BORDER-RIGHT: #ffffff 1px solid; BORDER-TOP: #fffffb 1px solid; BORDER-LEFT: #ffffff 1px solid; COLOR: #5e5e5e; BORDER-BOTTOM: #ffffff 1px solid; TEXT-ALIGN: center" Runat="server"></asp:textbox>条记录,共有
						<asp:label id="lbl_totalrecord" runat="server" Width="10px" Height="8px"></asp:label>页记录.&nbsp;&nbsp;&nbsp;
						<INPUT class="ButtonCss" onclick="return confirm('您确认让选中的人员调职吗？');" type="submit" value="调职" id="cmdChangeDepartment" runat="server">
						<INPUT class="ButtonCss" onclick="return confirm('您确认让选中的人员复职吗？');" type="submit" value="复职" id="cmdRestoreDocument" runat="server">&nbsp;&nbsp;
					</td>
					<td style="HEIGHT: 31px" width="3%" height="31"><asp:imagebutton id="btn_first" runat="server" Width="23" Height="23" ToolTip="第一页" CommandArgument="first" ImageUrl="../../Images/top.gif" BorderWidth="0"></asp:imagebutton></td>
					<td style="HEIGHT: 31px" width="3%" height="31"><asp:imagebutton id="btn_pre" Width="23" Runat="server" ToolTip="前一页" CommandArgument="pre" ImageUrl="../../Images/prev.gif" BorderWidth="0"></asp:imagebutton></td>
					<td class="GbText" style="HEIGHT: 31px" align="middle" width="8%" height="31"><asp:label id="lbl_curpage" runat="server">Label</asp:label>/
						<asp:label id="lbl_totalpage" runat="server">Label</asp:label></td>
					<td style="HEIGHT: 31px" width="3%" height="31"><asp:imagebutton id="btn_next" Width="23" Runat="server" Height="23" ToolTip="下一页" CommandArgument="next" ImageUrl="../../Images/next.gif" BorderWidth="0"></asp:imagebutton></td>
					<td style="HEIGHT: 31px" width="3%" height="31"><asp:imagebutton id="btn_last" Width="23" Runat="server" Height="23" ToolTip="最后一页" CommandArgument="last" ImageUrl="../../Images/end.gif" BorderWidth="0"></asp:imagebutton></td>
				</tr>
				<tr>
					<td width="100%" colSpan="8">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tr>
								<td></td>
								<td align="right"><IMG height="25" src="../../images/endbott.gif" width="279"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
