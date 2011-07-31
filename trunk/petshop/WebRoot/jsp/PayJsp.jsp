<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'PayJsp.jsp' starting page</title>

	<script type="text/javascript">
		function check(){
			for(var i=1;i<4;i++){
				var test = document.getElementById("pay"+i);
			if(test.checked){
					if(test.value==1){
							return false;
					}
					if(test.value==3){
						alert("付款成功！");
						return true;
					}
					if(test.value==2){
						
					}
				
				}
			}	
		}
	</script>
  </head>
  
  <body>
   		<%String orderid = request.getParameter("orderid");
   		request.setAttribute("orderid",orderid);
   			
   		 %>
     
     付款方式：<br>
     	<a>网银付款</a>
     	<a href="pay.do">余额付款</a>
     	<A href="paySucceed.jsp">货到付款</A><br/>
  	
  </body>
</html>
