<%@ Page language="c#" Codebehind="SelectReceiver.aspx.cs" AutoEventWireup="false" Inherits="MaiSystem.SelectReceiver" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>选择收件人</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" rel="Stylesheet" href="../../../Css/bootstrap.min.css" />
    <link type="text/css" rel="Stylesheet" href="../../../Css/bootstrap-responsive.min.css" />
    <link type="text/css" rel="Stylesheet" href="../../../Css/font-awesome.min.css" />
     <!--[if IE 7]>
		<link rel="stylesheet" href="../../../Css/font-awesome-ie7.min.css" />
	<![endif]-->
    <style type="text/css">
        .container-fluid .sidebar {
            position:relative;
            top:0;
            left:auto;
            width:150px;
        }

        .container-fluid .sidebar select {
            position:relative;
            width: 150px;
            left: auto;
        }

        .left {
            float:left;
        }

        .right {
            float:right;
        }

        .fixed-fixed {
            margin: 0 300px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="sidebar left">
            <form class="well-small" method="post" runat="server">
                <div class="controls-row">
                    <select id="listDept"></select>
                </div>
                <div class="controls-row">
                    <asp:DropDownList ID="listAddressBook" runat="server" Visible="False"></asp:DropDownList>
                    <select multiple="multiple" id="listAccount" style="height:356px"></select>
                </div>
            </form>
		</div><!--/#sidebar left-->
        <div class="sidebar right">
            <form method="post" class="well-small">
                <div class="row">
                    <div class="span2">
                        <label>收件人</label>
                        <select id="listSendTo" style="HEIGHT: 90px;" multiple="multiple" size="5" name="listSendTo"></select>
                    </div>
                </div>
                <div class="row">
                    <div class="span2">
                        <label>抄送人</label>
                        <select id="listCcTo" style="HEIGHT: 92px" multiple="multiple" size="5" name="listCcTo"></select>
                    </div>
                </div>
                <div class="row">
                    <div class="span2">
                        <label>密送人</label>
                        <select id="listBccTo" style="HEIGHT: 105px" multiple="multiple" size="6" name="listBccTo"></select>
                    </div>
                </div>
            </form>
            <!--
            <div class="row-fluid">
                <input class="buttoncss" onclick="ReturnValue()" type="button" value="确定">
                <input class="buttoncss" onclick="window.close()" type="button" value="取消">
            </div>-->
        </div><!-- #sidebar right -->
        <div class="content fixed-fixed">
            <form class="well-small" method="post">
                <div class="row" style="height:90px;">
                    <div class="span5" style="margin-top:35px">
                        <a class="btn btn-mini btn-add" 
                            data-target="listSendTo"><i class="icon-double-angle-right icon-2x"></i></a>
                        <a class="btn btn-mini btn-remove"
                            data-target="listSendTo"><i class="icon-double-angle-left icon-2x"></i></a>
                    </div>
                </div>
                <div class="row" style="height:92px">
                    <div class="span2" style="margin-top:62px">
                        <a class="btn btn-mini btn-add" 
                            data-target="listCcTo"><i class="icon-double-angle-right icon-2x"></i></a>
                        <a class="btn btn-mini btn-remove" 
                            data-target="listCcTo"><i class="icon-double-angle-left icon-2x"></i></a>
                    </div>
                </div>
                <div class="row" style="height:105px">
                    <div class="span2" style="margin-top:80px">
                        <a class="btn btn-mini btn-add" 
                            data-target="listBccTo"><i class="icon-double-angle-right icon-2x"></i></a>
                        <a class="btn btn-mini btn-remove" 
                            data-target="listBccTo"><i class="icon-double-angle-left icon-2x"></i></a>
                    </div>
                </div>
            </form>
        </div><!-- content -->
    </div><!--/.fluid-container#main-container-->
    <footer style="text-align:center">
        <input class="btn btn-primary" onclick="ReturnValue()" type="button" value="确定">
        <input class="btn btn-warning" onclick="window.close()" type="button" value="取消">
    </footer>
    <script type="text/javascript" src="../../../js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../../../js/underscore-min.js"></script>
    <script type="text/javascript">
        var type = '<%= DispType %>';
        var classid = '<%= ClassID %>';

        $(".btn-add").click(function () {
            var targetControl = $("#" + $(this).data("target"));

            $("#listAccount").find("option").each(function () {
                if ($(this).is(":selected")) {
                    targetControl.append($("<option></option>").attr("value", $(this).val()).text($(this).text()));
                }
            });
        });

        $(".btn-remove").click(function () {
            var targetControl = $("#" + $(this).data("target"));
            targetControl.find("option").each(function () {
                if ($(this).is(":selected")) {
                    $(this).remove();
                }
            });
        });

        $("#listDept").change(function () {
            $("#listAccount").empty();
            $(this).find("option").each(function () {
                if ($(this).is(":selected")) {
                    $.ajax({
                        url: 'SelectReceiver.aspx?type=' + type + '&ClassID=' + classid + '&resulttype=staff' + '&dep=' + $(this).val(),
                        dataType: 'json',
                        type: 'GET',
                        cache: false,
                        success: function (data, textStatus, jqXHR) {
                            _.each(data, function (d, index) {
                                if (0 == index)
                                    $("#listAccount").append($("<option></option>").attr({ "value": d.StaffName, "selected": true }).text(d.RealName));
                                else
                                    $("#listAccount").append($("<option></option>").attr("value", d.StaffName).text(d.RealName));
                            });
                        },
                        error: function (jqXHR, textStatus, err) {
                            alert("获取收件人列表发生错误：" + jqXHR.responseText);
                        }
                    });
                }
            });
        });

        $(document).ready(function () {
            $.ajax({
                url: 'SelectReceiver.aspx?type=' + type + '&ClassID=' + classid + '&resulttype=staff',
                dataType: 'json',
                type: 'GET',
                cache: false,
                success: function (data, textStatus, jqXHR) {
                    _.each(data, function (d, index) {
                        if (0 == index)
                            $("#listAccount").append($("<option></option>").attr({ "value": d.StaffName, "selected": true }).text(d.RealName));
                        else
                            $("#listAccount").append($("<option></option>").attr("value", d.StaffName).text(d.RealName));
                    });
                },
                error: function (jqXHR, textStatus, err) {
                    alert("获取收件人列表发生错误：" + jqXHR.responseText);
                }
            });

            $.ajax({
                url: 'SelectReceiver.aspx?type=' + type + '&ClassID=' + classid + '&resulttype=position',
                dataType: 'json',
                type: 'GET',
                cache: false,
                success: function (data, textStatus, jqXHR) {
                    _.each(data, function (d, index) {
                        if (0 == index)
                            $("#listDept").append($("<option></option>").attr({ "value": d.PositionID, "selected": true }).text(d.PositionName));
                        else
                            $("#listDept").append($("<option></option>").attr("value", d.PositionID).text(d.PositionName));
                    });
                },
                error: function (jqXHR, textStatus, err) {
                    alert("获取部门列表发生错误:" + jqXHR.responseText);
                }
            });

            PopulateData();
        });

        function PopulateData() {
            if (window.dialogArguments != null) {
                var parwin = window.dialogArguments;

                if (parwin.document.all.hdnTxtSendTo.value != "") {
                    var Control = $("#listSendTo");
                    var SendToValueArray = parwin.document.all.hdnTxtSendTo.value.split(",");
                    var SendToTxtArray = parwin.document.all.txtSendTo.value.split(",");
                    for (i = 0; i < SendToValueArray.length - 1; i++) {
                        Control.append($("<option></option>").attr("value", SendToValueArray[i]).text(SendToTxtArray[i]));
                    }
                }

                if (parwin.document.all.hdnTxtCcTo.value != "") {
                    var Control = $("#listCcTo");
                    var CcToValueArray = parwin.document.all.hdnTxtCcTo.value.split(",");
                    var CcToTxtArray = parwin.document.all.txtCcTo.value.split(",");
                    for (i = 0; i < CcToValueArray.length - 1; i++) {
                        Control.append($("<option></option>").attr("value", CcToValueArray[i]).text(CcToTxtArray[i]));
                    }
                }

                if (parwin.document.all.hdnTxtSendTo.value != "") {
                    var Control = $("#listBccTo");
                    var BccToValueArray = parwin.document.all.hdnTxtBccTo.value.split(",");
                    var BccToTxtArray = parwin.document.all.txtBccTo.value.split(",");
                    for (i = 0; i < BccToValueArray.length - 1; i++) {
                        Control.append($("<option></option>").attr("value", BccToValueArray[i]).text(BccToTxtArray[i]));
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
            var listCcToTxtStr = "";
            var listCcToValueStr = "";
            var listBccToTxtStr = "";
            var listBccToValueStr = "";
            var listSendToCompleteStr = "";

            var listSendTo = $("#listSendTo");
            var listCcTo = $("#listCcTo");
            var listBccTo = $("#listBccTo");


            listSendTo.find("option").each(function () {
                listSendToTxtStr += $(this).text() + ",";
                listSendToValueStr += $(this).val() + ",";
            });
            parwin.document.all.Compose.txtSendTo.value = listSendToTxtStr;
            parwin.document.all.Compose.hdnTxtSendTo.value = listSendToValueStr;


            listCcTo.find("option").each(function () {
                listCcToTxtStr += $(this).text() + ",";
                listCcToValueStr += $(this).val() + ",";
            });
            parwin.document.all.Compose.txtCcTo.value = listCcToTxtStr;
            parwin.document.all.Compose.hdnTxtCcTo.value = listCcToValueStr;

            listBccTo.find("option").each(function () {
                listBccToTxtStr += $(this).text() + ",";
                listBccToValueStr += $(this).val() + ",";
            });
            parwin.document.all.Compose.txtBccTo.value = listBccToTxtStr;
            parwin.document.all.Compose.hdnTxtBccTo.value = listBccToValueStr;

            window.close();
        }

        function SaveValue() {
            if (window.dialogArguments != null) {
                var parwin = window.dialogArguments;
            }

            var listSendToTxtStr = "";
            var listSendToValueStr = "";
            var listCcToTxtStr = "";
            var listCcToValueStr = "";
            var listBccToTxtStr = "";
            var listBccToValueStr = "";
            var listSendToCompleteStr = "";

            listSendTo = eval("document.SelectReceiver.listSendTo");
            listCcTo = eval("document.SelectReceiver.listCcTo");
            listBccTo = eval("document.SelectReceiver.listBccTo");


            for (i = 0; i < listSendTo.length; i++) {
                listSendToTxtStr += listSendTo.options[i].text + ",";
                listSendToValueStr += listSendTo.options[i].value + ",";
            }
            parwin.document.all.Compose.txtSendTo.value = listSendToTxtStr;
            parwin.document.all.Compose.hdnTxtSendTo.value = listSendToValueStr;


            for (i = 0; i < listCcTo.length; i++) {
                listCcToTxtStr += listCcTo.options[i].text + ",";
                listCcToValueStr += listCcTo.options[i].value + ",";
            }
            parwin.document.all.Compose.txtCcTo.value = listCcToTxtStr;
            parwin.document.all.Compose.hdnTxtCcTo.value = listCcToValueStr;


            for (i = 0; i < listBccTo.length; i++) {
                listBccToTxtStr += listBccTo.options[i].text + ",";
                listBccToValueStr += listBccTo.options[i].value + ",";
            }
            parwin.document.all.Compose.txtBccTo.value = listBccToTxtStr;
            parwin.document.all.Compose.hdnTxtBccTo.value = listBccToValueStr;


        }

    </script>
</body>
</html>
