<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title><%=request.getAttribute("pagetitle")%></title>
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/style/style.css" />
<link href="<%=request.getContextPath()%>/pages/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/pages/css/style.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/pages/css/front.css" media="screen, projection" rel="stylesheet"
type="text/css" />
		<style type="text/css">
.search_bar {
	margin-left: auto;
	margin-right: auto;
	width: 980px;
}

.template_content {
	width: 980px;
	margin-left: auto;
	margin-right: auto;
}

.template_left {
	float: left;
	width: 200px;
}

.template_right {
	float: left;
	width: 760px;
}

.template_footer {
	clear: both;
	width: 980px;
	margin-left: auto;
	margin-right: auto;
}
</style>
	</head>
	<body>

	<tiles:insert attribute="topline" />
	<tiles:insert attribute="topmenu" />
	<div class="search_bar">
		<tiles:insert attribute="searchbar" />
	</div>
		<div class="wrap">
			<div class="content_left">
				<tiles:insert attribute="left"></tiles:insert>
			</div>
			<div class="content_right">
				<tiles:insert attribute="right"></tiles:insert>
			</div>
		</div>
		<div class="template_footer">
			<jsp:include page="/pages/footer.jsp" />
		</div>
	</body>
</html>