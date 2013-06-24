<%@ Page language="c#" Codebehind="NewStaff.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.Position.NewStaff" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>NewStaff</title>
        <link href="../../Css/BasicLayout.css" type="text/css" rel="stylesheet" />
        <link href="../../Css/redmond/jquery-ui-1.10.3.custom.min.css" type="text/css" rel="Stylesheet" />
		<style type="text/css">
            .td { FONT-SIZE: 14px; COLOR: #0000ff }
		</style>
	</HEAD>
	<body leftMargin="0" topMargin="0">
		<form id="NewStaff" method="post" runat="server">
			<CENTER>
				<TABLE id="Table2" borderColor="#111111" height="1" cellSpacing="0" cellPadding="0" width="100%"
					border="0">
					<TR height="30">
						<TD class="GbText" width="3%" background="../../Images/treetopbg.jpg" bgColor="#c0d9e6"><FONT color="#003366" size="3"><IMG alt="" src="../../DataImages/ClientManage.gif"></FONT></TD>
						<TD class="GbText" background="../../Images/treetopbg.jpg" bgColor="#c0d9e6"><B><B><B><FONT face="宋体">员工注册</FONT></B></B></B></TD>
						<TD class="GbText" align="right" background="../../Images/treetopbg.jpg" bgColor="#c0d9e6"></TD>
					</TR>
				</TABLE>
				<table class="gbtext" id="AutoNumber1" style="BORDER-COLLAPSE: collapse" borderColor="#93bee2"
					cellSpacing="0" cellPadding="0" width="100%" border="1" runat="server">
					<tr bgColor="#e8f4ff">
						<td style="HEIGHT: 34px" align="right" width="20%" height="34">用户姓名:</td>
						<td style="HEIGHT: 34px" height="34">&nbsp;<asp:textbox id="txtStaffName" CssClass="InputCss" Runat="server" Columns="70" Width="382"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ErrorMessage="请输入姓名" ControlToValidate="txtStaffName"
								Font-Size="X-Small"></asp:requiredfieldvalidator><asp:literal id="message" runat="server" EnableViewState="False"></asp:literal></td>
					</tr>
					<tr>
						<td align="right" width="20%" height="30">真实姓名:</td>
						<td height="30">&nbsp;<asp:textbox id="txtRealName" CssClass="InputCss" Runat="server" Columns="70" Width="382"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ErrorMessage="请输入真实姓名" ControlToValidate="txtRealName"
								Font-Size="X-Small"></asp:requiredfieldvalidator></td>
					</tr>
					<tr bgColor="#e8f4ff">
						<td align="right" width="20%" height="30">性别:</td>
						<td height="30">&nbsp;<asp:radiobutton id="rb_male" Runat="server" GroupName="rSex" Checked="True" Text="男"></asp:radiobutton><asp:radiobutton id="rb_female" Runat="server" GroupName="rSex" Checked="False" Text="女"></asp:radiobutton></td>
					</tr>
					<tr>
						<td align="right" width="20%" height="30">出生日期:</td>
						<td height="30">&nbsp;<asp:textbox ClientIDMode="Static" id="txtBirthday" CssClass="InputCss" Runat="server" Columns="70"
								Width="383" ReadOnly="True"></asp:textbox></td>
					</tr>
					<tr bgColor="#e8f4ff">
						<td align="right" width="20%" height="30">密码:</td>
						<td height="30">&nbsp;<asp:textbox id="txtPassword" runat="server" CssClass="InputCss" Width="383px" TextMode="Password"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator4" runat="server" ErrorMessage="密码不能为空" ControlToValidate="txtPassword"
								Font-Size="X-Small"></asp:requiredfieldvalidator></td>
					</tr>
					<tr>
						<td align="right" width="20%" height="30">重复密码:</td>
						<td height="30">&nbsp;<asp:textbox id="txtRePassword" runat="server" CssClass="InputCss" Width="382px" TextMode="Password"></asp:textbox><asp:comparevalidator id="CompareValidator1" runat="server" ErrorMessage="密码确认错误" ControlToValidate="txtRePassword"
								Font-Size="X-Small" ControlToCompare="txtPassword"></asp:comparevalidator></td>
					</tr>
					<TR bgColor="#e8f4ff">
						<td align="right" width="20%" height="30">电子邮件:</td>
						<td height="30">&nbsp;<asp:textbox id="txtEmail" CssClass="InputCss" Runat="server" Columns="70" Width="382"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" ErrorMessage="请填写电子邮件地址" ControlToValidate="txtEmail"
								Font-Size="X-Small" Display="Dynamic"></asp:requiredfieldvalidator><asp:regularexpressionvalidator id="checkmail" runat="server" ErrorMessage="错误的EMAIL格式" ControlToValidate="txtEmail"
								Display="Dynamic" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:regularexpressionvalidator></td>
					</TR>
					<tr>
						<td align="right" width="20%" height="30">公司电话:</td>
						<td height="30">&nbsp;<asp:textbox id="txtPhone" CssClass="InputCss" Runat="server" Columns="70" Width="382"></asp:textbox></td>
					</tr>
					<tr bgColor="#e8f4ff">
						<td align="right" width="20%" height="30">移动电话:</td>
						<td height="30">&nbsp;<asp:textbox id="txtMobile" CssClass="InputCss" Runat="server" Columns="70" Width="382"></asp:textbox><asp:regularexpressionvalidator id="checkmobile" runat="server" ErrorMessage="手机号错误" ControlToValidate="txtMobile"
								Font-Size="X-Small" ValidationExpression="\d*"></asp:regularexpressionvalidator></td>
					</tr>
					<TR>
						<TD align="right" width="20%" height="30"><FONT face="宋体">职位级别:</FONT></TD>
						<TD height="30"><FONT face="宋体">&nbsp;<asp:textbox id="txtCaste" CssClass="InputCss" Runat="server" Columns="70" Width="382"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator5" runat="server" ErrorMessage="不能为空" ControlToValidate="txtCaste"></asp:requiredfieldvalidator><asp:regularexpressionvalidator id="RegularExpressionValidator1" runat="server" ErrorMessage="必须为数字" ControlToValidate="txtCaste"
									ValidationExpression="\d*"></asp:regularexpressionvalidator></FONT></TD>
					</TR>
					<tr id="myposition" runat="server">
						<td align="right" width="20%" height="30">所属职位:</td>
						<td height="30"><FONT face="宋体">&nbsp;<asp:dropdownlist id="cboPosition" runat="server" Width="383px"></asp:dropdownlist></FONT></td>
					</tr>
					<TR>
						<TD align="right" width="20%" height="30"></TD>
						<TD height="30">
							<asp:CheckBox id="cbRemind" runat="server" Width="240px" Font-Size="X-Small" Text="站内短消息提醒(提醒公司全体员工)"
								Height="16px"></asp:CheckBox></TD>
					</TR>
					<TR>
						<TD align="center" colSpan="2" height="35"><FONT face="宋体"><asp:button id="cmdSubmit" runat="server" CssClass="redButtonCss" Width="60px" Text="确定" Height="20px"></asp:button>&nbsp;&nbsp;&nbsp;&nbsp;
								<INPUT class=redButtonCss style="WIDTH: 60px; HEIGHT: 20px" onclick="ReturnBack(<%=ReturnPage%>)" type=button value="返 回" name=cmdReturn>
							</FONT>
						</TD>
					</TR>
				</table>
			</CENTER>
		</form>
        <script type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
        <script type="text/javascript" src="../../js/jquery.ui.datepicker-zh-CN.js"></script>
        <script type="text/javascript" language="javascript">
            $(document).ready(function(){
                $("#txtBirthday").datepicker({
                    changeMonth: true,
                    changeYear: true
                });
            });

            function ReturnBack(ReturnType)
            {			
                if(ReturnType==0)
                    location.href ="ListView.aspx?Position_ID=<%=PositionID%>";	
			    else
			        location.href ="../Staff/ManageStaff.aspx";			
            }
		</script>
	</body>
</HTML>
