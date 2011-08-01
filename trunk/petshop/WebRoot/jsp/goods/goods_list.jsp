<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>


	<h1>
		商品列表
	</h1>
	<table>
		<tbody>
			<logic:present name="goodsList">
			<logic:iterate id="goods" name="goodsList">
				<tr>
					<td>
						<img width="90" height="100" alt="${goods.goodsid}.jsp" src="<%=request.getContextPath()%>/resource/${goods.goodsid}.jpg">
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
			</logic:iterate>
			</logic:present>
		</tbody>
	</table>
			<a href="GoodsListServlet">首页</a>
			<a href="GoodsListServlet?nowPage=${page-1 }">上一页</a> 
			<a href="GoodsListServlet?nowPage=${page+1 }">下一页</a> 
			<a href="GoodsListServlet?nowPage=${endPage }">尾页</a>
	
