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
     
     ���ʽ��<br/>
     <html:form action="/pay" method="post">
     	<html:radio property="paytype" value="0">��������</html:radio>
     	<html:radio property="paytype" value="1">����</html:radio>
     	<html:radio property="paytype" value="2">��������</html:radio><br/>
     	<html:submit value="ȷ�ϸ���"></html:submit>
     </html:form>
  </body>
</html>
