<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.thepetshop.object.*"%>
<%@page import="cn.thepetshop.object.OrderShow"%>
<%@page import="java.util.List"%>
<html>
	<head>
		<title>订单显示</title>
<style>
<!--
*{
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
	font-size: 12px;
}
.oldordershow{
	padding-top:45px;
	padding-left: 100px;
}
.oldordershow a{
	font-weight:600;
	text-decoration:none;
	color:#69C;
}
.oldordershow a:visited{
	color:#69C;
}
.oldordershow a:hover{
	color:#333;
}
.oldordershow table{
	border-spacing:3px;
	border-collapse:collapse;
	border-width:4px;
	border-color:#9FBE3F;
	border-style:double;
	text-align:center;
}
.oldordershow td{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.oldordershow tr{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.oldordershow th{
	border:solid 1px #9FBE3F;
	padding:3px;
	text-align:center;
}

-->
</style>
	</head>
	<body >
		<div class="oldordershow">
		<%
			List<OrderInfo> orderinfo = (List<OrderInfo>)request.getAttribute("list") ;
		%>
		<table >
			<tr>
				<td>订单编号</td>
				<td>收货人</td>
				<td>收货地址</td>
				<td>收货人电话</td>
				<td>订单总价</td>
				<td>订单状态</td>
				<td>操作</td>
				<td>下单时间</td>
			</tr>
			<%
				for(int i=0;i<orderinfo.size();i++){
					OrderInfo os=orderinfo.get(i);
					Order order=os.getOrder();
					if(order.getState()==4){%>
			<tr>
				<td><a href="goods.do?orderid=<%=order.getOrderId() %>"><%=order.getOrderId() %></a></td>
				<td><%=order.getReceiver() %></td>
				<td><%=order.getAddress() %></td>
				<td><%=order.getPhone() %></td>
				<td><%=order.getMoney() %></td>
				<td>交易成功已评价</td>
				<td>无</td>
				<td><%=order.getTime() %></td>
			</tr>
				<%	}				
				}
			 %>
		
		</table>
	</div>
	</body>
</html>