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
	font-size:12px;
	font-weight:900;
}
-->
</style>
<hr />
<div class="webposition2">订单&gt;&gt;确认商品&gt;&gt;填写个人信息<span style="color:#ccc">&gt;&gt;付款</span></div>
<div class="mySubmitOrder">
	<html:form action="/submitOrder" method="post">
		收货信息：
		<table width="100%">
			<tr>
				<td width="80px">收件人</td>
				<td width="520px">
					<input name="receiver" id="receiver" type="text" style="width: 100px" />
					<span style="color:red;font-size:12px;" id="receivermsg" /></span>
				</td>
			</tr>
			<tr>
				<td width="80px">
					联系电话
				</td>
				<td>
					<input name="phone" id="phone" type="text" style="width: 100px" />
					<span style="color:red;font-size:12px;" id="phonemsg" /></span>
				</td>
			</tr>
			<tr>
				<td width="80px">
					地址
				</td>
				<td>
					<input name="address"  id="address" type="text" style="width: 400px" />
					<span style="color:red;font-size:12px;" id="addressmsg" /></span>
				</td>
			</tr>
		</table>
		<br />
			订单信息：
		<table border="1" width=100%>
			<tr>
				<th><center>商品号</center></th>
				<th><center>名称</center></th>
				<th width="60px"><center>单价</center></th>
				<th width="40px"><center>数量</center></th>
			</tr>
			<logic:present name="orderedGoodsList">
				<logic:iterate id="orderedGoods" name="orderedGoodsList">
					<tr>
						<td><center><bean:write name="orderedGoods" property="goodsid" /></center></td>
						<td><bean:write name="orderedGoods" property="goodsName" /></td>
						<td><center><bean:write name="orderedGoods" property="goodsPrice" /></center></td>
						<td><center><bean:write name="orderedGoods" property="num" /></center></td>
					</tr>
				</logic:iterate>
				<tr>
					<td colspan="2"><span style="padding-right:15px;">总金额</span></td>
					<td colspan="2"><center>￥<span style="color:#ff6633;padding-left:2px;font-weight:700;"><bean:write name="summoney" /></span></center></td>
				</tr>
			</logic:present>
		</table>
		<br />
		<center><html:submit value="去付款" onclick="return orderformcheck()"></html:submit></center>
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
