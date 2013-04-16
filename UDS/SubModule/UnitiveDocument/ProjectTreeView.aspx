<%@ Register TagPrefix="uc1" TagName="ControlProjectTreeView" Src="../../Inc/ControlProjectTreeView.ascx" %>
<%@ Page language="c#" Codebehind="ProjectTreeView.aspx.cs" AutoEventWireup="false" Inherits="UDS.TreeView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<TITLE>文档一体化系统</TITLE>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../Css/basiclayout.css" rel="stylesheet">
		<style>A.linkFooter:link {
	FONT-WEIGHT: normal; FONT-SIZE: 9px; COLOR: #006699; FONT-FAMILY: Arial, Helvetica, sans-serif; TEXT-DECORATION: none
}
A.linkMenu:link {
	FONT-WEIGHT: normal; FONT-SIZE: 9pt; COLOR: #006699; FONT-FAMILY: Arial, Helvetica, sans-serif; TEXT-DECORATION: none
}
A.linkMenu:visited {
	FONT-WEIGHT: normal; FONT-SIZE: 9pt; COLOR: #006699; FONT-FAMILY: Arial, Helvetica, sans-serif; TEXT-DECORATION: none
}
A.linkMenu:active {
	FONT-WEIGHT: normal; FONT-SIZE: 9pt; COLOR: #ff3300; TEXT-DECORATION: underline
}
A.linkMenu:hover {
	FONT-WEIGHT: normal; FONT-SIZE: 9pt; COLOR: #ff3300; TEXT-DECORATION: none
}
BODY {
	SCROLLBAR-FACE-COLOR: #024289; SCROLLBAR-HIGHLIGHT-COLOR: #024289; SCROLLBAR-SHADOW-COLOR: #024289; SCROLLBAR-3DLIGHT-COLOR: #e8f4ff; SCROLLBAR-ARROW-COLOR: #949494; SCROLLBAR-TRACK-COLOR: #0051a5; SCROLLBAR-DARKSHADOW-COLOR: black; SCROLLBAR-BASE-COLOR: #e8f4ff
}
.borderMenuLayer {
	BORDER-LEFT-COLOR: #c9c9c9; BORDER-BOTTOM-COLOR: #c9c9c9; BORDER-TOP-COLOR: #c9c9c9; BORDER-RIGHT-COLOR: #c9c9c9
}
.borderMenuLayerOver {
	FONT-SIZE: 9pt; BORDER-LEFT-COLOR: #949494; BORDER-BOTTOM-COLOR: #949494; BORDER-TOP-COLOR: #949494; BORDER-RIGHT-COLOR: #949494
}
.textWhite {
	FONT-WEIGHT: normal; FONT-SIZE: 9pt; COLOR: #999999; LINE-HEIGHT: 22px; FONT-FAMILY: "宋体"
}
.top {
	FONT-WEIGHT: normal; FONT-SIZE: 9pt; COLOR: #000000; FONT-FAMILY: "Arial", "Helvetica", "sans-serif"; TEXT-DECORATION: none
}
		</style>
		<script language="javascript">
		

		</script>
	</HEAD>
	<body style="BACKGROUND-POSITION: right 50%; BACKGROUND-ATTACHMENT: fixed; BACKGROUND-REPEAT: no-repeat" leftMargin="0" background="../../Images/lefttreebg.gif" topMargin="0" bgcolor="#024289" onload="SetStatus()">
		<form id="Projecttreeview" method="post" runat="server">
			<table height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TR>
					<TD vAlign="center" height="30"><FONT face="宋体">
							<TABLE id="Table1" height="30" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TR>
									<TD bgcolor="#024289">&nbsp;<asp:image id="Image1" runat="server" ImageUrl="../../DataImages/xpDesktop.gif"></asp:image><FONT face="宋体">&nbsp;<A  style="TEXT-DECORATION: none" href="Desktop.aspx" target="MainFrame"><font color=white>桌面(<%=UserName%>)</font></A></FONT></TD>
									<TD width="1"></TD>
								</TR>
							</TABLE>
						</FONT>
					</TD>
				</TR>
				<tr vAlign="top">
					<td><uc1:controlprojecttreeview id="ControlProjectTreeView1" runat="server"></uc1:controlprojecttreeview></td>
				</tr>
			</table>
		</form>
		<script language="javascript">
		function SetStatus()
		{
			try{				
				myTreeView = document.all.ControlProjectTreeView1_TreeView1;
				var urlstr=location.href.split("?")[1];
				if (urlstr!=null)
					{
						urlstr=urlstr.split("classID=")[1];
						var classID=urlstr.split("&")[0];//取得classID值
						var mNodeArray=new Array();
						mNodeArray=myTreeView.getChildren();
						CheckAll(mNodeArray,classID);
						mNodeArray=null;
					}
				}
			catch(e){alert('error occur!'+e);}
		}
		
		function ExpandAllParentNode(node)
		{
						
				if(node!=null){
					node.setAttribute("Expanded","True");
					ExpandAllParentNode(node.getParent());
				}
		}
		
		
		function CheckAll(arr,classID)
		{
			var i;
			for(i=0;i<arr.length;i++)
			{
					var mNode=arr[i];
					var currNodeID	= mNode.getAttribute("ID");
					if(currNodeID==classID)
					{
						ExpandAllParentNode(mNode);
						break;
					}
					if((mNode.getChildren().lengh)!=0)
					CheckAll(mNode.getChildren(),classID);//递归遍历节点
			}
	    }

		</script>
	</body>
</HTML>