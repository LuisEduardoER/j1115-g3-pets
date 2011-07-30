<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>

<body>
	<table align="center" width="100%">
		<tbody>
			<tr>		
			<td align="left" width="95%">		
			<logic:present name="goodsList">
			<logic:iterate id="goods" name="goodsList"  indexId="i">
				<table>
					<tbody>
						<tr>
							<td><html:img src="<%=request.getContextPath()%>/resource/${goods.g_id}.jpg" alt="${goods.g_id}.jpg"/></td>
						</tr>
						<tr>
							<td><bean:write name="goods" property="g_name"/></td>
						</tr>
						<tr>
							<td><bean:write name="goods" property="g_price"/></td>
						</tr>
						<tr>
							<td><html:button property="" value=" 添加到购物车"/></td>
						</tr>
					</tbody>
				</table>
				<%i=i%4;%>				
				<logic:equal name="i" value="0">
					<br><br>
				</logic:equal>
			</logic:iterate>
			</logic:present>
			</td>
			</tr>
		</tbody>
	</table>
</body>