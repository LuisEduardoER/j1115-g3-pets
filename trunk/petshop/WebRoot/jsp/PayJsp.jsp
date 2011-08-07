<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../taglib/common.jsp" %>


<style>
<!--

.payjsp{
	margin-left:auto;
	margin-right:auto;
	width:300px;
	padding-top:100px;
}

.payjsp table{
	border-spacing:3px;
	border-collapse:collapse;
	border-width:4px;
	border-color:#9FBE3F;
	border-style:double;
}
.payjsp td{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.payjsp tr{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.payjsp th{
	border:solid 1px #9FBE3F;
	padding:3px;
	text-align:center;
}
-->
</style>
<hr/>
<div class="payjsp">
	<html:form action="/pay" method="post">
		<table width="100%">
	     	<tr>
	     		<th colspan="3">付款方式</th>
	     	</tr>
	     	<tr>
	     		<td>
	     			<html:hidden property="orderid" value="${hqs_orderid }"/>
	     			<html:radio property="paytype" value="0">网银付款</html:radio>
	     		</td>
	     		<td><html:radio property="paytype" value="1" >余额付款</html:radio></td>
	     		<td><html:radio property="paytype" value="2">货到付款</html:radio></td>
	     	</tr>
	     	<tr>
	     		<td colspan="3" align="center""><html:submit value="确认付款"></html:submit></td>
			</tr>
		</table>
	</html:form>
</div>
