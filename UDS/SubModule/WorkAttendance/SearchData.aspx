<%@ Import namespace="System"%>
<%@ Import namespace="System.Data"  %>
<%@ Page language="c#" Codebehind="SearchData.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.WorkAttendance.SearchData" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>SearchData</title>
		<META http-equiv="Content-Type" content="text/html; charset=gb2312">
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
        <link type="text/css" rel="Stylesheet" href="../../Css/redmond/jquery-ui-1.10.3.custom.min.css" />
		<script language="javascript">
		function fillstring(str)
		{
			if(str.length==1)
			{
				str = "0" + str; 
			}
			return(str);
		}
		function quickseldate(type)
		{
			var begintime,endtime;
			var oneminute = 60*1000;
			var onehour   = 60*oneminute;
			var oneday    = 24*onehour;
			var oneweek   = 7*oneday;
			
			var todayDate = new Date();
			var date = todayDate.getDate();
			var month= todayDate.getMonth() +1;
			var year= todayDate.getFullYear();
			var day = todayDate.getDay();
			if(navigator.appName == "Netscape")
			{
				year = 1900 + year;
			}

			//-->
						
			if(type=="day")
			{
				begintime = year.toString() + "-" + fillstring(month.toString()) + "-" + fillstring(date.toString());
				endtime = begintime;
			}
			else if(type=="week")
			{
				var daytoMon = day-1;
				if(day==0) 
					daytoMon = 6;
				
				todayDate.setTime(todayDate.getTime()-daytoMon*oneday);
				date = todayDate.getDate();
				month= todayDate.getMonth() +1;
				year= todayDate.getFullYear();
				day = todayDate.getDay();
				
				begintime = year.toString() + "-" + fillstring(month.toString()) + "-" + fillstring(date.toString());
				
				todayDate.setTime(todayDate.getTime()+6*oneday);
				
				date = todayDate.getDate();
				month= todayDate.getMonth() +1;
				year= todayDate.getFullYear();
				
				endtime = year.toString() + "-" + fillstring(month.toString()) + "-" + fillstring(date.toString());
			}
			else if(type=="month")
			{
				var dateto1 = date-1;
				
				todayDate.setTime(todayDate.getTime()-dateto1*oneday);
				date = todayDate.getDate();
				month= todayDate.getMonth() +1;
				year= todayDate.getFullYear();
				day = todayDate.getDay();
				
				begintime = year.toString() + "-" + fillstring(month.toString()) + "-" + fillstring(date.toString());
				
				todayDate.setMonth(month);
				todayDate.setTime(todayDate.getTime()-oneday);
				
				date = todayDate.getDate();
				month= todayDate.getMonth() +1;
				year= todayDate.getFullYear();
				
				endtime = year.toString() + "-" + fillstring(month.toString()) + "-" + fillstring(date.toString());

			}

			document.getElementById("txtbegintime").value = begintime;
			document.getElementById("txtendtime").value = endtime;
		
		}
		</script>
		<script language="C#" runat="server">
		 string  GetGridData(string staffid,int type)
		 {

			//type:0 正常 1：迟到 2：早退 3：未考勤 4：总考勤天数
			switch(type)
			{
				case 0:
					dvw.RowFilter = "OnDuty_Status = false and OffDuty_Status = false and staff_id="+staffid;
					break;
				case 1:
					dvw.RowFilter = "OnDuty_Status=true and staff_id="+staffid;
					break;
				case 2:
					dvw.RowFilter = "OffDuty_Status = true and staff_id="+staffid;
					break;
				case 3:
					dvw.RowFilter = "staff_id=" + staffid;
					return((dvw1.Count - dvw.Count).ToString());
					break;
				case 4:
					break;
			}
			return(dvw.Count.ToString());
		 
		 } 
		</script>
	</HEAD>
	<body leftMargin="0" topMargin="0">
		<form id="SearchData" method="post" runat="server">
			<FONT face="宋体">
				<TABLE id="Table1" borderColor="#111111" height="1" cellSpacing="0" cellPadding="0" width="100%"
					border="0">
					<TR height="30">
						<TD class="GbText" width="3%" background="../../Images/treetopbg.jpg" bgColor="#c0d9e6"><FONT color="#003366" size="3"><IMG alt="" src="../../DataImages/kaoqin2.gif"></FONT></TD>
						<TD class="GbText" background="../../Images/treetopbg.jpg" bgColor="#c0d9e6"><B><B>考勤查询</B></B></TD>
					</TR>
				</TABLE>
				<TABLE class="GBText" id="Table1" style="BORDER-COLLAPSE: collapse; HEIGHT: 242px" borderColor="#93bee2"
					height="242" cellSpacing="1" cellPadding="1" width="100%" border="1" DESIGNTIMEDRAGDROP="56">
					<TR>
						<TD style="WIDTH: 84px">输入时间段</TD>
						<TD>开始时间：
							<asp:textbox ClientIDMode="Static" id="txtbegintime" runat="server" CssClass="inputcss" Columns="10"
								ReadOnly="True"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" Display="None" ControlToValidate="txtbegintime"
								ErrorMessage="开始时间不能为空"></asp:requiredfieldvalidator>--结束时间
							<asp:textbox id="txtendtime" onfocus="setday(this);" runat="server" CssClass="inputcss" Columns="10"
								ReadOnly="True"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" Display="None" ControlToValidate="txtendtime"
								ErrorMessage="结束不能为空"></asp:requiredfieldvalidator>&nbsp;
							<asp:comparevalidator id="cvdate" runat="server" Display="None" ControlToValidate="txtendtime" ErrorMessage="结束时间应该大于开始时间"
								Operator="GreaterThanEqual" ControlToCompare="txtbegintime"></asp:comparevalidator>&nbsp;
							<asp:radiobutton id="rbtnthisweek" onclick="quickseldate('week');" runat="server" Text="本周" GroupName="quickdate"></asp:radiobutton><asp:radiobutton id="rbtnthismonth" onclick="quickseldate('month');" runat="server" Text="本月" GroupName="quickdate"></asp:radiobutton></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 84px">查找范围</TD>
						<TD><asp:dropdownlist id="ddlsearchbound" runat="server" Width="300px" AutoPostBack="True">
								<asp:ListItem Value="0" Selected="True">公司</asp:ListItem>
								<asp:ListItem Value="1">职位</asp:ListItem>
								<asp:ListItem Value="2">个人</asp:ListItem>
							</asp:dropdownlist></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 84px">请选择</TD>
						<TD><asp:listbox id="lbstaffs" runat="server" CssClass="inputcss" Width="150px" SelectionMode="Multiple"
								Height="141px" Visible="False"></asp:listbox><asp:dropdownlist id="ddldepartments" runat="server" Width="150px" Visible="False"></asp:dropdownlist></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 84px"></TD>
						<TD><asp:validationsummary id="vs1" runat="server"></asp:validationsummary></TD>
					</TR>
					<TR>
						<TD align="center" colSpan="2" height="30"><asp:button id="btnsearch" runat="server" CssClass="buttoncss" Text=" 查  询 "></asp:button></TD>
					</TR>
					<TR>
						<TD align="right" colSpan="2"><asp:datagrid id="AttendanceGrid" runat="server" Width="100%" CellPadding="3" BorderWidth="1px"
								BorderColor="#93BEE2" DataKeyField="staff_id" EnableViewState="False" AutoGenerateColumns="False">
								<HeaderStyle Font-Size="X-Small" BackColor="#E8F4FF"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="realname" HeaderText="姓名">
										<ItemStyle Font-Size="X-Small"></ItemStyle>
										<FooterStyle Font-Size="X-Small"></FooterStyle>
									</asp:BoundColumn>
									<asp:TemplateColumn HeaderText="正常天数">
										<ItemTemplate>
											<asp:HyperLink Text ='<%# GetGridData(((DataRowView)Container.DataItem)["Staff_ID"].ToString(),0)%>' NavigateUrl='<%# "tmpStaffData.aspx?staffid="+((DataRowView)Container.DataItem)["Staff_ID"].ToString()+"&begintime="+txtbegintime.Text+"&endtime="+txtendtime.Text+"&type=1"%>' Target=_blank Runat=server>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="迟到天数">
										<ItemTemplate>
											<asp:HyperLink Text ='<%# GetGridData(((DataRowView)Container.DataItem)["Staff_ID"].ToString(),1)%>' NavigateUrl='<%# "tmpStaffData.aspx?staffid="+((DataRowView)Container.DataItem)["Staff_ID"].ToString()+"&begintime="+txtbegintime.Text+"&endtime="+txtendtime.Text+"&type=2"%>' Target=_blank Runat=server>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="早退天数">
										<ItemTemplate>
											<asp:HyperLink Text ='<%# GetGridData(((DataRowView)Container.DataItem)["Staff_ID"].ToString(),2)%>' NavigateUrl='<%# "tmpStaffData.aspx?staffid="+((DataRowView)Container.DataItem)["Staff_ID"].ToString()+"&begintime="+txtbegintime.Text+"&endtime="+txtendtime.Text+"&type=3"%>' Target=_blank Runat=server>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="未考勤天数">
										<ItemTemplate>
											<asp:HyperLink Text ='<%# GetGridData(((DataRowView)Container.DataItem)["Staff_ID"].ToString(),3)%>' NavigateUrl='<%# "tmpStaffData.aspx?staffid="+((DataRowView)Container.DataItem)["Staff_ID"].ToString()+"&begintime="+txtbegintime.Text+"&endtime="+txtendtime.Text+"&type=4"%>' Target=_blank Runat=server>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="总考勤天数">
										<ItemTemplate>
											<asp:HyperLink Text ='<%# GetGridData(((DataRowView)Container.DataItem)["Staff_ID"].ToString(),4)%>' NavigateUrl='<%# "tmpStaffData.aspx?staffid="+((DataRowView)Container.DataItem)["Staff_ID"].ToString()+"&begintime="+txtbegintime.Text+"&endtime="+txtendtime.Text+"&type=5"%>' Target=_blank Runat=server ID="Hyperlink1" NAME="Hyperlink1">
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
								</Columns>
							</asp:datagrid><INPUT class="buttoncss" id="btn_Report" type="button" value="打印报表" style="DISPLAY:none"
								runat="server"></TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
        <script language="javascript" type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
        <script language="javascript" type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
        <script language="javascript" type="text/javascript" src="../../js/jquery.ui.datepicker-zh-CN.js"></script>
        <script language="javascript" type="text/javascript">
            $(document).ready(function () {
                $("#txtbegintime").datepicker();
                $("#txtendtime").datepicker();
            });
        </script>
	</body>
</HTML>
