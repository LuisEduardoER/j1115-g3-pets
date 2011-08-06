<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib/common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'updatepass.jsp' starting page</title>
    
 <style>
<!--
table{
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
	font-size: 12px;
	border-color:#9FBE3F;
	border-style:double;
}
input {
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
	font-size: 12px;
}
.moduserpass{
	margin-top:100px;
	margin-left:auto;
	margin-right:auto;
	width:300px;
}
.moduserpass td{
	height:30px;
}
.moduserpass th{
	padding-left: 130px;
}
.moduserpass input text{
	width:190px;
}

-->
</style>
 </head>
  
  <body>
     <div class="moduserpass">
			
			<form action="/petshop/updateUserPass.do"  method="post">
				<table border="2" width="100%">
				<tr>
					<th colspan="2"> 
						修改密码
					</th>
				</tr>
					<tr>
						<td>
							原始密码
						</td>
						<td>
							<input type="text" name="oldpass" />
						</td>
					</tr>
					<tr>
						<td>
							新密码
						</td>
						<td>
							<input type="text" name="newpass" />
						</td>
					</tr>
					<tr>
						<td>
							确认密码
						</td>
						<td>
							<input type="text" name="newpass1" />
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center"">
							<input type="submit" value=" 提交 " />
						</td>
					</tr>
				</table>
			</form>
		</div>		
  </body>
</html>
