<%@ Page language="c#" Codebehind="Index.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.Login.index" %>
<HTML>
	<HEAD>
		<title>Coffice 系统</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<style type="text/css">
		.Vibox { BORDER-RIGHT: 0px; PADDING-RIGHT: 0px; BORDER-TOP: 0px; PADDING-LEFT: 0px; FONT-SIZE: 12px; PADDING-BOTTOM: 0px; MARGIN: 0px; BORDER-LEFT: 0px; WIDTH: 150px; COLOR: #003399; PADDING-TOP: 0px; BORDER-BOTTOM: 0px; FONT-STYLE: normal; FONT-FAMILY: "Arial", "Helvetica", "sans-serif"; HEIGHT: 18px }
	.Vibutton { BORDER-RIGHT: #006699 1px solid; PADDING-RIGHT: 1px; BORDER-TOP: #006699 1px solid; PADDING-LEFT: 1px; FONT-SIZE: 12px; PADDING-BOTTOM: 1px; MARGIN: 1px; BORDER-LEFT: #006699 1px solid; WIDTH: 60px; COLOR: #006699; PADDING-TOP: 1px; BORDER-BOTTOM: #006699 1px solid; FONT-FAMILY: "宋体"; HEIGHT: 18px; BACKGROUND-COLOR: #ffffff }
	.Vitext { FONT-SIZE: 12px; COLOR: white; FONT-FAMILY: "宋体" }
	.Mybuttona { background-image:url(../../Images/denglu.jpg); CURSOR: hand;}
	.Mybuttonb { background-image:url(../../Images/quxiao.jpg); CURSOR: hand;border: 0px solid; }

-->
</STYLE>

	</style>
	</HEAD>
	<BODY bgcolor="#353467" bgcolor= leftMargin="0" topMargin="0" onload='javascript: if(this.document.all.txtUsername.value=="") this.document.all.txtUsername.focus();else this.document.all.txtPassword.focus();'>
		<span id="obj"></span>
		
		<!--
		<OBJECT id="ePass" style="LEFT: 0px; TOP: 0px" height="0" width="0" classid="clsid:E740C5DF-3454-46A7-80EC-364D1ADB6CF0" name="ePass" VIEWASTEXT>
		</OBJECT>
		-->
		<!--判断用户是否选择使用USBKey-->
		<script language="javascript">
			function needUsbKey(){
			if (document.index.cb_isNeedUsbKey.checked==true)
			{
				obj.innerHTML="<OBJECT id='ePass' style='LEFT: 0px; TOP: 0px' height='0' width='0' classid='clsid:E740C5DF-3454-46A7-80EC-364D1ADB6CF0' name='ePass' VIEWASTEXT></OBJECT>";						
			}
		}
		</script>
		<script language="VBScript">

Dim FirstDigest
Dim Digest 
Digest= "01234567890123456"
dim bErr

'sub needUsbKey()
'	if  index.cb_isNeedUsbKey.checked =true Then
'		obj.innerHTML="<OBJECT id='ePass' style='LEFT: 0px; TOP: 0px' height='0' width='0' classid='clsid:E740C5DF-3454-46A7-80EC-364D1ADB6CF0' name='ePass' VIEWASTEXT></OBJECT>"
'	end if
'End sub

sub ShowErr(Msg)
	bErr = true
	ErrMsg.innerHTML = "<input type='hidden' name='ErrMsg' Value='" & Msg & "'>"
'	MsgBox Msg,0,"提示"
'	Document.Writeln "<FONT COLOR='#FF0000'>"
'	Document.Writeln "<P>&nbsp;</P><P>&nbsp;</P><P>&nbsp;</P><P ALIGN='CENTER'><B>ERROR:</B>"
'	Document.Writeln "<P>&nbsp;</P><P ALIGN='CENTER'>"
'	Document.Writeln Msg
'	Document.Writeln " failed, and returns 0x" & hex(Err.number) & ".<br>"
'	Document.Writeln "<P>&nbsp;</P><P>&nbsp;</P><P>&nbsp;</P>"
'	Document.Writeln "</FONT>"
End Sub

function Validate()
	Digest = "01234567890123456"
	On Error Resume Next
	'Dim TheForm
	'Set TheForm = Document.forms("ValidForm")
	'If Len(TheForm.UserPIN.Value) < 4  Then
	'	MsgBox "PIN empty or user pin length less than 4 or so pin length less than 6!!"	 
	'	Validate = FALSE
	'	Exit Function
	'End If

	bErr = false

	'Let detecte whether the ePass 1000 Safe Active Control loaded.
	'If we call any method and the Err.number be set to &H1B6, it 
	'means the ePass 1000 Safe Active Control had not be loaded.
	ePass.GetLibVersion
	
	If Err.number = &H1B6 Then

		ShowErr "Load ePass 1000 Safe Active Control"
		Validate = false
		Exit function
	Else
		
		ePass.OpenDevice 1, ""
		
		If Err then
			ShowErr "请勾选使用框,并插入USB_Key!"
			Validate = false
			ePass.CloseDevice
			Exit function
		End if
	
		'ePass.ResetSecurityState 0
		dim results
		results = "01234567890123456"
		results = ePass.GetStrProperty(7, 0, 0)
		'MsgBox results

		'ePass.VerifyUserPIN TheForm.Identity.Value, TheForm.UserPIN.Value
		'ePass.VerifyPIN 0, TheForm.UserPIN.Value

		If Err Then
			ShowErr "Verify User PIN Failure!!!"
			Validate = false
			ePass.CloseDevice
			Exit function
		End If
		

		If Not bErr Then
			ePass.ChangeDir &H300, 0, "ASP_DEMO"
			If Err then 
				ShowErr "Change to demo directory"
				Validate = false
				ePass.CloseDevice
				Exit function
			End If
		End If


		'Open the first key file.
		If Not bErr Then
			ePass.OpenFile 0, 1
			If Err Then
				ShowErr "Open first KEY-file"
				Validate = false
				ePass.CloseDevice
				Exit function
			End If
		
		End If

		'Do HASH-MD5-HMAC compute.
		If Not bErr Then
			Digest = ePass.HashToken (1, 2,"<%=RandData%>")
			If Err Then 
				ShowErr "HashToken compute"
				Validate = false
				ePass.CloseDevice
				Exit function
			End If
			DigestID.innerHTML = "<input type='hidden' name='Digest' Value='" & Digest & "'>"
			snID.innerHTML = "<input type='hidden' name='SN_SERAL' Value='" & results & "'>"
		End If		
	End If

	ePass.CloseDevice
	
End function
		</script>
		
		
		
		<form id="index" method="post" runat="server" onsubmit="Validate()">
		
		<span id="DigestID"></span>
			<span id="snID"></span>
			<span id="ErrMsg"></span>
		
			<table  bgcolor="#353467" cellSpacing="0" cellPadding="0" width="100%" height="100%" border="0" background="../../Images/newface1.jpg" style="background-repeat: no-repeat;
background-attachment: fixed;">
				
			
				<tr><td width="443">				
					
				</tr>
					<td width="357" align="center" valign="top">				
　<p>　</p>
<p>　</p>
<p>				
<img border="0" src="../../Images/welcome.gif" width="224" height="117"></p>
<p>
<SPAN style="FONT-FAMILY: 黑体; FONT-SIZE: 12pt"><font color=white>用户名：</font></SPAN><asp:textbox id="txtUsername" runat="server" CssClass="Vibox"></asp:textbox><asp:requiredfieldvalidator id="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="*"></asp:requiredfieldvalidator><p>
<SPAN style="FONT-FAMILY: 黑体; FONT-SIZE: 12pt"><font color=white>密&nbsp; 码：</font></SPAN><asp:textbox id="txtPassword" runat="server" CssClass="Vibox" TextMode="Password"></asp:textbox><asp:requiredfieldvalidator id="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="*"></asp:requiredfieldvalidator><p>
				<asp:button id="btnSubmit" BorderWidth=0 BorderStyle=None Width="88" Height="43" runat="server" CssClass="Mybuttona" Text=""></asp:button>&nbsp;<input class="Mybuttonb" style="width=88px;height=43px"  type="reset" value="" name="Submit2"><p>
				&nbsp;<span class="Vitext"><asp:CheckBox id="cb_isNeedUsbKey" runat="server" Text="使用USB_Key" Height="10px"></asp:CheckBox><asp:label id="lblErrorMessage" runat="server" Visible="False" ForeColor="Red" Width="128px">错误的用户名和口令</asp:label>
				<p>建议在1024*768分辨率下浏览</p></td></tr>
				<tr>
					
					
								
							</span></font></td>
					
				</tr>
				</table>
		</form>
	</BODY>
</HTML>