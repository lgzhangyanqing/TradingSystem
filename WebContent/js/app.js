(function(){
	var app = angular.module('main', ['ngRoute','ngMessages'])
	
	app.service("shared", function() {
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
	});
	
	

	app.config(function($routeProvider, $locationProvider) {
	  $routeProvider
		  .when('/', {
		    templateUrl: 'pages/landing.jsp',
		    controller: 'homeController',
		  })
		  .when('/land', {
			    templateUrl: 'pages/landing.jsp',
			    controller: 'signController',
		  })
		  .when('/login_form', {
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
		 /* .when('/confirmation',{
			  templateUrl:'pages/confirmation.jsp',
			  controller:"homeController",
		  })*/
		  /*.otherwise({ redirectTo: '/' });*/
	  
	  	/*$locationProvider.html5Mode(true);*/
	});
	
	app.controller('MainController',  function($scope, $interval, $http, $rootScope, shared) {
		$scope.user;
		$scope.loading=false;
		$scope.percent = Math.random()*50+"%";
		$http.get("validTran")
		.success(function(data) {
			$scope.user = data;
			shared.setUser($scope.user);
		}).error(function(data) {
			console.log("AJAX ERROR");
		});	
		
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
				url: "/market",
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
	    
	    
	});
	/*app.controller('ModalInstanceCtrlBuy', function ($scope, $modalInstance, $http, items, shared) {
		$scope.user = shared.getUser();	
		$scope.Math = window.Math;
		$scope.buyItem = items;
		$scope.upper = Math.floor($scope.user.balance / $scope.buyItem.price);
		$scope.quan = 1;
		$scope.newTran;
		$scope.$watch("quan",function(val,old){
			val = isNaN(val)?"1":val;
		    $scope.quan = parseInt(val); 
		});
			
		$scope.send = function(){
			$http({
				method: "POST",
				url: "addPending",
				data: $scope.newTran = {
						tid:0,
						own: {
							user: $scope.user,
							stock: {
								sid: $scope.buyItem.stock.sid,
								symbol: $scope.buyItem.stock.symbol,
								stockDesc: $scope.buyItem.stockName
							},
						},
						amount: $scope.quan,
						price: $scope.buyItem.price,
						ts: new Date()
				}
			}).success(function (response) {
				console.log(response);
			}).error(function (data) {
				console.log(data);
			}); 
		};
		
		$scope.ok = function () {
			$scope.send();
			$modalInstance.close($scope.buyItem);
		};

		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	});
	app.controller('ModalInstanceCtrlSell', function ($scope, $modalInstance, $http, items, shared) {
		$scope.user = shared.getUser();	
		$scope.Math = window.Math;
		$scope.sellItem = items;
		$scope.quan = 1;
		$scope.newTran;
		$scope.$watch("quan",function(val,old){
			val = isNaN(val)?"1":val;
		    $scope.quan = parseInt(val); 
		});
		
		$scope.getAmount = function(sellItem){
			$scope.stockInfo = shared.getStockInfo();
			for (var i=0; i< $scope.stockInfo.length; i++){
				if (sellItem.stock.sid == $scope.stockInfo[i].stock.sid){
					return $scope.stockInfo[i].quantity;
				}
			}
			return 0;
		};
		
		$scope.send = function(){
			$http({
				method: "POST",
				url: "addPending",
				data: $scope.newTran = {
						tid:0,
						own: {
							user: $scope.user,
							stock: {
								sid: $scope.sellItem.stock.sid,
								symbol: $scope.sellItem.stock.symbol,
								stockDesc: $scope.sellItem.stockName
							},
						},
						amount: -$scope.quan,
						price: $scope.sellItem.price,
						ts: new Date()
				}
			}).success(function (response) {
				console.log(response);
			}).error(function (data) {
				console.log(data);
			}); 
		};
		
		$scope.ok = function () {
			$scope.send();
			$modalInstance.close($scope.sellItem);
		};

		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	});*/
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
		$scope.openBuy = function () {
			
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
		
		$scope.stocksArray = [];
		$interval(function() {
			$http({
				method: "GET",
				url: "/market",
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
	  
	   /* 
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
	
	app.controller("headerCtrl",function($scope,$http){
		$scope.user = [];
			$http.get("header")
			.success(function(data) {
				$scope.user = data;
				console.log(data);
			}).error(function(data) {
				console.log("AJAX ERROR!");
			});
	});
	   
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