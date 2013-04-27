<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="UDS.SubModule.Position.Index" %>
<%@ Register TagPrefix="uc1" TagName="ControlPositionTreeView" Src="~/Inc/ControlPositionTreeView.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>部门设置</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
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
            <form id="positiontreeview" method="post" runat="server">
				<uc1:ControlPositionTreeView id="ControlPositionTreeView1" runat="server"></uc1:ControlPositionTreeView>
            </form>
			<!--<div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div>-->
		</div><!--/#sidebar-->
        <div id="main-content" class="clearfix">
            <div id="page-content" class="clearfix">
                <iframe id="PositionMainFrame" name="PositionMainFrame" style="width:100%;height:100%;border:0px" frameborder="0"></iframe>
            </div><!--/#page-content-->
        </div><!-- #main-content -->
    </div><!--/.fluid-container#main-container-->
    <script type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../js/quantumcode-elements.js"></script>
    <script type="text/javascript" src="../../js/quantumcode.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#PositionMainFrame").load(function () {
                var height = $(this).contents().find("#WorkArea").height() + 40;
                //这样给以一个最小高度  
                $(this).height(height < 400 ? 400 : height);
            });
        });

        $(document).ready(function () {
            $("#PositionMainFrame")[0].src = '<%=Page.ResolveClientUrl("~/SubModule/position/ListView.aspx") %>';
        });
    </script>
</body>
</html>
