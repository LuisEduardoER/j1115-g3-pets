<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>


	<h1>
		商品列表
	</h1>
	<table>
		<tbody>
			<logic:present name="goodsList">
			<logic:iterate id="goods" name="goodsList" indexId="i">
			<table><tbody>
				<tr>
					<td>
						<img width="140" height="150" alt="${goods.goodsid}.jsp" src="<%=request.getContextPath()%>/resource/${goods.goodsid}.jpg">
					</td>
				</tr>
				<tr>
					<td>
						<bean:write name="goods" property="goodsName"/>
					</td>
				</tr>
				<tr>
					<td>
						<bean:write name="goods" property="goodsPrice"/>
					</td>
				</tr>
				<tr>
					<td>
						<html:button property="" value="添加到购物车"></html:button>
					</td>
				</tr>
				</tbody></table>
			</logic:iterate>
			</logic:present>
		</tbody>
	</table>
	<a href="goodsPage.do?category=${category}">首页</a>
			<a href="goodsPage.do?nowPage=${page-1 }&category=${category}">上一页</a> 
			<a href="goodsPage.do?nowPage=${page+1 }&category=${category}">下一页</a> 
			<a href="goodsPage.do?nowPage=${endPage }&category=${category}">尾页</a>
