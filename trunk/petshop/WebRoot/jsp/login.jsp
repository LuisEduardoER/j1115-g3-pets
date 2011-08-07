<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib/common.jsp"%>
<style>
<!--
.login{
	font-size:16px;
	width:500px;
	margin-left:auto;
	margin-right:auto;
}
.login input{
	font-size:16px;
}
.login table{
	padding:3px;
}
.login tr{
	padding:5px;
}
.login th{
	padding:5px;
}
.login td{
	padding:5px;
}
.login span{
	cursor:pointer;
	display:inline-block;
}
.authImg{
	padding:0px;
}
-->
</style>
<hr/>
<p align="center">
	<img src="<%=request.getContextPath()%>/resource/2.png"/>
</p>
<div class="login">
<html:form action="/login" method="post">
	<table>
		<tr>    
			<td>
				<bean:message key="jsp.username"/>:
			</td>
			<td colspan="2">
				<html:text property="username"/><html:errors property="username"/>
			</td>
		</tr>
		<tr>
			<td>
				<bean:message key="jsp.password"/>:
			</td>
			<td colspan="2">
				<html:password property="password"/><html:errors property="password"/>
			</td>
		</tr>
		<tr>
			<td>
				验证码:
			</td>
			<td>
				<input type="text" name="checknum" size="10" />
			</td>
			<td style="padding:0">
				<span id="authImg">
					<img src="/petshop/checkNum.do" onclick="imagechange()"/>
				</span>
				<font color="red">${msg}</font>
			</td>
		</tr>
		<tr>
			<td >
				<center>
					<input type="submit" class="button" value="登录 &raquo;" />
				</center>
			</td>
		</tr>
	</table>
</html:form>
</div>
<script type="text/javascript">
  function imagechange(){
        document.getElementById("authImg").innerHTML = "<img id='authImg' src='/petshop/checkNum.do?id="+(new Date()).toString()+"' onclick='imagechange()' />";
  }
</script>