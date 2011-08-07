<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../taglib/common.jsp" %>
<style>
<!--
.goodsdetail{
	font-size:12px;
}
.goodsdetail table{
	border-spacing:3px;
	border-collapse:collapse;
	border-width:4px;
	border-color:#9FBE3F;
	border-style:double;
}
.goodsdetail td{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.goodsdetail tr{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.goodsdetail th{
	border:solid 1px #9FBE3F;
	padding:3px;
	text-align:center;
}
</style>
<hr />
<div class="goodsdetail">
  	<table width="100%">
  		<tr>
    		<td colspan="4">订单号：${orderid }<br/>订单详细信息：</td>
    	</tr>
  		<tr>
  			<th><center>商品编号</center></th>
  			<th>商品名称</th>
  			<th><center>商品单价</center></th>
  			<th>商品简介</th>
  		</tr>
    	<logic:present name="elist" scope="request">
    		<logic:iterate id="goods" name="elist">
    			
    			<tr>
    				<td><center><a href="/petshop/goodsDetails.do?goodsid=<bean:write name='goods' property='goodsid'/>"><bean:write name="goods" property="goodsid"/></a></center></td>
    				<td><bean:write name="goods" property="goodsName"/></td>
    				<td><center><bean:write name="goods" property="goodsPrice"/></center></td>
    				<td><bean:write name="goods" property="goodsBrief"/></td>
    			</tr>
    		</logic:iterate>
    	</logic:present>
    </table>
</div>
