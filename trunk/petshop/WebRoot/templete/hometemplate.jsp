<%@page contentType="text/html;charset=utf-8"%>
<%@include file="/jsp/taglib/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title></title>
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/jsp/css/style.css" />
	</head>
	<body>
		<div class="wrap">
			<div class="top">
				<tiles:insert attribute="top" />
				<tiles:insert attribute="topmenu" />
			</div>
			<div class="middle">
				<div class="homecontent">
					<tiles:insert attribute="homecontent" />
				</div>
			</div>
			<div class="footer">
				<jsp:include page="/jsp/footer.jsp" />
			</div>
		</div>
	</body>
</html>