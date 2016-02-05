<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Trading System Change password</title>

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome/css/font-awesome.css">
<!-- Slider================================================== -->
<link href="css/owl.carousel.css" rel="stylesheet" media="screen">
<link href="css/owl.theme.css" rel="stylesheet" media="screen">
<!-- Stylesheet ================================================== -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/responsive.css">
<link
	href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/stylesheet.css" rel="stylesheet">
<link href="css/landing-page.css" rel="stylesheet">
<link rel="stylesheet" href="css/animate.min.css" type="text/css">
<link rel="stylesheet" href="css/creative.css" type="text/css">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/modernizr.custom.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="js/angular.js"></script>
<script src="js/angular.min.js"></script>
<script src="js/angular-route.min.js"></script>
<script src="js/angular-ui-router.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular-messages.js"></script>

<script src="js/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>
	
		var app = angular.module("changePasswordApp", [ "ngMessages" ]);

		var compareTo = function() {
			return {
				require : "ngModel",
				scope : {
					otherModelValue : "=compareTo"
				},
				link : function(scope, element, attributes, ngModel) {

					ngModel.$validators.compareTo = function(modelValue) {
						return modelValue == scope.otherModelValue;
					};

					scope.$watch("otherModelValue", function() {
						ngModel.$validate();
					});
				}
			};
		};
		app.directive("compareTo", compareTo);
		app.controller("changePasswordCtrl", function() {

		});

	
</script>

</head>
<body ng-app="changePasswordApp" class="forgotpassword">
	<div ng-controller="changePasswordCtrl">
		<div class="content-section-c">
			<div class="container">
				<div class="row">
					<section style="margin-top: 30px;">
						<div class="container">
							<div class="row">
								<div class="col-md-6 col-md-offset-3">
									<div class="panel panel-login">
										<div class="panel-heading"
											style="height: 80px; text-align: center; font-size: 14px; color: #134DEF; font-weight: bold;">
											<h2>Hello,${username}! Please Change Your Password</h2>
										</div>
										<div class="panel-body">
											<div class="row">
												<div class="col-lg-12">
													<form action="change2" method="post" name="registerform">

														<input type="text" name="userName" value="${username}"
															style="display: none" />
														<div class="form-group"
															ng-class="{ 'has-error': registerform.password.$touched && registerform.password.$invalid }">
															<label for="upassword" style="color: black;">
																Password:</label> <input type="password" name="password"
																id="j_passWord" tabindex="2" class="form-control"
																placeholder="Enter your password" ng-model="passWord"
																ng-pattern="/^[a-zA-Z0-9]+$/" ng-minlength="6"
																ng-maxlength="20" required>
															<div class="help-block"
																ng-messages="registerform.password.$error"
																ng-messages-multiple
																ng-if="registerform.password.$dirty">
																<p ng-message="required" style="color: #f05f40;">This
																	field is required</p>
																<p ng-message="minlength" style="color: #f05f40;">This
																	field is too short. Minimum: 6.</p>
																<p ng-message="maxlength" style="color: #f05f40;">This
																	field is too long</p>
																<p ng-message="pattern" style="color: #f05f40;">This
																	field only accept alphabet and numbers</p>
															</div>
														</div>
														<div class="form-group">
															<label for="upassword" style="color: black;">
																Confirm your password:</label> <input type="password"
																name="confirmPassword" id="confirm-password"
																tabindex="2" class="form-control"
																placeholder="Confirm your password"
																ng-model="confirmPassword" compare-to="passWord"
																required>
															<div class="help-block"
																ng-messages="registerform.confirmPassword.$error"
																ng-messages-multiple
																ng-if="registerform.confirmPassword.$dirty">
																<p ng-message="compareTo" style="color: #f05f40;">Must
																	match the previous entry</p>
																<p ng-message="required" style="color: #f05f40;">This
																	field is required</p>
															</div>
														</div>
														<button type="submit" class="btn btn-success" >Submit</button>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>

</body>
</html>