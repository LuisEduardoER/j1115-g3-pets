<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cn.thepetshop.object.*"%>
<html>
	<head>
		<title>未交易成功</title>
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
			<%for(int i=0;i<orderinfo.size();i++){ 
				OrderInfo os = orderinfo.get(i);
				Order od=os.getOrder();
				if(od.getState()!=4){
			%>
			<tr>
				<td><a href="goods.do?orderid=<%=od.getOrderId() %>"><%=od.getOrderId() %></a></td>
				<td><%=od.getReceiver() %></td>
				<td><%=od.getAddress() %></td>
				<td><%=od.getPhone() %></td>
				<td><%=od.getMoney() %></td>
				<%if(od.getState()==0){ %>
					<td>未付款未发货</td>
					<td><a href="jsp/PayJsp.jsp?orderid=<%=od.getOrderId() %>">付款</a>||
					<A href="delete.do?orderid=<%=od.getOrderId() %>">取消订单</A></td>
				<%} %>
				<%if(od.getState()==1) {%>
					<td>已付款未发货</td>
					<td>等待发货</td>
				<%}%>
				<%if(od.getState()==2) {%>
					<td>已付款已发货</td>
					<td><A href="sure.do?orderid=<%=od.getOrderId() %>">确认收货</A></td>
				<%}%>
				<%if(od.getState()==3) {%>
					<td>已确认收货</td>
					<td><A href="pingJia.do?orderid=<%=od.getOrderId()%>">评价</A></td>
				<%}%>
				<td><%=od.getTime() %></td>
			</tr>
			<%	}
			} %>
	
			
		</table>
	</body>
</html>