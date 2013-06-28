<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="UDS.SubModule.AM.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>资产管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="../../Css/bootstrap.min.css"/>
	<link rel="stylesheet" href="../../Css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="../../Css/redmond/jquery-ui-1.10.3.custom.min.css" />
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

    <style type="text/css">
		.widget-box .widget-toolbar a
		{
			color: white;
		}
	</style>
</head>
<body>
    <div id="editAMDialog">

    </div>
    <div class="container-fluid">
        <div id="page-content">
		    <div class="page-header">
			    <h1>资产管理</h1>
		    </div>
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-header header-color-blue">
                            <h5><i class="icon-barcode icon-2x"></i>资产列表</h5>
                            <div class="widget-toolbar">
                                <a href="editbulletin.aspx?isNew=" id="newlink"><i class="icon-edit"></i>添加资产</a>
                                <!--<a href="javascript:deleteBulletin()"><i class="icon-remove"></i>删除</a>-->
                            </div>
                        </div>
                        <div class="widget-body">
							<div class="widget-body-inner" style="display: block">
								<div class="widget-main no-padding" id="amList">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
    <script type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.ui.datepicker-zh-CN.js"></script>
    <script type="text/javascript" src="../../js/underscore-min.js"></script>
    <script type="text/javascript" src="../../js/backbone-min.js"></script>
    <script type="text/javascript" src="../../js/jquery.fileDownload.js"></script>
    <script type="text/javascript" src="../../js/records.js"></script>
    <script type="text/javascript" src="../../js/udsAM.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var amEditDlg = new udsAMEditView({
                templateUri: '<%= Page.ResolveUrl("~/App_ViewTemplate/am_editor.html") %>',
                el: $("#editAMDialog")
            });

            var amtable = new udsAMTableView({
                el: $("#amList"),
                editorDlg: amEditDlg,
                templateUri: '<%= Page.ResolveUrl("~/App_ViewTemplate/am_table.html") %>',
                queryUrl: '<%= Page.ResolveUrl("~/SubModule/AM/action.aspx") %>'
            });

            amtable.render();
        });
    </script>
</body>
</html>
