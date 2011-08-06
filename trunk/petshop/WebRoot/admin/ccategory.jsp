<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib/common.jsp" %>
<%@page import="cn.thepetshop.dao.CategoryJavaBean"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'ccategory.jsp' starting page</title>
	<script type="text/javascript">
		var hqs_modifycc = null;
		
		function del(){
			var b = false;
			var chks = document.delCCategoryForm.cjbnos;
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
			return false;	
		}	
		var xmlhttp;
		
		function modchildren(pno,cno,tname){
		hqs_modifycc = tname;
		var text = document.getElementById(pno).value;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = callback;
		xmlhttp.open("post","updateChildren.do?pno="+cno+"&cno="+pno+"&text="+text,true);
		xmlhttp.send();
		document.getElementById(pno).value = "";
	}

		function callback() {
		if (xmlhttp.readyState == 4) {
		document.getElementById(hqs_modifycc).innerHTML="";
			var text = xmlhttp.responseText;
			document.getElementById(hqs_modifycc).innerHTML=text;	
		}
	}
	</script>
	
  </head>
  
  <style>
<!--
input{
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
	font-size: 12px;
}
.adminbutton{
	padding-left: 120px;
	padding-top:15px;
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
	font-size: 12px;
}
.adminccategory{
	padding-left: 120px;
	padding-top:15px;
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
	font-size: 12px;
}
.adminccategory a{
	font-weight:600;
	text-decoration:none;
	color:#69C;
}
.adminccategory a:visited{
	color:#69C;
}
.adminccategory a:hover{
	color:#333;
}
.adminccategory table{
	border-spacing:3px;
	border-collapse:collapse;
	border-width:4px;
	border-color:#9FBE3F;
	border-style:double;
}
.adminccategory td{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.adminccategory tr{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.adminccategory th{
	border:solid 1px #9FBE3F;
	padding:3px;
	text-align:center;
}

-->
</style>

  <body>
  <div class="adminccategory">
  <html:form action="/delCCategory" method="post" onsubmit="return del()" >
	
    	<table border="1" width="80%" style="border-collapse: collapse;">
    		<tr>
    			<th>选择</th>
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
					<td><input type="checkbox" name='cjbnos' value='${cjb.cid }' ></td> 
						<td>${cjb.pid} </td>
		    			<td>${cjb.cid}</td>
		    			<td id="${cjb.cname }">${cjb.cname }</td>
		    			
		    			<td>
						<html:text property="${cjb.pid }" styleId="${cjb.cid}" value=""></html:text>
		    			 <html:button property="mod" value="修改" onclick="modchildren(${cjb.cid },${cjb.pid},'${cjb.cname }')"></html:button>
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
	</div>
	<div class="adminbutton">
		<html:form action="/addCCategory.do?pno=${cjb.pid}" method="post">
    	 添加子分类:
    	 <html:text property="addCCategory" styleId="addCCategory" value=""></html:text>
    	 <html:submit value="添加分类"></html:submit>		
    	</html:form>
    </div>
</body>
</html>
