<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@include file="/taglib/common.jsp"%>	

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>  
    <title>My JSP 'header.jsp' starting page</title>  
  </head>
  
  <body>
  	<div align="right">
		<html:form action="/login">
				<html:text property="username" />
				 <html:password property="password" />
				<html:submit  value="Login"/><a href="zhuce.jsp">Regist</a>
		</html:form>
	</div>
  </body>
  
</html>
