<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/jsp/taglib/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'regist.jsp' starting page</title>
   </head>
  
  <body>
      <div align="right">
		<html:form action="/register">
				<html:text property="username" />
				<html:password property="password" />
				<html:submit  value="Regist"/>
		</html:form>
	</div>
  </body>
</html>
