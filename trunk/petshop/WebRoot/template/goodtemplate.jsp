<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title><%=request.getAttribute("pagetitle") %></title>
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/style/style.css" />
	</head>
	<body>
		<div class="wrap">
			<div class="content_left">
			<tiles:insert attribute="left"></tiles:insert>
			</div>
			<div class="content_right">
				<tiles:insert attribute="right"></tiles:insert>
			</div>
		</div>
	</body>
</html>