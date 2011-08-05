<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib/common.jsp"%>

<table>
	<tbody>
		<tr>
			<td width="10px">
				<img src="<%=request.getContextPath()%>/resource/${goods.gid}.jpg" alt="${goods.gid}.jpg" />
			</td>
			<td>
				<table>
					<tbody>
						<tr>
							<td><bean:write name="goods" property="gname"/></td>
						</tr>
						<tr>
							<td>一口价：<bean:write name="goods" property="gprice"/></td>
						</tr>
						<tr>
							<td><input id="buyamount${goods.gid}" type="text" name="buynum"/>库存<bean:write name="goods" property="gnum"/>个（已售出<bean:write name="goods" property="gsold"/>个）</td>
						</tr>
						<tr>
							<td><input type="button" value="加入购物车" onclick="addtocart('${goods.gid}')"/><html:button property="" value="立即购买"/></td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				历史买家平均评分：<bean:write name="goods" property="gscore"/><br/>
				简介：<br/>
				<bean:write name="goods" property="gbrief"/>
			</td>
		</tr>
	</tbody>
</table>