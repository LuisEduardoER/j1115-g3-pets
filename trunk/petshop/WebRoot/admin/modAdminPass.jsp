<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../taglib/common.jsp" %>
 
<html> 
	<head>
		<title>JSP for ModAdminPassForm form</title>
	</head>
	<body>
		<html:form action="/modAdminPass">
			原密码 : <html:password property="oldPass"/><html:errors property="oldPass"/><br/>
			新密码 : <html:password property="newPass1"/><html:errors property="newPass1"/><br/>
			确认密码 : <html:password property="newPass2"/><html:errors property="newPass2"/><br/>
			<html:submit value="提交"/><html:cancel value="取消"/>
			<logic:present name="msg" scope="request">
				<bean:write name="msg"/>
			</logic:present>
			
		</html:form>
	</body>
</html>

