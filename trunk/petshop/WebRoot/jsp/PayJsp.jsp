<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'PayJsp.jsp' starting page</title>
  </head>
  
  <body>
   		<%String orderid = request.getParameter("orderid");
   		request.setAttribute("orderid",orderid);
   			
   		 %>
     
     ���ʽ��<br>
     	<a>��������</a>
     	<a href="pay.do">����</a>
     	<A href="paySucceed.jsp">��������</A><br/>
  	
  </body>
</html>
