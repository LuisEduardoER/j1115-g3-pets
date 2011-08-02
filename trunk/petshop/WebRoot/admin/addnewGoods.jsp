<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib/common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加新商品</title>
  </head>
  
  <body>
  	<html:form action="/addNewGoods" method="post">
   	<table>
   		<tr>
   			<th colspan=2 align="center">添加商品</th>
   		</tr>
   		<tr>  		
   			<td>父分类</td>
   		<td>
   		<select name="cid" >
   			
   		<%
   			for(int i=0;i<10;i++){
   				out.println("<option value='"+i+"'>"+i+"</option>");
   			}
   		 %>
   		
   			</select>
		子分类
   		<html:select property="pid" value="">
   		<html:option value="1"></html:option>
   		</html:select>
		</td>
   	</tr>
   	<tr>
   		<td>商品名称</td>
   		<td>
			<html:text property="gname" value=""></html:text>
		</td>
   	</tr>
   
   	<tr>
   		<td>价格:</td>
   		<td>
   			<html:text property="gprice" value=""></html:text>元  
   		</td>
   	</tr>
   	<tr>
   		<td>商品数量:</td>
   		<td>
   			<html:text property="gnum" value=""></html:text>
   		</td>
   	</tr>
   		<tr>
   		<td>商品简介:</td>
   		<td>
   			<html:textarea property="gbrief" rows="8" cols="50" value=""></html:textarea>
   		</td>
   	</tr>
   	<tr>
   		<td colspan=2 align="center">
   		<html:submit value="添加"></html:submit>
		<html:reset value="重写"></html:reset>
   		</td>  		
   	</tr>
   </table>
   </html:form>
  </body>
</html>
