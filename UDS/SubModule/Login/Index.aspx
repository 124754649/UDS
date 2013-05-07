<%@ Page language="c#" Codebehind="Index.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.Login.index" %>
<!DOCTYPE html>
<HTML>
<head>
	<title><%= ConfigurationManager.AppSettings["productName"] %></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<link type="text/css" rel="stylesheet" href="../../Css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="../../Css/bootstrap-responsive.min.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/logincss.css" />
</head>
<body>
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#"><img src='<%= Page.ResolveUrl("~/Images/logo.png") %>' alt='<%= ConfigurationManager.AppSettings["productName"] %>'><%= ConfigurationManager.AppSettings["productName"] %></a>
        </div>
      </div>
    </div>

    <div class="container">
        <div id="login-wraper">
            <form id="index" class="form-horizontal login-form" method="post" runat="server">
                <div class="body">
                    <legend>登录到 <span class="blue"><%= ConfigurationManager.AppSettings["productName"] %></span></legend>
                    <label>用户名</label>
                    <asp:TextBox ID="txtUsername" runat="server" ClientIDMode="Static"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="Larger"></asp:RequiredFieldValidator>
                    <label>密码</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="Larger"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="lblErrorMessage" runat="server" Visible="False" ForeColor="Red" Width="128px">错误的用户名和口令</asp:Label>
                </div>
                <div class="footer">
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="登录"></asp:Button>
                    <input class="btn btn-danger" type="reset" value="取消" name="Submit2" style="display:none">
                </div>
            </form>
        </div>
    </div>

    <footer class="white navbar-fixed-bottom">
      建议在1024*768分辨率下浏览
    </footer>

    <script src="../../js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../js/jquery.backstretch.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //$('#mainContent').height($(window).height());
            $.backstretch('<%= Page.ResolveUrl("~/Images/index_bg.png") %>');

            if ($("#txtUsername").val() == "") {
                $("#txtUsername").focus();
            }
            else {
                $("#txtPassword").focus();
            }
        });
    </script>  
</body>
</HTML>