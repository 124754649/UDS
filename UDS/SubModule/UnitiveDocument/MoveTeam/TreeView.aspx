<%@ Page Language="c#" CodeBehind="TreeView.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.UnitiveDocument.MoveTeam.TreeView" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>项目移动</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .treenodespan {
            cursor:pointer;
        }

        .treenodespanmouseover,
        .treenodespanselected {
            background-color:lightblue
        }
    </style>
</head>
<body ms_positioning="GridLayout">
    <form id="TreeView" method="post" runat="server">
        <table width="33%" border="0">
            <tr>
                <td>&nbsp;<asp:TreeView ID="TreeView1" runat="server" ImageSet="XPFileExplorer" NodeIndent="15" ShowLines="True">
                    <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                    <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px" NodeSpacing="0px" VerticalPadding="2px" />
                    <ParentNodeStyle Font-Bold="False" />
                    <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px" VerticalPadding="0px" />
                </asp:TreeView>
                </td>
            </tr>
            <tr>
                <td>&nbsp;<font face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</font><input class="ButtonCss" type="button" value="确定" onclick="confirmRemove()"></td>
            </tr>
        </table>
    </form>
    <script type="text/javascript" src="../../../js/jquery-1.9.1.min.js"></script>
    <script language="javascript">
        function confirmRemove() {
            var parwin = window.dialogArguments;
            if (null != lastnode) {
                tdText = $(lastnode).data("text");
                if (fromid != $(lastnode).data("id")) {
                    if (confirm("您确认要移动原项目至 <<" + tdText + ">> ?")) {
                        $.ajax({
                            type: "GET",
                            url: "TreeView.aspx?Action=1&FromID=" + fromid + "&ToID=" + $(lastnode).data("id"),
                            dataType: "text",
                            success: function () {
                                alert("移动成功!");
                                parwin.parent.location.reload();
                                window.close();
                            },
                            error: function (xhrq, textStatus, errorThrown) {
                                alert(xhrq.responseText);
                            }
                        });
                    }
                }
                else {
                    alert("不能移动到原项目下，请重新选择一个项目");
                }
            }
            else {
                alert("请先选择一个目标项目");
            }
            
            //tdText = TreeView1.getTreeNode(TreeView1.selectedNodeIndex).getAttribute("Text")
            //if (confirm("您确认要移动原项目至 <<" + tdText + ">> ?")) {
            //    parwin.location = "TreeView.aspx?Action=1&FromID=&ToID=" + TreeView1.getTreeNode(TreeView1.selectedNodeIndex).getAttribute("ID");
            //    window.close();
            //    parwin.alert('移动成功!');
            //    parwin.parent.location.reload();
            //}
        }

        var fromid = "<%=FromID%>";

        var lastnode = null;

        $(function () {
            $("span.treenodespan").click(function () {
                if ($(this).hasClass("treenodespanselected")) {
                    $(this).removeClass("treenodespanselected");
                    lastnode = null;
                }
                else {
                    $(this).addClass("treenodespanselected");
                    if (null != lastnode)
                        $(lastnode).removeClass("treenodespanselected");
                    lastnode = this;
                }
            });

            $("span.treenodespan").mouseover(function () {
                if (!$(this).hasClass("treenodespanmouseover")) {
                    $(this).addClass("treenodespanmouseover");
                }
            });

            $("span.treenodespan").mouseout(function () {
                if ($(this).hasClass("treenodespanmouseover")) {
                    $(this).removeClass("treenodespanmouseover");
                }
            });
        });

        $(document).ready(function () {
            
        });
    </script>
</body>
</html>
