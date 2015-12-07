<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TradingSystem</title>
<script src="js/angular.min.js"></script>
<script src="js/checklist-model.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- for header and footer -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/extra/bootstrap-theme.css" rel="stylesheet">
<link href="css/extra/elegant-icons-style.css" rel="stylesheet" />
<link href="css/extra/font-awesome.min.css" rel="stylesheet" />    
<link href="css/extra/style.css" rel="stylesheet">
<script src="js/angular.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

    <!-- Bootstrap CSS -->    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="css/style-responsive.css" rel="stylesheet" />
<script>
var app = angular.module('mainModule', ['checklist-model']);
app.controller("mainController", function($scope, $http) {
			$scope.transList = [];
			$http.get("getPending")
			.success(function(data) {
				$scope.transList = data;
				console.log($scope.hasPending());
			}).error(function(data) {
				console.log("AJAX ERROR");
			});
			$scope.selected = {
					 trans: []
			};
			$scope.checkAll = function($event) {
				var checkbox = $event.target;
				$scope.selected.trans = [];
				if(checkbox.checked){
					for ( var i = 0; i < $scope.transList.length; i++) {
					    var entity = $scope.transList.indexOf($scope.transList[i]);
					    $scope.selected.trans.push(entity);
					}
				}else{
					$scope.selected.trans = [];
				}
	        };
	        $scope.hasPending = function(){
	        	if ($scope.transList.length > 0) return true;
	        	else return false;
	        };
		});	
</script>
<style type="text/css">
	.error {
		color:red;
		visibility:hidden;
	}
	th, td {
		text-align:center;
	}
</style>
</head>

 <body ng-app="mainModule">
  <!-- container section start -->
  <c:import url="pageComponent/header.jsp"/>
 
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-table"></i>Pending Process</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
						<li><i class="fa fa-table"></i>Pending Process</li>
					</ol>
				</div>
			</div>
              <!-- page start-->

              <div class="row">
                  <div class="col-lg-12" ng-controller="mainController" >
                      <section class="panel">
                          <header class="panel-heading">
                              Pending Status
                          </header>
                           <div class="panel-body">
                          <div ng-if="!hasPending()">
							 <h1>No Pendings!</h1>
						  </div>
						  
					<div ng-if="hasPending()">
                		<form id="pendingList" action="pending" method="get">
                          <table class="table table-striped table-advance table-hover" id="transHistory" >
                           <tbody>
                              <tr>
								<th>User ID</th>
								<th>Stock ID</th>
								<th>Amount</th>
								<th>Price</th>
								<th>Transaction Time</th>
								<th>Commit</th>
								<th>Drop</th>
								<th><input type="checkbox" name="selectAll" ng-model="selectAll" ng-click="checkAll($event)"/></th>
                              </tr>
                              <tr ng-repeat="tran in transList">
								<td>{{tran.own.user.uid}}</td>
								<td>{{tran.own.stock.sid}}</td>
								<td>{{tran.amount}}</td>
								<td>{{tran.price}}</td>
								<td>{{tran.ts}}</td>
								<td><button class="commit" name="commit" value={{transList.indexOf(tran)}}>Commit</button></td>
								<td><button class="drop" name="drop" value={{transList.indexOf(tran)}}>Drop</button></td>
								<td>
									<input id="tagglebox" ng-checked="selectAll" type="checkbox" 
									checklist-value="transList.indexOf(tran)" checklist-model="selected.trans" /> 
								</td>
                              </tr>
                           </tbody>
                        </table>
                        <br/>
						<div>
							<button class="commit" name="commitAll" value={{selected.trans}}>Commit Selected</button>
							<button class="drop" name="dropAll" value={{selected.trans}}>Drop Selected</button>
						</div>
                       </form>
                      </div>
                      </div>
                      </section>
                  </div>
              </div>
              
          </section>
      </section>
      <!--main content end-->
  </section>
  <!-- container section end -->
    <!-- javascripts -->
    <script src="js/jquery.js"></script>
    <script src="js/jquery-1.8.3.min.js"></script>
    <!-- nice scroll -->
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <!-- chartjs -->
    <script src="assets/chart-master/Chart.js"></script>
    <!-- custom chart script for this page only-->
	<script src="js/amcharts.js"></script>
	<script src="js/pie.js"></script>
	<script src="js/light.js"></script>
	<script src="js/pie2.js"></script>
    <!--custome script for all page-->
    <script src="js/scripts.js"></script>


  </body>
</html>