<%@page contentType="text/html;charset=utf-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title></title>
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/jsp/css/style.css" />
	</head>
	<body>
		<div id="wrap">
			<div id="top_content">
				<jsp:include page="header.jsp" />
				<div id="content">
					<tiles:insert attribute="content" />
				</div>
			</div>
			<jsp:include page="footer.jsp" />
		</div>
	</body>
</html>
