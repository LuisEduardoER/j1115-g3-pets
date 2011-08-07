<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib/common.jsp"%>
<link href="<%=request.getContextPath()%>/pages/css/rightcontent.css" rel="stylesheet" type="text/css" />

<style>
<!--
input{
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
	font-size: 12px;
}
.adminorderlist{
	padding-top:15px;
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
	font-size: 12px;
}
.adminorderlist a{
	font-weight:600;
	text-decoration:none;
	color:#69C;
}
.adminorderlist a:visited{
	color:#69C;
}
.adminorderlist a:hover{
	color:#333;
}
.adminorderlist table{
	border-spacing:3px;
	border-collapse:collapse;
	border-width:4px;
	border-color:#9FBE3F;
	border-style:double;
	text-align:center;
}
.adminorderlist td{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.adminorderlist tr{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.adminorderlist th{
	border:solid 1px #9FBE3F;
	padding:3px;
	text-align:center;
}

-->
</style>

<script type="text/javascript">
	function del(){
		var b = false;
		var chks = document.delForm.orders;
		for(i=0;i<chks.length;i++){
			if(chks[i].checked)
				b = true;
		}
		if(b){
			if(confirm("您是否要删除")){
				return true;
			}else{
				return false;
			}
		}else{
			alert("请选择要删除的选项");
			return false;
		}
	}
	function hqs_delivery(oid){
		location.href="modOrder.do?oid="+oid;
	}
</script>
<hr/>
<div class="adminorderlist">
<form action="/petshop/delOrderList.do" method="post" name="delForm" onsubmit="return del()">
	<table border="0" width="100%">
		<tr>
			<th width="28px">选择</th>
			<th>订单编号</th>
			<th>用户编号</th>
			<th>订单时间</th>
			<th>收货人</th>
			<th>送货地址</th>
			<th>收货人电话</th>
			<th>付款方式</th>
			<th>总价</th>
			<th>订单状态</th>
			<th>操作</th>
		</tr>
		<logic:present name="allorderlist" scope="request">
			<logic:iterate id="orderlist" name="allorderlist" indexId="i">
				<tr>
					<td><input type='checkbox' name='orders' value='${allorderlist[i].oid }'></td>
					<td><bean:write name="orderlist" property="oid" /></td>
					<td><bean:write name="orderlist" property="uid" /></td>
					<td><bean:write name="orderlist" property="otime" /></td>
					<td><bean:write name="orderlist" property="oreceiver" /></td>
					<td><bean:write name="orderlist" property="oaddress" /></td>
					<td><bean:write name="orderlist" property="ophone" /></td>
					<td>
						<logic:equal value="0" name="orderlist" property="otype">网银支付</logic:equal>
						<logic:equal value="1" name="orderlist" property="otype">余额支付</logic:equal>
						<logic:equal value="2" name="orderlist" property="otype">货到付款</logic:equal>
					</td>
					<td><bean:write name="orderlist" property="osum" /></td>
					<td>
						<logic:equal value="0" name="orderlist" property="ostate">等待付款</logic:equal>
						<logic:equal value="1" name="orderlist" property="ostate">等待发货</logic:equal>
						<logic:equal value="2" name="orderlist" property="ostate">已发货</logic:equal>
						<logic:equal value="3" name="orderlist" property="ostate">已确认收货</logic:equal>
						<logic:equal value="4" name="orderlist" property="ostate">已评价</logic:equal>
						<logic:equal value="5" name="orderlist" property="ostate">已取消</logic:equal>
					</td>
					<td>
						<logic:equal value="1" name="orderlist" property="ostate">
							<input type="button" id="${allorderlist[i].oid }" onclick="hqs_delivery(${allorderlist[i].oid })" value="发货" />
						</logic:equal>
					</td>
				</tr>
			</logic:iterate>
		</logic:present>
		<tr>
			<td colspan="11" align="center">
				<a href="showAllOrder.do?nPage=0">首页</a>
				<a href="showAllOrder.do?nPage=${orderpage-1 }">上一页</a>
				<a href="showAllOrder.do?nPage=${orderpage+1 }">下一页</a>
				<a href="showAllOrder.do?nPage=${orderendPage }">尾页</a>
				<span class="pagenum">${orderpage}/${orderendPage}</span>
				<br />
			</td>
		</tr>
	</table>
	<html:submit value="删除"></html:submit>
</form>
</div>