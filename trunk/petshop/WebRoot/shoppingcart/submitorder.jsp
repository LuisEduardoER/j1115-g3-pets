<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/taglib/common.jsp"%>
<link href="<%=request.getContextPath()%>/pages/css/rightcontent.css" rel="stylesheet" type="text/css" />
<style>
<!--
.mySubmitOrder{
	padding-top:50px;
}
.mySubmitOrder a{
	font-weight:600;
	text-decoration:none;
	color:#69C;
}
.mySubmitOrder a:visited{
	color:#69C;
}
.mySubmitOrder a:hover{
	color:#333;
}
.mySubmitOrder table{
	border-spacing:3px;
	border-collapse:collapse;
	border-width:4px;
	border-color:#9FBE3F;
	border-style:double;
}
.mySubmitOrder td{
	border:solid 1px #9FBE3F;
	height:30px;
}
.mySubmitOrder tr{
	border:solid 1px #9FBE3F;
}
.mySubmitOrder th{
	border:solid 1px #9FBE3F;
	height:30px;
}
.webposition2{
	padding-top:20px;
	color:#333;
}
-->
</style>
<hr />
<div class="webposition2">订单&gt;&gt;确认商品&gt;&gt;填写个人信息</div>
<div class="mySubmitOrder">
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
		<html:submit value="确认信息" onclick="return orderformcheck()"></html:submit>
	</html:form>
</div>
<script type="text/javascript">
	function orderformcheck(){
		var receiver = document.getElementById("address");
		var diadd = document.getElementById("address");
		var diphone = document.getElementById("phone");
		document.getElementById("receivermsg").innerHTML = "";
		document.getElementById("addressmsg").innerHTML = "";
		document.getElementById("phonemsg").innerHTML = "";
		
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
		return b;
	}
</script>
