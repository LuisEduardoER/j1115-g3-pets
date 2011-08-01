<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>收货人资料</title>
	</head>

	<body>
		<html:form action="/submitOrder" method="post">
		收货信息：
			<table>
				<tr>
					<td width="80px">收件人</td>
					<td><input name="receiver" type="text" style="width: 100px" /></td>
				</tr>
				<tr>
					<td width="80px">地址</td>
					<td><input name="address" type="text" style="width: 400px" /></td>
				</tr>
				<tr>
					<td width="80px">联系电话</td>
					<td><input name="phone" type="text" style="width: 400px" /></td>
				</tr>
			</table>
			<br />
			<input type="button" value="提交" />
		</html:form>
	</body>
</html>
