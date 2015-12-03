<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container"  ng-controller="stockController" id="main">
<div class="panel panel-default">
	<div>
		<h4>Pick up your <span class="glyphicons glyphicons-heart-empty"></span> stock</h4>
	</div>
	<div class="panel-head">
		<form class="form">
			<div class="form-group col-md-6">
				<label>Stock Symbol</label>
				<input class="form-control" type="text" ng-model="stock.id">
			</div>
			<!-- <div calss="form-group col-md-6">
				<button class="btn btn-primary" ng-click="search()">
					<span class="glyphicon glyphicon-search"></span> Search
				</button>
			</div> -->
		</form>
	</div>
	<div class="panel-body">
		<table class="table table-stripped">
			<tr>
				<th>
					<a href="" ng-click="order('id')">Stock Symbol</a>
					<span class="sortorder" ng-show="predicate === 'id'" ng-class="{reverse:reverse}"></span>
				</th>
				<th>
					<a href="" ng-click="order('name')">Stock Name</a>
					<span class="sortorder" ng-show="predicate === 'name'" ng-class="{reverse:reverse}"></span>
				</th>
				<th>
					<a href="" ng-click="order('price')">Price</a>
					<span class="sortorder" ng-show="predicate === 'price'" ng-class="{reverse:reverse}"></span>
				</th>
				<th>
					<a href="" ng-click="order('change')">Change</a>
					<span class="sortorder" ng-show="predicate === 'change'" ng-class="{reverse:reverse}"></span>
				</th>
				<th>
					<a href="" ng-click="order('pchange')">Change%</a>
					<span class="sortorder" ng-show="predicate === 'pchange'" ng-class="{reverse:reverse}"></span>					
				</th>
			</tr>
			<tr ng-repeat="stock in stocksArray | orderBy:predicate:reverse | filter:stock.id">
				<td>{{stock.id}}</td>
				<td>{{stock.name}}</td>
				<td>{{stock.price}}</td>
				<td>
					<b ng-if="stock.change>0" style="color:green">{{stock.change}}</b>
					<b ng-if="stock.change<0" style="color:red">{{stock.change}}</b>
					<b ng-if="stock.change==0" style="color:black">{{stock.change}}</b>
				</td>
				<td>
					<b ng-if="stock.pchange.indexOf('-')>-1" style="color:red">{{stock.pchange}}</b>
					<b ng-if="stock.pchange.indexOf('+')>-1" style="color:green">{{stock.pchange}}</b>
					<b ng-if="stock.pchange.indexOf('0')==0" style="color:black">{{stock.pchange}}</b>
				</td>
			</tr>
		</table>
	</div>
</div>
</div>
<script src="js/app.js"></script>
