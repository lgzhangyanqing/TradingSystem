<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trading System Change password</title>
<script src = "js/angular.js"></script>
<script src="js/angular-route.min.js"></script>
<script src="js/angular-ui-router.min.js"></script>
<script>
	var app = angular.module("changePasswordApp", []);
	app.controller("changePasswordCtrl", function($scope, $http){
		$scope.newpasswordconfirm = "";
		$scope.email = "";
		$scope.changePassword = function(){
			$http({
				url: "changepassword",
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
	<input type="text" ng-model="email"  placeholder="Email Address"/>
	<h2>Please Input the new password!</h2>
	<hr>
	<h3>New Password</h3>
	<input type="text" ng-model="newpassword" placeholder="Enter your password"/>
	<h3>Confirm your password</h3>
	<input type="text" ng-model="newpasswordconfirm" placeholder="Confirm your password"/>
	<button ng-click="changePassword()">Submit</button>
</div>

</body>
</html>