<%@page contentType="text/html;charset=utf-8"%>
<%@include file="common.jsp"%>		
			
					<p id="whereami">
					</p>
					<h1>
						<bean:message key="jsp.logon.title"/>
					</h1>
					<p>
						&nbsp;<font color="red"><html:errors property="logonfirst" /></font>
					</p>

					<html:form action="/logon" method="post">
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table">
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

						</table>

						<p>
							<input type="submit" class="button" value="提交 &raquo;" />
						</p>
						<html:errors property="" />
					</html:form>

					<p>
						&nbsp;
					</p>