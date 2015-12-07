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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Portfolio</title>
	<script src="js/angular.min.js"></script>
    <script src="js/ui-bootstrap-tpls-0.13.4.min.js"></script>
    <script src="js/angular-animate.min.js"></script>
    <script src="js/activity-portfolio.js"></script>
    <script src="js/angular-resource.min.js"></script>
    <script	src="js/jquery.min.js"></script>
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
    
    <script src="js/Chart.js"></script>
	<!-- <script src="js/Chart.Doughnut.js"></script>
 -->	
	<script src="js/angular-chart.js"></script>
	<link rel="stylesheet" href="css/angular-chart.css">

<style>

	#chartdiv {
		width		: 100%;
		height		: 435px;
		font-size	: 11px;
	}	
	
	.alert {
		display: none;
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

      <section id="main-content">
          <section class="wrapper" ng-controller="mainController">
			<!-- page start-->
			   <div class="row">
			   	 
                  <div class="col-lg-9" ng-controller="ModalDemoCtrl">
                      <section class="panel">
                          <header class="panel-heading">
                              Stock
                          </header>
                          <div class="panel-body">
                        <form action="portfolio" id="listUserStocks" method="post">
                          <table class="table table-striped table-advance table-hover" >
                           <tbody>
                              <tr>
                                 <!-- <th><i class="icon_star"></i> Stock Id</th> -->
                                 <th><i class="icon_calendar"></i> Symbol</th>
                                 <th><i class="icon_datareport_alt"></i> StockName</th>
                                 <th><i class="icon_currency_alt"></i>Price</th>
                                 <th><i class="icon_currency"></i>Change</th>
                                 <th>Change%</th>
                                 <th><i class="icon_calendar"></i> Quantity</th>
                                 <th><i class="icon_cogs"></i> Action</th>
                              </tr>
                              <tr ng-repeat=" stock in stockInfo">
								<!-- <td>{{stock.stock.sid}}</td> -->
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
								
								<td>{{stock.quantity}}</td>
								<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-primary" href="#" ng-click="pass(stock); openBuy()">Buy</a>
                                      <a class="btn btn-success" href="#" ng-click="pass(stock); openSell()" >Sell</a>
                                  </div>
                                  </td>
                                 </sec:authorize>
                              </tr>

                           </tbody>
                        </table>
                        
                        </form>
                        <!-- loading bar -->
						<div class = "loadbox" ng-hide="loading">
							<div class = "loadbar">
								<div class="progress progress-striped active progress-sm" >
							    	<div class="progress-bar progress-bar-success"  role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:{{percent}}">
							        	<span class="sr-only">45% Complete</span>
							        </div>
					    		</div>
					     		<p>Loading...</p>
					    	</div>
					   </div>
                        
                        
                  <div id="buySuccess" ng-show="buySuccess&&!sellSuccess&&!addSuccess">Buying Transaction Success!</div>
		          <div id="sellSuccess" ng-show="sellSuccess&&!buySuccess&&!addSuccess">Selling Transaction Success!</div>
	              </div>
                      </section>
                  </div>
                  <div class="col-lg-3" >
                      <section class="panel">
                          <header class="panel-heading">
                              Balance
                          </header>
                          <div class="panel-body">
								<div ng-controller="ModalDemoCtrl" style="text-align:center">
										<span>Current Balance: <b style="color: #0099CC;vertical-align: sub;font-size: 35px;margin-left: 5px;">$ {{user.balance}}</b></span>	
										<div id="addSuccess" ng-show="addSuccess&&!sellSuccess&&!sellSuccess">Adding money Success!</div>	
										<button id="addBalance" class="btn btn-primary btn-sm"
											ng-click="openAdd()">Manage Balance</button>
								</div>
								
							</div>
                      </section>
                 </div>
              </div>
              
    <!-- <div ng-controller="mainController">
		<div ng-controller="ModalDemoCtrl">
				<button id="addBalance" class="btn btn-primary btn-sm"
					ng-click="openAdd()">Add Balance</button>
				<span>Current Balance: <b style="color: red">{{user.balance}}</b></span>	
				<div id="addSuccess" ng-show="addSuccess&&!sellSuccess&&!sellSuccess">Adding money Success!</div>	
			
		</div>
		
	</div> -->
	
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

            <div class="row">
              <!-- chart morris start -->
              	<div class="col-lg-12">
                	<section class="panel">
                    	<header class="panel-heading">
                        	<h3>OWNERSHIP SUMMARY CHARTS</Char>
                      	</header>
                      	<div class="panel-body">
                        	<div class="tab-pane" id="chartjs">
                      			<div class="row">
                          		<!-- Line -->
                          			<div class="col-lg-6">
                              			<section class="panel">
                                  			<header class="panel-heading">
                                      			Total value pie chart
                                  			</header>
                                  			<div class="panel-body text-center" ng-controller="PieCtrl">
												<canvas id="pie" class="chart chart-pie" chart-data="data" chart-labels="labels" chart-legend="true">
												</canvas> 
                                  			</div>
                              			</section>
                          			</div>   
                          			<div class="col-lg-6">
                              			<section class="panel">
                                  			<header class="panel-heading">
                                      			Total quantity bar chart
                                  			</header>
                                  			<div class="panel-body text-center" ng-controller="BarCtrl">
												<canvas id="bar" class="chart chart-bar"
  chart-data="data" chart-labels="labels" chart-legend="true">
</canvas>
                                  			</div>
                              			</section>
                          			</div>                            
                      			</div>
                      		</div>
						</div>
                    </section>
              	</div>
              <!-- chart morris start -->
            </div>		
			
		</section>
	</section>
    </div>

<!-- container section end -->
    <!-- javascripts -->
    <script src="js/jquery.js"></script>
    <script src="js/jquery-1.8.3.min.js"></script>
        <!-- nice scroll -->
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <!-- chartjs -->
    <script src="assets/chart-master/Chart.js"></script>
    <!-- custom chart script for this page only-->
	<script src="js/amcharts.js"></script>
	<script src="js/pie.js"></script>
	<script src="js/light.js"></script>
	<script src="js/pie2.js"></script>
    <!--custome script for all page-->
    <script src="js/scripts.js"></script>


</body>
</html>