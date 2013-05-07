<%@ Page language="c#" Codebehind="ShowDay.aspx.cs" AutoEventWireup="false" Inherits="UDS.SubModule.WorkAttendance.ShowDay" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>考勤日期设置</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../Css/BasicLayout.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .inday {
            background-color: #EBFFE5;
        }

        .outday {
            background-color: #ffffef;
        }
    </style>
</head>
<body leftmargin="0" topmargin="0">
    <form id="ShowDay" method="post" runat="server">
        <font face="宋体">
            <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"
                width="100%" height="1">
                <tr height="30">
                    <td width="3%" bgcolor="#c0d9e6" class="GbText" background="../../Images/treetopbg.jpg"><font color="#006699" size="3">
                        <img src="../..//DataImages/page.gif" width="16" height="16"></font></td>
                    <td bgcolor="#c0d9e6" class="GbText" background="../../Images/treetopbg.jpg"><b>考勤设置</b></td>
                </tr>
            </table>
            <table id="daytable" cellspacing="0" cellpadding="0" width="100%" align="center" border="1"
                runat="server" class="gbtext" style="BORDER-COLLAPSE: collapse" bordercolor="#93bee2">
                <tr height="30">
                    <td align="center" style="CURSOR: pointer" class="showDayHead" onmouseover="this.title='点击改变整列'"
                        title="点击修改整列" bgcolor="#e8f4ff">星期一</td>
                    <td align="center" style="CURSOR: pointer" class="showDayHead" onmouseover="this.title='点击改变整列'"
                        bgcolor="#e8f4ff">星期二</td>
                    <td align="center" style="CURSOR: pointer" class="showDayHead" onmouseover="this.title='点击改变整列'"
                        bgcolor="#e8f4ff">星期三</td>
                    <td align="center" style="CURSOR: pointer" class="showDayHead" onmouseover="this.title='点击改变整列'"
                        bgcolor="#e8f4ff">星期四</td>
                    <td align="center" style="CURSOR: pointer" class="showDayHead" onmouseover="this.title='点击改变整列'"
                        bgcolor="#e8f4ff">星期五</td>
                    <td align="center" style="CURSOR: pointer" class="showDayHead" onmouseover="this.title='点击改变整列'"
                        bgcolor="#e8f4ff">星期六</td>
                    <td align="center" style="CURSOR: pointer" class="showDayHead" onmouseover="this.title='点击改变整列'"
                        bgcolor="#e8f4ff">星期日</td>
                </tr>
            </table>
        </font>
        <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" width="100%">
            <tr height="30">
                <td class="GbText">
                    <table id="Table1" height="24" cellspacing="0" cellpadding="0" width="200" class="gbtext"
                        style="BORDER-COLLAPSE: collapse" border="1" bordercolor="#e8e8e8">
                        <tr>
                            <td bgcolor="#ebffe5" width="100" align="center"><font face="宋体">工作日</font></td>
                            <td bgcolor="#ffffef" width="100" align="center"><font face="宋体">休息日</font></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr height="30">
                <td class="GbText" align="center">
                    <asp:Button ID="btnsubmit" runat="server" Text=" 确 认 " CssClass="buttoncss"></asp:Button>
                    <input id="hcellstatus" type="hidden" runat="server">
                    <asp:Button ID="lblMessage" runat="server" CssClass="buttoncss" Text="修改成功" Visible="False"
                        BorderWidth="0px" OnClientClick='back2MF();return false;'></asp:Button>
                </td>
            </tr>
        </table>
    </form>
    <script language="javascript" type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $(".showDayHead").click(function () {
                var tdNum = $(this).parent().find('td').index($(this)[0]) + 1;
                $('#daytable tr td:nth-child(' + tdNum + ')').each(function () {
                    //console.log($(this));
                    Click_Cell(this);
                });
            });
        });

        function back2MF() {
            var url = '<%= Page.ResolveUrl("Set.aspx") %>';
            parent.navigatemf("考勤管理", url, "WorkAttendance");
        }

        function Click_Cell(object) {
            
            if ($(object).hasClass("inday")) {
                $(object).removeClass("inday");
                $(object).addClass("outday");
            }
            else if($(object).hasClass("outday")){
                $(object).removeClass("outday");
                $(object).addClass("inday");
            }

            if ($(object).hasClass("inday") || $(object).hasClass("outday")) {
                //alert(object.style.backgroundColor);
                //数据格式采用ID:n,{ID:n....}（n双数上班，单数休息）
                var innerstring;
                innerstring = document.getElementById("hcellstatus").value;
                //遍历ID找到是否存在该ID,如果有就修改VALUE，没有就添加VALUE=0
                var arr = innerstring.split(",");
                var arrtmp;
                var re = /\d+/;//匹配id
                var re1 = /:\w+/;//匹配n
                var n, tmpstr;
                var havefound = false;//找到了匹配项
                for (var i = 0; i < arr.length; i++) {
                    arrtmp = arr[i].match(re);
                    //	if(arrtmp!=null)
                    //		alert("|"+arrtmp[0]+"|"+object.id+"|");
                    if ((arrtmp != null) && (arrtmp[0] == object.id))//找到匹配项
                    {
                        //alert("找到匹配项"+"|"+arrtmp[0]+"|"+object.id);
                        n = arr[i].match(re1);
                        n = n[0].substr(1);
                        n = ":" + String(parseInt(n) + 1);
                        tmpstr = arr[i].replace(re1, n);
                        document.getElementById("hcellstatus").value = innerstring.replace(arr[i], tmpstr);
                        havefound = true;
                        break;
                    }

                }
                if (!havefound)//没有找到匹配项，添加字符串
                {
                    if ($(object).hasClass("inday"))
                        innerstring = object.id + ":0,";
                    else
                        innerstring = object.id + ":1,";

                    document.getElementById("hcellstatus").value += innerstring;
                    //alert(document.ShowDay.hcellstatus.value);
                }

                //alert(object.style.backgroundColor);
            }

        }

        function Top_Click(cellnumber) {
            console.log("Top_Click");
            var tdNum = $(this).parent().find('td').index($(this)[0]) + 1;
            alert(tdNum);
            //$('#daytable tr td:nth-child(' + cellnumber + 1 + ')').each(function () {
            //    console.log($(this));
            //    Click_Cell(this);
            //});
        }
    </script>
</body>
</html>
