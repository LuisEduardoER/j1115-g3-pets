<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cn.thepetshop.object.OrderedGoods"%>

<style>
<!--
input {
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
}
.goodpingjia{
	padding-top:15px;
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
}

.goodpingjia table{
	border-spacing:3px;
	border-collapse:collapse;
	border-width:4px;
	border-color:#9FBE3F;
	border-style:double;
}
.goodpingjia td{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.goodpingjia tr{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.goodpingjia th{
	border:solid 1px #9FBE3F;
	padding:3px;
	text-align:center;
}

-->
</style>
<% 
	List<OrderedGoods> list = (List<OrderedGoods>)request.getAttribute("elist"); 
	int orderid=(Integer)request.getAttribute("orderid");
%>
<div class="goodpingjia">
	<form action="scort.do" method="post">
		<table>
			<tr>
				<th>商品编号</th>
				<th>商品名称</th>
				<th>商品简介</th>
				<th>商品评分</th>
			</tr>
				<%for(int i=0;i<list.size();i++){
					OrderedGoods og = list.get(i);
					%>
			<tr>
				<td><%=og.getGoodsid() %></td>
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
				<td colspan="4" align="center"><input type="submit" value="提交" /></td>
				<input type="hidden" name="orderid" value="<%=orderid %>" />
			</tr>
		</table>
	</form>
</div>
