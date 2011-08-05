<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/taglib/common.jsp"%>

<html:form action="/submitOrder" method="post">
	收货信息：
	<table>
		<tr>
			<td width="80px">收件人</td>
			<td>
				<input name="receiver" id="receiver" type="text" style="width: 100px" />
				<span id="receivermsg" /></span>
			</td>
		</tr>
		<tr>
			<td width="80px">
				地址
			</td>
			<td>
				<input name="address" id="address" type="text" style="width: 400px" />
				<span id="addressmsg" /></span>
			</td>
		</tr>
		<tr>
			<td width="80px">
				联系电话
			</td>
			<td>
				<input name="phone" id="phone" type="text" style="width: 400px" />
				<span id="phonemsg" /></span>
			</td>
		</tr>
	</table>
	<br />
		付款方式：
			<input type="radio" name="pay" value="0" />网银付款
			<input type="radio" name="pay" value="1" />余额付款
			<input type="radio" name="pay" value="2" />货到付款
			<span id="paymentmsg"></span>
	<br />
		订单信息：
			<table border="1">
		<tr>
			<th>商品号</th>
			<th>名称</th>
			<th>单价</th>
			<th width="200">数量</th>
		</tr>
		<logic:present name="orderedGoodsList">
			<logic:iterate id="orderedGoods" name="orderedGoodsList">
				<tr>
					<td><bean:write name="orderedGoods" property="goodsid" /></td>
					<td><bean:write name="orderedGoods" property="goodsName" /></td>
					<td><bean:write name="orderedGoods" property="goodsPrice" /></td>
					<td><bean:write name="orderedGoods" property="num" /></td>
				</tr>
			</logic:iterate>
			<tr>
				<td colspan="2">总金额</td>
				<td colspan="2"><bean:write name="summoney" /></td>
			</tr>
		</logic:present>
	</table>
	<html:submit value="提交" onclick="return orderformcheck()"></html:submit>
</html:form>
<script type="text/javascript">
	function orderformcheck(){
		var receiver = document.getElementById("address");
		var diadd = document.getElementById("address");
		var diphone = document.getElementById("phone");
		document.getElementById("receivermsg").innerHTML = "";
		document.getElementById("addressmsg").innerHTML = "";
		document.getElementById("phonemsg").innerHTML = "";
		document.getElementById("paymentmsg").innerHTML = "";
		
		var b = true;
		
		if(receiver.value==""){
			document.getElementById("receivermsg").innerHTML = "收件人不能为空";
			b = false;
		}
		if(diadd.value==""){
			document.getElementById("addressmsg").innerHTML = "收货地址不能为空";
			b = false;
		}
		if(diphone.value==""){
			document.getElementById("phonemsg").innerHTML = "收货人不能为空";
			b = false;
		}
		var radios = document.getElementsByName("pay");
		var radiocheck = false;
		for(i=0;i<radios.length;i++){
			if(radios[i].checked == true){
				radiocheck = true;
			}
		}
		if(!radiocheck){
			document.getElementById("paymentmsg").innerHTML = "付款方式不能为空";
			b = false;
		}
		return b;
	}
</script>
