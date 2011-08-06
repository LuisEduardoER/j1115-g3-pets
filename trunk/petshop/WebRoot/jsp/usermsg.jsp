<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib/common.jsp"%>


<html>
  <head>
    <title>My JSP 'usermsg.jsp' starting page</title>
    <style>
<!--
.usermsg{
	padding-top:45px;
	padding-left: 140px;
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
	font-size: 12px;
}

.usermsg table{
	border-spacing:3px;
	border-collapse:collapse;
	border-width:4px;
	border-color:#9FBE3F;
	border-style:double;
	text-align:center;
}
.usermsg td{
	border:solid 1px #9FBE3F;
	padding:1px;
}
.usermsg tr{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.usermsg th{
	border:solid 1px #9FBE3F;
	padding:3px;
	text-align:center;
}

-->
</style>
  </head>
  
  <div class="usermsg">
  <logic:present name="user">
       <form action="" method="post">
       	<table border="2" width="60%" class="table" >
       		<tr >
       		 <th colspan="2" align="center"">会员个人信息</th>
       		 </tr>
       		<tr >
       		<td>
				用户编号：
			</td>
			<td>
				<bean:write name="user" property="id" />
			</td>
			</tr>
			<tr>
			<td >
				姓名：
			</td>
			<td>
				<bean:write name="user" property="username" />
			</td>
		   </tr>
		<tr>
			<td>
				密码：
			</td>
			<td>
				<bean:write name="user" property="password" />
			</td>
		</tr>
		<tr>
			<td>
				用户身份：
			</td>
			<td>
				<bean:write name="user" property="identity" />
			</td>
		</tr>
		<tr>
			<td>
				用户余额：
			</td>
			<td>
				<bean:write name="user" property="money" />
			</td>
		</tr>
	</table>
       </form>
</logic:present>
</div>
</html>
