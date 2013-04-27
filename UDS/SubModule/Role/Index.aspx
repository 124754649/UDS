<%@ Page CodeBehind="Index.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="UDS.SubModule.Role.Index" %>
<%@ Register TagPrefix="uc1" TagName="ControlRoleTreeView" Src="~/Inc/ControlRoleTreeView.ascx" %>
<!DOCTYPE html>
<html>
	<head runat="server">
		<TITLE>角色设置</TITLE>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
        <link rel="stylesheet" href="../../Css/bootstrap.css" />
        <link rel="stylesheet" href="../../Css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="../../Css/font-awesome.min.css" />
        <!--[if IE 7]>
		  <link rel="stylesheet" href="../../Css/font-awesome-ie7.min.css" />
		<![endif]-->
        <link rel="stylesheet" href="../../Css/quantumcode.css" />
        <link rel="stylesheet" href="../../Css/quantumcode-resposive.css" />
        <link rel="stylesheet" href="../../Css/quantumcode-skins.css" />

        <!--[if lt IE 9]>
		  <link rel="stylesheet" href="../../Css/quantumcode-ie.css" />
		<![endif]-->
	</head>
    <body>
        <div class="container-fluid" id="WorkArea">
			<div id="sidebar">
                <form id="roletreeview" method="post" runat="server">
				    <uc1:ControlRoleTreeView id="ControlRoleTreeView1" runat="server"></uc1:ControlRoleTreeView>
                </form>
				<!--<div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div>-->
			</div><!--/#sidebar-->
            <div id="main-content" class="clearfix">
                <div id="page-content" class="clearfix">
                    <iframe id="RoleMainFrame" name="RoleMainFrame" style="width:100%;height:100%;border:0px" frameborder="0"></iframe>
                </div><!--/#page-content-->
            </div><!-- #main-content -->
        </div><!--/.fluid-container#main-container-->
        <script type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../../js/quantumcode-elements.js"></script>
        <script type="text/javascript" src="../../js/quantumcode.js"></script>
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
