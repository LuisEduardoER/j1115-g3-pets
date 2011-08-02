<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../taglib/common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'PayJsp.jsp' starting page</title>
  </head>
  
  <body>
   		<%String orderid = request.getParameter("orderid");
   		request.setAttribute("orderid",orderid);
   		 %>
     
     付款方式：<br/>
     <html:form action="/pay" method="post">
     	<html:radio property="paytype" value="0">网银付款</html:radio>
     	<html:radio property="paytype" value="1">余额付款</html:radio>
     	<html:radio property="paytype" value="2">货到付款</html:radio><br/>
     	<html:submit value="确认付款"></html:submit>
     </html:form>
  </body>
</html>
