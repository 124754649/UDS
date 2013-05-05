<%@ Page language="c#" Codebehind="Compose.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.UnitiveDocument.Mail.Compose" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>写新邮件</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../../css/BasicLayout.css" type="text/css" rel="stylesheet">
    <script language="javascript">
        function dialwinprocess(type)
        {
            var newdialoguewin = window.showModalDialog("SelectReceiver.aspx?ClassID=<% Response.Write(ClassID); %>&type="+type,window,"dialogWidth:600px;DialogHeight=490px;status:no");
			    if(newdialoguewin!=null){
			        if(newdialoguewin.length>5)
			        {
			            ReceiverTypeArray = newdialoguewin.split("|");
			            SendToArray = ReceiverTypeArray[0].split("-");
			            CcToArray = ReceiverTypeArray[1].split("-");
			            BccToArray = ReceiverTypeArray[2].split("-");
			            try{
			                this.document.Compose.txtSendTo.value = SendToArray[0];
			                this.document.Compose.txtCcTo.value = CcToArray[0];
			                this.document.Compose.txtBccTo.value = BccToArray[0]; 
			            }
			            catch(e){}
						
						
			        }
			    }
			}
			
			
			function ProjectSelect()
			{
	
			    var ret;
			    ret = window.showModalDialog("TreeView.aspx",window,"dialogHeight:400px;dialogWidth:300px;center:Yes;Help:No;Resizable:No;Status:Yes;Scroll:auto;Status:no;");
			    if(ret>0)
			        return false;
			}
		
    </script>
    <script language="javascript">
			
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
		
        function selectAll(){
            var len=document.MailList.elements.length;
            var i;
            for (i=0;i<len;i++){
                if (document.MailList.elements[i].type=="checkbox"){
                    document.MailList.elements[i].checked=true;								
                }
            }
        }

        function unSelectAll(){
            var len=document.MailList.elements.length;
            var i;
            for (i=0;i<len;i++){
                if (document.MailList.elements[i].type=="checkbox"){
                    document.MailList.elements[i].checked=false; 
                }   
            } 
        }		

    </script>
</head>
<body leftmargin="0" ms_positioning="GridLayout" topmargin="0">
    <form id="Compose" method="post" enctype="multipart/form-data" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td valign="top" height="38">
                    <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr height="30">
                            <td class="GbText" width="20" background="../../../Images/treetopbg.jpg" bgcolor="#c0d9e6"
                                align="right"><font color="#003366" size="3">
                                    <img height="16" src="../../../Images/icon/284.GIF" width="16"></font></td>
                            <td class="GbText" background="../../../Images/treetopbg.jpg" bgcolor="#e8f4ff" width="60"
                                align="right"><font color="#006699">我的邮件</font></td>
                            <td class="GbText" background="../../../Images/treetopbg.jpg" bgcolor="#e8f4ff" align="right"><font face="宋体">&nbsp;&nbsp;&nbsp;</font></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="bottom" height="25">
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr height="25">
                            <td style="HEIGHT: 25px" width="1"></td>
                            <td id="bar1" style="HEIGHT: 25px" align="center" width="90" background="../../../images/maillistbutton1.gif">&nbsp;<a href='javascript:parent.navigatemf("收件箱", "<%= Page.ResolveUrl("Index.aspx?FolderType=1") %>", "mail")' class="Newbutton">收件箱</a></td>
                            <td id="bar2" style="HEIGHT: 25px" align="center" width="90" background="../../../images/maillistbutton1.gif">&nbsp;<a href='javascript:parent.navigatemf("发件箱", "<%= Page.ResolveUrl("Index.aspx?FolderType=2") %>", "mail")' class="Newbutton">发件箱</a></td>
                            <td id="bar3" style="HEIGHT: 25px" align="center" width="90" background="../../../images/maillistbutton1.gif">&nbsp;<a href='javascript:parent.navigatemf("废件箱", "<%= Page.ResolveUrl("Index.aspx?FolderType=3") %>", "mail")' class="Newbutton">废件箱</a></td>
                            <td id="bar4" style="HEIGHT: 25px" align="center" width="90" background="../../../images/maillistbutton2.gif">&nbsp;<a href='javascript:parent.navigatemf("撰写新邮件", "<%= Page.ResolveUrl("Compose.aspx?ClassID=0") %>", "mail")' class="Newbutton">撰写新邮件</a></td>
                            <td id="bar5" style="HEIGHT: 25px" align="center" width="90" background="../../../images/maillistbutton1.gif">&nbsp;<a href='javascript:parent.navigatemf("外部邮件", "<%= Page.ResolveUrl("Index.aspx?FolderType=4") %>", "mail")' class="Newbutton">外部邮件</a></td>
                            <td style="HEIGHT: 25px" align="right"><font face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td bgcolor="#93bee2" colspan="5" height="5"><font style="BACKGROUND-COLOR: #ffffff" face="宋体"></font></td>
            </tr>
            <tr>
                <td>&nbsp;
						<table cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                                <td align="right" width="100">
                                    <asp:Label ID="lblSendTo" runat="server" CssClass="Text" Font-Size="X-Small">收件人:</asp:Label><font face="宋体">&nbsp;</font></td>
                                <td>
                                    <input class="InputCss"
                                        style="WIDTH: 404px; HEIGHT: 19px" readonly type="text" size="62"
                                        value="<%=SendToRealName%>" name="txtSendTo">&nbsp;<a style="CURSOR: hand" onclick="dialwinprocess(1)" href="#"><font face="宋体">选择收件人</font></a></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblCcTo" runat="server" CssClass="Text" Font-Size="X-Small">抄送人:</asp:Label><font face="宋体">&nbsp;</font></td>
                                <td>
                                    <input class="InputCss"
                                        style="WIDTH: 405px; HEIGHT: 19px" readonly type="text" size="62"
                                        value="<%=CcToRealName%>" name="txtCcTo">&nbsp;<a style="CURSOR: hand" onclick="dialwinprocess(2)" href="#"><font face="宋体">选择抄送人</font></a></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblBccTo" runat="server" CssClass="Text" Font-Size="X-Small">秘抄人:</asp:Label><font face="宋体">&nbsp;</font></td>
                                <td>
                                    <input class="InputCss"
                                        style="WIDTH: 406px; HEIGHT: 19px" readonly type="text" size="62"
                                        value="<%=BccToRealName%>" name="txtBccTo">&nbsp;<a style="CURSOR: hand" onclick="dialwinprocess(2)" href="#"><font face="宋体">选择密送人</font></a></td>
                            </tr>
                            <tr>
                                <td style="HEIGHT: 21px" align="right">
                                    <asp:Label ID="lblSubject" runat="server" CssClass="Text" Font-Size="X-Small" Width="40px">主&nbsp;&nbsp;题:</asp:Label><font face="宋体">&nbsp;</font></td>
                                <td style="HEIGHT: 21px">
                                    <asp:TextBox ID="txtSubject" runat="server" CssClass="InputCss" Width="484px"></asp:TextBox></td>
                            </tr>
                            <tr height="30">
                                <td align="right">
                                    <asp:Label ID="lblImportance" runat="server" CssClass="Text" Font-Size="X-Small">重要性:</asp:Label><font face="宋体">&nbsp;</font></td>
                                <td>
                                    <asp:DropDownList ID="listImportance" runat="server" Width="150px"></asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;<input
                                        class="InputCss" name="hdnProjectID" style="WIDTH: 150px; HEIGHT: 20px"
                                        type="hidden" size="11" value="<%=ClassID %>"
                                        width="20"><input class="InputCss" name="txtProjectName"
                                            style="WIDTH: 150px; HEIGHT: 20px" readonly type="text" size="11"
                                            value="<%=GetClassName() %>" width="20"><input class="redButtonCss" onclick="ProjectSelect()" type="button" value="▼">
                                    <asp:CheckBox ID="cbRemind" runat="server" Font-Size="X-Small" Text="站内短消息提醒"></asp:CheckBox></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblBody" runat="server" CssClass="Text" Font-Size="X-Small">内&nbsp;&nbsp;容:</asp:Label><font face="宋体">&nbsp;</font></td>
                                <td>
                                    <asp:TextBox ID="txtBody" runat="server" CssClass="inputsta" Width="486px" Height="188px" TextMode="MultiLine"></asp:TextBox></td>
                            </tr>
                            <tr class="InputCss">
                                <td>&nbsp;</td>
                                <td>
                                    <table id="tblAttachFiles" width="486" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center">
                                                <table cellspacing="0" cellpadding="0" width="485" border="0">
                                                    <tr>
                                                        <td class="InputCss" style="WIDTH: 45px" rowspan="2">
                                                            <table style="WIDTH: 44px; HEIGHT: 76px" width="44" align="center" border="0">
                                                                <tbody class="InputCss">
                                                                    <tr>
                                                                        <td>&nbsp;<font face="宋体">附件1</font></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>&nbsp;<font face="宋体">附件2</font></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>&nbsp;<font face="宋体">附件3</font></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>&nbsp;<font face="宋体">附件4</font></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                        <td style="WIDTH: 150px" rowspan="2">
                                                            <input class="InputCss" id="filecontrol1" style="WIDTH: 146px; HEIGHT: 19px" type="file"
                                                                size="5" name="filecontrol1" runat="server"><br>
                                                            <input class="InputCss" id="filecontrol2" style="WIDTH: 146px; HEIGHT: 19px" type="file"
                                                                size="6" name="filecontrol2" runat="server"><br>
                                                            <input class="InputCss" id="File1" style="WIDTH: 146px; HEIGHT: 19px" type="file" size="6"
                                                                name="filecontrol3" runat="server"><br>
                                                            <input class="InputCss" id="File2" style="WIDTH: 146px; HEIGHT: 19px" type="file" size="6"
                                                                name="filecontrol4" runat="server">
                                                        </td>
                                                        <td>&nbsp;<font face="宋体"> </font>
                                                            <asp:Button ID="btnUpload" runat="server" CssClass="redButtonCss" Text="添加附件"></asp:Button></td>
                                                        <td rowspan="2">&nbsp;<font face="宋体">&nbsp;&nbsp; </font>
                                                            <asp:ListBox ID="listUp" runat="server" Width="153px" Height="81px" SelectionMode="Multiple"></asp:ListBox></td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;<font face="宋体">
                                                            <asp:Button ID="btnRemove" runat="server" CssClass="redButtonCss" Text="删除附件"></asp:Button></font></td>
                                                    </tr>
                                                </table>
                                                <p>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBoxList ID="cblistAttribute" runat="server" Font-Size="X-Small" RepeatDirection="Horizontal"></asp:CheckBoxList>
                                                </p>
                                                <p>
                                                    <asp:Button ID="btnSendMail" runat="server" CssClass="ButtonCss" Text=" 发  送 "></asp:Button>&nbsp;&nbsp;&nbsp;
													<input class="ButtonCss" style="WIDTH: 58px; HEIGHT: 20px" onclick="javascript:try {if(parent.frames.length==0) window.close();else self.location='<% Response.Write(Request.UrlReferrer); %>        ';} catch(e){}" type="button" value=" 返  回 ">
                                                </p>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td width="47%">
                                <img height="25" src="../../../Images/temp.gif" width="250">
                            </td>
                            <td width="53%">
                                <div align="right">
                                    <img height="25" src="../../../Images/endbott.gif" width="279"></div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input style="Z-INDEX: 109; LEFT: 137px; POSITION: absolute; TOP: 338px" type="hidden"
            name="hdnSendToStr">
        &nbsp;
        <input type="hidden"
            value="<%=SendTo%>" name="hdnTxtSendTo"><input type="hidden"
                value="<%=CcTo%>" name="hdnTxtCcTo"><input type="hidden"
                    value="<%=BccTo%>" name="hdnTxtBccTo">
    </form>
</body>
</html>
