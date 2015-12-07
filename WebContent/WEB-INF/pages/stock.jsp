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
<script src="js/jquery.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- for header and footer -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/extra/bootstrap-theme.css" rel="stylesheet">
<link href="css/extra/elegant-icons-style.css" rel="stylesheet" />
<link href="css/extra/font-awesome.min.css" rel="stylesheet" />
<link href="css/extra/style.css" rel="stylesheet">
<script src="js/angular.min.js"></script>
<script src="js/jquery.min.js"></script>

    <!-- Bootstrap CSS -->    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->

<script>
	var app = angular.module('mainModule', []);
	app.config(['$httpProvider', function ($httpProvider) {    
		$httpProvider.defaults.headers.post['Content-Type'] = 'application/json; charset=UTF-8';
	}]);
	app.controller('mainController', function($scope, $http) {
		$scope.stockList = [];
		$http.get("getStock").success(function(data) {
			$scope.stockList = data;
		}).error(function(data) {
			console.log(data);
		});
		
		$scope.symbol;
		$scope.desc;
		$scope.errorMsg;
		$scope.ifValid = false;		
		$scope.validStock = function(){
			$scope.message;
			$http({
				method: "POST",
				url: "validateStock",
				data: {symbol: $scope.symbol}
			}).success(function(data){
				$scope.message = data;
				if ($scope.message == "valid"){
					$scope.errorMsg = "";
					$scope.ifValid = true;
					console.log($scope.errorMsg);
				}else{
					$scope.errorMsg = $scope.message;
					$scope.ifValid = false;
				}
			})
			.error(function(data){
				console.log(data);
			});
		};		

		$scope.own = [];
		$http.get("stockOwned")
		.success(function(data){
			$scope.own = data;
		})
		.error(function(data){
			console.log(data);
		});
		
		$scope.hasOwn = function(stock){
			for (var i=0; i<$scope.own.length; i++){
				if (stock.sid == $scope.own[i].own.stock.sid){
					return true;
				}
			}
			return false;
		};	
	});
</script>
<style type="text/css">
.errors {
	color: red;
}
</style>
    
  </head>

  <body ng-app="mainModule">
  
  <c:import url="pageComponent/header.jsp" />
     

      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-table"></i> Stock</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
						<li><i class="fa fa-table"></i>Stock Process</li>
					</ol>
				</div>
			</div>
              <!-- page start-->
              <div class="row" ng-controller="mainController">
                  <div class="col-lg-8" >
                      <section class="panel">
                          <header class="panel-heading">
                              Stock
                          </header>
                         <div class="panel-body">
                       <form action="stock" id="listForm" method="post">
                          <table class="table table-striped table-advance table-hover">
                           <tbody>
                              <tr>
								<th>Stock ID</th>
								<th>Symbol</th>
								<th>Description</th>
								<th>Action</th>
                              </tr>
                              <tr ng-repeat="stock in stockList">
                                 <td>{{stock.sid}}</td>
								 <td>{{stock.symbol}}</td>
								 <td>{{stock.stockDesc}}</td>
								 <td>
									<button class="btn btn-info popovers" name="delete" 
									value="{{stock.sid}}" ng-disabled="hasOwn(stock)">Delete</button>
								 </td>
                              </tr>

                           </tbody>
                        </table>
                       </form>
                       
                       
    
	</div>
                      </section>
                  </div>
                  
                  <div class="col-md-4" >
                      <section class="panel">
                          <header class="panel-heading">
                              Stock
                          </header>
                         <div class="panel-body">
                         <h2>Add Stock</h2>
                         <p> You can add stock here by using valid stock symbol</p>
	<div class="errors" id="stock_error"" ng-show="!ifValid">{{errorMsg}}</div>
	<form action="addStock" id="j_addForm" name="addForm" method="post">
		<label style="width: 100px">Stock Symbol</label> 
		<input type="text" name="symbol" id="j_symbol" ng-model="symbol" ng-blur="validStock()"
		 	ng-model-options="{updateOn:'default blur'}" placeholder="e.g. YHOO" required />
		<span>*&nbsp;</span>
		<span class="errors" id="symbol_error" ng-show="addForm.symbol.$dirty && addForm.symbol.$invalid">
			Please enter the stock symbol!
		</span><br/>
		<label style="width: 100px">Description</label> 
		<input type="text" name="stockDesc" id="j_stockDesc" ng-model="desc"
			ng-model-options="{updateOn:'default blur'}" placeholder="e.g. Yahoo!" required/>
		<span>*&nbsp;</span>
		<span class="errors" id="desc_error" ng-show="addForm.stockDesc.$dirty && addForm.stockDesc.$invalid">
			Please enter the stock description!
		</span><br/>
		<input class="btn btn-info popovers" style="background-color:blue" type="reset" value="Reset" id="j_reset"/>
		<input class="btn btn-info popovers" type="submit" value="Submit" id="j_submit" 
			ng-disabled="!ifValid || addForm.stockDesc.$invalid"/>
	</form>
                        </div>
                      </section>
                  </div>
              </div>
              <!-- page end-->
              

              
          </section>
      </section>
      <!--main content end-->
  </section>
  <!-- container section end -->
    <!-- javascripts -->
    <script src="js/jquery.js"></script>
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="js/gritter.js" type="text/javascript"></script>
    <!--custome script for all page-->
    <script src="js/scripts.js"></script>


  </body>
</html>
