(function(){
	var app = angular.module('main', ['ngRoute','ngMessages'])
	/*app.service("shared", function() {
	var _stock = null;
	var _user = null;
	var _stockInfo = null;
	return {
		getStock : function() {
			return _stock;
		},
		setStock : function(stock) {
			_stock = stock;
		},
		getUser : function() {
			return _user;
		},
		setUser : function(user){
			_user = user;
		},
		getStockInfo : function(){
			return _stockInfo;
		},
		setStockInfo : function(stockInfo){
			_stockInfo = stockInfo;
		}
		};
	});*/
	app.controller('MainController', function($scope, $interval, $http, $route, $routeParams, $location) {
	     $scope.$route = $route;
	     $scope.$location = $location;
	     $scope.$routeParams = $routeParams;
	     
	 });
	

	app.config(function($routeProvider, $locationProvider) {
	  $routeProvider
		  .when('/', {
		    templateUrl: 'pages/home.jsp',
		    controller: 'homeController',
		  })
		  /*.when('/home', {
			    templateUrl: 'pages/home.jsp',
			    controller: 'signController',
		  })*/
		  .when('/login', {
			    templateUrl: 'pages/login.jsp',
			    controller: 'loginController',
		  })
		   .when('/sign', {
			    templateUrl: 'pages/sign.jsp',
			    controller: 'signController',
		  })
		  .when('/marketdata', {
		    templateUrl: 'pages/marketData.jsp',
		    controller: 'stockController',
		  })
		  .when('/history', {
		    templateUrl: 'pages/history.jsp',
		    controller: 'historyController',
		  })
		  .when('/portfolio', {
			    templateUrl: 'pages/portfolio.jsp',
			    controller: 'porController',
		  })
		  /*.otherwise({ redirectTo: '/' });*/
	  
	  	$locationProvider.html5Mode(true);
	});
	app.controller('homeController',function($http, $routeParams){
		$scope.params = $routeParams;
	});
	app.controller('loginController',function($http, $routeParams){
		$scope.params = $routeParams;
	});
	app.controller('signController',function($http, $routeParams){
		$scope.params = $routeParams;
		$scope.pw1 = 'password';

	});
	app.controller('stockController',function($scope, $interval, $http,$routeParams) {
		// Initialization
		$scope.stocksArray = [];
		$interval(function() {
			$http({
				method: "GET",
				url: "rest/market",
			}).success(function(data) {
				$scope.stocksArray = data;
			}).error(function(data) {
				alert("AJAX Error!");
			});
		}, 2000);
		$scope.params = $routeParams;
		
		
			
		/*$scope.hasStock = function(stock) {
			console.log(stock);
			for (var i=0; i<$scope.stockInfo.length; i++){
				if (stock.stock.sid == $scope.stockInfo[i].stock.sid){
					return true;
				}
			}
			return false;
		};
		*/
		$scope.predicate = 'stock.stock.symbol';
	    $scope.reverse = true;
	    $scope.order = function(predicate) {
	      $scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
	      $scope.predicate = predicate;
	    };
	});
	app.controller('homeController',function($http, $routeParams){
		$scope.params = $routeParams;
		$scope.message="mainhome";
	});
	app.controller('historyController',function($http, $routeParams){
		$scope.params = $routeParams;
		$scope.message="history";
	});
	
	app.controller('porController',function($scope,$interval, $http,$routeParams){
		/*$scope.stockInfo = [];
		$interval(function() {
		$http.get("getOwnInfo")
		.success(function(data){
			$scope.stockInfo = data;
			shared.setStockInfo($scope.stockInfo);
			$scope.percent = "100%";
			window.setTimeout(function() {
			     $scope.$apply(function() {
			        $scope.loading = true;
			     });
			 }, 1000);
		}).error(function(data){
			console.log("AJAX ERROR");
		});
		}, 2000);*/
		
		$scope.stocksArray = [];
		$interval(function() {
			$http({
				method: "GET",
				url: "rest/market",
			}).success(function(data) {
				$scope.stocksArray = data;
			}).error(function(data) {
				alert("AJAX Error!");
			});
		}, 2000);
		$scope.params = $routeParams;
		
		$scope.pass = function(stock) {
			shared.setStock(stock);
		};
		$scope.predicate = 'stock.stock.symbol';
	    $scope.reverse = true;
	    $scope.order = function(predicate) {
	      $scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
	      $scope.predicate = predicate;
	    };
	  
	   /* $scope.openBuy = function () {
			
			$scope.item = shared.getStock();
			var modalInstance = $modal.open({
				animation: $scope.animationsEnabled,
				templateUrl: 'buyContent.html',
				controller: 'ModalInstanceCtrlBuy',
				resolve: {
					items: function () {
						return $scope.item;
					}
				}
			});

			modalInstance.result.then(function (selectedItem) {
				$scope.selected = selectedItem;
			}, function () {
				$log.info('Modal dismissed at: ' + new Date());
			});
		};
		
		$scope.openSell = function () {
			
			$scope.item = shared.getStock();
			var modalInstance = $modal.open({
				animation: $scope.animationsEnabled,
				templateUrl: 'sellContent.html',
				controller: 'ModalInstanceCtrlSell',
				resolve: {
					items: function () {
						return $scope.item;
					}
				}
			});

			modalInstance.result.then(function (selectedItem) {
				$scope.selected = selectedItem;
			}, function () {
				$log.info('Modal dismissed at: ' + new Date());
			});
		};*/
	});
	app.controller('transactionController',function($http){
		$scope.message="transaction";
	});
	var pwCheck=  function(){
		 return {
		        require: 'ngModel',
		        link: function (scope, elem, attrs, ctrl) {
		          var firstPassword = '#' + attrs.pwCheck;
		          elem.add(firstPassword).on('keyup', function () {
		            scope.$apply(function () {
		              var v = elem.val()===$(firstPassword).val();
		              ctrl.$setValidity('pwmatch', v);
		            });
		          });
		        }
		      };
	}
	app.directive('pwCheck', pwCheck);
	   
/*	app.factory('links', ['$http', function($http) {
		  return $http.get('/links.json')
		         .success(function(data) {
		           return data;
		         })
		         .error(function(data) {
		           return data;
		         });	  
	}]);*/
})()