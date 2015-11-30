(function(){
	var app = angular.module('main', ['ngRoute'])
	
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
		  .when('/home', {
			    templateUrl: 'pages.home.jsps',
			    controller: 'signController',
		  })
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
		  .when('/transaction', {
		    templateUrl: 'pages/transaction.html',
		    controller: 'transactionController',
		  })
		  .when('/search', {
		    templateUrl: 'pages/search.html',
		    controller: 'searchController',
		  })
		  .otherwise({ redirectTo: '/' });
	  
	/*  $locationProvider.html5Mode(true);*/
	});
	app.controller('homeController',function($http, $routeParams){
		$scope.params = $routeParams;
	});
	app.controller('loginController',function($http, $routeParams){
		$scope.params = $routeParams;
	});
	app.controller('signController',function($http, $routeParams){
		$scope.params = $routeParams;
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
		
		$scope.predicate = 'stock.stock.id';
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