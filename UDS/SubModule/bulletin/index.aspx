<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="UDS.SubModule.bulletin.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>公告管理</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="../../Css/bootstrap.min.css"/>
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

    <style type="text/css">
		.widget-box .widget-toolbar a
		{
			color: white;
		}
	</style>
</head>
<body>
	<div class="container-fluid">
        <div id="page-content">
		    <div class="page-header">
			    <h1>公告管理</h1>
		    </div>
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-header header-color-blue">
                            <h5><i class="icon-bullhorn icon-2x"></i>公告</h5>
                            <div class="widget-toolbar">
                                <a href="#"><i class="icon-edit"></i>新建公告</a>
                                <a href="#"><i class="icon-remove"></i>删除</a>
                            </div>
                        </div>
                        <div class="widget-body">
							<div class="widget-body-inner" style="display: block">
								<div class="widget-main no-padding">
                                    <table id="bulletinTable" class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="center">
                                                    <label>
                                                        <input type="checkbox" />
                                                        <span class="lbl"></span>
                                                    </label>
                                                </th>
                                                <th>公告标题</th>
                                                <th>公告时间</th>
                                                <th>已读人数</th>
                                            </tr>    
                                        </thead>
                                        <tbody>
                                            <script type="text/html" id="bulletinTableTemplate">
                                                <% _.each %>
                                            </script>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
    <script type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../../ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //CKEDITOR.replace("toolbar", "Basic");
            //CKEDITOR.replace("bulletinContent", { "toolbar": "Basic" });
        });
    </script>
</body>
</html>
