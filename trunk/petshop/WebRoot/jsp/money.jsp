<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib/common.jsp"%>
<html>
  <head>
    <title>My JSP 'money.jsp' starting page</title>
    <style type="text/css">
    .money{
	padding-top:100px;
	padding-left: 240px;
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
	font-size: 12px;
}
input{
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
	font-size: 12px;
}
.money table{
	border-spacing:3px;
	border-collapse:collapse;
	border-width:4px;
	border-color:#9FBE3F;
	border-style:double;
	text-align:center;
}
.money td{
	border:solid 1px #9FBE3F;
	padding:1px;
}
.money tr{
	border:solid 1px #9FBE3F;
	padding:3px;
}
 
    </style>
    
    <script type="text/javascript">
    	function hqs_gotoebank(){
    		location.href="/petshop/eBank.do";	
    	}
    	function hqs_goshopping(){
    		location.href="/petshop/index.do";	
    	}
    </script>
  </head>
 
	<div class="money">
       <logic:present name="user">
       <form action="" method="post">
       	<table width="60%" class="table" >
       
		<tr>
			<td>
				<strong>您的余额为：</strong>
				<bean:write name="user" property="money" />
			</td>
		</tr>
		<tr>
		<td>
			<input type="button" value="充值" onclick="hqs_gotoebank()"/>
			<input type="button"" value="去购物" onclick="hqs_goshopping()"/>
			</td>
		</tr>
	</table>
       </form>
</logic:present>
</div>
</html>
