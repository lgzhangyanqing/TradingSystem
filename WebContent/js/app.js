(function(){
	var app = angular.module('main', ['ngRoute'])
	
	app.controller('MainController', function($scope, $interval, $http, $route, $routeParams, $location) {
	     $scope.$route = $route;
	     $scope.$location = $location;
	     $scope.$routeParams = $routeParams;
	     
	 });
	
	
	/* .controller('HomeController', function($scope, $routeParams) {
	     $scope.name = "BookController";
	     $scope.params = $routeParams;
	 })*/
	/*app.controller('HomeController', ['$scope', 'links', function($scope, photos) {
		 photos.success(function(data) {
		    $scope.photos = data;
		 });
	}]);
	
	 app.controller('historyController', ['$scope', 'links', '$routeParams', function($scope, links, $routeParams) {
		  photos.success(function(data) {
		    $scope.detail = data[$routeParams.id];
		  });
	}]);*/
	app.config(function($routeProvider, $locationProvider) {
	  $routeProvider
	  .when('/', {
	    templateUrl: 'pages/main.html',
	    controller: 'homeController',
	  })
	  .when('/marketdata', {
	    templateUrl: 'pages/marketData.html',
	    controller: 'stockController',
	  })
	  .when('/history', {
	    templateUrl: 'pages/history.html',
	    controller: 'historyController',
	  })
	  .when('/transaction', {
	    templateUrl: 'pages/transaction.html',
	    controller: 'transactionController',
	  })
	  .when('/search', {
	    templateUrl: 'search.html',
	    controller: 'searchController',
	  })
	  .otherwise({ redirectTo: '/' });
	  /*$locationProvider.html5Mode(true);*/
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
	});
	app.controller('homeController',function($http){
		$scope.message="mainhome";
	});
	app.controller('historyController',function($http){
		$scope.message="history";
	});
	app.controller('searchController',function($http){
		$scope.message="search";
	});
	app.controller('transactionController',function($http){
		$scope.message="transaction";
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