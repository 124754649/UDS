<%@ Page CodeBehind="Index.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="UDS.SubModule.Role.Index" %>
<%@ Register TagPrefix="uc1" TagName="ControlRoleTreeView" Src="~/Inc/ControlRoleTreeView.ascx" %>
<!DOCTYPE html>
<html>
	<head runat="server">
		<TITLE>角色设置</TITLE>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
        
	</head>
    <body>
        <form id="roletreeview" method="post" runat="server">
            <table>
                <tr>
                    <td style="width:120px;vertical-align:top"><uc1:ControlRoleTreeView id="ControlRoleTreeView1" runat="server"></uc1:ControlRoleTreeView></td>
                    <td style="width:100%;vertical-align:top;padding-right:5px"><iframe id="RoleMainFrame" name="RoleMainFrame" style="width:100%;height:100%;border:0px" frameborder="0"></iframe></td>
                </tr>
            </table>
       </form>
        
        <script type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $("#RoleMainFrame").load(function () {
                    var height = $(this).contents().find("#WorkArea").height() + 40;
                    //这样给以一个最小高度  
                    $(this).height(height < 400 ? 400 : height);
                });
            });

            $(document).ready(function () {
                $("#RoleMainFrame")[0].src = '<%=Page.ResolveClientUrl("~/SubModule/Role/ListView.aspx") %>';
            });
        </script>
    </body>
</html>
