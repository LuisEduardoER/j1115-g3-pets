<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib/common.jsp"%>


<style>
<!--
.usermsg{
	padding-top:100px;
	width:300px;
	margin-left:auto;
	margin-right:auto;
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
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
	font-weight: bold;
}
-->
</style>
<hr/>
<div class="usermsg">
	<logic:present name="user">
		<table width="100%">
			<tr>
				<th colspan="2" align="center"">会员个人信息</th>
			</tr>
       		<tr >
       			<td>用户编号：</td>
				<td><bean:write name="user" property="id" /></td>
			</tr>
			<tr>
				<td>用户名：</td>
				<td><bean:write name="user" property="username" /></td>
			</tr>
		</table>
	</logic:present>
</div>