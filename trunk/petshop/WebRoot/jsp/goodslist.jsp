<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../taglib/common.jsp" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'goodslist.jsp' starting page</title>
	<style>
<!--

.goodsdetail{
	padding-top:45px;
	padding-left:100px;
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
	font-size: 12px;
}

.goodsdetail table{
	border-spacing:3px;
	border-collapse:collapse;
	border-width:4px;
	border-color:#9FBE3F;
	border-style:double;
}
.goodsdetail td{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.goodsdetail tr{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.goodsdetail th{
	border:solid 1px #9FBE3F;
	padding:3px;
	text-align:center;
}
</style>
  </head>
  
  <body>
  <div class="goodsdetail">
  	<table >
  		<tr>
  			<th>商品编号</th>
  			<th>商品分类</th>
  			<th>商品名称</th>
  			<th>商品单价</th>
  			<th>商品简介</th>
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
    </div>
  </body>
</html>
