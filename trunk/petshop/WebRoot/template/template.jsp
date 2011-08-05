<%@page contentType="text/html;charset=utf-8"%>
<%@include file="/taglib/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title><%=request.getAttribute("pagetitle") %></title>
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/jsp/css/style.css" />
	</head>
	<body>
		<tiles:insert attribute="topline" />
		<tiles:insert attribute="topmenu" />
		<tiles:insert attribute="searchbar" />
		<tiles:insert attribute="content" />
		<jsp:include page="/jsp/footer.jsp" />
	</body>
</html>
