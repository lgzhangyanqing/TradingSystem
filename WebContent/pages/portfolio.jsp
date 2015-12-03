<div class="container"  ng-controller="porController" id="main">
	<div class="row">
		<div class="panel panel-default col-md-10">
			<div class="panel-head">
				<div class="container">
					<div>
						<h4>Pick up your <span class="glyphicons glyphicons-heart-empty"></span> stock</h4>
					</div>
					<form class="form">
						<div class="form-group">
							<label class="control-lable col-md-1">Stock Symbol: </label>
							<div class="col-md-4">
							<input class="form-control" type="text" ng-model="stock.symbol">
							</div>
							<button class="btn btn-primary" ng-click="add()">
								<span class="glyphicon glyphicon-adding"></span> Add to My Portfolio
							</button>
						</div>
						<!-- <div calss="form-group">
							<button class="btn btn-primary" ng-click="add()">
								<span class="glyphicon glyphicon-adding"></span> Add to My Portfolio
							</button>
						</div> -->
					</form>
				</div>
			</div>
			<div class="panel-body">
				<table class="table">
					<tr>
						<th>
							<a href="" ng-click="order('symbol')">Stock Symbol</a>
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
						<th>
							Quantity
						</th>
						<th>
							Transaction
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
						<td>
							{{this.quantity}}
						</td>
						<td>
					        <button class="btn btn-success" ng-click="pass(stock); openBuy()">
					        	 BUY
					        </button>
					        <button class="btn btn-danger" ng-click="pass(stock); openSell()">
					        	 SELL
					        </button>
					    </td>
					</tr>
				</table>
			</div>
		</div>
		<div class="panel panel-default col-md-2">
			<div class="container">
			<h3>My Balance:</h3>
			<p>$ {{user.balance}}</p>
			<button class="btn btn-success" ng-click="openAdd()">Manage</button>
			</br>
			</div>
		</div>
	</div>
</div>
<script src="js/app.js"></script>