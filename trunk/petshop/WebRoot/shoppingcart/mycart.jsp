<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.thepetshop.object.Cart" %>
<%@page import="cn.thepetshop.object.OrderedGoods" %>
<%@page import="java.util.List" %>
<%@include file="/taglib/common.jsp"%>

<script language="javascript" type="text/javascript">
	var request = null;
	var tempid = null;
	
	function createRequest() {//创建一个request
		try {
			request = new XMLHttpRequest();
		} catch (trymicrosoft) {
			try {
				request = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (othermicrosoft) {
				try {
					request = new ActiveObject("Microsoft.XMLHTTP");
				} catch (failed) {//如果都不行，则将request设置为null
					request = null;
				}
			}
		}
		if (request == null) {//如果没有得到request则报一个错误
			alert("Error");
		}
	}
 	
 	function reducenum(arg){
 		createRequest();
 		tempid = arg;
 		request.onreadystatechange = reducecallback;//每改变一次状态调用一次callback方法
		request.open("post", "ModifyAmountServlet?method=reduce&goodsid="+arg, true);//处理连接
		request.send(null);
 	}
 	
 	function addnum(arg){
 		createRequest();
 		tempid = arg;
 		request.onreadystatechange = addcallback;//每改变一次状态调用一次callback方法
		request.open("post", "ModifyAmountServlet?method=add&goodsid="+arg, true);//处理连接
		request.send(null);
 	}
 	
	function reducecallback() {
		if (request.readyState == 4) {
			var text = request.responseText;
			//得到servlet的输出，若为true则将id为umsg的内容改为用户已存在
			if ("true" == text) {
				var num = parseInt(document.getElementById(tempid).innerText);
				if(num == 0){
					return;
				}
				document.getElementById(tempid).innerHTML = num+1;
			}
		}
	}
	
	function addcallback() {
		if (request.readyState == 4) {
			var text = request.responseText;
			//得到servlet的输出，若为true则将id为umsg的内容改为用户已存在
			if ("true" == text) {
				var num = document.getElementById(tempid).innerText;
				document.getElementById(tempid).innerHTML = num-1;
			}
		}
	}
</script>

<form action="">
<table width=100% class="carttable">
	<tr>
		<th>商品号</th><th>名称</th><th>单价</th><th>数量</th>
	</tr>
	<%
		Cart cart = (Cart)request.getAttribute("cart");
		List<OrderedGoods> list = cart.getGoodsList();
		for(int i=0;i<list.size();i++){
			OrderedGoods og = list.get(i);
	%>
			<tr>
				<td><a href="GoodsPageServlet?goodsid=${og.goodsid}"><span id="cartgoodsid">${og.goodsid}</span></a></td>
				<td>${og.goodsName }</td>
				<td>${og.price }</td>
				<td><a onclick="reducenum('${og.goodsid}')">-</a><span id="${og.goodsid}">${og.num }</span><a onclick="addnum('${og.goodsid}')">+</a></td>
			</tr>
	<%
		}
	%>
	
	<tr>
		<td rowspan="3">商品总金额</td><td><span id="summoney"><%=cart.getSumMoney() %></span></td>
	</tr>
	<input type="submit" />
</table>
</form>