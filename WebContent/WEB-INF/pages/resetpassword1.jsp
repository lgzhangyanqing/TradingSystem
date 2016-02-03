<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>RailwayTicketingSystem | Registration Page</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport" />

<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet"
	href="<c:url value="/resource/js/bootstrap/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<c:url value="/resource/dist/css/AdminLTE.min.css"/>">
<!-- iCheck -->
<link rel="stylesheet"
	href="<c:url value="/resource/plugins/iCheck/square/blue.css"/>">

<!-- jQuery 2.1.4 -->
<script
	src="<c:url value="/resource/plugins/jQuery/jQuery-2.1.4.min.js"/>"></script>
<!-- Bootstrap 3.3.5 -->
<script
	src="<c:url value="/resource/js/bootstrap/js/bootstrap.min.js"/>"></script>
<!-- iCheck -->
<script src="<c:url value="/resource/plugins/iCheck/icheck.min.js"/>"></script>
<!-- Angular js -->
<script src="<c:url value="/resource/js/angular/angular.js"/>"></script>
 <style>
  .body-class {
  	background-image:url(/MyRTS/resource/image/trainlogin_wz.jpg);
  	background-size: cover;
    background-repeat: no-repeat;
	}
  </style>
<script>
	$(function() {
		$('input').iCheck({
			checkboxClass : 'icheckbox_square-blue',
			radioClass : 'iradio_square-blue',
			increaseArea : '20%' // optional
		});
	});
</script>

<script>
	angular.module("registerModule", []).controller("registerController",
			function($scope, $http) {
			});
</script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition register-page body-class">
	<div class="register-box">
		<div class="register-logo">
			<a href="/MyRTS/main.html" style="color:#3c8dbc"><b>Railway Ticketing System</b></a>
		</div>

		<div class="register-box-body">
			<p class="login-box-msg">Enter a New Password</p>
			<form name="registerForm" id="register-form" ng-app="registerModule"
				ng-controller="registerController" ng-model="registerForm"
				action="<c:url value='/resetpassword/reset/${md5}'/>" method="post"
				id="register-form">
				<div class="form-group has-feedback"
					ng-class="{	'has-error':registerForm.password.$dirty && registerForm.password.$error.required,'has-warning':registerForm.password.$error.minlength ||registerForm.password.$error.maxlength}">
				    <div id="forgot-password">
			      	  <p>New password</p>
			        </div>
					<input type="password" name="password" class="form-control"
						placeholder="Password" ng-minlength="5" ng-maxlength="20"
						ng-model="password" required> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback"
					ng-class="{'has-error': (registerForm.password.$modelValue !== registerForm.repassword.$modelValue) && registerForm.repassword.$dirty}">
					<div id="forgot-password">
			      	  <p>Confirm new password</p>
			        </div>
					<input type="password" name="repassword" class="form-control"
						placeholder="Confim Password" ng-model="repassword"> <span
						class="glyphicon glyphicon-log-in form-control-feedback"></span>
				</div>
				<div class="row">
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat"
							ng-disabled="registerForm.$invalid || (registerForm.password.$modelValue !== registerForm.repassword.$modelValue) ">Continue</button>
					</div>
					<!-- /.col -->
				</div>
			</form>

		<!-- <div class="social-auth-links text-center">
          <p>- OR -</p>
          <a href="https://www.facebook.com/" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign up using Facebook</a>
          <a href="https://myaccount.google.com/" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign up using Google+</a>
        </div> -->
			

		</div>
		<!-- /.form-box -->
	</div>
	<!-- /.register-box -->
</body>
</html>
