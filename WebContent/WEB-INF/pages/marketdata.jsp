<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

<title>Real Time Market Data</title>
    <script src="js/angular.min.js"></script>
    <script src="js/ui-bootstrap-tpls-0.13.4.min.js"></script>
    <script src="js/angular-animate.min.js"></script>
    <script src="js/activity.js"></script>
    <script src="js/angular-resource.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <!-- for header and footer -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/extra/bootstrap-theme.css" rel="stylesheet">
<link href="css/extra/elegant-icons-style.css" rel="stylesheet" />
<link href="css/extra/font-awesome.min.css" rel="stylesheet" />    
<link href="css/extra/style.css" rel="stylesheet">
<script src="js/angular.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

    <!-- Bootstrap CSS -->    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->
<style>
	h3 {
		color: blue;
	}
	th, td {
		text-align:center;
	}
	input[type="range"] {
    display:inline;
	padding-top:6px;
    width: 200px;
    height:20px;
	}
	input[type="range"]::-webkit-slider-thumb {
    	background-color: #666;
    	padding-top:10px;
    	width: 10px;
    	height: 20px;
	}
</style>
  </head>

  <body ng-app="ui.bootstrap.demo">
  <c:import url="pageComponent/header.jsp"/>
  <!-- container section start -->
 
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-globe"></i>Real-Time Market Data</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
						<li><i class="fa fa-globe"></i>MarketData</li>
					</ol>
				</div>
			</div>
              <!-- page start-->

              <div class="row">
                  <div class="col-lg-12" ng-controller="ModalDemoCtrl">
                      <section class="panel">
                          <header class="panel-heading">
                              Market Data
                          </header>
                           <div class="panel-body">
                          <div ng-controller="mainController">
                          <form class="form">
									<div class="form-group col-md-6">
										<label>Stock Symbol</label>
										<input class="form-control" type="text" ng-model="stock.symbol">
									</div>
									<!-- <div calss="form-group col-md-6">
										<button class="btn btn-primary" ng-click="search()">
											<span class="glyphicon glyphicon-search"></span> Search
										</button>
									</div> -->
								</form>
                          <table class="table table-striped table-advance table-hover" id="stockList">
                           <tbody>
                              <tr>
                                 <th>
                                 	<a href="" ng-click="order('stock.symbol')">StockSymbol</a>
       								<span class="sortorder" ng-show="predicate === 'stock.symbol'" ng-class="{reverse:reverse}"></span>
                                 </th>
                                
                                 <th>
                                 	<a href="" ng-click="order('stockName')">StockName</a>
       								<span class="sortorder" ng-show="predicate === 'stockName'" ng-class="{reverse:reverse}"></span>
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
                              <tr ng-repeat="stock in stocksArray | orderBy:predicate:reverse">
								<td>{{stock.stock.symbol}}</td>
								<td>{{stock.stockName}}</td>
								<td>{{stock.price}}</td>
								<td>
									<b ng-if="stock.change>0" style="color:green">+{{stock.change}}</b>
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

                           </tbody>
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
                  </div>
              </div>
              <!-- page end-->

<div  ng-controller="ModalDemoCtrl">
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
</div>             
              
          </section>
      </section>
      <!--main content end-->
  </section>
  <!-- container section end -->
    <!-- javascripts -->
    <script src="js/jquery.js"></script>
    <script src="js/jquery-1.8.3.min.js"></script>
    <!-- nice scroll -->
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>    
    <!--custome script for all page-->
    <script src="js/scripts.js"></script>


  </body>
</html>
