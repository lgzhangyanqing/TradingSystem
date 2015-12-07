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