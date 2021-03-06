﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="UDS.SubModule.bulletin.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>公告板</title>
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
	<div id="bulletinItemDlg" title="">

    </div>
    <div class="container-fluid">
        <div id="page-content">
		    <div class="page-header">
			    <h1>公告板</h1>
		    </div>
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-header header-color-blue">
                            <h5><i class="icon-bullhorn icon-2x"></i>公告</h5>
                            <div class="widget-toolbar">
                                
                            </div>
                        </div>
                        <div class="widget-body">
							<div class="widget-body-inner" style="display: block">
								<div class="widget-main no-padding" id="bulletinList">
                                    
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
    <script type="text/javascript" src="../../ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="../../js/underscore-min.js"></script>
    <script type="text/javascript" src="../../js/backbone-min.js"></script>
    <script type="text/javascript" src="../../js/jquery.fileDownload.js"></script>
    <script type="text/javascript" src="../../js/records.js"></script>
    <script type="text/javascript" src="../../js/udsBulletin.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var bulletins = new bulletinCollection(
                {
                    urlRoot: '<%= Page.ResolveUrl("~/SubModule/bulletin/bulletinAction.aspx") %>',
                    type: 1
                });

            var r = new records(
                {
                    records: bulletins,
                    target: bulletins,
                    orderby: "",
                    order: "desc",
                    rows: 10
                });

            r.fetch({
                success: function () {
                    var bi = new bulletinItemModel({
                        urlRoot: '<%= Page.ResolveClientUrl("~/SubModule/bulletin/bulletinAction.aspx") %>'
                    });

                    var bview = new bulletinListView(
                    {
                        templateUri: '<%= Page.ResolveUrl("~/App_ViewTemplate/bulletin_normal.html") %>',
                        model: r,
                        el: $("#bulletinList"),
                        itemDialog: $("#bulletinItemDlg"),
                        selectedItem: bi,
                        itemView: new bulletinItemView({
                            templateUri: '<%= Page.ResolveClientUrl("~/App_ViewTemplate/bulletin_item.html") %>',
                            updateUri: '<%= Page.ResolveClientUrl("~/SubModule/bulletin/updatebulletin.aspx") %>',
                            downloadUri: '<%= Page.ResolveClientUrl("~/SubModule/bulletin/download.aspx") %>',
                            model: bi
                        })
                    });

                    bview.render();
                }
            });
        });
    </script>
</body>
</html>
