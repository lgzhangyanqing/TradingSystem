<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link type="text/css" rel="stylesheet" href="stylesheet.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0-beta.1/angular.min.js"></script>
	<script src="https://code.angularjs.org/1.2.28/angular-route.min.js"></script>
	<script type="text/javascript" src="js/app.js"></script>
	<script src="js/angular.min.js"></script>
	<script type="text/javascript">
		var amountScrolled = 300;
		$(window).scroll(function() {
			if ( $(window).scrollTop() > amountScrolled ) {
				$('a.toplink').fadeIn('slow');
			} else {
				$('a.toplink').fadeOut('slow');
			}
		}); 
	</script>
</head>
<body ng-app="main">
	<header id="header">
		<section>
			<div class="col-md-9 header-branding">
				<div class="container">
					<div class="top">
						<a href="#/">
							<img width="130" height="60" src="../icon/icon.jpg">
						</a>
						<div class="tab headerLinks" >
							<a href="" >Login/Sign Up</a>
						</div>
					</div>
					<nav class="topnav nav-box" ng-controller="MainController">
						<div style="overflow:auto">
							<div class="topnav-nav" >
									<a href="#/" class="nav-font">
										Home
									</a>
									<a href="#/marketdata" class="nav-font">
										MarketData
									</a>
									<a href="#/transaction" class="nav-font">
										Transaction
									</a>
									<a href="#/history" class="nav-font">
										History
									</a>
									<a href="#/search" class="nav-font">
										Search
									</a>
							</div>
							<div class="header-cart" >
								<div class="cart">
									<a href="#cart" id="cartToggle">
										<img class="icon-cart" src="../icon/cart.png">
										<span id="cartCount">0</span>
									</a>
								</div>
							</div>
						</div>
					</nav>
				</div>
			</div>			
		</section>
	</header>
	<div class="main">
		<div ng-show></div>
	</div>
	<div ng-controller="stockController" class="stock_table">
	<h2>Market Data</h2>
	<table id="stockList" border="1" style="width: 300px">
		<tr>
			<th>Stock ID</th>
			<th>Price</th>
			<th>Change</th>
		</tr>
		<tr ng-repeat="stock in stocksArray">
			<td>{{stock.id}}</td>
			<td>{{stock.price}}</td>
			<td>
				<b ng-if="stock.change>0" style="color:green">{{stock.change}}</b>
				<b ng-if="stock.change<0" style="color:red">{{stock.change}}</b>
				<b ng-if="stock.change==0" style="color:black">{{stock.change}}</b>
			</td>
		</tr>
	</table>
</div>

	<div class="rtop_btn" id="rtop_btn">
		<a href="#/" class="toplink">
			<img src="../icon/backtotop.png" class="totop" width="60" height="60">
		</a>
	</div>
	
	<footer class="footer">
		<div class="social-follow">
			<span class="follow">Follow Us</span>
			<div class="social-icons">
				<a href="https://twitter.com" rel="me" class="icons-sprite sfooter-twitter" target="_blank" itemprop="sameAs"></a>
				<a href="https://www.facebook.com" rel="me" class="icons-sprite sfooter-facebook" target="_blank" itemprop="sameAs"></a>
				<a href="https://www.instagram.com" rel="me" class="icons-sprite sfooter-instagram" target="_blank" itemprop="sameAs"></a>
			</div>
		</div>
	</footer>
</body>
</html>