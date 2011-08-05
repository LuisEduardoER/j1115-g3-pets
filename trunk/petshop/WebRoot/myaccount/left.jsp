<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/taglib/common.jsp" %>
<html>
<head>
<title>Powered by NetGou</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
td {font-size: 9pt;line-height: 1.5;}
body {font-size: 9pt;line-height: 1.5;}
a:link { font-size: 9pt; color: #000000; text-decoration: none }
a:visited{ font-size: 9pt; color: #000000; text-decoration: none }
a:hover {font-size: 9pt;color: red}
.topitem{ cursor: hand; 
    background-image:url(images/mtbg1.gif);
    height:24px;
    width:98%;
    border-right: 1px solid #2FA1DB;
    border-left: 1px solid #2FA1DB;
    clear:left
}
.itemsct{
  border-right: 1px solid #2FA1DB;
  border-left: 1px solid #2FA1DB;
  background-color:#EEFAFE;
  margin-bottom:6px;
  width:98%;
}
.topl{ float:left;margin-left:6px;margin-right:3px; }
.topr{ padding-top:3px }
body {
  scrollbar-base-color:#8CC1FE;
  scrollbar-arrow-color:#FFFFFF;
  scrollbar-shadow-color:#6994C2
}
</style>
<script language="javascript">
function showHide(objname)
{
    var obj = document.getElementById(objname);
    if(obj.style.display == "none") obj.style.display = "block";
    else{ if(document.all) obj.style.display = "none"; }
}
</script>
</head>
<base target="main">
<body bgcolor="#86C1FF" leftmargin="0" topmargin="3">
<div align="center">
</table>
</div>

<!-- Item 3 Strat -->
<div onClick='showHide("items3")' class='topitem' align='left'> 
	<div class='topl'><img src='images/mtimg1.gif' width='21' height='24' border='0'></div>
    <div class='topr'>个人信息</div>
</div>
<div style='clear:both'></div>
<div style='display:block' id='items3' class='itemsct'> 
<table width="100%" border="0" align="center" cellPadding="0" cellSpacing="0">
  <tr height="25">
    <td style="border-bottom: #2FA1DB 1px solid;padding-left:5px;"><img src='images/newitem.gif' width='7' height='10' alt=''/></td>
    <td style="border-bottom: #2FA1DB 1px solid"><html:link action= "/getUserMsg">查询信息</html:link></td>
  </tr>
  <tr height="25">
    <td style="border-bottom: #2FA1DB 1px solid;padding-left:5px;"><img src='images/newitem.gif' width='7' height='10' alt=''/></td>
    <td style="border-bottom: #2FA1DB 1px solid"><a href="<%=request.getContextPath()%>/jsp/updatepass.jsp">修改密码</a></td>
  </tr>
  <tr height="25">
    <td style="border-bottom: #2FA1DB 1px solid;padding-left:5px;"><img src='images/newitem.gif' width='7' height='10' alt=''/></td>
    <td style="border-bottom: #2FA1DB 1px solid"><html:link action= "/getUserMoney">余额查询</html:link></td>
  </tr>
</table>
</div>
<!-- Item 4 End -->



<!-- Item 0 Strat -->
<div onClick='showHide("items0")' class='topitem' align='left'> 
  <div class='topl'><img src='images/mtimg1.gif' width='21' height='24' border='0'></div>
  <div class='topr'>订单管理</div>
</div>
<div style='clear:both'></div>
<div style='display:block' id='items0' class='itemsct'>
<table width="100%" border="0" align="center" cellPadding="0" cellSpacing="0">
  <tr height="25">
    <td style="border-bottom: #2FA1DB 1px solid;padding-left:5px;"><img src='images/newitem.gif' width='7' height='10' alt=''/></td>
    <td style="border-bottom: #2FA1DB 1px solid"><a href="../trading.do" target="_top">订单ING</a></td>
  </tr>
  <tr height="25">
    <td style="border-bottom: #2FA1DB 1px solid;padding-left:5px;"><img src='images/newitem.gif' width='7' height='10' alt=''/></td>
    <td style="border-bottom: #2FA1DB 1px solid"><a href="../history.do" target="_top">历史订单</a></td>
  </tr>
</table>
</div>
<!-- Item 0 End -->
<div onClick='showHide("items8")' class='topitem' align='left'> 
  <div class='topl'><img src='images/mtimg1.gif' width='21' height='24' border='0'></div>
  <div class='topr'>购物车</div>
</div>
<div style='clear:both'></div>
<div style='display:block' id='items8' class='itemsct'>
<table width="100%" border="0" align="center" cellPadding="0" cellSpacing="0">
  <tr height="25">
    <td style="border-bottom: #2FA1DB 1px solid;padding-left:5px;"><img src='images/newitem.gif' width='7' height='10' alt=''/></td>
    <td style="border-bottom: #2FA1DB 1px solid"><A href="adsmgr.php" target="right">我的购物车</A></td>
  </tr>
</table>
</div>
<!-- Item 14 Strat -->
<div style='clear:both'></div>

<!-- Item 15 End -->
<!-- Item 18 Strat -->
<div style='clear:both'></div>
<div onClick='showHide("items13")' class='topitem' align='left'> 
    <div class='topl'><img src='images/mtimg1.gif' width='21' height='24' border='0'></div>
    <div class='topr'>充值</div>
</div>
<div style='clear:both'></div>
<div style='display:block' id='items13' class='itemsct'> 
<table width="100%" border="0" align="center" cellPadding="0" cellSpacing="0">
  <tr height="25">
    <td style="border-bottom: #2FA1DB 1px solid;padding-left:5px;"><img src='images/newitem.gif' width='7' height='10' alt=''/></td>
    <td style="border-bottom: #2FA1DB 1px solid"><A href="<%=request.getContextPath()%>/jsp/recharge.jsp" target='_blank'>网银充值</A></td>
  </tr>
</table>
</div>
</div>
</body>
</html>