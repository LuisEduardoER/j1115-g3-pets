<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib/common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改商品信息</title>
	<style type="text/css">
		input {
			font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
			font-size: 12px;
		}
		textarea{
			font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
			font-size: 12px;
		}
		.adminmodgoods{
			padding-top: 60px;
			padding-left: 150px;
			font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
			
		}
	</style>
  	<script type="text/javascript">
  		function hqs_checkmod(){
  			var gname = document.getElementById("gname").value;
			 var gnum = document.getElementById("gnum").value;
			 var price = document.getElementById("gprice").value;
	
			if(gnum=="" || gname=="" || price=="" ){
				alert("至少还有一个未填项");
				return false;
			}
  		}
  		
  		function checknumber(){
			var price = document.getElementById("gprice").value;
			if(!Number(price)){
				document.getElementById("gprice").value="";
				document.getElementById("msg").innerHTML="必须是数字";
			}else{
				document.getElementById("msg").innerHTML="";
			}
		}
		function checkInteger(){
		 var gnum = document.getElementById("gnum").value;
		 var num = gnum.match(/^[0-9]+$/);
			if (num==null)
    		{
        		document.getElementById("gnum").value="";
				document.getElementById("msg2").innerHTML="输入的是非整数";
    		}
    		else
    		{
       		 document.getElementById("msg2").innerHTML="";
    		}
		}
  	</script>
  </head>
  
  <body>
  <div class="adminmodgoods">
  <html:form action="/modGoodsInfo" onsubmit="return hqs_checkmod()">
  <html:hidden property="gid" value="${onegoodslist.gid }"/>
    商品名称<html:text property="gname" value="${onegoodslist.gname }" styleId="gname"></html:text><font color="red">*</font><br>
    商品价格<html:text property="gprice" value="${onegoodslist.gprice }" styleId="gprice" onblur="checknumber()"></html:text><font color="red">*</font>  <font id="msg" color="red"></font><br>
    剩余数量<html:text property="gnum" value="${onegoodslist.gnum }" styleId="gnum" onblur="checkInteger()"></html:text><font color="red">*</font><font id="msg2" color="red"></font><br>
    商品简介<html:textarea property="gbrief" cols="50" rows="8" value="${onegoodslist.gbrief }"></html:textarea><br>
  <html:submit value="修改"></html:submit>
  <html:cancel value="取消"></html:cancel>
  </html:form>
  </div>
  </body>
</html>
