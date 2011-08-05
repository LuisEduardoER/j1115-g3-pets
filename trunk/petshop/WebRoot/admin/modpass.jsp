<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib/common.jsp"%>	

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>modpass.html</title>
	<script type="text/javascript">
		function checkPass(){
			var newPass1 = document.getElementById("newPass1").value;
			var newPass2 = document.getElementById("newPass2").value;
			if(newPass1 == newPass2){
				return true;
			}else{
				document.getElementById("newPass1").value="";
				document.getElementById("newPass2").value="";
				document.getElementById("Msg").innerHTML="密码不匹配，请重新输入"
				return false;
			}
		}
	//	function isSucceed(var msg){
	//		if(msg=="密码修改成功")
	//			alert(msg);
	//		if(msg="原密码错误")
	//			alert(msg);
	//	}

	</script>
  </head>
  
  <body>
	<div>
	<form action="/modAdminPass" onsubmit="return checkPass()">
		原密码：	<input type="password" name="oldPass"><br>
		新密码：	<input id="newPass1" type="password" name="newPass"><br>
		确认密码：<input id="newPass2" type="password"><font color="red" id="Msg"></font><br>
		<input type="submit"" value="确认" ><input type="button" value="取消">
	</form>
	</div>
	<%
		String msg = (String)request.getAttribute("msg");
		out.print(msg);
	 %>
	 
  </body>
</html>
