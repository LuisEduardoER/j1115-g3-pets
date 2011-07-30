<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/jsp/taglib/common.jsp"%>


<html>
  <head>
    <title>My JSP 'usermsg.jsp' starting page</title>
  </head>
  
  <h2 align="center">
		会员个人信息
  </h2>
   
  <logic:present name="user">
       <form action="" method="post">
       	<table width="100%" class="table" >
       		<tr >
       		<td>
				<strong>用户编号：</strong>
				<bean:write name="user" property="id" />
			</td>
			</tr>
			<tr>
			<td width="25%">
				<strong>姓名：</strong>
				<bean:write name="user" property="username" />
			</td>
		   </tr>
		<tr>
			<td>
				<strong>密码：</strong>
				<bean:write name="user" property="password" />
			</td>
		</tr>
		<tr>
			<td>
				<strong>用户身份：</strong>
				<bean:write name="user" property="identity" />
			</td>
		</tr>
		<tr>
			<td>
				<strong>用户余额：</strong>
				<bean:write name="user" property="money" />
			</td>
		</tr>
	</table>
       </form>
</logic:present>
</html>
