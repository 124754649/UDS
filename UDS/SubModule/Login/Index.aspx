<%@ Page language="c#" Codebehind="Index.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.Login.index" %>
<!DOCTYPE html>
<HTML>
<head>
	<title><%= ConfigurationManager.AppSettings["productName"] %></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<link type="text/css" rel="stylesheet" href="../../Css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="../../Css/bootstrap-responsive.min.css" />
	<style type="text/css">
	    body {
	        background-color: #353467;
	        font-family: Verdana,Arial,Helvetica,sans-serif;
	    }

	    .loginbox {
            /*width:1024px;*/
            height:660px;
            margin:0 auto;
            background-image:url(../../Images/newface1.jpg);
            background-repeat:no-repeat;
            background-attachment:fixed;
	    }
    </style>
</head>
<body>
    <div id="mainContent" class="container-fluid">
        <div class="row-fluid">
            <div class="span10 offset1 loginbox">
                <div class="span5"></div>
                <div class="span5" style="margin-top:50px">
                    <form id="index" class="form-horizontal" method="post" runat="server">
                        <div class="control-group">
                            <div class="controls">
                                <img border="0" src="../../Images/welcome.gif" width="224" height="117" style="display: none">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="txtUsername" style="color: white">用户名</label>
                            <div class="controls controls-row">
                                <asp:TextBox ID="txtUsername" runat="server" ClientIDMode="Static"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="Larger"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="txtPassword" style="color: white">密码</label>
                            <div class="controls controls-row">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" Display="Dynamic" ForeColor="Red" Font-Size="Larger"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="登录"></asp:Button>
                                <input class="btn btn-danger" type="reset" value="取消" name="Submit2">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span5"></div>
            <div class="span7">
                <asp:CheckBox ID="cb_isNeedUsbKey" runat="server" Text="使用USB_Key" Height="10px" Visible="false"></asp:CheckBox>
                <div class="control-group">
                    <div class="controls">
                        <asp:Label ID="lblErrorMessage" runat="server" Visible="False" ForeColor="Red" Width="128px">错误的用户名和口令</asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <p style="color:white" class="text-center">建议在1024*768分辨率下浏览</p>
            </div>
        </div>
    </div> <!-- mainContent -->

    <script src="../../js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //$('#mainContent').height($(window).height());

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