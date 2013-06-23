<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="you.aspx.cs" Inherits="UDS.about.you" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>关于你</title>
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
    <div class="container-fluid">
        <div id="page-content">
		    <div class="page-header">
			    <h1>公告管理</h1>
		    </div>
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-header header-color-blue">
                            <h5><i class="icon-bullhorn icon-2x"></i>关于你</h5>
                            <div class="widget-toolbar">
                                
                            </div>
                        </div>
                        <div class="widget-body">
							<div class="widget-body-inner" style="display: block">
								<div class="widget-main no-padding" id="bulletinList">
                                    <table class="table table-striped table-bordered table-hover">
                                    <% for (int i = 0; i < UDS.Components.BrowserInfos.BrowserAttributes.GetLength(1); i++)
                                       { %>
                                        <tr>
                                            <td>
                                                <%= UDS.Components.BrowserInfos.BrowserAttributes[0, i] %>
                                            </td>
                                            <td>
                                                <%= UDS.Components.BrowserInfos.BrowserAttributes[1, i] %>
                                            </td>
                                        </tr>
                                    <% } %>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
</body>
</html>
