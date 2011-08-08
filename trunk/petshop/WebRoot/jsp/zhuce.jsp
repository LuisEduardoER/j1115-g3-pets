<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib/common.jsp"%>
<head>
	 <title>用户注册</title>
</head>
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
   	function checknull(){
   		var name = document.getElementById("username").value;
   		var pass1 = document.getElementById("password").value;
   		var pass2 = document.getElementById("password2").value;
   		if(name=="" || pass1=="" || pass2==""){
   			return false;
   		}else{
   			return true;
   		}
   	}
</script>
<style type="text/css">
.regpage {
	font-family: "Courier New", "Comic Sans MS", 微软雅黑, 黑体;
	font-size: 14px;
}

input {
	font-family: "Courier New", "Comic Sans MS", 微软雅黑, 黑体;
	font-size: 14px;
}
</style>
<hr/>
<p align="center">
	<img src="<%=request.getContextPath()%>/resource/dog2.jpg" />
</p>

<br>
<div class="regpage">
	<form action="/petshop/regist.do" name="regform" method="post" onsubmit="return checknull()">
		<table align="center" width="360px">
			<tr>
				<td width="80px">
					用户名：
				</td>
				<td>
					<input type="text" id="username" name="username" onblur="check()" />
					<span style="font-size: 12px; color: red" id="umsg"></span>
				</td>
			</tr>
			<tr>
				<td>
					密码：
				</td>
				<td>
					<input type="password" id="password" name="password" />
				</td>
			</tr>
			<tr>
				<td>
					确认密码：
				</td>
				<td>
					<input type="password" id="password2" name="password2" onkeyup="validate()" />
					<span id="tishi" style="font-size: 12px;"></span>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="注册" id="submit" />
				</td>
			</tr>
		</table>
		<input type="radio" style="display: none;" name="remember" />
		${regmsg }
	</form>
</div>
