<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/taglib/common.jsp" %>
<script language="javascript" type="text/javascript">

	var menurequest = null;
	
	function createRequest() {//创建一个request
		try {
			menurequest = new XMLHttpRequest();
		} catch (trymicrosoft) {
			try {
				menurequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (othermicrosoft) {
				try {
					menurequest = new ActiveObject("Microsoft.XMLHTTP");
				} catch (failed) {//如果都不行，则将request设置为null
					menurequest = null;
				}
			}
		}
		if (menurequest == null) {//如果没有得到request则报一个错误
			alert("Error");
		}
	}
 	
 	function addtocart(arg){
 		createRequest();
 		marg = arg;
 		var amount = 1;//需要购买的商品数量
 		var inputbuy = document.getElementById('buyamount'+arg);
 		if(inputbuy!=null){
 			if((inputbuy.value).match(/^[0-9]+$/)!=null){
 			 	amount = inputbuy.value;
 			}else{
 				alert("请输入整数");
 				inputbuy.value = "1";
 			}
 		}
 		
 		menurequest.onreadystatechange = menucallback;//每改变一次状态调用一次callback方法
		menurequest.open("post", "/petshop/addToCart.do?goodsamount="+amount+"&goodsid="+arg, true);//处理连接
		menurequest.send(null);
 	}
 	
	function menucallback() {
		if (menurequest.readyState == 4) {
			var text = menurequest.responseText;
			if (!isNaN(text)) {
				document.getElementById('goodscount').innerHTML = text;
				alert("添加成功");
			}else{
				alert(text);
			}
		}
	}
</script>

<div class="topmenu">
	<div class="topnav">
		<a href="<%=request.getContextPath()%>/" ><span class="logo"></span></a>
		<div class="topnav_right">
			<div class="cart">
				<div class="cartbg">
					<div class="cart_left">
						<a href="<html:rewrite action="/getCart" />"><span id="goodscount" style="color: #333">${goodsnumincart}</span>&nbsp;<span>Item(s)</span>
						</a>
					</div>
					<div class="cart_right">
						<a href="<html:rewrite action="/getCart" />" ><span class="checkout"></span></a>
					</div>
				</div>
			</div>
			<div class="nav">
				<ul>
					<li><a href="/petshop/listGoods.do?category=1"><span>dog</span></a></li>
					<li><a href="/petshop/listGoods.do?category=2"><span>cat</span></a></li>
					<li><a href="/petshop/listGoods.do?category=4"><span>bird</span></a></li>
					<li><a href="/petshop/listGoods.do?category=5"><span>fish</span></a></li>
					<li><a href="/petshop/listGoods.do?category=6"><span>reptile</span></a></li>
					<li><a href="/petshop/listGoods.do?category=3"><span>small animal</span></a></li>
				</ul>
			</div>
		</div>
	</div><!--topnav end-->
</div><!--topmenu end-->
