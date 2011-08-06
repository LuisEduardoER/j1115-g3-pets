<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/taglib/common.jsp"%>
<%@page import="cn.thepetshop.dao.CategoryJavaBean"%>


<style>
<!--
input{
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
	font-size: 12px;
}
.adminpcategory{
	padding-top:15px;
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
	font-size: 12px;
}
.adminpcategory a{
	font-weight:600;
	text-decoration:none;
	color:#69C;
}
.adminpcategory a:visited{
	color:#69C;
}
.adminpcategory a:hover{
	color:#333;
}
.adminpcategory table{
	border-spacing:3px;
	border-collapse:collapse;
	border-width:4px;
	border-color:#9FBE3F;
	border-style:double;
}
.adminpcategory td{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.adminpcategory tr{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.adminpcategory th{
	border:solid 1px #9FBE3F;
	padding:3px;
	text-align:center;
}
#showchildren {
	cursor: pointer;
	a: link : red;
}
-->
</style>

<link href="<%=request.getContextPath()%>/pages/css/rightcontent.css" rel="stylesheet" type="text/css" />

<hr />
<div class="adminpcategory">
<html:form action="/modPCategory" method="post">
	<table border="0" width="100%">
		<tr>
			<th>选择	</th>
			<th>编号	</th>
			<th>分类名称</th>
			<th>操作	</th>
		</tr>
		<tr>
			<%
				Object obj = request.getAttribute("parentList");
					if (obj != null) {
						List<CategoryJavaBean> list = (List)obj;
						for (CategoryJavaBean cjb : list) {
							pageContext.setAttribute("cjb", cjb);
			%>
			<td width="60px"><center><input type="radio" name="cjbnos" value="${cjb.cid }"></center></td>
			<td><center>${cjb.cid}</center></td>
			<td>${cjb.cname }</td>
			<td><a href="children.do?parentno=${cjb.cid }">显示子分类</a></td>
		</tr>

		<%
			}
				}
		%>
	</table> 
	父分类名称:
	<html:text property="newCategory" styleId="newCategory" value=""></html:text>
	<html:submit value="修改选中的分类"></html:submit>
</html:form>

<html:form action="/addPCategory" method="post">
    	 添加父分类:
		<html:text property="addCategory" styleId="addCategory" value=""></html:text>
		<html:submit value="添加分类"></html:submit>
</html:form>
</div>