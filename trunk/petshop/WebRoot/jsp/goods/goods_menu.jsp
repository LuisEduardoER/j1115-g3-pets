<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>

<head>
	<script type="text/javascript">
	function changemenu(id) {
		if (id.style.display == "none") {
			id.style.display = "block";
		} else {
			id.style.display = "none";
		}
	}
	</script>
</head>

<body>
	<table>
		<tbody>
			<tr>
				<th style="cursor: pointer;" onclick='changemenu(t1)';>
					Dog's Shop
				</th>
			</tr>
			<tr>
				<td align="center" id="t1">
					<%
						request.setAttribute("c1", "7");
					%>
					<html:link action="listGoods" paramId="category" paramName="c1">狗</html:link>
					<br>
					<%
						request.setAttribute("c2", "8");
					%>
					<html:link action="listGoods" paramId="category" paramName="c2">狗の用品</html:link>
					<br>
					<%
						request.setAttribute("c3", "9");
					%>
					<html:link action="listGoods" paramId="category" paramName="c3">狗の食品</html:link>
					<br>
					<%
						request.setAttribute("c4", "10");
					%>
					<html:link action="listGoods" paramId="category" paramName="c4">狗の药品</html:link>
				</td>
			</tr>
			<tr>
				<th style="cursor: pointer;" onclick="javascript:changemenu(t2)"> Cat's	Shop</th>
			</tr>
			<tr>
				<td align="center" id="t2">
					<%
						request.setAttribute("c5", "11");
					%>
					<html:link action="listGoods" paramId="category" paramName="c5">猫</html:link>
					<br>
					<%
						request.setAttribute("c6", "12");
					%>
					<html:link action="listGoods" paramId="category" paramName="c6">猫の用品</html:link>
					<br>
					<%
						request.setAttribute("c7", "13");
					%>
					<html:link action="listGoods" paramId="category" paramName="c7">猫の食品</html:link>
					<br>
					<%
						request.setAttribute("c8", "14");
					%>
					<html:link action="listGoods" paramId="category" paramName="c8">猫の药品</html:link>
				</td>
			</tr>
			<tr>
				<th style="cursor: pointer;" onclick=javascript:changemenu(t3);
>
					Bird's Shop
				</th>
			</tr>
			<tr>
				<td align="center" id="t3">
					<%
						request.setAttribute("c9", "19");
					%>
					<html:link action="listGoods" paramId="category" paramName="c9">鸟类</html:link>
					<br>
					<%
						request.setAttribute("c10", "20");
					%>
					<html:link action="listGoods" paramId="category" paramName="c10">鸟の用品</html:link>
					<br>
					<%
						request.setAttribute("c11", "21");
					%>
					<html:link action="listGoods" paramId="category" paramName="c11">鸟の食品</html:link>
					<br>
					<%
						request.setAttribute("c12","22");
						%>
						<html:link action="listGoods" paramId="category" paramName="c12">鸟の药品</html:link>
				</td>
			</tr>
			<tr>
				<th style="cursor: pointer;" onclick="javascript:changemenu(t4)">
					Fish's Shop
				</th>
			</tr>
			<tr>
				<td align="center" id="t4">
					<%
						request.setAttribute("c13", "23");
					%>
					<html:link action="listGoods" paramId="category" paramName="c13">鱼类</html:link>
					<br>
					<%
						request.setAttribute("c14", "24");
					%>
					<html:link action="listGoods" paramId="category" paramName="c14">鱼の用品</html:link>
					<br>
					<%
						request.setAttribute("c15", "25");
					%>
					<html:link action="listGoods" paramId="category" paramName="c15">鱼の食品</html:link>
					<br>
					<%
						request.setAttribute("c16", "26");
					%>
						<html:link action="listGoods" paramId="category" paramName="c16">鱼の药品</html:link>
				</td>
			</tr>
			<tr>
				<th style="cursor: pointer;" onclick=javascript:changemenu(t5);
>
					Reptile's Shop
				</th>
			</tr>
			<tr>
				<td align="center" id="t5">
					<%
						request.setAttribute("c17", "27");
					%>
					<html:link action="listGoods" paramId="category" paramName="c17">爬行类</html:link>
					<br>
					<%
						request.setAttribute("c18", "28");
					%>
					<html:link action="listGoods" paramId="category" paramName="c18">爬行类の用品</html:link>
					<br>
					<%
						request.setAttribute("c19", "29");
					%>
					<html:link action="listGoods" paramId="category" paramName="c19">爬行类の食品</html:link>
					<br>
					<%
						request.setAttribute("c20", "30");
					%>
					<html:link action="listGoods" paramId="category" paramName="c20">爬行类の药品</html:link>
				</td>
			</tr>
			<tr>
				<th style="cursor: pointer;" onclick=javascript:changemenu(t6);
>
					Small Pet's Shop
				</th>
			</tr>
			<tr>
				<td align="center" id="t6">
					<%
						request.setAttribute("c21", "15");
					%>
					<html:link action="listGoods" paramId="category" paramName="c21">小动物</html:link>
					<br>
					<%
						request.setAttribute("c22", "16");
					%>
					<html:link action="listGoods" paramId="category" paramName="c22">小动物の用品</html:link>
					<br>
					<%
						request.setAttribute("c23", "17");
					%>
					<html:link action="listGoods" paramId="category" paramName="c23">小动物の食品</html:link>
					<br>
					<%
						request.setAttribute("c24", "18");
					%>
					<html:link action="listGoods" paramId="category" paramName="c24">小动物の药品</html:link>
				</td>
			</tr>
		</tbody>
	</table>
</body>
