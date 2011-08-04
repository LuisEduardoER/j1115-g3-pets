<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cn.thepetshop.object.OrderedGoods"%>
<html>
	<head>
		<title>商品评价</title>
	</head>
	<body>
		<% List<OrderedGoods> list = (List<OrderedGoods>)request.getAttribute("elist"); 
		   int orderid=(Integer)request.getAttribute("orderid");
		%>
		<form action="scort.do" method="post">
				<table>
					<tr>
						<TD>商品编号</TD>
						<td>商品名称</td>
						<td>商品简介</td>
						<td>商品评分</td>
					</tr>
					<%for(int i=0;i<list.size();i++){
						OrderedGoods og = list.get(i);
						%>
						<tr>
						<TD><%=og.getGoodsid() %></TD>
						<td><%=og.getGoodsName() %></td>
						<td><%=og.getGoodsBrief() %></td>
						<td>
							<input type="radio" name="<%=i%>" value="1"/>1分
							<input type="radio" name="<%=i %>" value="2"/>2分
							<input type="radio" name="<%=i %>" value="3"/>3分
							<input type="radio" name="<%=i %>" value="4"/>4分
							<input type="radio" name="<%=i %>" value="5"/>5分
							<input type="hidden" name="pro<%=i %>" value="<%=og.getGoodsid() %>">
						</td>
					</tr>
					<%} %>
					<tr>
						<td colspan="4" align="center"><input type="submit" value="提交"></td>
					</tr>
					<input type="hidden" name="orderid" value="<%=orderid %>" />
			</table>
		</form>
	</body>
</html>