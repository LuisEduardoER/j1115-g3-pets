<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/taglib/common.jsp" %>
<script type="text/javascript" src="../../pages/js/jquery.js"></script>
<script src="../../pages/js/jquery.js" type="text/javascript"></script>
<script src="../../pages/js/jquery.tipsy.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".signin").click(function(e) {
			e.preventDefault();
			$("fieldset#signin_menu").toggle();
			$(".signin").toggleClass("menu-open");
		});
		$("fieldset#signin_menu").mouseup(function() {
			return false
		});
		$(document).mouseup(function(e) {
			if ($(e.target).parent("a.signin").length == 0) {
				$(".signin").removeClass("menu-open");
				$("fieldset#signin_menu").hide();
			}
		});
	});
</script>

<div class="top">
	<div class="topcontent">
		<logic:notPresent scope="session" name="username" >
			<font color="#FF6600">Welcome to the Pet Shop</font>
			<a href="" class="signin"><span>Login</span>
			</a>|
			<a href="../../jsp/zhuce.jsp">Create Account</a>
			<fieldset id="signin_menu">
				<form method="post" id="signin" action="/petshop/login.do">
					<p>
					<label for="username">
						Username
					</label>
					<input id="username" name="username" value="" title="username"
						tabindex="4" type="text">
					</p>
					<p>
						<label for="password">
							Password
						</label>
						<input id="password" name="password" value="" title="password"
							tabindex="5" type="password">
					</p>
					<p class="remember">
						<input id="signin_submit" value="Sign in" tabindex="6"
							type="submit">
						<input id="remember" name="remember" tabindex="7"
							type="checkbox" />
						<label for="remember">
							Remember me
						</label>
					</p>
				</form>
			</fieldset>
		</logic:notPresent>
		<logic:present scope="session" name="username" >
			<font color="#FF6600">Welcome to the Pet Shop</font>
			<a href="../../myaccount/default.jsp">MyAccount</a>|
			<html:link action="/logoff">Log off</html:link>
		</logic:present>
	</div>
	<!--topcontent end-->
</div>
<!--top end-->