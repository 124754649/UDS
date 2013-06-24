<%@ Page CodeBehind="Index.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="UDS.SubModule.Index" %>
<%@ Register TagPrefix="uc1" TagName="ControlProjectTreeView" Src="~/Inc/ControlProjectTreeView.ascx" %>
<!DOCTYPE html>
<html>
	<head runat="server">
		<TITLE><%= ConfigurationManager.AppSettings["productName"] %></TITLE>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href='~/CSS/bootstrap.css' />
        <link rel="stylesheet" href='~/CSS/bootstrap-responsive.min.css' />
        <link rel="stylesheet" href='~/CSS/font-awesome.min.css' />
        <!--[if IE 7]>
		  <link rel="stylesheet" href='~/CSS/font-awesome-ie7.min.css' />
		<![endif]-->
        <link rel="stylesheet" href='~/CSS/quantumcode.css' />
        <link rel="stylesheet" href='~/CSS/quantumcode-resposive.css' />
        <link rel="stylesheet" href='~/CSS/quantumcode-skins.css' />

        <!--[if lt IE 9]>
		  <link rel="stylesheet" href='~/CSS/quantumcode-ie.css' />
		<![endif]-->

        <style>
            .brand img
            {
                margin:0;
                padding:0;
                max-height:40px;
                border:0 none;
            }
        </style>
	</head>
    <body>
        <div class="navbar navbar-inverse">
		  <div class="navbar-inner">
		   <div class="container-fluid">
			  <a class="brand" href="#"><img src='<%= Page.ResolveUrl("~/Images/logo.png") %>' alt='<%= ConfigurationManager.AppSettings["productName"] %>'> <%= ConfigurationManager.AppSettings["productName"] %></a>
			  <ul class="nav ace-nav pull-right">
					<li class="grey" id="taskShort"></li>
					<li class="purple" id="smsShort"></li>
					<li class="green" id="bulletinShort"></li>
					<li class="light-blue user-profile">
						<a class="user-menu dropdown-toggle" href="#" data-toggle="dropdown">
							<!--<img style="display:none" alt="Jason's Photo" src="assets/avatars/user.jpg" class="nav-user-photo" />-->
							<span id="user_info">
								<small>欢迎,</small> <%= UserName %>
							</span>
							<i class="icon-caret-down"></i>
						</a>
						<ul id="user_menu" class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
							<li><a href='javascript:navigatemf("密码设置", "<%= Page.ResolveClientUrl("~/SubModule/UnitiveDocument/Setup/MySetup.aspx") %>", "HEAD")'><i class="icon-cog"></i>密码</a></li>
                            <li class="divider"></li>
                            <li><a href='javascript:navigatemf("考勤", "<%= Page.ResolveUrl("~/SubModule/WorkAttendance/Default.aspx") %>", "HEAD")'><i class="icon-signin"></i>考勤</a></li>
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
				<!--<div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div>-->
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
                    <iframe id="MainFrame" name="MainFrame" style="width:100%;border:0 none" frameborder="0"></iframe>
                </div><!--/#page-content-->
            </div><!-- #main-content -->
        </div><!--/.fluid-container#main-container-->
        <script type="text/javascript" src='<%= Page.ResolveClientUrl("~/js/jquery-1.9.1.js") %>'></script>
        <script type="text/javascript" src='<%= Page.ResolveClientUrl("~/js/bootstrap.min.js") %>'></script>
        <script type="text/javascript" src='<%= Page.ResolveClientUrl("~/js/quantumcode-elements.js") %>'></script>
        <script type="text/javascript" src='<%= Page.ResolveClientUrl("~/js/quantumcode.js") %>'></script>
        <script type="text/javascript" src='<%= Page.ResolveClientUrl("~/js/jquery.iframe-auto-height.plugin.1.9.1.min.js") %>'></script>
        <script type="text/javascript" src='<%= Page.ResolveClientUrl("~/js/underscore-min.js") %>'></script>
        <script type="text/javascript" src='<%= Page.ResolveClientUrl("~/js/json2.js") %>'></script>
        <script type="text/javascript" src='<%= Page.ResolveClientUrl("~/js/backbone-min.js") %>'></script>
        <script type="text/javascript" src='<%= Page.ResolveClientUrl("~/js/breadcrumbModel.js") %>'></script>
        <script type="text/javascript" src='<%= Page.ResolveClientUrl("~/js/udsTask.js") %>'></script>
        <script type="text/javascript" src='<%= Page.ResolveClientUrl("~/js/udsBulletin.js") %>'></script>
        <script type="text/javascript">            
            var bcItems = null;

            var bcControl = null;

            var taskCon = null;
            var smsCon = null;
            var bulletinCon = null;

            $(function () {
                $("#btnMyDesktop").click(function () {
                    navigatemf('我的桌面', '<%=Page.ResolveClientUrl("~/SubModule/UnitiveDocument/Desktop.aspx") %>', 'desktop');
                });
            });

            $(document).ready(function () {
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
                    $("iframe#MainFrame").iframeAutoHeight({ debug:false, minHeight: 400, heightOffset: 40 });
                }

                //if (($.browser.msie && $.browser.version >= 9) || !$.browser.msie) {
                bcItems = new breadcrumbCollection();
                bcControl = new breadcrumbView({
                    el: $(".breadcrumb"),
                    model: bcItems
                });

                bcControl.render();
                //}

                taskCon = new udsShortView({
                    el: $("#taskShort"),
                    model: new udsTasks({"baseUrl": '<%=Page.ResolveClientUrl("~/SubModule/UnitiveDocument/Desktop.aspx") %>',
                        "type": 1
                    }),
                    targetUrl: 'javascript:navigatemf("我的任务", "<%= Page.ResolveUrl("~/SubModule/Schedule/TaskList.aspx") %>", "我的任务")',
                    iClass: 'icon-tasks',
                    numberTitle: '个任务需要完成',
                    moreTitle: '查看更多任务',
                    columns:['subject', 'period']
                });

                taskCon.render();

                smsCon = new udsShortView({
                    el: $("#smsShort"),
                    model: new udsSMS({ "baseUrl": '<%=Page.ResolveUrl("~/SubModule/SM/index.aspx") %>' }),
                    targetUrl: 'javascript:navigatemf("短讯管理", "<%= Page.ResolveUrl("~/SubModule/SM/index.aspx?DispType=1") %>", "短讯管理")',
                    iClass: 'icon-bell-alt', //icon-animated-bell icon-only
                    numberTitle: '条短消息未查看',
                    moreTitle: '查看更多短消息',
                    columns:['content', 'senderRealName']
                });

                smsCon.render();

                bulletinCon = new udsShortView({
                    el: $("#bulletinShort"),
                    model: new bulletinCollection({ urlRoot: '<%= Page.ResolveUrl("~/SubModule/bulletin/bulletinAction.aspx") %>', type: 5 }),
                    targetUrl: 'javascript:navigatemf("公告板", "<%= Page.ResolveUrl("~/SubModule/bulletin/index.aspx") %>", "公告板")',
                    iClass: 'icon-bullhorn',
                    numberTitle: '条公告未查看',
                    moreTitle: '查看更多公告',
                    columns:['subject', 'sendtime']
                });

                bulletinCon.render();

                navigatemf('我的桌面', '<%=Page.ResolveClientUrl("~/SubModule/UnitiveDocument/Desktop.aspx") %>', 'desktop');
            });

            function navigatemf(title, url, groups) {
                //if (($.browser.msie && $.browser.version >= 9) || !$.browser.msie) {
                    tmpItem = new breadcrumbModel();
                    tmpItem.Group(groups);
                    tmpItem.Url(url);
                    tmpItem.Title(title);

                    bcItems.addBreadcrumb(tmpItem);
                //}

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
