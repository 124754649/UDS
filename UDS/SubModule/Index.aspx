<%@ Page CodeBehind="Index.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="UDS.SubModule.Index" %>
<%@ Register TagPrefix="uc1" TagName="ControlProjectTreeView" Src="~/Inc/ControlProjectTreeView.ascx" %>
<!DOCTYPE html>
<html>
	<head runat="server">
		<TITLE><%= ConfigurationManager.AppSettings["productName"] %></TITLE>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../Css/bootstrap.css" />
        <link rel="stylesheet" href="../Css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="../Css/font-awesome.min.css" />
        <!--[if IE 7]>
		  <link rel="stylesheet" href="../Css/font-awesome-ie7.min.css" />
		<![endif]-->
        <link rel="stylesheet" href="../Css/quantumcode.css" />
        <link rel="stylesheet" href="../Css/quantumcode-resposive.css" />
        <link rel="stylesheet" href="../Css/quantumcode-skins.css" />

        <!--[if lt IE 9]>
		  <link rel="stylesheet" href="../Css/quantumcode-ie.css" />
		<![endif]-->

        <style>
            
        </style>
	</head>
    <body>
        <div class="navbar navbar-inverse">
		  <div class="navbar-inner">
		   <div class="container-fluid">
			  <a class="brand" href="#"><small><i class="icon-leaf"></i> <%= ConfigurationManager.AppSettings["productName"] %></small> </a>
			  <ul class="nav ace-nav pull-right">
					<li class="grey">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-tasks"></i>
							<span class="badge">4</span>
						</a>
						<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer">
							<li class="nav-header">
								<i class="icon-ok"></i> 4 Tasks to complete
							</li>
							
							<li>
								<a href="#">
									<div class="clearfix">
										<span class="pull-left">Software Update</span>
										<span class="pull-right">65%</span>
									</div>
									<div class="progress progress-mini"><div class="bar" style="width:65%"></div></div>
								</a>
							</li>
							
							<li>
								<a href="#">
									<div class="clearfix">
										<span class="pull-left">Hardware Upgrade</span>
										<span class="pull-right">35%</span>
									</div>
									<div class="progress progress-mini progress-danger"><div class="bar" style="width:35%"></div></div>
								</a>
							</li>
							
							<li>
								<a href="#">
									<div class="clearfix">
										<span class="pull-left">Unit Testing</span>
										<span class="pull-right">15%</span>
									</div>
									<div class="progress progress-mini progress-warning"><div class="bar" style="width:15%"></div></div>
								</a>
							</li>
							
							<li>
								<a href="#">
									<div class="clearfix">
										<span class="pull-left">Bug Fixes</span>
										<span class="pull-right">90%</span>
									</div>
									<div class="progress progress-mini progress-success progress-striped active"><div class="bar" style="width:90%"></div></div>
								</a>
							</li>
							
							<li>
								<a href="#">
									See tasks with details
									<i class="icon-arrow-right"></i>
								</a>
							</li>
						</ul>
					</li>
					<li class="purple">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-bell-alt icon-animated-bell icon-only"></i>
							<span class="badge badge-important">8</span>
						</a>
						<ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-closer">
							<li class="nav-header">
								<i class="icon-warning-sign"></i> 8 Notifications
							</li>
							
							<li>
								<a href="#">
									<div class="clearfix">
										<span class="pull-left"><i class="icon-comment btn btn-mini btn-pink"></i> New comments</span>
										<span class="pull-right badge badge-info">+12</span>
									</div>
								</a>
							</li>
							
							<li>
								<a href="#">
									<i class="icon-user btn btn-mini btn-primary"></i> Bob just signed up as an editor ...
								</a>
							</li>
							
							<li>
								<a href="#">
									<div class="clearfix">
										<span class="pull-left"><i class="icon-shopping-cart btn btn-mini btn-success"></i> New orders</span>
										<span class="pull-right badge badge-success">+8</span>
									</div>
								</a>
							</li>
							
							<li>
								<a href="#">
									<div class="clearfix">
										<span class="pull-left"><i class="icon-twitter btn btn-mini btn-info"></i> Followers</span>
										<span class="pull-right badge badge-info">+4</span>
									</div>
								</a>
							</li>
																
							<li>
								<a href="#">
									See all notifications
									<i class="icon-arrow-right"></i>
								</a>
							</li>
						</ul>
					</li>
					<li class="green">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-envelope-alt icon-animated-vertical icon-only"></i>
							<span class="badge badge-success">5</span>
						</a>
						<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer">
							<li class="nav-header">
								<i class="icon-envelope"></i> 5 Messages
							</li>
							
							<li>
								<a href="#">
									<img alt="Alex's Avatar" class="msg-photo" src="assets/avatars/avatar.png" />
									<span class="msg-body">
										<span class="msg-title">
											<span class="blue">Alex:</span>
											Ciao sociis natoque penatibus et auctor ...
										</span>
										<span class="msg-time">
											<i class="icon-time"></i> <span>a moment ago</span>
										</span>
									</span>
								</a>
							</li>
							
							<li>
								<a href="#">
									<img alt="Susan's Avatar" class="msg-photo" src="assets/avatars/avatar3.png" />
									<span class="msg-body">
										<span class="msg-title">
											<span class="blue">Susan:</span>
											Vestibulum id ligula porta felis euismod ...
										</span>
										<span class="msg-time">
											<i class="icon-time"></i> <span>20 minutes ago</span>
										</span>
									</span>
								</a>
							</li>
							
							<li>
								<a href="#">
									<img alt="Bob's Avatar" class="msg-photo" src="assets/avatars/avatar4.png" />
									<span class="msg-body">
										<span class="msg-title">
											<span class="blue">Bob:</span>
											Nullam quis risus eget urna mollis ornare ...
										</span>
										<span class="msg-time">
											<i class="icon-time"></i> <span>3:15 pm</span>
										</span>
									</span>
								</a>
							</li>
							
							<li>
								<a href="#">
									See all messages
									<i class="icon-arrow-right"></i>
								</a>
							</li>									
	
						</ul>
					</li>
					<li class="light-blue user-profile">
						<a class="user-menu dropdown-toggle" href="#" data-toggle="dropdown">
							<img style="display:none" alt="Jason's Photo" src="assets/avatars/user.jpg" class="nav-user-photo" />
							<span id="user_info">
								<small>欢迎,</small> <%= UserName %>
							</span>
							<i class="icon-caret-down"></i>
						</a>
						<ul id="user_menu" class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
							<li><a href='<%= Page.ResolveClientUrl("~/SubModule/UnitiveDocument/Setup/MySetup.aspx") %>'><i class="icon-cog"></i>密码</a></li>
							<li style="display:none"><a href="#"><i class="icon-user"></i> Profile</a></li>
							<li class="divider"></li>
							<li><a href='<%= Page.ResolveClientUrl("~/SubModule/Login/logout.aspx?Action=2") %>'><i class="icon-off"></i>退出</a></li>
						</ul>
					</li>
			  </ul><!--/.ace-nav-->

		   </div><!--/.container-fluid-->
		  </div><!--/.navbar-inner-->
		</div><!--/.navbar-->
        <div class="container-fluid" id="main-container">
			<a href="#" id="menu-toggler"><span></span></a><!-- menu toggler -->

			<div id="sidebar">
				
				<div id="sidebar-shortcuts">
					<div id="sidebar-shortcuts-large">
						<button id="btnMyDesktop" class="btn btn-small btn-success"><i class="icon-desktop"></i>我的桌面</button>
						<!--<button class="btn btn-small btn-info"><i class="icon-pencil"></i></button>
						<button class="btn btn-small btn-warning"><i class="icon-group"></i></button>
						<button class="btn btn-small btn-danger"><i class="icon-cogs"></i></button>-->
					</div>
					<!--<div id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>
						<span class="btn btn-info"></span>
						<span class="btn btn-warning"></span>
						<span class="btn btn-danger"></span>
					</div>-->
				</div><!-- #sidebar-shortcuts -->
                <form id="Projecttreeview" method="post" runat="server">
				    <uc1:controlprojecttreeview id="ControlProjectTreeView1" runat="server"></uc1:controlprojecttreeview>
                </form>
				<div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div>
			</div><!--/#sidebar-->
            <div id="main-content" class="clearfix" style="height:100%">
                <div id="breadcrumbs">
						<ul class="breadcrumb">
							<!--<li><i class="icon-home"></i> <a href="#">Home</a><span class="divider"><i class="icon-angle-right"></i></span></li>
							<li class="active">Dashboard</li>-->
						</ul><!--.breadcrumb-->

						<!--<div id="nav-search">
							<form class="form-search">
									<span class="input-icon">
										<input autocomplete="off" id="nav-search-input" type="text" class="input-small search-query" placeholder="Search ..." />
										<i id="nav-search-icon" class="icon-search"></i>
									</span>
							</form>
						</div>--><!--#nav-search-->
					</div><!--#breadcrumbs-->
                <div id="page-content" class="clearfix">
                    <!--<iframe id="MainFrame" name="MainFrame" style="width:100%" frameborder="0"></iframe>-->
                </div><!--/#page-content-->
            </div><!-- #main-content -->
        </div><!--/.fluid-container#main-container-->
        <script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
        <script type="text/javascript" src="../js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../js/quantumcode-elements.js"></script>
        <script type="text/javascript" src="../js/quantumcode.js"></script>
        <script type="text/javascript" src="../js/jquery.iframe-auto-height.plugin.1.9.1.min.js"></script>
        <script type="text/javascript" src="../js/underscore-min.js"></script>
        <script type="text/javascript" src="../js/json2.js"></script>
        <script type="text/javascript" src="../js/backbone-min.js"></script>
        <script type="text/javascript" src="../js/breadcrumbModel.js"></script>
        <script type="text/javascript">            
            var bcItems = null;

            var bcControl = null;

            $(function () {
                $("#btnMyDesktop").click(function () {
                    navigatemf('我的桌面', '<%=Page.ResolveClientUrl("~/SubModule/UnitiveDocument/Desktop.aspx") %>', 'desktop');
                });
            });

            $(document).ready(function () {
                var mainframe = document.createElement("iframe");
                mainframe.setAttribute("id", "MainFrame");
                mainframe.setAttribute("name", "MainFrame");
                mainframe.setAttribute("frameborder", "0");
                mainframe.setAttribute("width", "100%");

                $(mainframe).appendTo("#page-content");

                if ($.browser.msie) {
                    $("#MainFrame").load(function () {
                        if ($.browser.version >= 9) {
                            $("#MainFrame")[0].height = $("#MainFrame", window.top.document)[0].contentDocument.body.offsetHeight + 40;
                        }
                        else {
                            $("#MainFrame")[0].height = $("#MainFrame", window.top.document)[0].Document.body.scrollHeight + 40;
                        }
                    });
                }
                else {
                    $("iframe#MainFrame").iframeAutoHeight({ debug:true, minHeight: 400 });
                }

                if (($.browser.msie && $.browser.version >= 9) || !$.browser.msie) {
                    bcItems = new breadcrumbCollection();
                    bcControl = new breadcrumbView({
                        el: $(".breadcrumb"),
                        model: bcItems
                    });

                    bcControl.render();
                }

                navigatemf('我的桌面', '<%=Page.ResolveClientUrl("~/SubModule/UnitiveDocument/Desktop.aspx") %>', 'desktop');
            });

            function navigatemf(title, url, groups) {
                if (($.browser.msie && $.browser.version >= 9) || !$.browser.msie) {
                    tmpItem = new breadcrumbModel();
                    tmpItem.Group(groups);
                    tmpItem.Url(url);
                    tmpItem.Title(title);

                    bcItems.addBreadcrumb(tmpItem);
                }

                if ($.browser.ms)
                    $("#MainFrame")[0].src = "about:blank";

                $("#MainFrame")[0].src = url;
            }
        </script>
    </body>
	<%--<frameset id="UpFrame" rows="89,82%" frameborder="0" border="0" framespacing="0">
		<frame id="header" name="header" scrolling="no" noresize src="../Inc/ControlHeader.aspx">
		<frame id="main" name="main" src="UnitiveDocument/Index.aspx" scrolling="yes">
		<noframes>
		</noframes>
	</frameset>--%>
</html>
