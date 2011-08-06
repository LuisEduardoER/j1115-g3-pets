<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cn.thepetshop.object.*"%>
<html>
	<head>
		<title>未交易成功</title>
<style>
<!--
*{
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
	font-size: 12px;
}
.newordershow{
	padding-top:45px;
	padding-left: 100px;
}
.newordershow a{
	font-weight:600;
	text-decoration:none;
	color:#69C;
}
.newordershow a:visited{
	color:#69C;
}
.newordershow a:hover{
	color:#333;
}
.newordershow table{
	border-spacing:3px;
	border-collapse:collapse;
	border-width:4px;
	border-color:#9FBE3F;
	border-style:double;
	text-align:center;
}
.newordershow td{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.newordershow tr{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.newordershow th{
	border:solid 1px #9FBE3F;
	padding:3px;
	text-align:center;
}

-->
</style>
	</head>
	<body >
		<div class="newordershow">
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
		</div>
	</body>
</html>