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
						<TD class="GbText" background="../../Images/treetopbg.jpg" bgColor="#c0d9e6"><B><B><B><FONT face="����">Ա��ע��</FONT></B></B></B></TD>
						<TD class="GbText" align="right" background="../../Images/treetopbg.jpg" bgColor="#c0d9e6"></TD>
					</TR>
				</TABLE>
				<table class="gbtext" id="AutoNumber1" style="BORDER-COLLAPSE: collapse" borderColor="#93bee2"
					cellSpacing="0" cellPadding="0" width="100%" border="1" runat="server">
					<tr bgColor="#e8f4ff">
						<td style="HEIGHT: 34px" align="right" width="20%" height="34">�û�����:</td>
						<td style="HEIGHT: 34px" height="34">&nbsp;<asp:textbox id="txtStaffName" CssClass="InputCss" Runat="server" Columns="70" Width="382"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ErrorMessage="����������" ControlToValidate="txtStaffName"
								Font-Size="X-Small"></asp:requiredfieldvalidator><asp:literal id="message" runat="server" EnableViewState="False"></asp:literal></td>
					</tr>
					<tr>
						<td align="right" width="20%" height="30">��ʵ����:</td>
						<td height="30">&nbsp;<asp:textbox id="txtRealName" CssClass="InputCss" Runat="server" Columns="70" Width="382"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ErrorMessage="��������ʵ����" ControlToValidate="txtRealName"
								Font-Size="X-Small"></asp:requiredfieldvalidator></td>
					</tr>
					<tr bgColor="#e8f4ff">
						<td align="right" width="20%" height="30">�Ա�:</td>
						<td height="30">&nbsp;<asp:radiobutton id="rb_male" Runat="server" GroupName="rSex" Checked="True" Text="��"></asp:radiobutton><asp:radiobutton id="rb_female" Runat="server" GroupName="rSex" Checked="False" Text="Ů"></asp:radiobutton></td>
					</tr>
					<tr>
						<td align="right" width="20%" height="30">��������:</td>
						<td height="30">&nbsp;<asp:textbox ClientIDMode="Static" id="txtBirthday" CssClass="InputCss" Runat="server" Columns="70"
								Width="383" ReadOnly="True"></asp:textbox></td>
					</tr>
					<tr bgColor="#e8f4ff">
						<td align="right" width="20%" height="30">����:</td>
						<td height="30">&nbsp;<asp:textbox id="txtPassword" runat="server" CssClass="InputCss" Width="383px" TextMode="Password"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator4" runat="server" ErrorMessage="���벻��Ϊ��" ControlToValidate="txtPassword"
								Font-Size="X-Small"></asp:requiredfieldvalidator></td>
					</tr>
					<tr>
						<td align="right" width="20%" height="30">�ظ�����:</td>
						<td height="30">&nbsp;<asp:textbox id="txtRePassword" runat="server" CssClass="InputCss" Width="382px" TextMode="Password"></asp:textbox><asp:comparevalidator id="CompareValidator1" runat="server" ErrorMessage="����ȷ�ϴ���" ControlToValidate="txtRePassword"
								Font-Size="X-Small" ControlToCompare="txtPassword"></asp:comparevalidator></td>
					</tr>
					<TR bgColor="#e8f4ff">
						<td align="right" width="20%" height="30">�����ʼ�:</td>
						<td height="30">&nbsp;<asp:textbox id="txtEmail" CssClass="InputCss" Runat="server" Columns="70" Width="382"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" ErrorMessage="����д�����ʼ���ַ" ControlToValidate="txtEmail"
								Font-Size="X-Small" Display="Dynamic"></asp:requiredfieldvalidator><asp:regularexpressionvalidator id="checkmail" runat="server" ErrorMessage="�����EMAIL��ʽ" ControlToValidate="txtEmail"
								Display="Dynamic" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:regularexpressionvalidator></td>
					</TR>
					<tr>
						<td align="right" width="20%" height="30">��˾�绰:</td>
						<td height="30">&nbsp;<asp:textbox id="txtPhone" CssClass="InputCss" Runat="server" Columns="70" Width="382"></asp:textbox></td>
					</tr>
					<tr bgColor="#e8f4ff">
						<td align="right" width="20%" height="30">�ƶ��绰:</td>
						<td height="30">&nbsp;<asp:textbox id="txtMobile" CssClass="InputCss" Runat="server" Columns="70" Width="382"></asp:textbox><asp:regularexpressionvalidator id="checkmobile" runat="server" ErrorMessage="�ֻ��Ŵ���" ControlToValidate="txtMobile"
								Font-Size="X-Small" ValidationExpression="\d*"></asp:regularexpressionvalidator></td>
					</tr>
					<TR>
						<TD align="right" width="20%" height="30"><FONT face="����">ְλ����:</FONT></TD>
						<TD height="30"><FONT face="����">&nbsp;<asp:textbox id="txtCaste" CssClass="InputCss" Runat="server" Columns="70" Width="382"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator5" runat="server" ErrorMessage="����Ϊ��" ControlToValidate="txtCaste"></asp:requiredfieldvalidator><asp:regularexpressionvalidator id="RegularExpressionValidator1" runat="server" ErrorMessage="����Ϊ����" ControlToValidate="txtCaste"
									ValidationExpression="\d*"></asp:regularexpressionvalidator></FONT></TD>
					</TR>
					<tr id="myposition" runat="server">
						<td align="right" width="20%" height="30">����ְλ:</td>
						<td height="30"><FONT face="����">&nbsp;<asp:dropdownlist id="cboPosition" runat="server" Width="383px"></asp:dropdownlist></FONT></td>
					</tr>
					<TR>
						<TD align="right" width="20%" height="30"></TD>
						<TD height="30">
							<asp:CheckBox id="cbRemind" runat="server" Width="240px" Font-Size="X-Small" Text="վ�ڶ���Ϣ����(���ѹ�˾ȫ��Ա��)"
								Height="16px"></asp:CheckBox></TD>
					</TR>
					<TR>
						<TD align="center" colSpan="2" height="35"><FONT face="����"><asp:button id="cmdSubmit" runat="server" CssClass="redButtonCss" Width="60px" Text="ȷ��" Height="20px"></asp:button>&nbsp;&nbsp;&nbsp;&nbsp;
								<INPUT class=redButtonCss style="WIDTH: 60px; HEIGHT: 20px" onclick="ReturnBack(<%=ReturnPage%>)" type=button value="�� ��" name=cmdReturn>
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
