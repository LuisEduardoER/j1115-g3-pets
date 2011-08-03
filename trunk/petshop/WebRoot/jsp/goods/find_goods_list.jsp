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
						<img width="140" height="150" alt="${goods.goodsid}.jpg" src="<%=request.getContextPath()%>/resource/${goods.goodsid}.jpg">
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
	<a href="findGoods.do?nowPage=${firstPage }&searchcategory=${searchcategory}&searchkey=${searchkey}">首页</a>
			<a href="findGoods.do?nowPage=${page-1 }&searchcategory=${searchcategory}&findname=${searchkey}">上一页</a> 
			<a href="findGoods.do?nowPage=${page+1 }&searchcategory=${searchcategory}&findname=${searchkey}">下一页</a> 
			<a href="findGoods.do?nowPage=${endPage }&searchcategory=${searchcategory}&findname=${searchkey}">尾页</a>