<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/taglib/common.jsp"%>
<form action="">
<table width=100%>
	<tr>
		<th>商品号</th><th>名称</th><th>单价</th><th>数量</th>
	</tr>
	<logic:present name="orderedGoodsList">
		<logic:iterate id="orderedGoods" name="orderedGoodsList">
			<tr>
				<td><bean:write name="orderedGoods" property="goodsid"/></td>
				<td><bean:write name="orderedGoods" property="goodsName"/></td>
				<td><bean:write name="orderedGoods" property="goodsPrice"/></td>
				<td><a>-</a><bean:write name="orderedGoods" property="quantity"/><a>+</a></td>
			</tr>
		</logic:iterate>
	</logic:present>
	<tr>
		<td rowspan="3">商品总金额</td><td></td>
	</tr>
	<input type="submit" />
</table>
</form>