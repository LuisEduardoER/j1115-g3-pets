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
				<td>商品图片名称</td>
				<td>单价</td>
				<td>数量</td>
				<td>总价</td>
				<td>订单状态</td>
				<td>操作</td>
				<td>交易时间</td>
			</tr>
			<%for(int i=0;i<orderinfo.size();i++){ 
				OrderInfo os = orderinfo.get(i);
				Order od=os.getOrder();
			%>
			
				<tr>
					<td><%=od.getOrderId() %></td>
					<td>
					<table>
						<%List<OrderedGoods> orderedgoods=os.getGoodsList();
							for(int j=0;j<orderedgoods.size();j++){ 
								OrderedGoods goods=orderedgoods.get(i);
								int goodsid=goods.getGoodsid();
								request.setAttribute("goodsid",goodsid);
								%>	
						<tr>
							<img src = ""><%=goods.getGoodsName() %>
						</tr>	
					</table>
				</td>
				<td>
					<table>
						<tr>
							<%=goods.getGoodsPrice() %>
						</tr>
					</table>
				</td>
				<td>
					<table>
						<tr>
							<%=goods.getNum() %>
						</tr>
					</table>
				</td>
				<% }%>
				<td><%=os.getSumMoney() %></td>
					<%if(od.getState()==0) {%>
					<td>未付款未发货</td>
					<td><A href="PayJsp.jsp?orderid=<%=od.getOrderId() %>">付款</A></td>
					<%}%>
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
					<td><A href="evalute.jsp?orderid=<%=od.getOrderId()%>">评价</A></td>
					<%}%>
					<%if(od.getState()==5) {%>
					<td>未付款未发货</td>
					<td><A href="delete.do?orderid=<%=od.getOrderId() %>">取消订单</A></td>
					<%}%>
					<td><%=od.getTime() %></td>
			</tr>
			
			<%}
			%>
			
		</table>
	</body>
</html>