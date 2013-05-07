<%@ Page language="c#" Codebehind="SelectReceiver.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.SM.SelectReceiver" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>选择收信人 </title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/BasicLayout.css" type="text/css" rel="stylesheet">
    <base target="_self">
    <script language="javascript">
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
</head>
<body onload="PopulateData()" ms_positioning="GridLayout" background="../../../Images/mailuserbg.gif">
    <form id="SelectReceiver" method="post" runat="server">
        <select id="listMobileSendTo" style="Z-INDEX: 107; LEFT: 371px; WIDTH: 181px; POSITION: absolute; TOP: 248px; HEIGHT: 155px" multiple size="9" name="listMobileSendTo">
        </select>
        <input class="buttoncss" style="Z-INDEX: 106; LEFT: 256px; WIDTH: 81px; POSITION: absolute; TOP: 251px; HEIGHT: 24px" onclick="AddItem(this.name)" type="button" value=">>>>" name="btnMobileSendToRight">
        <input class="buttoncss" style="Z-INDEX: 105; LEFT: 256px; WIDTH: 81px; POSITION: absolute; TOP: 275px; HEIGHT: 24px" onclick="RemoveItem(this.name)" type="button" value="<<<<" name="btnMobileSendToLeft">
        <select id="listSendTo" style="Z-INDEX: 104; LEFT: 374px; WIDTH: 182px; POSITION: absolute; TOP: 43px; HEIGHT: 161px" multiple size="10" name="listSendTo"></select>
        <input class="buttoncss" style="Z-INDEX: 103; LEFT: 256px; WIDTH: 81px; POSITION: absolute; TOP: 49px; HEIGHT: 24px" onclick="AddItem(this.name)" type="button" value=">>>>" name="btnReceSendToRight">
        <input class="buttoncss" style="Z-INDEX: 102; LEFT: 256px; WIDTH: 81px; POSITION: absolute; TOP: 73px; HEIGHT: 24px" onclick="RemoveItem(this.name)" type="button" value="<<<<" name="btnReceSendToLeft">
        <asp:DropDownList ID="listAccount" ondblclick="AddItem('btnReceSendToRight')" Style="Z-INDEX: 101; LEFT: 73px; POSITION: absolute; TOP: 43px" runat="server" Width="148px" Height="356px" multiple onchange="setStatusright()"></asp:DropDownList>
        <asp:Label ID="lblReceiver" Style="Z-INDEX: 111; LEFT: 375px; POSITION: absolute; TOP: 18px" runat="server" Font-Size="X-Small">站内短讯</asp:Label>
        <asp:Label ID="lblMReceiver" Style="Z-INDEX: 112; LEFT: 374px; POSITION: absolute; TOP: 225px" runat="server" Font-Size="X-Small">手机短讯</asp:Label>
        <input class="buttoncss" style="Z-INDEX: 116; LEFT: 221px; WIDTH: 61px; POSITION: absolute; TOP: 421px; HEIGHT: 24px" onclick="ReturnValue()" type="button" value="确定">
        <input class="buttoncss" style="Z-INDEX: 117; LEFT: 356px; WIDTH: 61px; POSITION: absolute; TOP: 421px; HEIGHT: 24px" onclick="window.close()" type="button" value="取消">
        <asp:DropDownList ID="listDept" Style="Z-INDEX: 118; LEFT: 76px; POSITION: absolute; TOP: 16px" runat="server" OnSelectedIndexChanged="DeptListChange" AutoPostBack="True"></asp:DropDownList>
    </form>
</body>
</html>
