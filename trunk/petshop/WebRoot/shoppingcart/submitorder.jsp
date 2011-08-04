<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/taglib/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>填写订单信息</title>
	</head>
	
	<body>
		<html:form action="/submitOrder" method="post">
		收货信息：
			<table>
				<tr>
					<td width="80px">收件人</td>
					<td><input name="receiver" type="text" style="width: 100px" /><span id="receiver"/></span>
				</tr>
				<tr>
					<td width="80px">地址</td>
					<td><input name="address" type="text" style="width: 400px" /><span id="address"/></span>
				</tr>
				<tr>
					<td width="80px">联系电话</td>
					<td><input name="phone" type="text" style="width: 400px" /><span id="phone"/></span>
				</tr>
			</table>
			<br />
		付款方式：
			<input type="radio" name="pay" value="0"/>网银付款
			<input type="radio" name="pay" value="1"/>余额付款
			<input type="radio" name="pay" value="2"/>货到付款
			<span id="payment"></span>
			<br />
		订单信息：
			<table border="1">
				<tr>
					<th>商品号</th><th>名称</th><th>单价</th><th width="200">数量</th>
				</tr>
				<logic:present name="orderedGoodsList" >
					<logic:iterate id="orderedGoods" name="orderedGoodsList">
						<tr>
							<td><bean:write name="orderedGoods" property="goodsid"/></td>
							<td><bean:write name="orderedGoods" property="goodsName"/></td>
							<td><bean:write name="orderedGoods" property="goodsPrice"/></td>
							<td><bean:write name="orderedGoods" property="num"/></td>
						</tr>
					</logic:iterate>
					<tr>
						<td colspan="2">总金额</td><td colspan="2"><bean:write name="summoney"/></td>
					</tr>
				</logic:present>
			</table>
			<html:submit value="提交" onclick="return orderformcheck()" ></html:submit>
		</html:form>
		<script type="text/javascript">
			function orderformcheck(){
				var receiver = document.getElementById("address");
				var diadd = document.getElementById("address");
				var diadd = document.getElementById("address");
			}
		</script>
	</body>
</html>
