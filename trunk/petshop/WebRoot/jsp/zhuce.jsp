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
		function validate() {
              var pw1 = username=document.regform.password.value;
              var pw2 =username=document.regform.password2.value;
              if(pw1 == pw2) {
                  document.getElementById("tishi").innerHTML="<font color='green'>两次密码相同</font>";
                  document.getElementById("submit").disabled = false;
              }
              else {
                  document.getElementById("tishi").innerHTML="<font color='red'>两次密码不相同</font>";
                document.getElementById("submit").disabled = true;
              }
          }
	   
	</script>
   </head>
           <p align="center">
					<img src="<%=request.getContextPath()%>/resource/line.png"/>
				</p>
  <body >
    
		<br>
		<form action="/petshop/regist.do" name="regform" method="post" >
			<table width="60%" align="center">
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
						<input type="password" name="password" />
					</td>
				</tr>
				<tr>
					<td>
						确认密码：
					</td>
					<td>
						<input type="password" name="password2" onkeyup="validate()"/><span id="tishi">
					</td>
				</tr>
				     <td colspan="2">
						<input type="submit" value="注册 &raquo" id="submit"/>
					</td>
				</tr>
			</table>

		</form>
   </body>
</html>
