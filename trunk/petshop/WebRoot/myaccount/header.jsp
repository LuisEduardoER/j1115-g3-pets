<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>$strtitle$netgou[company_name]-Powered By NetGou</title>
<style>
td {font-size: 9pt;line-height: 1.5;}

body {font-size: 9pt;line-height: 1.5;}

a:link { font-size: 9pt; color: #000000; text-decoration: none }

a:visited{ font-size: 9pt; color: #000000; text-decoration: none }

a:hover {font-size: 9pt;color: red}
.bdd{ float:right; height:26px; padding-left:6px; padding-right:6px;
	     background-image:url(images/tn2.gif); line-height:29px;
	     border-right:1px solid #2C6FA8;border-left:1px solid #F0F3F8 }
.bdd1{ float:right; height:26px; padding-left:6px; padding-right:6px;
	     background-image:url(images/tn2.gif); line-height:29px;
	     border-right:1px solid #2C6FA8;}
.bdd2{ float:right; height:26px; padding-left:6px; padding-right:6px;
	     background-image:url(images/tn2.gif); line-height:29px;
	     border-left:1px solid #F0F3F8 }
.STYLE2 {font-size: x-small}
</style>
<script language='javascript'>
function OpenMenu(cid,lurl,rurl,bid){
   if($Nav()=='IE'){
     if(rurl!='') top.document.frames.main.location = rurl;
     if(cid > -1) top.document.frames.menu.location = 'index_menu.php?c='+cid;
     else if(lurl!='') top.document.frames.menu.location = lurl;
     if(bid>0) document.getElementById("d"+bid).className = 'bdd2';
     if(preID>0 && preID!=bid) document.getElementById("d"+preID).className = 'bdd';
     preID = bid;
   }else{
     if(rurl!='') top.document.getElementById("main").src = rurl;
     if(cid > -1) top.document.getElementById("menu").src = 'index_menu.php?c='+cid;
     else if(lurl!='') top.document.getElementById("menu").src = lurl;
     if(bid>0) document.getElementById("d"+bid).className = 'bdd2';
     if(preID>0 && preID!=bid) document.getElementById("d"+preID).className = 'bdd';
     preID = bid;
   }
}

var preFrameW = '160,*';
var FrameHide = 0;
function ChangeMenu(way){
	var addwidth = 10;
	var fcol = top.document.all.bodyFrame.cols;
	if(way==1) addwidth = 10;
	else if(way==-1) addwidth = -10;
	else if(way==0){
		if(FrameHide == 0){
			preFrameW = top.document.all.bodyFrame.cols;
			top.document.all.bodyFrame.cols = '0,*';
			FrameHide = 1;
			return;
		}else{
			top.document.all.bodyFrame.cols = preFrameW;
			FrameHide = 0;
			return;
		}
	}
	fcols = fcol.split(',');
	fcols[0] = parseInt(fcols[0]) + addwidth;
	top.document.all.bodyFrame.cols = fcols[0]+',*';
}
</script>


  



</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellSpacing="0" cellPadding="0" background="images/ntbg2.gif">
  <tr>
    <td rowspan="2" width="200"><a href="./"><img src='images/logo.gif' border='0' alt="logo"></a></td>
    <td align="right" style="padding-top:4px" height="30">
	  <table border="0" cellPadding="0" cellSpacing="0">
	    <tr style="padding-left:3px">
	      <td><b><?php echo $uname=$_SESSION['uname'];?></b> 你好，欢迎登录后台管理&nbsp;&nbsp;</td>
		  <td><a href="javascript:ChangeMenu(-1)"><img src='images/frame-l.gif' border='0' alt="减小左框架"></a></td>
	      <td><a href="javascript:ChangeMenu(0)"><img src='images/frame_on.gif' border='0' alt="隐藏/显示左框架"></a></td>
	      <td><a href="javascript:ChangeMenu(1)"><img src='images/frame-r.gif' border='0' alt="增大左框架"></a></td>
	      <td width="20"></td>
	    </tr>
	  </table>
    </td>
  </tr>
  <tr>
    <td align="right">
	  <table border="0" cellSpacing="0" cellPadding="0">
  		<tr>
		  <td><img src='images/ttn1.gif' width='20' height='28'></td>
		  <td class='bdd1'><A href="default.html" target="_top">首页</A></td>
		  <td class='bdd'><A href="prolist.php" target="right">商品管理</A></td>
		  <td class='bdd'><A href="usermgr.php" target="right">用户管理</A></td>
		  <td class='bdd'><A href="orderlist.php" target="right">订单管理</A></td>
		  <td class='bdd'><A href="adsmgr.php" target="right">广告管理</A></td>
		  <td class='bdd'>版权信息</td>
		  <td class='bdd2'><A href="loging.php?mode=logout" target="_top">退出</A></td>
		  <td><img src='images/ttn3.gif' width='7' height='28' border="0"></td>
		  <td width="20"></td>
	 	</tr>
	  </table>
	</td>
  </tr>
</table>
</body>
</html>