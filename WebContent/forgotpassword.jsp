<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trading System Forgot Password</title>
<script src = "js/angular.js"></script>
<script src="js/angular-route.min.js"></script>
<script src="js/angular-ui-router.min.js"></script>
<script>
	var app = angular.module("mainApp", ["ngRoute"]);
	app.config(function($routeProvider){
		$routeProvider 
			.when("/page1", {
				templateUrl: "html/page1.html",
				controller: "mainCtrl"
			});
	});
	app.controller("mainCtrl", function($scope, $http){
		$scope.message = "Please check your input email to change the password!";
		$scope.email = "";
		$scope.sendEmail = function(){
			$http({
				url:"recoveraccountemail",
				method: "GET",
				params: {email:$scope.email}
			}).then(function(response){
				console.log("send email success");
			});
		};
	});
</script>
</head>
<body ng-app="mainApp">
<div ng-controller="mainCtrl">
	<h1>Recover Account</h1>
	<hr>
	<h2>Email Address</h2>
	<input type="text" ng-model="email"  placeholder="Email Address"/>
	<a href="#page1" ng-click="sendEmail()">Recover Account</a>
	<div ng-view></div>
</div>
</body>
</html>