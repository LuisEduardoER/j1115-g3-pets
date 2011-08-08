<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/taglib/common.jsp" %>
<style>
<!--

.modAdminPass{
	margin-top:100px;
	margin-left:auto;
	margin-right:auto;
	width:300px;
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
}
.modAdminPass td{
	height:30px;
}
.modAdminPass input{
	width:190px;
}
.modAdminPass center input{
	width:80px;
}
-->
</style>
<script type="text/javascript">
	function checkpass(){
		var oldPass = document.getElementById("oldPass").value;
		var newPass1 = document.getElementById("newPass1").value;
		var newPass2 = document.getElementById("newPass2").value;
		if(oldPass=="" || newPass1=="" || newPass2==""){
			alert("您还有密码要输入");
			return false;
		}
	}
</script>
<link href="<%=request.getContextPath()%>/pages/css/rightcontent.css" rel="stylesheet" type="text/css" />

<hr />
<div class="modAdminPass">
<html:form action="/modAdminPass" onsubmit="return checkpass()">
	<table width="100%" border="0">
		<tr>
			<td width="100px;">原密码 :</td><td width="200px"><html:password property="oldPass" styleId="oldPass"/><html:errors property="oldPass"/></td>
		</tr>
		<tr>
			<td>新密码 :</td><td><html:password property="newPass1" styleId="newPass1"/><html:errors property="newPass1"/></td>
		</tr>
		<tr>
			<td>确认密码 :</td><td><html:password property="newPass2" styleId="newPass2"/><html:errors property="newPass2"/></td>
		</tr>
	</table>
	<br/>
	<center><html:submit value="提交"/></center>
	<logic:present name="msg" scope="request">
		<br />
		<center style="color:red"><bean:write name="msg"/></center>
	</logic:present>
</html:form>
</div>

