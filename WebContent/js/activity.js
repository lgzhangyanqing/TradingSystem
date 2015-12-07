angular.module('ui.bootstrap.demo', [ 'ngAnimate', 'ui.bootstrap', 'ngResource']);
var app = angular.module('ui.bootstrap.demo');
app.config(['$httpProvider', function ($httpProvider) {    
	$httpProvider.defaults.headers.post['Content-Type'] = 'application/json; charset=UTF-8';
}]);
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
app.controller("mainController", ["$scope", "$interval", "$http", "$rootScope", "shared", 
                                  function($scope, $interval, $http, $rootScope, shared) {
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
	

	
	$scope.stocksArray = [];
//	$interval(function() {
		$http.get("market")
		.success(function(data) {
			$scope.stocksArray = data;
		}).error(function(data) {
			console.log("AJAX ERROR!");
		});
//	}, 2000);
	$scope.pass = function(stock) {
		shared.setStock(stock);
	};
		
	$scope.hasStock = function(stock) {
		console.log(stock);
		for (var i=0; i<$scope.stockInfo.length; i++){
			if (stock.stock.sid == $scope.stockInfo[i].stock.sid){
				return true;
			}
		}
		return false;
	};
	
	$scope.predicate = 'stock.stock.symbol';
    $scope.reverse = true;
    $scope.order = function(predicate) {
      $scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
      $scope.predicate = predicate;
    };
	
}]);
app.controller('ModalDemoCtrl', ['$scope', '$modal', '$log', 'shared', 
                                 function ($scope, $modal, $log, shared) {
	$scope.item;
	$scope.animationsEnabled = true;
	
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
	};
}]);

// Please note that $modalInstance represents a modal window (instance) dependency.
// It is not the same as the $modal service used above.

app.controller('ModalInstanceCtrlBuy', function ($scope, $modalInstance, $http, items, shared) {
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
});