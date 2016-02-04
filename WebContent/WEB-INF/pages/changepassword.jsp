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

<!-- Favicons================================================== -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.css">
<!-- Slider================================================== -->
<link href="css/owl.carousel.css" rel="stylesheet" media="screen">
<link href="css/owl.theme.css" rel="stylesheet" media="screen">
<!-- Stylesheet ================================================== -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/responsive.css">
<link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/stylesheet.css" rel="stylesheet">
<link href="css/landing-page.css" rel="stylesheet">
<link rel="stylesheet" href="css/animate.min.css" type="text/css">
<link rel="stylesheet" href="css/creative.css" type="text/css">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/modernizr.custom.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="js/angular.js"></script>
<script src="js/angular.min.js"></script>
<script src="js/angular-route.min.js"></script>
<script src="js/angular-ui-router.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular-messages.js"></script>
<script src="js/app2.js"></script>
<script>
	var app = angular.module("changePasswordApp", []);
	app.controller("changePasswordCtrl", function($scope, $http){
		$scope.newpasswordconfirm = "";
		$scope.email = "";
		$scope.changePassword = function(){
			$http({
				url: "change",
				method: "GET",
				params: {newpasswordconfirm: $scope.newpasswordconfirm, email:$scope.email}
			}).then(function(response){
				console.log("change password success!!");
			});
		}
	});
</script>

</head>






<body ng-app="changePasswordApp">
<div ng-controller="changePasswordCtrl">
	<h1>Input Email again</h1>
	<input type="text"  ng-model="email=${email}" placeholder="Email Address"/>
	<h2>${username}, Please Input the new password!</h2>
	<hr>
	<h3>New Password</h3>
	<input type="text" ng-model="newpassword"  placeholder="Enter your password"/>
	<h3>Confirm your password</h3>
	<input type="text" ng-model="newpasswordconfirm" placeholder="Confirm your password"/>
	<a ng-click="changePassword()" href="http://localhost:8080/TradingSystem/login.html">Submit</a>
</div>

</body>
</html>