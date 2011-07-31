<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.thepetshop.object.Order"%>
<%@page import="cn.thepetshop.object.OrderShow"%>
<%@page import="java.util.List"%>
<html>
	<head>
		<title>订单显示</title>
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
				if(os.getTradeStatus()==4){
			%>
			
			<tr>
				<td><%=os.getOrderId() %></td>
				<td><img src = ""><%=os.getProName() %></td>
				<td><%=os.getPrice() %></td>
				<td><%=os.getNumb() %></td>
				<td><%=os.getSumMoney() %></td>
				<td>交易成功已评价</td>
				<td>无</td>
				<td><%=os.getXiaDanDate() %></td>
			</tr>
			
			<%}
			}
			%>
			
		</table>

	</body>
</html>