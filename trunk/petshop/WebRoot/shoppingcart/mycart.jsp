<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.thepetshop.object.Cart" %>
<%@page import="cn.thepetshop.object.OrderedGoods" %>
<%@page import="java.util.List" %>
<%@include file="/taglib/common.jsp"%>

<script language="javascript" type="text/javascript">

	var request = null;
	var marg = null;
	
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
 	
 	function modify(arg){
 		createRequest();
 		marg = arg;
 		if(document.getElementById(arg).value<0){
 			document.getElementById('msg'+arg).innerHTML = "商品数不能小于0";
 			setTimeout('hidemsg()',1000);
 			return;
 		}
 		if(isNaN(document.getElementById(arg).value)){
 			document.getElementById('msg'+arg).innerHTML = "请输入数字";
 			setTimeout('hidemsg()',1000);
 			return;
 		}
 		var num = document.getElementById(arg).value;
 		request.onreadystatechange = callback;//每改变一次状态调用一次callback方法
		request.open("post", "ModifyAmountServlet?newnum="+num+"&goodsid="+arg+"&rn="+Math.random(), true);//处理连接
		request.send(null);
 	}
 	
	function callback() {
		if (request.readyState == 4) {
			var text = request.responseText;
			var tempid = "msg"+marg;
			var di = document.getElementById(tempid);
			if ("changesuccess" == text) {
				di.innerHTML = "修改成功";
				recount();
			}else if("unchange" == text){
				di.innerHTML = "商品数量未修改";
			}else if(!isNaN(text)){//判断是否是数字
				di.innerHTML = "库存不足，只剩" + text + "件";
			}else{
				di.innerHTML = "修改失败";
			}
			setTimeout('hidemsg()',500);
		}
	}
	
	function hidemsg(){
		var tempid = "msg"+marg;
		document.getElementById(tempid).innerHTML = "";
	}
	
	function recount(){
		di = document.getElementById('carttable');
		var len = di.rows.length;
		//alert(len);
		var sum = 0;
		for(i=1;i<len-1;i++){
			var price = di.rows[i].cells[2].innerHTML;
			var num = di.rows[i].cells[3].getElementsByTagName("input")[0].value;
			//alert(price);
			//alert(num);
			sum += price * num;
		}
		document.getElementById("summoney").innerHTML = sum;
	}
</script>

<table width=100% class="carttable" border="1" id="carttable">
	<tr>
		<th>商品号</th><th>名称</th><th>单价</th><th width="200">数量</th>
	</tr>
	<%
		Object obj = request.getAttribute("cart");
		if(obj!=null){
			Cart cart = (Cart)obj;
			List<OrderedGoods> list = cart.getGoodsList();
			for(int i=0;i<list.size();i++){
				OrderedGoods og = list.get(i);
				pageContext.setAttribute("og",og);
	%>
			<tr>
				<!-- 这里需要得到商品页面 -->
				<td align="center" width="60px"><a href="GoodsPageServlet?goodsid=${og.goodsid}"><span id="cartgoodsid">${og.goodsid}</span></a></td>
				<td>${og.goodsName }</td>
				<td>${og.goodsPrice }</td>
				<td width="250px">
					<input id="${og.goodsid}" type="text" value="${og.num}" maxlength="3" style="width: 30px;" />
					<input type="button" onclick="modify('${og.goodsid}')" value="修改" />
					<font id="msg${og.goodsid}" color="red" size="3"></font>
				</td>
			</tr>
			<%
			}
			%>
			<tr>
				<td colspan="2">商品总金额</td><td colspan="2"><span id="summoney"><%=cart.getSumMoney() %></span>元</td>
			</tr>
	<%
		}
	%>
</table>
<br />
<div align="center"><input type="button" value="提交订单" onclick="location.href='/shoppingcart/orderinfo.jsp'"/></div>