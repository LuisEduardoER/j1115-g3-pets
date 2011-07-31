<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Insert title here</title>
	</head>
	<body>
		<center>
		<%String orderid = request.getParameter("orderid"); %>
			<form action="evalut" method="post">
				<input type="hidden" name = "orderid" value=<%=orderid %>/>
				<input type="radio" name = "score" value = "1">1分
				<input type="radio" name = "score" value = "2">2分
				<input type="radio" name = "score" value = "3">3分
				<input type="radio" name = "score" value = "4">4分
				<input type="radio" name = "score" value = "5">5分<br/>
				<input type="submit" value="提交">
			</form>
		</center>
	</body>
</html>