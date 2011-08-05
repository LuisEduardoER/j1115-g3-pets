<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib/common.jsp"%>
	<table>
		<tbody>
			<logic:present name="goodsList">
			<logic:iterate id="goods" name="goodsList" indexId="i">
			<table><tbody>
				<tr>
					<td>
						<img width="140" height="150" alt="${goods.goodsid}.jpg" src="<%=request.getContextPath()%>/resource/${goods.goodsid}.jpg">
					</td>
				</tr>
				<tr>
					<td>
						<a href="goodsDetails.do?goodsid=${goods.goodsid}"><bean:write name="goods" property="goodsName"/></a>
					</td>
				</tr>
				<tr>
					<td>
						<bean:write name="goods" property="goodsPrice"/>
					</td>
				</tr>
				<tr>
					<td>
						<html:button property="" value="添加到购物车" onclick="addtocart('${goods.goodsid}')"></html:button>
					</td>
				</tr>
				</tbody></table>
			</logic:iterate>
			</logic:present>
		</tbody>
	</table>
	<center style="font-size:14px;font-weight:900;">
		<a href="goodsPage.do?nowPage=${firstPage }&category=${category}">|&lt;&lt;</a>&nbsp;&nbsp;
		<a href="goodsPage.do?nowPage=${page-1 }&category=${category}">&lt;&lt;</a> &nbsp;&nbsp;
		<span class="pagenum">${page}/${endPage}</span>&nbsp;&nbsp;
		<a href="goodsPage.do?nowPage=${page+1 }&category=${category}">&gt;&gt;</a> &nbsp;&nbsp;
		<a href="goodsPage.do?nowPage=${endPage }&category=${category}">&gt;&gt;|</a>
	</center>