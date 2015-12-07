<div class="container"  ng-controller="porController" id="main">
	<div class="row">
		<div class="panel panel-default col-md-10">
			<header class="panel-heading">
                  Stock
            </header>
				<div class="panel-head">
				<div class="container">
					<form class="form">
						<div class="form-group">
							<h4>Quick Check: </h4>
						</div>
						<div class="form-group">
							<label class="control-lable col-sm-2">Stock Symbol: </label>
							<div class="col-sm-3">
							<input class="form-control" type="text" ng-model="stock.symbol">
							</div>
						</div>
					</form>
				</div>
			</div> 
			
			<div class="panel-body">
			<form action="portfolio" id="listUserStocks" method="post">
				<table class="table table-striped table-advance table-hover">
					
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
				</form>
			</div>
		</div>
		<div class="panel panel-default col-md-2">
			<div class="container">
			<h3>My Balance:</h3>
			<p>$ {{user.balance}}</p>
			<button class="btn btn-success" ng-click="openAdd()">Manage</button>
			</div>
		</div>
	</div>
</div>
<script src="js/app.js"></script>
<div>
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
    <script type="text/ng-template" id="sellContent.html">
        <div class="modal-header">
            <h3 class="modal-title">Sell stocks: {{sellItem.stockName}} 
				(Currently own {{getAmount(sellItem)}})</h3>
        </div>
        <div class="modal-body">
            <label>Stock Symbol: </label>
			<b style="color:red">{{sellItem.stock.symbol}}</b><br/>
			<label>Stock Name: </label>
			<b style="color:red">{{sellItem.stockName}}</b><br/>
			<label>Unit Price: </label>
			<b style="color:red">{{sellItem.price}}</b><br/>
			<label>Quantity: </label>
			<input type="number" min="1" max={{getAmount(sellItem)}} value={{quan}} ng-model="quan"/>
			<input type="range" min="1" max={{getAmount(sellItem)}} value={{quan}} ng-model="quan"/>
			<br/>	
        </div>				
        <div class="modal-footer">
		<div>		
			<label style="margin-right:50px">Ready to sell <span style="color:red">{{quan}}</span>
			shares of <span style="color:red">{{sellItem.stock.symbol}}</span>? 
			Balance after transaction: <span style="color:red">$
			{{Math.round(user.balance + sellItem.price * quan)}}</span></label>
		</div><br/>
            <button class="btn btn-primary" type="button" ng-click="ok()">OK</button>
            <button class="btn btn-warning" type="button" ng-click="cancel()">Cancel</button>
        </div>
    </script>
    <script type="text/ng-template" id="addContent.html">
        <div class="modal-header">
            <h3 class="modal-title">Add Balance (Currently have {{balance}})</h3>
        </div>
        <div class="modal-body">
			<label>Amount: </label>
			<input type="number" min="1" max={{2147483647-balance}} value={{quan}} ng-model="quan"/>
			<input type="range" min="1" max={{2147483647-balance}} value={{quan}} ng-model="quan"/>
			<br/>
        </div>		
        <div class="modal-footer">
		<div>		
			<label style="margin-right:50px">Ready to add <span style="color:red">$ {{quan}}</span>
				 to your account? <br/>
				Balance after adding: <span style="color:red">$ {{balance + quan}}</span></label>
		</div><br/>
            <button class="btn btn-primary" type="button" ng-click="ok()">OK</button>
            <button class="btn btn-warning" type="button" ng-click="cancel()">Cancel</button>
        </div>
    </script>
</div>	