<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib/common.jsp"%>
<html>
  <head>
    <title>My JSP 'money.jsp' starting page</title>
  </head>
  

       <logic:present name="user">
       <form action="" method="post">
       	<table width="100%" class="table" >
       
		<tr>
			<td>
				<strong>您的余额为：</strong>
				<bean:write name="user" property="money" />
			</td>
		</tr>
	</table>
       </form>
</logic:present>

</html>
