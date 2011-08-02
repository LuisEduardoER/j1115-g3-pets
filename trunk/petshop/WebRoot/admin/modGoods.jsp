<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib/common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改商品信息</title>
	
  </head>
  
  <body>
  <html:form action="/modGoodsInfo">
  <html:hidden property="gid" value="${onegoodslist.gid }"/>
    商品名称<html:text property="gname" value="${onegoodslist.gname }"></html:text><br>
    商品价格<html:text property="gprice" value="${onegoodslist.gprice }"></html:text><br>
    剩余数量<html:text property="gnum" value="${onegoodslist.gnum }"></html:text><br>
    商品简介<html:textarea property="gbrief" cols="50" rows="8" value="${onegoodslist.gbrief }"></html:textarea><br>
  <html:submit value="修改"></html:submit>
  <html:cancel value="取消"></html:cancel>
  </html:form>
  </body>
</html>
