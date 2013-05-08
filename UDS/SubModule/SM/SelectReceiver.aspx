<%@ Page language="c#" Codebehind="SelectReceiver.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.SM.SelectReceiver" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>选择收信人 </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" rel="stylesheet" href="../../Css/bootstrap.min.css" />
    <link type="text/css" rel="Stylesheet" href="../../Css/bootstrap-responsive.min.css" />
    <link type="text/css" rel="Stylesheet" href="../../Css/font-awesome.min.css" />
    <!--[if IE 7]>
		<link rel="stylesheet" href="../../Css/font-awesome-ie7.min.css" />
	<![endif]-->
    <style type="text/css">
        .container-fluid .sidebar
        {
            position: relative;
            top: 0;
            left: auto;
            width: 150px;
        }

            .container-fluid .sidebar select
            {
                position: relative;
                width: 150px;
                left: auto;
            }

        .left
        {
            float: left;
        }

        .right
        {
            float: right;
        }

        .fixed-fixed
        {
            margin: 0 300px;
        }
    </style>
</head>
<body onload="PopulateData()">
    <div class="container-fluid">
        <div class="sidebar left">
            <form id="Form1" class="well-small" method="post" runat="server">
                <div class="controls-row">
                    <asp:DropDownList ID="listDept" runat="server" OnSelectedIndexChanged="DeptListChange" AutoPostBack="True"></asp:DropDownList>
                </div>
                <div class="controls-row">
                    <asp:DropDownList ID="listAccount" Height="316px" ondblclick="AddItem('btnReceSendToRight')" runat="server" multiple onchange="setStatusright()"></asp:DropDownList>
                </div>
            </form> <!-- form -->
        </div><!-- siderbar left -->
        <div class="sidebar right">
            <form method="post" class="well-small">
                <div class="row">
                    <div class="span2">
                        <label>站内短讯</label>
                        <select id="listSendTo" style="HEIGHT: 161px" multiple size="10" name="listSendTo"></select>
                    </div>
                    <div class="span2">
                        <label>手机短讯</label>
                        <select id="listMobileSendTo" style="HEIGHT: 155px" multiple size="9" name="listMobileSendTo"></select>
                    </div>
                </div>
            </form>
        </div><!-- sidebar right -->
        <div class="content fixed-fixed">
            <form class="well-small" method="post">
                <div class="row" style="height:161px;">
                    <div class="span5" style="margin-top:60px">
                        <a class="btn btn-small btn-add" onclick="AddItem(this.name)" data-target="listSendTo"><i class="icon-double-angle-right icon-2x"></i></a>
                        <a class="btn btn-small btn-remove" onclick="RemoveItem(this.name)" data-target="listSendTo"><i class="icon-double-angle-left icon-2x"></i></a>
                    </div>
                </div>
                <div class="row" style="height:155px">
                    <div class="span5" style="margin-top:60px">
                        <a class="btn btn-small btn-add" onclick="AddItem(this.name)" data-target="listMobileSendTo"><i class="icon-double-angle-right icon-2x"></i></a>
                        <a class="btn btn-small btn-remove" onclick="RemoveItem(this.name)" data-nametarget="listMobileSendTo"><i class="icon-double-angle-left icon-2x"></i></a>
                    </div>
                </div>
            </form>
        </div><!-- content -->
    </div><!-- container-fluid -->
    <footer style="text-align:center">
        <input class="btn btn-primary" onclick="ReturnValue()" type="button" value="确定">
        <input class="btn btn-warning" onclick="window.close()" type="button" value="取消">
    </footer>
    <script type="text/javascript">
        function RemoveItem(ControlName) {
            Control = null;
            switch (ControlName) {
                case "btnReceSendToLeft":
                    Control = eval("document.SelectReceiver.listSendTo");
                    break;
                case "btnMobileSendToLeft":
                    Control = eval("document.SelectReceiver.listMobileSendTo");
                    break;
            }

            var j = Control.length;
            if (j == 0) return;
            for (j; j > 0; j--) {
                if (Control.options[j - 1].selected == true) {
                    Control.remove(j - 1);
                }
            }

        }

        function AddItem(ControlName) {
            Control = null;
            switch (ControlName) {
                case "btnReceSendToRight":
                    Control = eval("document.SelectReceiver.listSendTo");
                    break;
                case "btnMobileSendToRight":
                    Control = eval("document.SelectReceiver.listMobileSendTo");
                    break;
            }

            var i = 0;
            listAccount = eval("document.SelectReceiver.listAccount");
            var j = listAccount.length;
            for (i = 0; i < j; i++) {
                if (listAccount.options[i].selected == true) {

                    Control.add(new Option(listAccount[i].text, listAccount.options[i].value));
                }
            }

        }

        function setStatusright() {
            document.SelectReceiver.btnReceSendToRight.disabled = false;
            document.SelectReceiver.btnMobileSendToRight.disabled = false;
        }

        function setStatusleft() {
            document.SelectReceiver.btnReceSendToLeft.disabled = false;
            document.SelectReceiver.btnMobileSendToRight.disabled = false;
        }

        function PopulateData() {
            if (window.dialogArguments != null) {
                var parwin = window.dialogArguments;
                if (parwin.document.all.hdnTxtSendTo.value != "") {
                    Control = eval("document.SelectReceiver.listSendTo");
                    var SendToValueArray = parwin.document.all.hdnTxtSendTo.value.split(",");
                    var SendToTxtArray = parwin.document.all.txtSendTo.value.split(",");
                    for (i = 0; i < SendToValueArray.length - 1; i++) {
                        Control.add(new Option(SendToTxtArray[i], SendToValueArray[i]));
                    }
                }

                if (parwin.document.all.hdnTxtMobileSendTo.value != "") {
                    Control = eval("document.SelectReceiver.listMobileSendTo");
                    var MobileSendToValueArray = parwin.document.all.hdnTxtMobileSendTo.value.split(",");
                    var MobileSendToTxtArray = parwin.document.all.txtMobileSendTo.value.split(",");
                    for (i = 0; i < MobileSendToValueArray.length - 1; i++) {
                        Control.add(new Option(MobileSendToTxtArray[i], MobileSendToValueArray[i]));
                    }
                }



            }
        }
        function ReturnValue() {
            if (window.dialogArguments != null) {
                var parwin = window.dialogArguments;
            }

            var listSendToTxtStr = "";
            var listSendToValueStr = "";
            var listMobileSendToTxtStr = "";
            var listMobileSendToValueStr = "";
            var listSendToCompleteStr = "";

            listSendTo = eval("document.SelectReceiver.listSendTo");
            listMobileSendTo = eval("document.SelectReceiver.listMobileSendTo");


            for (i = 0; i < listSendTo.length; i++) {
                listSendToTxtStr += listSendTo.options[i].text + ",";
                listSendToValueStr += listSendTo.options[i].value + ",";
            }
            parwin.document.all.MsgSend.txtSendTo.value = listSendToTxtStr;
            parwin.document.all.MsgSend.hdnTxtSendTo.value = listSendToValueStr;


            for (i = 0; i < listMobileSendTo.length; i++) {
                listMobileSendToTxtStr += listMobileSendTo.options[i].text + ",";
                listMobileSendToValueStr += listMobileSendTo.options[i].value + ",";
            }
            parwin.document.all.MsgSend.txtMobileSendTo.value = listMobileSendToTxtStr;
            parwin.document.all.MsgSend.hdnTxtMobileSendTo.value = listMobileSendToValueStr;


            parwin.document.all.MsgSend.txtContent.focus();

            window.close();
        }

        function SaveValue() {
            if (window.dialogArguments != null) {
                var parwin = window.dialogArguments;
            }

            var listSendToTxtStr = "";
            var listSendToValueStr = "";
            var listMobileSendToTxtStr = "";
            var listMobileSendToValueStr = "";
            var listSendToCompleteStr = "";

            listSendTo = eval("document.SelectReceiver.listSendTo");
            listMobileSendTo = eval("document.SelectReceiver.listMobileSendTo");



            for (i = 0; i < listSendTo.length; i++) {
                listSendToTxtStr += listSendTo.options[i].text + ",";
                listSendToValueStr += listSendTo.options[i].value + ",";
            }
            parwin.document.all.MsgSend.txtSendTo.value = listSendToTxtStr;
            parwin.document.all.MsgSend.hdnTxtSendTo.value = listSendToValueStr;


            for (i = 0; i < listMobileSendTo.length; i++) {
                listMobileSendToTxtStr += listMobileSendTo.options[i].text + ",";
                listMobileSendToValueStr += listMobileSendTo.options[i].value + ",";
            }
            parwin.document.all.MsgSend.txtMobileSendTo.value = listMobileSendToTxtStr;
            parwin.document.all.MsgSend.hdnTxtMobileSendTo.value = listMobileSendToValueStr;





        }

    </script>
</body>
</html>
