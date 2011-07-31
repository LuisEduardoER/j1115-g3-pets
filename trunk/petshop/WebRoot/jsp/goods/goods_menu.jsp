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
	<table >
		<tbody>
			<tr>
				<th style="cursor: pointer;" onclick="javascript:changemenu(t1)">Dog's Shop</th>
			</tr>
			<tr>
				<td align="center" id="t1">
					<html:link href="">狗</html:link><br>
					<html:link>狗の用品</html:link><br>
					<html:link>狗の食品</html:link><br>
					<html:link>狗の药品</html:link>
				</td>
			</tr>
			<tr>
				<th style="cursor: pointer;" onclick="javascript:changemenu(t2)">Cat's Shop</th>
			</tr>
			<tr>
				<td align="center" id="t2">
					猫<br>
					猫の用品<br>
					猫の食品<br>
					猫の药品
				</td>
			</tr>
			<tr>
				<th style="cursor: pointer;" onclick="javascript:changemenu(t3)">Bird's Shop</th>
			</tr>
			<tr>
				<td align="center" id="t3">
					鸟类<br>
					鸟の用品<br>
					鸟の食品<br>
					鸟の药品
				</td>
			</tr>
			<tr>
				<th style="cursor: pointer;" onclick="javascript:changemenu(t4)">Fish's Shop</th>
			</tr>
			<tr>
				<td align="center" id="t4">
					鱼类<br>
					鱼の用品<br>
					鱼の食品<br>
					鱼の药品
				</td>
			</tr>
			<tr>
				<th style="cursor: pointer;" onclick="javascript:changemenu(t5)">Reptile's Shop</th>
			</tr>
			<tr>
				<td align="center" id="t5">
					爬行类<br>
					爬行类の用品<br>
					爬行类の食品<br>
					爬行类の药品
				</td>
			</tr>
			<tr>
				<th style="cursor: pointer;" onclick="javascript:changemenu(t6)">Small Pet's Shop</th>
			</tr>
			<tr>
				<td align="center" id="t6">
					小动物<br>
					小动物の用品<br>
					小动物の食品<br>
					小动物の药品
				</td>
			</tr>
		</tbody>
	</table>
</body>
