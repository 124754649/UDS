<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="UDS.SubModule.UnitiveDocument.Mail.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>我的桌面</title>
    <!--<meta name="viewport" content="width=device-width, initial-scale=1.0">-->
    <!--<link rel="stylesheet" href="../../../Css/bootstrap.min.css" />-->
    <!--<link rel="stylesheet" href="../../../Css/bootstrap-responsive.min.css" />-->
    <!--<link rel="stylesheet" href="../../../Css/font-awesome.min.css" />-->
    
    <link rel="stylesheet" href="../../../Css/quantumcode.css" />
    <link rel="stylesheet" href="../../../Css/quantumcode-resposive.css" />
    <link rel="stylesheet" href="../../../Css/quantumcode-skins.css" />

    <!--[if lt IE 9]>
		  <link rel="stylesheet" href="..../../Css/quantumcode-ie.css" />
		<![endif]-->
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
    <form id="form1" runat="server">
    <div>
        测试
    </div>
    </form>
</body>
</html>
