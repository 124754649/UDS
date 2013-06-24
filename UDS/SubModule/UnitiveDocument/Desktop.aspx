<%@ Page language="c#" Codebehind="Desktop.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.UnitiveDocument.Desktop" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>我的桌面</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="../../Css/bootstrap.min.css" />
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
    <link rel="stylesheet" href="../../Css/redmond/jquery-ui-1.10.3.custom.min.css" />

	<script language="javascript">
		function dialwinprocess(CurrDate, CurrTime, whichPg, TaskID) {
			if (whichPg == 1)
				var newdialoguewin = window.showModalDialog("../Schedule/Manage.aspx?CurrDate=" + CurrDate + "&CurrTime=" + CurrTime, window, "dialogWidth:1000px;DialogHeight=700px;status:no");
			else if (whichPg == 2)
				var newdialoguewin = window.showModalDialog("../Schedule/TaskDetail.aspx?TaskID=" + TaskID + "&Date=" + CurrDate, window, "dialogWidth:700px;DialogHeight=600px;status:no");
			else if (whichPg == 3)
				var newdialoguewin = window.showModalDialog("../Schedule/TaskStatus.aspx?TaskID=" + TaskID + "&Date=" + CurrDate, window, "dialogWidth:700px;DialogHeight=600px;status:no");
		}
	</script>
	<style type="text/css">
		.widget-box .widget-toolbar a
		{
			color: white;
		}
	</style>
</head>
<body>
    <div id="bulletinDialog">

    </div>
	<form id="WorkArea" method="post" runat="server">
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span6">
					<div class="widget-box">
						<div class="widget-header header-color-blue">
							<h5><i class="icon-tasks icon-2x"></i>今日任务</h5>
							<div class="widget-toolbar">
								<a href='javascript:parent.navigatemf("我的任务", "<%= Page.ResolveUrl("../Schedule/TaskList.aspx") %>", "task")' data-action="more"><i class="icon-reorder"></i>更多</a>
								<a onclick="var newwin=window.open('../Schedule/Manage.aspx','newtask','toolbar=yes,scrollbars=yes,width=800,height=600,resizable=yes');newwin.moveTo(0,0);newwin.focus();" href="#" data-action="new"><i class="icon-edit"></i>新建</a>
							</div>
						</div>
						<div class="widget-body">
							<div class="widget-body-inner" style="display: block">
								<div class="widget-main no-padding">
									<asp:DataGrid ID="dgList" runat="server" AllowPaging="True" BorderColor="#E8F4FF" GridLines="Horizontal"
										PageSize="5" DataKeyField="ID" Width="100%" PagerStyle-HorizontalAlign="center" PagerStyle-Mode="NumericPages"
										AutoGenerateColumns="False" BackColor="White" CellPadding="2" OnPageIndexChanged="DataGrid_PageChanged"
										BorderWidth="1px">
										<ItemStyle Font-Size="X-Small" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
										<HeaderStyle Font-Size="X-Small" Font-Bold="True" HorizontalAlign="Center" Height="20px" ForeColor="#006699"
											VerticalAlign="Middle" BackColor="#E8F4FF"></HeaderStyle>
										<FooterStyle Font-Size="XX-Small" HorizontalAlign="Center" Height="10px" VerticalAlign="Bottom"></FooterStyle>
										<Columns>
											<asp:TemplateColumn HeaderText="时段">
												<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left"></ItemStyle>
												<ItemTemplate>
													<asp:Label runat="server" Text='<%# GetDateString(DataBinder.Eval(Container, "DataItem.Date").ToString())+"  "+GetPeriodByPeriodID(DataBinder.Eval(Container, "DataItem.EndTime").ToString(),DataBinder.Eval(Container, "DataItem.beginPeriodID").ToString(),(DataBinder.Eval(Container, "DataItem.endPeriodID").ToString())) %>' ID="Label2" NAME="Label2">
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="内容">
												<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<a href="#" onclick='javascript:return dialwinprocess("","","2","<%# DataBinder.Eval(Container, "DataItem.TaskID") %>")'>
														<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Subject") %>' ID="Label3" NAME="Label3">
														</asp:Label></a>
												</ItemTemplate>
											</asp:TemplateColumn>
										</Columns>
										<PagerStyle Visible="False" HorizontalAlign="Right" ForeColor="White" BackColor="#93BEE2" Mode="NumericPages"></PagerStyle>
									</asp:DataGrid>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="span6">
					<div class="widget-box">
						<div class="widget-header header-color-blue">
							<h5><i class="icon-bullhorn icon-2x"></i>公告板</h5>
							<div class="widget-toolbar">
								<a href='javascript:parent.navigatemf("公告板", "<%= Page.ResolveUrl("~/SubModule/bulletin/Index.aspx") %>", "mail")' data-action="more"><i class="icon-reorder"></i>更多</a>
							</div>
						</div>
						<div class="widget-body">
							<div class="widget-body-inner" style="display: block">
								<div class="widget-main no-padding" id="bulletinlist">
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span6">
					<div class="widget-box">
						<div class="widget-header header-color-blue">
							<h5><i class="icon-file-alt"></i>我的文档</h5>
							<div class="widget-toolbar">
								<a href='javascript:parent.navigatemf("我的文档", "<%= Page.ResolveUrl("NewDoc/Listview.aspx") %>", "mail")' data-action="more"><i class="icon-reorder"></i>更多</a>
							</div>
						</div>
						<div class="widget-body">
							<div class="widget-main no-padding">
								<div class="widget-body-inner" style="display: block">
									<asp:DataGrid ID="dgDocList" runat="server" AllowPaging="True" BorderColor="#E8F4FF" GridLines="Horizontal"
										PageSize="5" DataKeyField="DocID" Width="100%" PagerStyle-HorizontalAlign="right" PagerStyle-Mode="NumericPages"
										AutoGenerateColumns="False" CellPadding="2" BorderWidth="1px" Font-Names="Arial" AllowSorting="True">
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
										<HeaderStyle Font-Size="X-Small" Font-Bold="True" HorizontalAlign="Center" Height="20px" ForeColor="#006699"
											VerticalAlign="Middle" BackColor="#E8F4FF"></HeaderStyle>
										<FooterStyle Font-Size="XX-Small" HorizontalAlign="Center" Height="10px" VerticalAlign="Bottom"></FooterStyle>
										<Columns>
											<asp:TemplateColumn HeaderText="文档标题">
												<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
												<ItemStyle Font-Size="X-Small" HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
												<ItemTemplate>
													<a href='<%= Page.ResolveClientUrl("Document/BrowseDocument.aspx?DocId=") %><%# DataBinder.Eval(Container.DataItem,"DocID") %>' target="_self">
														<%# (DataBinder.Eval(Container.DataItem,"DocTitle").ToString().Length>30)?DataBinder.Eval(Container.DataItem,"DocTitle").ToString().Substring(0,30)+"...":DataBinder.Eval(Container.DataItem,"DocTitle").ToString() %>
													</a>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="审批人">
												<HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
												<ItemStyle Font-Size="X-Small" HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<asp:Label ID="Label1" runat="server" Text='<%# GetRealName(DataBinder.Eval(Container, "DataItem.DocApprover").ToString()) %>'>
													</asp:Label>
												</ItemTemplate>
												<FooterStyle Font-Size="X-Small"></FooterStyle>
											</asp:TemplateColumn>
										</Columns>
										<PagerStyle Visible="False" Font-Size="12px" BorderColor="#E0E0E0" BorderStyle="Dotted" HorizontalAlign="Right"
											PageButtonCount="5" Mode="NumericPages"></PagerStyle>
									</asp:DataGrid>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="span6">
					<div class="widget-box">
						<div class="widget-header header-color-blue">
							<h5><i class="icon-briefcase icon-2x"></i>我的审批</h5>
							<div class="widget-toolbar">
								<a href='javascript:parent.navigatemf("我的审批", "<%= Page.ResolveUrl("Approve/Listview.aspx") %>", "mail")' data-action="more"><i class="icon-reorder"></i>更多</a>
							</div>
						</div>
						<div class="widget-body">
							<div class="widget-body-inner" style="display: block">
								<div class="widget-main no-padding">
									<asp:DataGrid ID="dgAppDocList" runat="server" AllowPaging="True" BorderColor="#E8F4FF" GridLines="Horizontal"
										PageSize="5" DataKeyField="DocID" Width="100%" PagerStyle-HorizontalAlign="right" PagerStyle-Mode="NumericPages"
										AutoGenerateColumns="False" CellPadding="3" BorderWidth="1px" Font-Names="Arial" AllowSorting="True"
										DESIGNTIMEDRAGDROP="164">
										<ItemStyle Font-Size="X-Small" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
										<HeaderStyle Font-Size="X-Small" Font-Bold="True" HorizontalAlign="Center" Height="20px" ForeColor="#006699"
											VerticalAlign="Middle" BackColor="#E8F4FF"></HeaderStyle>
										<FooterStyle Font-Size="XX-Small" HorizontalAlign="Center" Height="10px" VerticalAlign="Bottom"></FooterStyle>
										<Columns>
											<asp:TemplateColumn HeaderText="文档标题">
												<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
												<ItemStyle Font-Size="X-Small" HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
												<ItemTemplate>
													<a href='Document/ApproveDocument.aspx?DocId=<%# DataBinder.Eval(Container.DataItem,"DocID") %>'>
														<%# (DataBinder.Eval(Container.DataItem,"DocTitle").ToString().Length>30)?DataBinder.Eval(Container.DataItem,"DocTitle").ToString().Substring(0,30)+"...":DataBinder.Eval(Container.DataItem,"DocTitle").ToString() %>
													</a>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="上传人">
												<HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
												<ItemStyle Font-Size="X-Small" HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<asp:Label ID="Label4" runat="server" Text='<%# GetRealName(DataBinder.Eval(Container, "DataItem.DocAddedBy").ToString()) %>'>
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
										</Columns>
										<PagerStyle Visible="False" Font-Size="12px" BorderColor="#E0E0E0" BorderStyle="Dotted" HorizontalAlign="Right"
											PageButtonCount="5" Mode="NumericPages"></PagerStyle>
									</asp:DataGrid>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
    <script type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../../ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="../../js/underscore-min.js"></script>
    <script type="text/javascript" src="../../js/backbone-min.js"></script>
    <script type="text/javascript" src="../../js/jquery.fileDownload.js"></script>
    <script type="text/javascript" src="../../js/records.js"></script>
    <script type="text/javascript" src="../../js/udsBulletin.js"></script>
	<script language="javascript">
		function gotoMail(mailid) {
			var url = '<%= ResolveUrl("Mail/ReadMail.aspx?FolderType=1&MailId=") %>' + mailid;
				parent.navigatemf('阅读邮件', url, 'mail');
		}

	    $(document).ready(function () {
	        var bulletins = new bulletinCollection({
	            urlRoot: '<%= Page.ResolveUrl("~/SubModule/bulletin/bulletinAction.aspx") %>',
                type: 2
	        });
	        //bulletins.type = 2;

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
                        templateUri: '<%= Page.ResolveUrl("~/App_ViewTemplate/bulletin_widget.html") %>',
                        model: r,
                        el: $("#bulletinlist"),
                        itemDialog: $("#bulletinDialog"),
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
