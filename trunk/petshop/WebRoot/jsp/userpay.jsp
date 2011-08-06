<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib/common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'userpay.jsp' starting page</title>
	 <style>
<!--
input{
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
}

.userpay{
	padding-left: 240px;
	padding-top:100px;
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
}

.userpay table{
	border-spacing:3px;
	border-collapse:collapse;
	border-width:4px;
	border-color:#9FBE3F;
	border-style:double;
}
.userpay td{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.userpay tr{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.userpay th{
	border:solid 1px #9FBE3F;
	padding:3px;
	text-align:center;
}

-->
</style>

<%
  String oid = (String)request.getAttribute("hqs_oid");
%>
<div class="userpay">
	<html:form action="/pay" method="post">
		<table width="60%">
			<tr>
				<th colspan="3"> 付款方式</th>
			</tr>
			<tr>
				<td>
					<html:hidden property="orderid" value="<%=oid %>"/>
					<html:radio property="paytype" value="0">网银付款</html:radio>
				</td>
				<td><html:radio property="paytype" value="1">余额付款</html:radio></td>
				<td><html:radio property="paytype" value="2">货到付款</html:radio></td>
			</tr>
			<tr>
				<td colspan="3" align="center""><html:submit value="确认付款"></html:submit></td>
			</tr>
		</table>
	</html:form>
</div>

