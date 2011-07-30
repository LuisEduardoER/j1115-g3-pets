<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<h3>我的订单</h3>
<hr />
<table border="1" width=100%>
	<tr>
		<th>订单号</th>
		<th>收货人</th>
		<th>下单时间</th>
		<th>订单状态</th>
		<th>操作</th>
	</tr>
		<logic:present name="orderList">
			<logic:iterate id="order" name="orderList">
				<tr>
					<td><bean:write name="order" property="orderId"/></td>
					<td><bean:write name="order" property="receiver"/></td>
					<td><bean:write name="order" property="time"/></td>
					<logic:equal name="order" property="state" value="0">
						<td>等待付款</td>
						<td>
							<html:link action="" >修改</html:link>
							<html:link action="" >取消</html:link>
							<html:link action="" >付款</html:link>
						</td>
					</logic:equal>
					<logic:equal name="order" property="state" value="1">
						<td>等待发货</td>
						<td>
							<html:link action="" >取消</html:link>
						</td>
					</logic:equal>
					<logic:equal name="order" property="state" value="2">
						<td>已发货</td>
						<td>
							<html:link action="" >确认收货</html:link>
						</td>
					</logic:equal>
					<logic:equal name="order" property="state" value="3">
						<td>等待评价</td>
						<td>
							<html:link action="" >评价</html:link>
						</td>
					</logic:equal>
				</tr>
			</logic:iterate>
		</logic:present>
</table>
