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
<link href="<%=request.getContextPath()%>/pages/css/rightcontent.css" rel="stylesheet" type="text/css" />

<hr />
<div class="modAdminPass">
<html:form action="/modAdminPass">
	<table width="100%" border="0">
		<tr>
			<td width="100px;">原密码 :</td><td width="200px"><html:password property="oldPass"/><html:errors property="oldPass"/></td>
		</tr>
		<tr>
			<td>新密码 :</td><td><html:password property="newPass1"/><html:errors property="newPass1"/></td>
		</tr>
		<tr>
			<td>确认密码 :</td><td><html:password property="newPass2"/><html:errors property="newPass2"/></td>
		</tr>
	</table>
	<br/>
	<center><html:submit value="提交"/><html:cancel value="取消"/></center>
	<logic:present name="msg" scope="request">
		<br />
		<center style="color:red"><bean:write name="msg"/></center>
	</logic:present>
</html:form>
</div>

