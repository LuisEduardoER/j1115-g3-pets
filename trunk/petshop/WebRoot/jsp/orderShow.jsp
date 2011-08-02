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
				if(od.getState()==4){
			%>
			<tr>
				<td><%=od.getOrderId() %></td>
				<td>
					<table>
						<%List<OrderedGoods> orderedgoods=os.getGoodsList();
							for(int j=0;j<orderedgoods.size();j++){ 
								OrderedGoods goods=orderedgoods.get(i);%>	
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
				<td>交易成功已评价</td>
				<td>无</td>
				<td><%=od.getTime() %></td>
			</tr>
			<% }
			}
			%>
		</table>

	</body>
</html>