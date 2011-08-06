<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cn.thepetshop.object.*"%>

<style>
<!--

.newordershow{
	padding-top:45px;
	padding-left: 100px;
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
	font-size: 12px;
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
<hr />
<div class="newordershow">
		<%
			List<OrderInfo> orderinfo = (List<OrderInfo>)request.getAttribute("list");
		%>
		<table width="100%">
			<tr>
				<th>订单编号</th>
				<th>收货人</th>
				<th>收货地址</th>
				<th>收货人电话</th>
				<th>订单总价</th>
				<th>订单状态</th>
				<th>操作</th>
				<th>下单时间</th>
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
					<td>等待付款</td>
					<td>
						<a href="userPay.do?orderid=<%=od.getOrderId() %>">付款</a>|
						<a href="delete.do?orderid=<%=od.getOrderId() %>">取消</a>
					</td>
				<%}%>
				<%if(od.getState()==1) {%>
					<td>未发货</td>
					<td>等待发货</td>
				<%}%>
				<%if(od.getState()==2) {%>
					<td>已发货</td>
					<td><a href="sure.do?orderid=<%=od.getOrderId() %>">确认收货</a></td>
				<%}%>
				<%if(od.getState()==3) {%>
					<td>等待评价</td>
					<td><a href="pingJia.do?orderid=<%=od.getOrderId()%>">评价</a></td>
				<%}%>
				<td><%=od.getTime() %></td>
			</tr>
			<%	}
			} %>
	</table>
</div>