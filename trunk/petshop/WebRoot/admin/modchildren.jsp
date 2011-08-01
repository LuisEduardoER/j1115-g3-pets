<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'modchildren.jsp' starting page</title>
	
  </head>
  
  <body>
    <%
    	String cno = request.getParameter("cno");
    	String pno = request.getParameter("pno");
    	out.println("父编号<input type='text' name='cno' value="+cno+">");
    	out.println("<br>");
    	out.println("子编号<input type='text' name='pno' value="+pno+">");
    	out.println("<br>");
    	out.println("<input type='text' name='newname'/><br>");
    	out.println("<br>");
    	out.println("<input type='button' value='修改'>");
     %>
     
     
  </body>
</html>
