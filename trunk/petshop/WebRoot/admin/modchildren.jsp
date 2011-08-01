<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib/common.jsp" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'modchildren.jsp' starting page</title>
	
  </head>
  
  <body onload="">
  	<html:form action="/updateChildren">
    <%
    	String cno = request.getParameter("cno");
    	String pno = request.getParameter("pno");
    	request.setAttribute("cno",cno);
    	request.setAttribute("pno",pno);
    	
     %>
  	 父编号<html:text property="cno" value="${cno}"></html:text><br>
  	 子编号<html:text property="pno" value="${pno}"></html:text><br>
     名称<html:text property="newname" styleId="newname" value=""></html:text><br>
     <html:submit value="修改"></html:submit>
 
    </html:form> 
  </body>
</html>
