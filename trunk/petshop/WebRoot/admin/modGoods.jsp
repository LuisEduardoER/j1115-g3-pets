<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib/common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改商品信息</title>
	<style type="text/css">
		input {
			font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
			font-size: 12px;
		}
		textarea{
			font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
			font-size: 12px;
		}
		.adminmodgoods{
			padding-top: 60px;
			padding-left: 150px;
			font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
			
		}
	</style>
  </head>
  
  <body>
  <div class="adminmodgoods">
  <html:form action="/modGoodsInfo">
  <html:hidden property="gid" value="${onegoodslist.gid }"/>
    商品名称<html:text property="gname" value="${onegoodslist.gname }"></html:text><br>
    商品价格<html:text property="gprice" value="${onegoodslist.gprice }"></html:text><br>
    剩余数量<html:text property="gnum" value="${onegoodslist.gnum }"></html:text><br>
    商品简介<html:textarea property="gbrief" cols="50" rows="8" value="${onegoodslist.gbrief }"></html:textarea><br>
  <html:submit value="修改"></html:submit>
  <html:cancel value="取消"></html:cancel>
  </html:form>
  </div>
  </body>
</html>
