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
<script type="text/javascript">
	function checkpass(){
		var oldPass = document.getElementById("oldpass").value;
		var newPass1 = document.getElementById("newpass").value;
		var newPass2 = document.getElementById("newpass1").value;
		if(oldPass=="" || newPass1=="" || newPass2==""){
			alert("您还有密码要输入");
			return false;
		}
	}
</script>
<hr/>
<div class="moduserpass" >
	<form action="/petshop/updateUserPass.do"  method="post" onsubmit="return checkpass()">
		<table border="0" width="300px">
			<tr>
				<th colspan="2">修改密码</th>
			</tr>
			<tr>
				<td>原始密码</td>
				<td><input type="password" name="oldpass" id="oldpass"/></td>
			</tr>
			<tr>
				<td>新密码</td>
				<td><input type="password" name="newpass" id="newpass"/></td>
			</tr>
			<tr>
				<td>确认密码</td>
				<td><input type="password" name="newpass1" id="newpass1"/><font color="red">${msg}</font></td>
			</tr>
			<tr>
				<td colspan="2"><center><input type="submit" value="提交 " /></center></td>
			</tr>
		</table>
	</form>
</div>