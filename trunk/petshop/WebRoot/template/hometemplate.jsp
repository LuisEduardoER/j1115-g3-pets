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
<style type="text/css">
.search_bar{
	margin-left:auto;
	margin-right:auto;
	width:980px;
}
.template_content{
	width:980px;
	margin-left:auto;
	margin-right:auto;
}
.template_left{
	float:left;
	width:200px;
}
.template_right{
	float:left;
	width:780px;
}
.template_footer{
	clear:both;
	width:980px;
	margin-left:auto;
	margin-right:auto;
}
</style>
		
</head>
<body>
	<tiles:insert attribute="topline" />
	<tiles:insert attribute="topmenu" />
	<div class="search_bar">
		<tiles:insert attribute="searchbar" />
	</div>
	<div class="template_content">
		<div class="template_left">
			<tiles:insert attribute="leftmenu" />
		</div>
		<div class="template_right">
			<tiles:insert attribute="goodscontent" />
		</div>
	</div>
	<div class="template_footer">
		<jsp:include page="/pages/footer.jsp" />
	</div>
</body>
</html>