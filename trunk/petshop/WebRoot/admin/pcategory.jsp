<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%><%@page import="cn.thepetshop.dao.CategoryJavaBean"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>分类管理</title>
	
  </head>
  
  <body>
  <form action="ModPCategoryServlet" method="post" >
    	<table border="1" width="80%" style="border-collapse: collapse;">
    		<tr>
    			<th>编号</th>
    			<th>分类名称</th>
    			<th>操作</th>
    		</tr>
		    	<tr>
		    		<%
		    			Object obj = request.getAttribute("parentList");
		        		if(obj!=null){
		        			List<CategoryJavaBean> list = (List)obj;
		        			for(CategoryJavaBean cjb : list){
		        				pageContext.setAttribute("cjb",cjb);
					%>	  
		    			<td>${cjb.cid}</td>
		    			<td>${cjb.cname }</td>
		    			<td><input type='radio' name='cjbnos' value='${cjb.cid }' ></td>
		    		</tr>
    	
                   <%		
    					}
		        	}
    	 			%>	
    		
    	</table>
    	  
    	父分类名称:<input type="text" id="newCategory" name="newCategory">
    	 <input type="submit"" value="修改选中的分类" />
    	</form>
    	<form action="AddPCategoryServlet" method="post">
    	 添加父分类:<input type="text" id="addCategory" name="addCategory">
    	 		  <input type="submit" value="添加分类">
    	</form>
  </body>
</html>
