<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.thepetshop.object.*"%>
<%@page import="cn.thepetshop.object.OrderShow"%>
<%@page import="java.util.List"%>
<html>
	<head>
		<title>订单显示</title>
	</head>
	<body>
		<%
			List<OrderInfo> orderinfo = (List<OrderInfo>)request.getAttribute("list") ;
		%>
		<table>
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
				<td><%=os.getSumMoney() %></td>
				<td>交易成功已评价</td>
				<td>无</td>
				<td><%=order.getTime() %></td>
			</tr>
				<%	}				
				}
			 %>
		</table>
	</body>
</html>