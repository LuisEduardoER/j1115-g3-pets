<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'regist.jsp' starting page</title>
    
    <script type="text/javascript">
		var xmlhttp;
		function check(){
			if(window.XMLHttpRequest){
				xmlhttp = new XMLHttpRequest();
			}else{
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
		
			var username=document.regform.username.value;
			xmlhttp.onreadystatechange=clback;
			xmlhttp.open("post","/petshop/checkReg.do?username="+username,true);
			xmlhttp.send();
		}
	   function clback(){
			if(xmlhttp.readyState == 4){
				var text = xmlhttp.responseText;
				if("true" == text){
					document.getElementById("umsg").innerHTML="用户名已存在";
				}else{
					document.getElementById("umsg").innerHTML="";
				}
			}
		}
	   
	</script>
   </head>
  
  <body>
    <h4>
			注册
		</h4>
		<br>
		<form action="regist.do" name="regform" method="post">
			<table width="60%">
				<tr>
					<td width="100px">
						用户名：
					</td>
					<td>
						<input type="text" name="username" onblur="check()" />
						<font color="red" id="umsg"></font>
					</td>
				</tr>
				<tr>
					<td>
						密码：
					</td>
					<td>
						<input type="text" name="password" />
					</td>
				</tr>
				     <td colspan="2">
						<input type="submit" value="提交" />
					</td>
				</tr>
			</table>

		</form>
   </body>
</html>
