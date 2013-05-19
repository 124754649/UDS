<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uploadtest.aspx.cs" Inherits="UDS.SubModule.bulletin.uploadtest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link type="text/css" rel="stylesheet" href="../../Css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="../../Css/bootstrap-responsive.min.css" />
    <!-- Bootstrap CSS fixes for IE6 -->
    <!--[if lt IE 7]><link rel="stylesheet" href="../../Css/bootstrap-ie6.min.css"><![endif]-->
    <link type="text/css" rel="stylesheet" href="../../Css/fineuploader-3.5.0.css" />
</head>
<body>
    <div id="fine-uploader"></div>
    <script type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.fineuploader-3.5.0.min.js"></script>
    <script type="text/javascript" src="../../js/iframe.xss.response-3.5.0.js"></script>
    <script type="text/javascript">
        function createUploader() {
            var uploader = new qq.FineUploader({
                element: document.getElementById('fine-uploader'),
                request: {
                    endpoint: '../upload/doUpload.aspx'
                }
            });
        }

        window.onload = createUploader;
    </script>
</body>
</html>
