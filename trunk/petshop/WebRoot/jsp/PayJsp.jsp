<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../taglib/common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'PayJsp.jsp' starting page</title>
    	 <style>
<!--
input{
	font-family: "Courier New","Comic Sans MS",΢���ź�,����;
	font-size: 12px;
	
}

.payjsp{
	padding-left: 240px;
	padding-top:100px;
	font-family: "Courier New","Comic Sans MS",΢���ź�,����;
	font-size: 12px;
}

.payjsp table{
	border-spacing:3px;
	border-collapse:collapse;
	border-width:4px;
	border-color:#9FBE3F;
	border-style:double;
}
.payjsp td{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.payjsp tr{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.payjsp th{
	border:solid 1px #9FBE3F;
	padding:3px;
	text-align:center;
}
    </style>
  </head>
  
  <body>
  <div class="payjsp">
     <html:form action="/pay" method="post">
     	<table width="60%">
     	<tr>
     		<th colspan="3"> ���ʽ</th>
     	</tr>
     	<tr>
     		<td>
     			<html:hidden property="orderid" value="${hqs_orderid }"/>
     			<html:radio property="paytype" value="0">��������</html:radio>
     		</td>
     		<td>
     			<html:radio property="paytype" value="1">����</html:radio>
     		</td>
     		<td>
     			<html:radio property="paytype" value="2">��������</html:radio><br/>
     		</td>
     	</tr>
     	<tr>
     		<td colspan="3" align="center""><html:submit value="ȷ�ϸ���"></html:submit></td>
     	</tr>
     </table>
     </html:form>
     </div>
  </body>
</html>
