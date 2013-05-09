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
<body>
    <div class="container-fluid">
        <div class="sidebar left">
            <form id="Form1" class="well-small" method="post" runat="server">
                <div class="controls-row">
                    <select id="listDept"></select>
                </div>
                <div class="controls-row">
                    <select id="listAccount" style="height:316px" multiple="multiple"></select>
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
    <script type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../../js/underscore-min.js"></script>
    <script type="text/javascript">
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
                        url: 'SelectReceiver.aspx?result=staff' + '&dep=' + $(this).val(),
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
                url: 'SelectReceiver.aspx?result=staff',
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
                url: 'SelectReceiver.aspx?result=position',
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

                if (parwin.document.all.hdnTxtMobileSendTo.value != "") {
                    var Control = $("#listMobileSendTo");
                    var MobileSendToValueArray = parwin.document.all.hdnTxtMobileSendTo.value.split(",");
                    var MobileSendToTxtArray = parwin.document.all.txtMobileSendTo.value.split(",");
                    for (i = 0; i < MobileSendToValueArray.length - 1; i++) {
                        Control.append($("<option></option>").attr("value", MobileSendToValueArray[i]).text(MobileSendToTxtArray[i]));
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

            var listSendTo = $("#listSendTo");
            var listMobileSendTo = $("#listMobileSendTo");


            listSendTo.find("option").each(function () {
                listSendToTxtStr += $(this).text() + ",";
                listSendToValueStr += $(this).val() + ",";
            });

            parwin.document.all.MsgSend.txtSendTo.value = listSendToTxtStr;
            parwin.document.all.MsgSend.hdnTxtSendTo.value = listSendToValueStr;

            listMobileSendTo.find("option").each(function () {
                listMobileSendToTxtStr += $(this).text() + ",";
                listMobileSendToValueStr += $(this).val() + ",";
            });

            parwin.document.all.MsgSend.txtMobileSendTo.value = listMobileSendToTxtStr;
            parwin.document.all.MsgSend.hdnTxtMobileSendTo.value = listMobileSendToValueStr;


            parwin.document.all.MsgSend.txtContent.focus();

            window.close();
        }
    </script>
</body>
</html>
