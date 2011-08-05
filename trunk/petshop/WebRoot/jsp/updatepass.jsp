<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'updatepass.jsp' starting page</title>
    
    <style type="text/css">
		table{
			border-collapse: collapse;
			border-style: solid;
			border-color: #999;
			width: 400px;
		}
		td {
			border-style: solid;
			border-color: #999;
			padding-left: 10px;
		}
		th{
			border-style: solid;
			border-color: #999;
			text-align: right;
			padding: 5px;
			width: 100px;
		}
	</style>
 </head>
  
  <body>
     <div align="center">
			<h3> 
				&gt;&gt;修改密码
			</h3>
			<font size="3" color="red">
			
			</font>
			<form action="/petshop/updateUserPass.do"  method="post">
				<table border="1px;">
					<tr>
						<th>
							原始密码
						</th>
						<td>
							<input type="text" name="oldpass" />
						</td>
					</tr>
					<tr>
						<th>
							新密码
						</th>
						<td>
							<input type="text" name="newpass" />
						</td>
					</tr>
					<tr>
						<th>
							确认密码
						</th>
						<td>
							<input type="text" name="newpass1" />
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value=" 提交 " />
						</td>
					</tr>
				</table>
			</form>
				
  </body>
</html>
