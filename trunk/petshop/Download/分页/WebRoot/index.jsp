<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.java.dao.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    This is my JSP page. <br>
    
    <%
    	//pageContext.setAttribute("ename","a1");
    	//request.setAttribute("ename","a2");
    	//session.setAttribute("ename","a3");
    	//application.setAttribute("ename","a4");
    	
    	User u = new User();
    	u.setUname("smith");
    	//pageContext.setAttribute("user",user);
    	List list = new ArrayList();
    	list.add("aaa");
    	list.add("bbb");
    	list.add(u);
    	
    	pageContext.setAttribute("list",list);
    	
    	Map map = new HashMap();
		map.put("username","zhangshan");
		map.put("password","123456");
		request.setAttribute("map",map);
		
		request.setAttribute("sal","100");
    	
     %>
     <jsp:useBean id="user" class="com.java.dao.User" scope="page" />
     <jsp:setProperty property="uname" name="user" value="scott"/>
     ${sal+2 }
     ${user.uname }
     ${list[1]}
     <br>
     ${list[2]["uname"] }
     <br>
     ${map["password"] }
  </body>
</html>
