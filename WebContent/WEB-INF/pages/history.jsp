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
    
    <script src="js/Chart.js"></script>
	<!-- <script src="js/Chart.Doughnut.js"></script>
 -->	
	<script src="js/angular-chart.js"></script>
	<link rel="stylesheet" href="css/angular-chart.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->
<script>
	var app = angular.module("mainModule", ['checklist-model',"chart.js"]);
	app.config(['$httpProvider', function ($httpProvider) {    
		$httpProvider.defaults.headers.post['Content-Type'] = 'application/json; charset=UTF-8';
	}]);
	app.service("shared", function() {
		var _history = null;
		return {
			getHistory : function() {
				return _history;
			},
			setHistory : function(history) {
				_history = history;
			}
		};
	});
	app.controller("pendingController", function($scope, $http) {
		$scope.pendingList = [];
		$http.get("myPending").
		success(function(data) {
			$scope.pendingList = data;
		}).error(function(data) {
			console.log("AJAX ERROR");
		});
		$scope.selected = {
				 pending: []
		};
		$scope.checkAll = function($event) {
			var checkbox = $event.target;
			$scope.selected.pending = [];
			if(checkbox.checked){
				for ( var i = 0; i < $scope.pendingList.length; i++) {
				    var entity = $scope.pendingList.indexOf($scope.pendingList[i]);
				    $scope.selected.pending.push(entity);
				}
			}else{
				$scope.selected.pending = [];
			}
        };
        $scope.hasPending = function(){
        	if ($scope.pendingList.length > 0) return true;
        	else return false;
        };
	});	
	
	app.controller("historyController", ["$scope", "$interval" ,"$http", "$rootScope", "shared", "$filter",
	                                     function($scope, $interval, $http, $rootScope ,shared, $filter ) {
		$scope.transList = [];
		$http.get("getHistory")
		.success(function(data) {
			$scope.transList = data;
			shared.setHistory(data);
			
		}).error(function(data) {
			alert("Please sign in!");
		});
		
		$scope.hasTran = function(){
        	if ($scope.transList.length > 0) return true;
        	else return false;
        };
        
        $scope.predicate = 'tid';
        $scope.reverse = true;
        $scope.order = function(predicate) {
          $scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
          $scope.predicate = predicate;
        };
	}]);
	app.filter("dateRange", function(){
		return function(items, d1, d2){
			if (!d1 || !d2){
				return items;
			}
			var filtered = [];
			angular.forEach(items, function(item){
				var timestamp = new Date(item.ts);
				timestamp.setHours(0,0,0,0);
				if (timestamp >= d1 && timestamp <= d2){
					filtered.push(item);
				}
			});
			return filtered;
		};
	});
	app.controller("BarCtrl", function ($scope,shared,$interval) {
		
		$interval(function(){
			$scope.labels=[];
			$scope.series = [];
			$scope.data=[[],[]];
			$scope.history = shared.getHistory();
			//console.log($scope.history.stock);
			if($scope.history!=null){
				for(var i = 0;i<$scope.history.length;i++){
					var stockSym = $scope.history[i].own.stock.symbol;
					var volume = $scope.history[i].amount;
					var ind = $scope.labels.indexOf(stockSym);
					if(ind==-1){
						$scope.labels.push(stockSym);
						if(volume>0){
							$scope.data[1].push(volume);
							$scope.data[0].push(0);
						}else if(volume<0){
							$scope.data[0].push(-volume);
							$scope.data[1].push(0);
						}
					} else {
						if(volume>0){
							$scope.data[1][ind] = volume+$scope.data[1][ind];
						}else if(volume<0){
							$scope.data[0][ind] = $scope.data[0][ind]-volume;
						}
					}
				} 
				$scope.series = ['Sell Stock', 'Buy Stock'];
			}
			console.log($scope.series);
		}, 1000);
		});
app.controller("LineCtrl", function ($scope,shared,$interval) {
		
		$interval(function(){
			$scope.labels = [];
			$scope.data=[[],[]];
			$scope.history = shared.getHistory();
			//console.log($scope.history.stock);
			if($scope.history!=null){
				for(var i = 0;i<$scope.history.length;i++){
					console.log($scope.history[i].ts);
					var stockTs = $scope.history[i].ts.split(" ")[0];
					var volume = $scope.history[i].amount;
					var ind = $scope.labels.indexOf(stockTs);
					if(ind==-1){
						$scope.labels.push(stockTs);
						if(volume>0){
							$scope.data[1].push(volume);
							$scope.data[0].push(0);
						}else if(volume<0){
							$scope.data[0].push(-volume);
							$scope.data[1].push(0);
						}
					} else {
						if(volume>0){
							$scope.data[1][ind] = volume+$scope.data[1][ind];
						}else if(volume<0){
							$scope.data[0][ind] = $scope.data[0][ind]-volume;
						}
					}
				} 
				$scope.series = ['Sell Stock', 'Buy Stock'];
				
			}
			console.log($scope.series);
		}, 1000);
		});
</script>
<style type="text/css">
	.error {
		color: red;
		visibility: hidden;
	}
	h1 {
		color: red;
	}
	th, td{
		text-align:center;
	}
	.sortorder:after {
    	content: '\25b2';
  	}
	.sortorder.reverse:after {
    	content: '\25bc';
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
					<h3 class="page-header"><i class="fa fa-table"></i>History</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
						<li><i class="fa fa-table"></i>History</li>
						<li><i class="fa fa-th-list"></i>Pending/Tansaction</li>
					</ol>
				</div>
			</div>
              <!-- page start-->
              <div class="row">
                  <div class="col-lg-12" ng-controller="pendingController" >
                    <div ng-if="hasPending()">
                      <section class="panel">
                          <header class="panel-heading">
                              Pending Transactions 
                          </header>
                          <div class="panel-body">
                        <form id="pendingList" action="history" method="get">
                          <table class="table table-striped table-advance table-hover">
                           <tbody>
                              <tr>
                                 <th><i class="icon_star"></i> User ID</th>
                                 <th><i class="icon_calendar"></i> Stock ID</th>
                                 <th><i class="icon_calulator"></i> Quantity</th>
                                 <th><i class="icon_currency_alt"></i> Stock Price</th>
                                 <th><i class="icon_mobile"></i> Transaction Time</th>
                                 <th><i class="icon_mobile"></i> Cancel</th>
                                 <th><i class="icon_cogs"></i> <input type="checkbox" name="selectAll" ng-model="selectAll" 
						         ng-click="checkAll($event)"/></th>
                              </tr>
                              <tr ng-repeat="pending in pendingList">
								 <td>{{pending.own.user.uid}}</td>
								 <td>{{pending.own.stock.sid}}</td>
								 <td>{{pending.amount}}</td>
								 <td>{{pending.price}}</td>
								 <td>{{pending.ts}}</td>
                                 <td>
                                  <div class="btn-group">
                                      <button class="cancel" name="cancel" 
									value={{pendingList.indexOf(pending)}}>Cancel</button>
                                  </div>
                                  </td>
                                  <td>
									<input id="tagglebox" ng-checked="selectAll" type="checkbox" 
									checklist-value="pendingList.indexOf(pending)" checklist-model="selected.pending" /> 
								  </td>
                              </tr>
                           </tbody>
                        </table>
                        
                        <br/>
						<div>
							<button class="cancel" name="cancelAll" value={{selected.pending}}>Cancel Selected</button>
						</div>
                       </form>
                       </div>
                      </section>
                    </div>
                  </div>
              </div>
        
              <!-- page end-->
              

              <div class="row">
                  <div class="col-lg-12" ng-controller="historyController" >
                      <section class="panel">
                          <header class="panel-heading">
                              Transaction History 
                          </header>
                          <div class="panel-body">
                          <div ng-if="!hasTran()">
							<h1>No transaction history</h1>
						  </div>
						  
				     <div ng-if="hasTran()">
				     	<form id="search" style="margin-bottom: 15px;text-align: center;">
							<label>Key word: </label>
							<input type="text" placeholder="Filter by" ng-model="criteria"/>
							<label>Between </label>
							<input type="date" name="lower" ng-model="startDate"/>
							<label>and</label>
							<input type="date" name="upper" ng-model="endDate"/>
						</form>
                
                          <table class="table table-striped table-advance table-hover" id="transHistory" >
                           <tbody>
                              <tr>
								<th>
									<a href="" ng-click="order('tid')">TID</a>
       								<span class="sortorder" ng-show="predicate === 'tid'" ng-class="{reverse:reverse}"></span>
								</th>
								<th>
									<a href="" ng-click="order('own.user.userName')">Username</a>
       								<span class="sortorder" ng-show="predicate === 'own.user.userName'" ng-class="{reverse:reverse}"></span>
								</th>
								<th>
									<a href="" ng-click="order('own.stock.symbol')">Stock Symbol</a>
       								<span class="sortorder" ng-show="predicate === 'own.stock.symbol'" ng-class="{reverse:reverse}"></span>
								</th>
								<th>
									<a href="" ng-click="order('amount')">Amount</a>
       								<span class="sortorder" ng-show="predicate === 'amount'" ng-class="{reverse:reverse}"></span>
								</th>
								<th>
									<a href="" ng-click="order('price')">Price</a>
       								<span class="sortorder" ng-show="predicate === 'price'" ng-class="{reverse:reverse}"></span>
								</th>
								<th>
									<a href="" ng-click="order('ts')">Transaction Time</a>
       								<span class="sortorder" ng-show="predicate === 'ts'" ng-class="{reverse:reverse}"></span>
								</th>
                              </tr>
                              <tr ng-repeat="tran in transList |dateRange:startDate:endDate |filter:criteria| orderBy:predicate:reverse">
								<td>{{tran.tid}}</td>
								<td>{{tran.own.user.userName}}</td>
								<td>{{tran.own.stock.symbol}}</td>
								<td>{{tran.amount}}</td>
								<td>{{tran.price}}</td>
								<td>{{tran.ts}}</td>
                              </tr>
                           </tbody>
                        </table>
                      </div>
                      </div>
                      </section>
                  </div>
              </div>
              <div class="row">
               <!-- chart morris start -->
              	<div class="col-lg-12">
                	<section class="panel">
                    	<header class="panel-heading">
                        	<h3>TRANSACTION SUMMARY CHARTs</Char>
                      	</header>
                      	<div class="panel-body">
                        	<div class="tab-pane" id="chartjs">
                      			<div class="row">
                          		<!-- Line -->
                          			<div class="col-lg-6">
                              			<section class="panel">
                                  			<header class="panel-heading">
                                      			Transaction by stock bar chart
                                  			</header>
                                  			<div class="panel-body text-center" ng-controller="BarCtrl">
												<canvas id="bar" class="chart chart-bar"
  chart-data="data" chart-labels="labels" chart-legend="true">
</canvas>
                                  			</div>
                              			</section>
                          			</div>    
                          			<div class="col-lg-6">
                              			<section class="panel">
                                  			<header class="panel-heading">
                                      			Transaction by date line chart
                                  			</header>
                                  			<div class="panel-body text-center" ng-controller="LineCtrl">
												<canvas id="line" class="chart chart-line" chart-data="data"
  chart-labels="labels" chart-legend="true" chart-series="series"
  chart-click="onClick" >
</canvas> 
                                  			</div>
                              			</section>
                          			</div>                          
                      			</div>
                      		</div>
						</div>
                    </section>
              	</div>
              	
              	 <!-- chart morris start -->
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
