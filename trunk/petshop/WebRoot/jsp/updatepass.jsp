<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/taglib/common.jsp" %>

<style>
.moduserpass{
	padding-top:100px;
	padding-left:240px;
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
	font-size: 14px;
}

.moduserpass table{
	border-spacing:3px;
	border-collapse:collapse;
	border-width:4px;
	border-color:#9FBE3F;
	border-style:double;
}

.moduserpass td{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.moduserpass th{
	text-align:center;
	font-weight:bold;
}
.moduserpass tr{
	border:solid 1px #9FBE3F;
	padding:3px;
}
</style>
<hr/>
<div class="moduserpass" >
	<form action="/petshop/updateUserPass.do"  method="post">
		<table border="0" width="300px">
			<tr>
				<th colspan="2">修改密码</th>
			</tr>
			<tr>
				<td>原始密码</td>
				<td><input type="text" name="oldpass" /></td>
			</tr>
			<tr>
				<td>新密码</td>
				<td><input type="text" name="newpass" /></td>
			</tr>
			<tr>
				<td>确认密码</td>
				<td><input type="text" name="newpass1" /></td>
			</tr>
			<tr>
				<td colspan="2"><center><input type="submit" value="提交 " /></center></td>
			</tr>
		</table>
	</form>
</div>