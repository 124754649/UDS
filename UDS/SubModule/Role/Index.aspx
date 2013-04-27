<%@ Page CodeBehind="Index.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="UDS.SubModule.Role.Index" %>
<!DOCTYPE html>
<html>
	<head runat="server">
		<TITLE>部门设置</TITLE>
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
	<frameset id="thisFrame" cols="180,*" cols="184,76%">
		<frame name="LeftFrame" src="RoleTreeView.aspx" frameBorder="no" scrolling="no" noresize>
		<frame name="MainFrame" src="ListView.aspx" frameborder="no" scrolling="auto">
		<noframes>
			<pre id="p2">
================================================================
关于完成此内容框架集的说明
1. 为“contents”框架添加 src="" 页的 URL。
2. 为“main”框架添加 src="" 页的 URL。
3. 将 BASE target="main" 元素添加到“contents”页的 
	HEAD，以将“main”设置为默认框架，“contents”页的链接将
	在该框架中显示其他页。
================================================================
</pre>
			<p id="p1">
				此 HTML 框架集显示多个 Web 页。若要查看此框架集，请使用支持 HTML 4.0 及更高版本的 Web 浏览器。
			</p>
		</noframes>
	</frameset>
</html>
