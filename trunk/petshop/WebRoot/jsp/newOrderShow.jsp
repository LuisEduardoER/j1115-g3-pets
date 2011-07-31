<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cn.thepetshop.object.OrderShow"%>
<html>
	<head>
		<title>未交易成功</title>
	</head>
	<body>
		<%
			List<OrderShow> orderShows = (List<OrderShow>)request.getAttribute("list") ;
		%>
		<table>
			<tr>
				<td>订单编号</td>
				<td>商品图片名称</td>
				<td>单价</td>
				<td>数量</td>
				<td>总价</td>
				<td>订单状态</td>
				<td>操作</td>
				<td>交易时间</td>
			</tr>
			
			
			<%for(int i=0;i<orderShows.size();i++){ 
				OrderShow os = orderShows.get(i);
			%>
			
				<tr>
					<td><%=os.getOrderId() %></td>
					<td><img src = ""><%=os.getProName() %></td>
					<td><%=os.getPrice() %></td>
					<td><%=os.getNumb() %></td>
					<td><%=os.getSumMoney() %></td>
					<%if(os.getTradeStatus()==0) {%>
					<td>未付款未发货</td>
					<td><A href="PayJsp.jsp?orderid=<%=os.getOrderId() %>">付款</A></td>
					<%}%>
					<%if(os.getTradeStatus()==1) {%>
					<td>已付款未发货</td>
					<td>等待发货</td>
					<%}%>
					<%if(os.getTradeStatus()==2) {%>
					<td>已付款已发货</td>
					<td><A href="sure.do?orderid=<%=os.getOrderId() %>">确认收货</A></td>
					<%}%>
					<%if(os.getTradeStatus()==3) {%>
					<td>已确认收货</td>
					<td><A href="evalute.jsp?orderid=<%=os.getOrderId() %>">评价</A></td>
					<%}%>
					<%if(os.getTradeStatus()==5) {%>
					<td>未付款未发货</td>
					<td><A href="delete.do?orderid=<%=os.getOrderId() %>">取消订单</A></td>
					<%}%>
					<td><%=os.getXiaDanDate() %></td>
			</tr>
			
			<%}
			%>
			
		</table>
	</body>
</html>