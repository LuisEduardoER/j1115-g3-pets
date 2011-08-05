<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/taglib/common.jsp"%>

<script type="text/javascript">
  function imagechange(){
        document.getElementById("authImg").innerHTML = "<img id='authImg' src='/petshop/checkNum.do?id="+(new Date()).toString()+"' onclick='imagechange()' />";
  }


</script>

          <html:form action="/login" method="post">
                  <p align="center">
							<img src="<%=request.getContextPath()%>/resource/2.png"/>
					</p>
						<table align="center">
							<tr>    
								<td valign="middle" align="right">
									<bean:message key="jsp.username"/>:
								</td>

								<td valign="middle" align="left">
									<html:text property="username"/> <html:errors property="username"/>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									<bean:message key="jsp.password"/>:
								</td>
								<td valign="middle" align="left">
									<html:password property="password"/> <html:errors property="password"/>
								</td>
							</tr>
							<tr>
					<td>
						验证码:
					</td>
					<td>
						<input type="text" name="checknum" size="10">&nbsp&nbsp<span style="cursor:pointer;display:inline-block;" id="authImg"><img src="/petshop/checkNum.do" onclick="imagechange()"/></span>
						<font color="red">${msg}</font>
					</td>
				</tr>
							<tr align="center">
								<td >
									<input type="submit" class="button" value="登录 &raquo;" />
								</td>
							</tr>
						</table> 
   </html:form>