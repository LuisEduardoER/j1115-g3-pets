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
 		if(isNaN(document.getElementById(arg).value)){
 			document.getElementById('msg'+arg).innerHTML = "请输入数字";
 			setTimeout('hidemsg()',1000);
 			return;
 		}
 		if(document.getElementById(arg).value<1){
 			document.getElementById('msg'+arg).innerHTML = "商品数不能小于1";
 			setTimeout('hidemsg()',1000);
 			return;
 		}
 		var num = document.getElementById(arg).value;
 		request.onreadystatechange = callback;//每改变一次状态调用一次callback方法
		request.open("post", "/petshop/modifyAmount.do?newnum="+num+"&goodsid="+arg, true);//处理连接
		request.send(null);
 	}
 	
 	
	function callback() {
		if (request.readyState == 4) {
			var text = request.responseText;
			var tempid = "msg"+marg;
			var di = document.getElementById(tempid);
			if ("changesuccess" == text) {
				document.getElementById("prenum"+marg).innerHTML = document.getElementById(marg).value;
				di.innerHTML = "修改成功";
				recount();
			}else if("unchange" == text){
				di.innerHTML = "商品数量未修改";
			}else if(!isNaN(text)){//判断是否是数字
				di.innerHTML = "库存不足，只剩" + text + "件";
				document.getElementById(marg).value = document.getElementById("prenum"+marg).innerHTML;
			}else{
				di.innerHTML = "修改失败";
				document.getElementById(marg).value = document.getElementById("prenum"+marg).innerHTML;
			}
			setTimeout('hidemsg()',500);
		}
	}
 	function delgoods(arg){
 		createRequest();
 		marg = arg;
 		request.onreadystatechange = delcallback;//每改变一次状态调用一次callback方法
		request.open("post", "/petshop/modifyAmount.do?newnum=0&goodsid="+arg, true);//处理连接
		request.send(null);
 	}
	
	function delcallback() {
		if (request.readyState == 4) {
			var text = request.responseText;
			var tempid = "tr"+marg;
			var di = document.getElementById(tempid);
			if ("changesuccess" == text) {
				//alert(di.rowIndex);
				var di = document.getElementById(tempid);
 				di.parentNode.deleteRow(di.rowIndex);
				recount();
			}else{
				alert("删除失败，请重试");
			}
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
		var newcount = 0;
		for(i=1;i<len-1;i++){
			var price = di.rows[i].cells[2].innerHTML;
			var num = di.rows[i].cells[3].getElementsByTagName("input")[0].value;
			//alert(price);
			//alert(num);
			newcount += num*1;
			sum += price * num;
			sum = Math.round(sum*100)/100;
		}
		document.getElementById("summoney").innerHTML = sum;
		newcount = newcount*1;
		document.getElementById("goodscount").innerHTML = newcount;
	}
</script>
<link href="<%=request.getContextPath()%>/pages/css/rightcontent.css" rel="stylesheet" type="text/css" />
<style>
<!--
.carttablediv{
	padding-top:50px;
}
.carttablediv a{
	font-weight:600;
	text-decoration:none;
	color:#69C;
}
.carttablediv a:visited{
	color:#69C;
}
.carttablediv a:hover{
	color:#333;
}
.carttablediv table{
	border-spacing:3px;
	border-collapse:collapse;
	border-width:4px;
	border-color:#9FBE3F;
	border-style:double;
}
.carttablediv td{
	border:solid 1px #9FBE3F;
	height:30px;
}
.carttablediv tr{
	border:solid 1px #9FBE3F;
}
.carttablediv th{
	border:solid 1px #9FBE3F;
	height:30px;
}
.webposition{
	padding-top:20px;
	color:#333;
	font-size:12px;
	font-weight:900;
}
-->
</style>
<hr />
<div class="webposition">订单&gt;&gt;确认商品<span style="color:#ccc">&gt;&gt;填写个人信息&gt;&gt;付款</span></div>
<div class="carttablediv">
<table width=100% class="carttable" border="0" id="carttable">
	<tr>
		<th>商品号</th><th>名称</th><th>单价</th><th width="40px">数量</th><th>操作</th>
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
			<tr id="tr${og.goodsid}">
				<!-- 这里需要得到商品页面 -->
				<td align="center" width="60px"><a href="GoodsPageServlet?goodsid=${og.goodsid}"><span id="cartgoodsid">${og.goodsid}</span></a></td>
				<td>${og.goodsName }</td>
				<td>${og.goodsPrice }</td>
				<td width="250px">
					<input id="${og.goodsid}" type="text" value="${og.num}" maxlength="3" style="width: 30px;" />
					<input type="button" onclick="modify('${og.goodsid}')" value="修改" />
					<font id="msg${og.goodsid}" color="red" size="3"></font>
				</td>
				<td width="38px"><input type="button" onclick="delgoods('${og.goodsid}')" value="删除" /><span style="display:none;" id="prenum${og.goodsid}">${og.num}</span></td>
			</tr>
			<%
			}
			%>
			<tr>
				<td style="font-weight:600;text-align:right; padding-right:15px;" colspan="2">商品总金额</td><td colspan="3"><span style="padding-left:15px;color:#ff6633;font-weight:600;" id="summoney"><%=cart.getSumMoney() %></span>元</td>
			</tr>
	<%
		}
	%>
</table>
</div>
<br />
<div align="center"><html:link action="/inputCustomerInfo" >下一步</html:link></div>