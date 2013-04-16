<%@ Page language="c#" Codebehind="Desktop.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.UnitiveDocument.Desktop" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Desktop</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		function dialwinprocess(CurrDate,CurrTime,whichPg,TaskID)
			{
			   if(whichPg==1)
				var newdialoguewin = window.showModalDialog("../Schedule/Manage.aspx?CurrDate="+CurrDate+"&CurrTime="+CurrTime,window,"dialogWidth:1000px;DialogHeight=700px;status:no");
			   else if(whichPg==2)
			   var newdialoguewin = window.showModalDialog("../Schedule/TaskDetail.aspx?TaskID="+TaskID+"&Date="+CurrDate,window,"dialogWidth:700px;DialogHeight=600px;status:no");
			   else if(whichPg==3)
			   var newdialoguewin = window.showModalDialog("../Schedule/TaskStatus.aspx?TaskID="+TaskID+"&Date="+CurrDate,window,"dialogWidth:700px;DialogHeight=600px;status:no");
			}
		</script>
	</HEAD>
	<body leftMargin="0" topMargin="0" rightMargin="5">
		<form id="Desktop" method="post" runat="server">
			<table cellSpacing="10" cellPadding="0" width="100%" align="center" border="0">
				<tr>
					<td vAlign="top">
						<TABLE id="Table1" cellSpacing="0" cellPadding="0" align="left" border="0">
							<TR>
								<TD><IMG id="IMG1" src="../../Images/desktop1.jpg" border="0" runat="server"></TD>
								<TD vAlign="bottom" align="right" width="40"><A href="../Schedule/TaskList.aspx" target="_self"><IMG alt="" src="../../Images/more.gif" border="0"></A></TD>
								<TD vAlign="bottom" align="right" width="40"><A onclick="var newwin=window.open('../Schedule/Manage.aspx','newtask','toolbar=yes,scrollbars=yes,width=800,height=600,resizable=yes');newwin.moveTo(0,0);newwin.focus();"
										href="#" target="_self"><IMG alt="" src="../../Images/new.gif" border="0"></A></TD>
							</TR>
							<tr>
								<td><asp:datagrid id="dgList" runat="server" AllowPaging="True" BorderColor="#E8F4FF" GridLines="Horizontal"
										PageSize="5" DataKeyField="ID" Width="100%" PagerStyle-HorizontalAlign="center" PagerStyle-Mode="NumericPages"
										AutoGenerateColumns="False" BackColor="White" CellPadding="2" OnPageIndexChanged="DataGrid_PageChanged"
										CssClass="top" BorderWidth="1px">
										<ItemStyle Font-Size="X-Small" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
										<HeaderStyle Font-Size="X-Small" Font-Bold="True" HorizontalAlign="Center" Height="20px" ForeColor="#006699"
											VerticalAlign="Middle" BackColor="#E8F4FF"></HeaderStyle>
										<FooterStyle Font-Size="XX-Small" HorizontalAlign="Center" Height="10px" VerticalAlign="Bottom"></FooterStyle>
										<Columns>
											<asp:TemplateColumn HeaderText="时段">
												<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left"></ItemStyle>
												<ItemTemplate>
													<asp:Label runat="server" Text='<%# GetDateString(DataBinder.Eval(Container, "DataItem.Date").ToString())+"  "+GetPeriodByPeriodID(DataBinder.Eval(Container, "DataItem.EndTime").ToString(),DataBinder.Eval(Container, "DataItem.beginPeriodID").ToString(),(DataBinder.Eval(Container, "DataItem.endPeriodID").ToString())) %>' ID="Label2" NAME="Label2">
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="内容">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<a href="#" onclick='javascript:return dialwinprocess("","","2","<%# DataBinder.Eval(Container, "DataItem.TaskID") %>")'>
														<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Subject") %>' ID="Label3" NAME="Label3"></a>
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
										</Columns>
										<PagerStyle Visible="False" HorizontalAlign="Right" ForeColor="White" BackColor="#93BEE2" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
							</tr>
						</TABLE>
					</td>
					<td vAlign="top">
						<TABLE id="Table2" cellSpacing="0" cellPadding="0" align="left" border="0">
							<TR>
								<TD><IMG id="Img4" src="../../Images/desktop2.jpg" border="0" runat="server"></TD>
								<TD vAlign="bottom" align="right" width="40"><A href="NewDoc/Listview.aspx" target="_self"><IMG alt="" src="../../Images/more.gif" border="0"></A></TD>
								<TD vAlign="bottom" align="right" width="40"></TD>
							</TR>
							<tr>
								<td><FONT face="宋体"><asp:datagrid id="dgDocList" runat="server" AllowPaging="True" BorderColor="#E8F4FF" GridLines="Horizontal"
											PageSize="5" DataKeyField="DocID" Width="100%" PagerStyle-HorizontalAlign="right" PagerStyle-Mode="NumericPages"
											AutoGenerateColumns="False" CellPadding="2" BorderWidth="1px" Font-Names="Arial" AllowSorting="True">
											<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
											<HeaderStyle Font-Size="X-Small" Font-Bold="True" HorizontalAlign="Center" Height="20px" ForeColor="#006699"
												VerticalAlign="Middle" BackColor="#E8F4FF"></HeaderStyle>
											<FooterStyle Font-Size="XX-Small" HorizontalAlign="Center" Height="10px" VerticalAlign="Bottom"></FooterStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="文档标题">
													<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
													<ItemStyle Font-Size="X-Small" HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
													<ItemTemplate>
														<a href='Document/BrowseDocument.aspx?DocId=<%# DataBinder.Eval(Container.DataItem,"DocID") %>'>
															<%# (DataBinder.Eval(Container.DataItem,"DocTitle").ToString().Length>30)?DataBinder.Eval(Container.DataItem,"DocTitle").ToString().Substring(0,30)+"...":DataBinder.Eval(Container.DataItem,"DocTitle").ToString() %>
														</a>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="审批人">
													<HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
													<ItemStyle Font-Size="X-Small" HorizontalAlign="Center"></ItemStyle>
													<ItemTemplate>
														<asp:Label runat="server" Text='<%# GetRealName(DataBinder.Eval(Container, "DataItem.DocApprover").ToString()) %>'>
														</asp:Label>
													</ItemTemplate>
													<FooterStyle Font-Size="X-Small"></FooterStyle>
												</asp:TemplateColumn>
											</Columns>
											<PagerStyle Visible="False" Font-Size="12px" BorderColor="#E0E0E0" BorderStyle="Dotted" HorizontalAlign="Right"
												PageButtonCount="5" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></FONT></td>
							</tr>
						</TABLE>
					</td>
				</tr>
				<tr>
					<td height="40"></td>
					<td></td>
				</tr>
				<tr>
					<td vAlign="top">
						<TABLE id="Table3" cellSpacing="0" cellPadding="0" align="left" border="0">
							<TR>
								<TD vAlign="top"><IMG id="IMG2" src="../../Images/desktop3.jpg" border="0" runat="server"></TD>
								<TD vAlign="bottom" align="right" width="40"><A href="Mail/Index.aspx" target="_self"><IMG alt="" src="../../Images/more.gif" border="0"></A></TD>
								<TD vAlign="bottom" align="right" width="40"><A href="Mail/Compose.aspx?ClassID=0" target="_self"><IMG alt="" src="../../Images/new.gif" border="0"></A></TD>
							</TR>
							<tr>
								<td><asp:datagrid id="dgMailList" runat="server" AllowPaging="True" BorderColor="#E8F4FF" GridLines="Horizontal"
										PageSize="5" DataKeyField="MailID" Width="100%" PagerStyle-HorizontalAlign="right" PagerStyle-Mode="NumericPages"
										AutoGenerateColumns="False" CellPadding="2" BorderWidth="1px" Font-Names="Arial" AllowSorting="True">
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
										<HeaderStyle Font-Size="X-Small" Font-Bold="True" HorizontalAlign="Center" Height="20px" ForeColor="#006699"
											VerticalAlign="Middle" BackColor="#E8F4FF"></HeaderStyle>
										<FooterStyle Font-Size="XX-Small" HorizontalAlign="Center" Height="10px" VerticalAlign="Bottom"></FooterStyle>
										<Columns>
											<asp:TemplateColumn HeaderText="邮件主题">
												<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
												<ItemStyle Font-Size="X-Small" HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
												<ItemTemplate>
													<a href='Mail/ReadMail.aspx?FolderType=1&MailId=<%# DataBinder.Eval(Container.DataItem,"MailID") %>'>
														<%# (DataBinder.Eval(Container.DataItem,"MailSubject").ToString().Length>30)?DataBinder.Eval(Container.DataItem,"MailSubject").ToString().Substring(0,30)+"...":DataBinder.Eval(Container.DataItem,"MailSubject").ToString() %>
													</a>
													<%# DataBinder.Eval(Container.DataItem,"attnumber").ToString()==""?"":(DataBinder.Eval(Container.DataItem,"attnumber").ToString()=="0"?"":"<img src='../../DataImages/attach.gif' border='0'>") %>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="MailSender" HeaderText="发送者">
												<HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
												<ItemStyle Font-Size="X-Small" HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
										<PagerStyle Visible="False" Font-Size="12px" BorderColor="#E0E0E0" BorderStyle="Dotted" HorizontalAlign="Right"
											PageButtonCount="5" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
							</tr>
						</TABLE>
					</td>
					<td vAlign="top">
						<TABLE id="Table4" cellSpacing="0" cellPadding="0" align="left" border="0">
							<TR>
								<TD vAlign="top"><IMG id="IMG3" src="../../Images/desktop4.jpg" border="0" runat="server"></TD>
								<TD vAlign="bottom" align="right" width="40"><A href="Approve/Listview.aspx" target="_self"><IMG alt="" src="../../Images/more.gif" border="0"></A></TD>
								<TD vAlign="bottom" align="right" width="40"></TD>
							</TR>
							<tr>
								<td><asp:datagrid id="dgAppDocList" runat="server" AllowPaging="True" BorderColor="#E8F4FF" GridLines="Horizontal"
										PageSize="5" DataKeyField="DocID" Width="100%" PagerStyle-HorizontalAlign="right" PagerStyle-Mode="NumericPages"
										AutoGenerateColumns="False" CellPadding="3" BorderWidth="1px" Font-Names="Arial" AllowSorting="True"
										DESIGNTIMEDRAGDROP="164">
										<ItemStyle Font-Size="X-Small" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
										<HeaderStyle Font-Size="X-Small" Font-Bold="True" HorizontalAlign="Center" Height="20px" ForeColor="#006699"
											VerticalAlign="Middle" BackColor="#E8F4FF"></HeaderStyle>
										<FooterStyle Font-Size="XX-Small" HorizontalAlign="Center" Height="10px" VerticalAlign="Bottom"></FooterStyle>
										<Columns>
											<asp:TemplateColumn HeaderText="文档标题">
												<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
												<ItemStyle Font-Size="X-Small" HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
												<ItemTemplate>
													<a href='Document/ApproveDocument.aspx?DocId=<%# DataBinder.Eval(Container.DataItem,"DocID") %>'>
														<%# (DataBinder.Eval(Container.DataItem,"DocTitle").ToString().Length>30)?DataBinder.Eval(Container.DataItem,"DocTitle").ToString().Substring(0,30)+"...":DataBinder.Eval(Container.DataItem,"DocTitle").ToString() %>
													</a>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="上传人">
												<HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
												<ItemStyle Font-Size="X-Small" HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<asp:Label runat="server" Text='<%# GetRealName(DataBinder.Eval(Container, "DataItem.DocAddedBy").ToString()) %>'>
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
										</Columns>
										<PagerStyle Visible="False" Font-Size="12px" BorderColor="#E0E0E0" BorderStyle="Dotted" HorizontalAlign="Right"
											PageButtonCount="5" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
							</tr>
						</TABLE>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
