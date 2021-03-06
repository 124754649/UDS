<%@ Page language="c#" Codebehind="ListView.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.UnitiveDocument.Document.ListView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>ListView</title>
		<meta content="True" name="vs_showGrid">
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
		<script language="javascript">

		function MoveToTeam(a)
{
	var ret;
	ret = window.showModalDialog("../MoveTeam/TreeView.aspx?FromID=<%=ClassID%>",window,"dialogHeight:400px;dialogWidth:300px;center:Yes;Help:No;Resizable:No;Status:Yes;Scroll:auto;Status:no;");

	
	if(ret>0)
//	frmAddRight.ObjID.value = ret;
	return false;
}

		function CopyToTeam(a)
{
	var ret;
	ret = ret = window.showModalDialog("../CopyTeam/TreeView.aspx?FromID=<%=ClassID%>",window,"dialogHeight:400px;dialogWidth:300px;center:Yes;Help:No;Resizable:No;Status:Yes;Scroll:auto;Status:no;");

	
	if(ret>0)
//	frmAddRight.ObjID.value = ret;
	return false;
}
		function selectAll(){
			var len=document.Form1.elements.length;
			var i;
		    for (i=0;i<len;i++){
			if (document.Form1.elements[i].type=="checkbox"){
		        document.Form1.elements[i].checked=true;								
						 }
					}
				}

		function unSelectAll(){
	          var len=document.Form1.elements.length;
	          var i;
	          for (i=0;i<len;i++){
	               if (document.Form1.elements[i].type=="checkbox"){
	                  document.Form1.elements[i].checked=false; 
	               }   
	        	 } 
		    }		

		var ball1 = new Image();
		var ball2 = new Image();
		ball1.src = 'images/ball1.gif';
		ball2.src = 'images/ball2.gif';

		var active = new Image();
		var nonactive = new Image();
		active.src = '../../../images/maillistbutton2.gif';
		nonactive.src = '../../../images/maillistbutton1.gif';

		function onMouseOver(img)
		{
			document.images[img].src = ball2.src;
		}

		function onMouseOut(img)
		{
			document.images[img].src = ball1.src;
		}

		function onOverBar(bar)
		{
			if (bar != null) {
				bar.style.backgroundImage = "url("+active.src+")";
			}
		}

		function onOutBar(bar)
		{
			if (bar != null) {
				bar.style.backgroundImage = "url("+nonactive.src+")";
			}
		}
		</script>
		<script language="JavaScript" src="../../../Css/tr.js"></script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体">
				<table cellSpacing="0" cellPadding="0" width="100%" border="0">
					<tr>
						<td colSpan="2">
							<table cellSpacing="0" cellPadding="0" width="500" border="0">
								<tr height="25">
									<td id=bar1 align=center width=90 
          background='<% Response.Write(DisplayType=="0"?"../../../images/maillistbutton2.gif":"../../../images/maillistbutton1.gif"); %>' 
          >&nbsp;<A href="ListView.aspx?ClassID=<%=ClassID%>&amp;DisplayType=0" class=Newbutton>已归档</A></td>
									<td id=bar2 align=center width=90 
          background='<% Response.Write(DisplayType=="1"?"../../../images/maillistbutton2.gif":"../../../images/maillistbutton1.gif"); %>' 
          >&nbsp;<A href="ListView.aspx?ClassID=<%=ClassID%>&amp;DisplayType=1" class=Newbutton>未归档</A></td>
									<td id=bar3 align=center width=90 
          background='<% Response.Write(DisplayType=="2"?"../../../images/maillistbutton2.gif":"../../../images/maillistbutton1.gif"); %>' 
          >&nbsp;<A href="ListView.aspx?ClassID=<%=ClassID%>&amp;DisplayType=2" class=Newbutton>我的上传</A></td>
									<td id=bar4 align=center width=90 
          background='<% Response.Write(DisplayType=="3"?"../../../images/maillistbutton2.gif":"../../../images/maillistbutton1.gif"); %>' 
          >&nbsp;<A href="ListView.aspx?ClassID=<%=ClassID%>&amp;DisplayType=3" class=Newbutton>回收站</A></td>
									<td width="136"></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td vAlign="top"><asp:datagrid id="dgDocList" runat="server" DataKeyField="DocID" OnSortCommand="DataGrid_Sort"
								CellPadding="3" BorderWidth="1px" BorderColor="#93BEE2" PageSize="15" OnPageIndexChanged="DataGrid_PageChanged"
								PagerStyle-HorizontalAlign="Right" PagerStyle-Mode="NumericPages" AllowPaging="True" AutoGenerateColumns="False"
								AllowSorting="True" Width="100%">
								<AlternatingItemStyle BackColor="#E8F4FF"></AlternatingItemStyle>
								<HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Height="10px" ForeColor="White" VerticalAlign="Top"
									BackColor="#337FB2"></HeaderStyle>
								<FooterStyle Font-Size="XX-Small" HorizontalAlign="Center" Height="10px" VerticalAlign="Bottom"></FooterStyle>
								<Columns>
									<asp:TemplateColumn HeaderText="选择">
										<ItemStyle Font-Size="X-Small" HorizontalAlign="Center" Height="20px" Width="60px"></ItemStyle>
										<ItemTemplate>
											<asp:CheckBox id="Checkbox1" Checked="False" Runat="server"></asp:CheckBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn SortExpression="DocTitle" HeaderText="文档主题">
										<HeaderStyle Font-Underline="True"></HeaderStyle>
										<ItemStyle Font-Size="X-Small"></ItemStyle>
										<ItemTemplate>
											<a href="#" onclick='window.showModalDialog("BrowseDocument.aspx?DocId=<%# DataBinder.Eval(Container.DataItem,"DocID") %>",window,"dialogWidth:700px;DialogHeight=590px;status:no")'>
												<%# (DataBinder.Eval(Container.DataItem,"DocTitle").ToString().Length>30)?DataBinder.Eval(Container.DataItem,"DocTitle").ToString().Substring(0,30)+"...":DataBinder.Eval(Container.DataItem,"DocTitle").ToString() %>
											</a>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="DocApprover" SortExpression="DocApprover" HeaderText="审批人">
										<ItemStyle Font-Size="X-Small"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="DocAddedBy" SortExpression="DocAddedBy" HeaderText="上传人">
										<ItemStyle Font-Size="X-Small"></ItemStyle>
										<FooterStyle Font-Size="X-Small"></FooterStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="DocAddedDate" SortExpression="DocAddedDate" HeaderText="上传日期">
										<ItemStyle Font-Size="X-Small"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="DocViewedTimes" SortExpression="DocViewedTimes" HeaderText="浏览次数">
										<HeaderStyle Font-Size="X-Small"></HeaderStyle>
										<ItemStyle Font-Size="X-Small"></ItemStyle>
										<FooterStyle Font-Size="XX-Small"></FooterStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="DocLastViewer" SortExpression="DocLastViewer" HeaderText="最后浏览者">
										<ItemStyle Font-Size="X-Small"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn Visible="False" DataField="DocLastViewDate" SortExpression="DocLastViewDate" HeaderText="浏览日期">
										<HeaderStyle Font-Underline="True"></HeaderStyle>
										<ItemStyle Font-Size="X-Small"></ItemStyle>
										<FooterStyle Font-Size="XX-Small"></FooterStyle>
									</asp:BoundColumn>
								</Columns>
								<PagerStyle Font-Size="12px" BorderColor="#E0E0E0" BorderStyle="Dotted" HorizontalAlign="Right"
									BackColor="#E8F4FF" Mode="NumericPages"></PagerStyle>
							</asp:datagrid></td>
					</tr>
					<tr>
						<td vAlign="top">&nbsp;<font size="X-Small"><A onclick="selectAll()" href="#"><FONT size="2">全部选择</FONT></A>
								&nbsp; <A onclick="unSelectAll()" href="#"><FONT size="2">全部取消</FONT></A>&nbsp;</font>&nbsp;&nbsp;
							<asp:linkbutton id="lnkbtnDelete" runat="server" Font-Size="X-Small" CausesValidation="False">丢弃</asp:linkbutton>&nbsp;&nbsp;&nbsp;
							<FONT size="2"><A onclick="MoveToTeam()" href="#">
									<asp:label id="lblRemove" runat="server" Font-Size="X-Small"> 目录移动</asp:label></A><FONT size="3">&nbsp;
									<A onclick="CopyToTeam()" href="#">
										<asp:Label id="lblCopy" runat="server">目录复制</asp:Label></A>&nbsp;&nbsp;&nbsp;
								</FONT><A href="../Switch.aspx?ClassID=<%=ClassID%>&amp;Action=0" >
									<asp:label id="lblDeliveryDoc" runat="server" Font-Size="X-Small">投递文档</asp:label></A><FONT size="3">&nbsp;
								</FONT><A href="../oClassNode.aspx?Action=3&amp;ClassID=<%=ClassID%>" >
									<asp:label id="lblManageDirectory" runat="server" Font-Size="X-Small"> 目录管理</asp:label></A><FONT size="3">&nbsp;
								</FONT><A href="../MemberListView.aspx?TeamID=<%=ClassID%>" >
									<asp:label id="lblShowMember" runat="server" Font-Size="X-Small">显示组员</asp:label></A><FONT size="3">&nbsp;
								</FONT><A 
      href="../../AssignRule/RightListView.aspx?ObjID=<%=ClassID%>&amp;displayType=1">
									<asp:label id="lblManagePermission" runat="server" Font-Size="X-Small"> 权限管理</asp:label></A></FONT></td>
					</tr>
				</table>
			</FONT>
		</form>
	</body>
</HTML>
