<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<div class="container"  ng-controller="stockController" id="main">
      <section id="main-content">
          <section class="wrapper">
			<div class="panel panel-default">
				<div>
					<h4>Pick up your stock</h4>
				</div>
				<div class="panel-head">
					<form class="form">
						<div class="form-group col-md-6">
							<label>Stock Symbol</label>
							<input class="form-control" type="text" ng-model="stock.symbol">
						</div>
					</form>
				</div>
				<div class="panel-body">
					<table class="table table-stripped">
						<tr>
							<th>
								<a href="" ng-click="order('symbol')">Stock Symbol</a>
								<span class="sortorder" ng-show="predicate === 'symbol'" ng-class="{reverse:reverse}"></span>
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
							<sec:authorize access="hasRole('ROLE_USER')">
								<th style="color:#007aff">Transaction</th>
							 </sec:authorize> 
						</tr>
						<tr ng-repeat="stock in stocksArray | orderBy:predicate:reverse | filter:stock.symbol">
							<td>{{stock.stock.symbol}}</td>
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
							 <sec:authorize access="hasRole('ROLE_USER')">
			                	<td>
			                  		<div class="btn-group">
			                      		<a class="btn btn-primary" href="#" ng-click="pass(stock); openBuy()">Buy</a>
			                      		<a ng-if="hasStock(stock)" class="btn btn-success" href="#" ng-click="pass(stock); openSell()" >Sell</a>
			                  		</div>
			                  </td>
			               </sec:authorize> 
						</tr>
					</table>
					 <!-- loading bar -->
									<!-- <div class = "loadbox" ng-hide="loading">
										<div class = "loadbar">
											<div class="progress progress-striped active progress-sm" >
										    	<div class="progress-bar progress-bar-success"  role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:{{percent}}">
										        	<span class="sr-only">45% Complete</span>
										        </div>
								    		</div>
								     		<p>Loading...</p>
								    	</div>
								   </div> -->
				</div>
			</div>
		</section>
	</section>
</div>
<script src="js/app.js"></script>
	<script type="text/ng-template" id="buyContent.html">
        <div class="modal-header">
            <h3 class="modal-title">Buy stocks: {{buyItem.stockName}}</h3>
        </div>
        <div class="modal-body">
            <label>Stock Symbol: </label>
			<b style="color:red">{{buyItem.stock.symbol}}</b><br/>
			<label>Stock Name: </label>
			<b style="color:red">{{buyItem.stockName}}</b><br/>
			<label>Unit Price: </label>
			<b style="color:red">{{buyItem.price}}</b><br/>
			<label>Quantity: </label>
			<input type="number" min="1" max={{upper}} value={{quan}} ng-model="quan"/>
			<input type="range" min="1" max={{upper}} value={{quan}} ng-model="quan"/>
			<br/>	
        </div>				
        <div class="modal-footer">
		<div>		
			<label style="margin-right:50px">Ready to buy <span style="color:red">{{quan}}</span>
			shares of <span style="color:red">{{buyItem.stock.symbol}}</span>? 
			Balance after transaction: <span style="color:red">$
			{{Math.round(user.balance - buyItem.price * quan)}}</span> </label>
		</div><br/>
            <button class="btn btn-primary" type="button" ng-click="ok()">OK</button>
            <button class="btn btn-warning" type="button" ng-click="cancel()">Cancel</button>
        </div>
    </script>