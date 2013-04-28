<%@ Register TagPrefix="uc1" TagName="ControlProjectTreeView" Src="../../Inc/ControlProjectTreeView.ascx" %>

<%@ Page Language="c#" CodeBehind="ClassTree.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.AssginRule.ClassTree" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ClassTree</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
    <script language="javascript">
        function GetValue() {
            var pwindow = window.dialogArguments;
            //alert( CustomTreeView.getTreeNode(CustomTreeView.selectedNodeIndex).getAttribute("ID"));
            pwindow.document.all.ObjID.value = TreeView1.getTreeNode(TreeView1.selectedNodeIndex).getAttribute("ID");
            pwindow.document.all.ObjectName.value = TreeView1.getTreeNode(TreeView1.selectedNodeIndex).getAttribute("Text");
            close();
        }
    </script>
</head>
<body leftmargin="0" topmargin="0">
    <form id="WorkArea" method="post" runat="server">
        <asp:TreeView ID="TreeView1" runat="server" ImageSet="XPFileExplorer" NodeIndent="15" ShowLines="True">
            <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
            <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px" NodeSpacing="0px" VerticalPadding="2px" />
            <ParentNodeStyle Font-Bold="False" />
            <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px" VerticalPadding="0px" />
        </asp:TreeView>
        <p><font face="ËÎÌו"></font></p>
        </FONT>
    </form>
</body>
</html>
