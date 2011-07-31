<%@page contentType="text/html;charset=utf-8"%>
<%@include file="/taglib/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=request.getAttribute("pagetitle") %></title>
	<link href="<%=request.getContextPath()%>/pages/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/pages/css/style.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/pages/css/front.css" media="screen, projection" rel="stylesheet"
type="text/css" />
		
</head>
<body>
	<tiles:insert attribute="topline" />
	<tiles:insert attribute="topmenu" />
	<tiles:insert attribute="homecontent" />
	<jsp:include page="/jsp/footer.jsp" />
</body>
</html>