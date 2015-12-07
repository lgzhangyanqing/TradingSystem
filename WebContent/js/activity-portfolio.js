angular.module('ui.bootstrap.demo', [ 'ngAnimate', 'ui.bootstrap', 'ngResource','chart.js']);
var app = angular.module('ui.bootstrap.demo');
app.config(['$httpProvider', function ($httpProvider) {    
	$httpProvider.defaults.headers.post['Content-Type'] = 'application/json; charset=UTF-8';
}]);
app.service("shared", function() {
	var _stock = null;
	var _user = null;
	var _stockInfo = null;
	var _message = null;
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
		},
		getMessage : function(){
			return _message;
		},
		setMessage : function(message){
			_message = message;
		}
	};
	$scope.message = shared.getMessage();
});

app.controller("mainController", ["$scope", "$interval" ,"$http", "$rootScope", "shared", 
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
	
	$scope.stockInfo = [];
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
		 }, 600);
	}).error(function(data){
		console.log("AJAX ERROR");
	});
	}, 2000);
	
	$scope.pass = function(stock) {
		shared.setStock(stock);
	};
	
	$scope.hasStock = function(stock) {
		for (var i=0; i<$scope.stockInfo.length; i++){
			if (stock.stock.sid == $scope.stockInfo[i].stock.sid){
				return true;
			}
		}
		return false;
	};
}]);

app.controller('ModalDemoCtrl', ['$scope', '$modal', '$log', 'shared', 
                                 function ($scope, $modal, $log, shared) {
	$scope.message = shared.getMessage();
	$scope.item;
	$scope.animationsEnabled = true;
	$scope.buySuccess=false;
	$scope.sellSuccess=false;
	$scope.addSuccess=false;
	
	$scope.openBuy = function () {		
		$scope.user = shared.getUser();
		$scope.buyItem = shared.getStock();
		var modalInstance = $modal.open({
			animation: $scope.animationsEnabled,
			templateUrl: 'buyContent.html',
			controller: 'ModalInstanceCtrlBuy',
			resolve: {
				items: function () {
					return $scope.user;
				}
			}
		});

		modalInstance.result.then(function (quan) {
			$scope.buySuccess = true;
			$scope.sellSuccess=false;
			$scope.addSuccess=false;
			$scope.user.balance = Math.round($scope.user.balance - $scope.buyItem.price * quan);
		}, function () {
			$log.info('Modal dismissed at: ' + new Date());
		});
	};
	
	$scope.openSell = function () {		
		$scope.user = shared.getUser();
		$scope.buyItem = shared.getStock();
		var modalInstance = $modal.open({
			animation: $scope.animationsEnabled,
			templateUrl: 'sellContent.html',
			controller: 'ModalInstanceCtrlSell',
			resolve: {
				items: function () {
					return $scope.user;
				}
			}
		});

		modalInstance.result.then(function (quan) {
			$scope.sellSuccess=true;
			$scope.buySuccess=false;
			$scope.addSuccess=false;
			$scope.user.balance = Math.round($scope.user.balance + $scope.buyItem.price * quan);
		}, function () {
			$log.info('Modal dismissed at: ' + new Date());
		});
	};
	
	$scope.openAdd = function () {		
		$scope.user = shared.getUser();
		var modalInstance = $modal.open({
			animation: $scope.animationsEnabled,
			templateUrl: 'addContent.html',
			controller: 'ModalInstanceCtrlAdd',
			resolve: {
				items: function () {
					return $scope.user;
				}
			}
		});
		modalInstance.result.then(function (quan) {
			$scope.addSuccess=true;
			$scope.buySuccess=false;
			$scope.sellSuccess=false;
			$scope.user.balance = $scope.user.balance + quan;
			
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
	$scope.buyItem = shared.getStock();
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
		$modalInstance.close($scope.quan);
	};

	$scope.cancel = function () {
		$modalInstance.dismiss('cancel');
	};
});

app.controller('ModalInstanceCtrlSell', function ($scope, $modalInstance, $http, items, shared) {
	$scope.user = shared.getUser();	
	$scope.Math = window.Math;
	$scope.sellItem = shared.getStock();
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
		$modalInstance.close($scope.quan);
	};

	$scope.cancel = function () {
		$modalInstance.dismiss('cancel');
	};
});

app.controller("ModalInstanceCtrlAdd", function($scope, $modalInstance, $http, items, shared) {
	$scope.balance = items.balance;
	$scope.quan = 1;
	$scope.$watch("quan",function(val,old){
	    val = isNaN(val)?"1":val;
		$scope.quan = parseInt(val);
	});
	
	$scope.add = function (){
		$http({
			method: "POST",
			url: "addBalance",
			data: $scope.quan
		}).success(function(data){
			console.log(data);
		}).error(function(data){
			console.log(data);
		});
	};
	
	$scope.ok = function () {
		$scope.add();
		$modalInstance.close($scope.quan);
	};

	$scope.cancel = function () {
		$modalInstance.dismiss('cancel');
	};

});
app.controller("PieCtrl", function ($scope,shared,$interval) {
	$interval(function() {
		$scope.labels=[];
		$scope.data=[];
		$scope.stockInfo = shared.getStockInfo();
		if($scope.stockInfo!=null){
			var vals = 0;
			for(var i = 0;i<$scope.stockInfo.length;i++){
				vals = $scope.stockInfo[i].quantity*$scope.stockInfo[i].price + vals;
			} 
			for(var i = 0;i<$scope.stockInfo.length;i++){
				var val = $scope.stockInfo[i].quantity*$scope.stockInfo[i].price;
				$scope.labels.push($scope.stockInfo[i].stockName+"("+Math.round(val/vals*100*10)/10+"%)");
				$scope.data.push(val);
			} 
		}
	}, 2000);
});
app.controller("BarCtrl", function ($scope,shared,$interval) {
	$scope.series = ['Volume',' '];
	$interval(function(){
		$scope.labels=[];
		$scope.data=[[]];
		$scope.stockInfo = shared.getStockInfo();
		if($scope.stockInfo!=null){
			for(var i = 0;i<$scope.stockInfo.length;i++){
				var val = $scope.stockInfo[i].quantity;
				$scope.labels.push($scope.stockInfo[i].stock.symbol);
				$scope.data[0].push(val);
			} 
		}
	}, 2000);
	});