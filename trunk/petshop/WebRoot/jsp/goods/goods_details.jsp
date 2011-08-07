<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib/common.jsp"%>
<style>
<!--
.goodsdetail {
	font-family: "Courier New", "Comic Sans MS", 微软雅黑, 黑体;
}
.goodsimage{
	padding:30px;
	float:left;
}
.buygoods{
	padding:30px;
	padding-top:160px;
	float:left;
}
.goodsinfo{
	clear:both;
	padding-left:30px;
}
-->
</style>
<hr/>

<div class="goodsdetail">
	<div class="goodsimage"><img src="<%=request.getContextPath()%>/resource/${goods.gid}.jpg" width="310px" height="310px" /></div>
	<div class="buygoods">
		<table>
			<tr>
				<td><bean:write name="goods" property="gname" /></td>
			</tr>
			<tr>
				<td>一口价：	<bean:write name="goods" property="gprice" /></td>
			</tr>
			<tr>
				<td>
					<input id="buyamount${goods.gid}" type="text" name="buynum" />
					库存
					<span id="kucun"><bean:write name="goods" property="gnum" /></span>
					个（已售出
					<bean:write name="goods" property="gsold" />
					个）
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="加入购物车" onclick="addtocart('${goods.gid}')" />
				</td>
			</tr>
		</table>
	</div>
	<div class="goodsinfo">
	<hr/>
		<div class="goodsscore">
			历史买家平均评分：
			<bean:write name="goods" property="gscore" />
			<br />
		</div>
		<div>
			简介：
			<br />
			<bean:write name="goods" property="gbrief" />
		</div>
	</div>
</div>