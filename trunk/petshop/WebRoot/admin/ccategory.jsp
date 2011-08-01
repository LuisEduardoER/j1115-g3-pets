<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib/common.jsp" %>
<%@page import="cn.thepetshop.dao.CategoryJavaBean"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'ccategory.jsp' starting page</title>
	<script type="text/javascript">
		function del(){
			var b = false;
			var chks = document.delForm.cjbnos;
			for(i=0;i<chks.length;i++){
				if(chks[i].checked)
					b = true;
			}
			if(b){
				if(confirm("您是否要删除")){
					return true;
				}else{
					return false;
				}
			}else{
				alert("请选择要删除的选项");
				return false;
			}		
		}	
	
	</script>
  </head>
  
  <body>
  <html:form action="/delCCategory" method="post" onsubmit="del()" >
	
    	<table border="1" width="80%" style="border-collapse: collapse;">
    		<tr>
    			<th>父编号</th>
    			<th>子编号</th>
    			<th>分类名称</th>
    			<th colspan="2">操作</th>
    		</tr>
		    	<tr>
		    		<%
		    			Object obj = request.getAttribute("childrenList");
		        		if(obj!=null){
		        			List<CategoryJavaBean> list = (List)obj;
		        			for(CategoryJavaBean cjb : list){
		        				pageContext.setAttribute("cjb",cjb);
					%>	  
						<td>${cjb.pid} </td>
		    			<td>${cjb.cid}</td>
		    			<td>${cjb.cname }</td>
		    			<td width="100"><input type="checkbox" name='cjbnos' value='${cjb.cid }' >删除时勾选</td>
		    			<td>
		    		
		    			<input type="text" id="newname" name="newname">
		    			<!-- 
		    			<a href="UpdateChildrenServlet?pno=${cjb.cid }&cno=${cjb.pid}">修改</a>
		    			 -->
		    			<a href="admin/modchildren.jsp?pno=${cjb.cid }&cno=${cjb.pid}">修改</a>
		    			 
		    			</td>
		    			

		    		</tr>
    	
                   <%		
    					}
		        	}
    	 			%>	
    		
    	</table>
    	<html:hidden property="parno" value="${cjb.pid}"/>
    	<html:submit value="删除选中的分类"></html:submit>
    	</html:form>

		<html:form action="/addCCategory.do?pno=${cjb.pid}" method="post">
    	 添加子分类:
    	 <html:text property="addCCategory" styleId="addCCategory" value=""></html:text>
    	 <html:submit value="添加分类"></html:submit>		
    	</html:form>
</body>
</html>
