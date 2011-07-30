<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/front.css" media="screen, projection" rel="stylesheet"
	type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/jquery.tipsy.js" type="text/javascript"></script>
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
		<font color="#FF6600">Welcome to the Pet Shop</font>
		<a href="login" class="signin"><span>Login</span>
		</a>|
		<a href="#">Create Account</a>
		<fieldset id="signin_menu">
			<form method="post" id="signin" action="/login">
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
					<input id="remember" name="remember_me" value="1" tabindex="7"
						type="checkbox">
					<label for="remember">
						Remember me
					</label>
				</p>
			</form>
		</fieldset>
	</div>
	<!--topcontent end-->
</div>
<!--top end-->