<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../taglib/common.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodslist.jsp' starting page</title>
    
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
  <center>
  	<table border="1" bgcolor="#A1C037">
  		<tr>
  			<td>商品编号</td>
  			<td>商品分类</td>
  			<td>商品名称</td>
  			<td>商品单价</td>
  			<td>商品简介</td>
  		</tr>
    	<logic:present name="elist" scope="request">
    		<logic:iterate id="goods" name="elist">
    			<tr>
    				<td><bean:write name="goods" property="goodsid"/></td>
    				<td><bean:write name="goods" property="goodsCategory"/></td>
    				<td><bean:write name="goods" property="goodsName"/></td>
    				<td><bean:write name="goods" property="goodsPrice"/></td>
    				<td><bean:write name="goods" property="goodsBrief"/></td>
    			</tr>
    		</logic:iterate>
    	</logic:present>
    </table>
    </center>
  </body>
</html>
