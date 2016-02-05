<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Success page</title>
<!-- for header and footer -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/extra/bootstrap-theme.css" rel="stylesheet">
<link href="css/extra/elegant-icons-style.css" rel="stylesheet" />
<link href="css/extra/font-awesome.min.css" rel="stylesheet" />    
<link href="css/extra/style.css" rel="stylesheet">
<script src="js/angular.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
#time, p, a {
	text-align:center;
	font-family: 'Unkempt', cursive;
	letter-spacing: 2px;
	font-weight: 700;
}

</style>
<script type="text/javascript">
	angular.module("mainApp",[]).controller("mainCtrl",function($scope,$timeout){
		$scope.submit=function(){
			document.getElementById("signin").click();
		};
		
		$scope.counter = 5;
	    $scope.onTimeout = function(){
	        $scope.counter--;
	        if($scope.counter == 0){
	        	console.log($scope.counter);
	        	$scope.submit();
	        }
	        $timeout($scope.onTimeout,1000);
	    }
	    var mytimeout = $timeout($scope.onTimeout,1000);
	});
	</script>
</head>
<body style="background-color:grey;"ng-app="mainApp" ng-controller="mainCtrl">
	<section id="main-content" style="margin-top:100px;">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-8" style="float:none;margin:auto;text-align:center">
				 <section class="panel panel-info">
				 <div class="panel-heading">
				 	Activation Done
				 </div>
				 <div class="panel-body">
				<h1>{{counter}}</h1>
			<h1 style="color:#0099CC;">Change SuccessFully!, ${userName}</h1>
			
			<h2 id="go_home">This page will goto Yahoo Finance page after 5 seconds, if not <a id="myLink" ng-click="submit()">click this link</a></h2>

				<form name="login-form" action="login" method="GET"  ng-submit="submit()" style="display:none">
					
					<button type="submit" id="signin" type="submit" >Submit</button>
				</form>
			</div>
		</section>
	</div>
	</div>
	</section>
	</section>
</body>
</html>