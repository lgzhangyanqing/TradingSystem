<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8"> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="text/css" rel="stylesheet" href="css/stylesheet.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0-beta.1/angular.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular-messages.js"></script>
	<script src="https://code.angularjs.org/1.2.28/angular-route.min.js"></script>
	<script type="text/javascript" src="js/app.js"></script>
	<script src="js/angular.min.js"></script>
	<script type="text/javascript">
		$('#status').fadeOut(800);
		
		$("a[rel!='nofollow']a[rel!='external'][target!='_blank']a[class!='load']").click(function() {
		    $("#status").fadeIn(400);
		    setTimeout(function() {
		        $("#status").fadeOut(400)
		    },
		    4000)
		});
		
		$("a[href*='#'],a[rel='external nofollow'],a[href='javascript:void(0)'],a[href='javascript:reset_captcha('')']").click(function() {
		    $("#status").fadeOut(400)
		});
	</script>
	<style>
		.alert {
			color: red;
			background: #fdf1e5;
			font-size: 10px;
			line-height: 16px;
			width: 200px;
			margin: 10;
			position: relative;
		}
	</style>
	
	<base href="/Project1/">
	
</head>
<body ng-app="main" data-spy="scroll" data-target=".navbar" data-offset="50" class="background">

	<div class="container-fluid">
		<div class="top headerLinks">
			<a href="home">
				<img width="130" height="60" src="icon/icon.jpg">
			</a>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')?false:true">
				<ul class="nav navbar-nav navbar-right col-md-2" >
			        <li style="float:right;">
	                  	<a href="login" data-target="mylogin">
	                  	 	<span class="glyphicon glyphicon-log-in" ></span> Sign in
	                  	</a>

		        	<%-- <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')?false:true"> 
		        		<a href="login"  data-target="#mylogin" ><span class="glyphicon glyphicon-log-in" ></span> Sign in</a>
		        	</sec:authorize>
		        	<sec:authorize access="hasRole('ROLE_USER')">
		    			<a href="<c:url value='/j_spring_security_logout'/>"><span class="glyphicon glyphicon-log-out" ></span> Log out</a>
		    		</sec:authorize> --%>
		        </li>
		    	<%-- <sec:authorize access="hasRole('ROLE_USER')">
		    		<a href="<c:url value='/j_spring_security_logout'/>"><span class="glyphicon glyphicon-log-out" ></span> Log out</a>
		    	</sec:authorize> --%>
		    </ul>
		    </sec:authorize>
		</div>
	</div>
	<nav class="navbar navbar-default" data-spy="affix" data-offset-top="197">		
		<div class="container-fluid" ng-controller="MainController">
			<ul class="nav navbar-nav">
			    <li><a href="home" class="nav-font">Home</a></li>
			    <li>
			    	<a href="marketdata" class="nav-font">MarketData</a>
			    </li>
			   <!--  <li>
			    	<a href="#transaction" class="nav-font">Transaction</a>
			    </li> -->
			    <sec:authorize access="hasRole('ROLE_USER')">
                  <li>
                      <a class="nav-font" href="portfolio">
                          <i class="icon_desktop"></i>
                          <span>My Portfolio</span>
                      </a>
                  </li>
                  <li>
                      <a class="nav-font" href="history">
                          <i class="icon_document_alt"></i>
                          <span>History</span>
                      </a>
                  </li> 
                 </sec:authorize>
                 <%-- <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
                  <!-- user login dropdown start-->
                  <li class="dropdown" navbar-right ng-controller="headerCtrl">
                      <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                          <span class="profile-ava">
                              <img alt="" src="img/images.jpg" width="30" height="30">
                          </span>
                          <span class="username">Hello, {{user.userName}}</span>
                          <b class="caret"></b>
                      </a>
                      <ul class="dropdown-menu extended logout">
                          <div class="log-arrow-up"></div>
                          <li class="prof-info-container">
                          	<div class="profile-ava prof-big"><img alt="" src="img/images.jpg" width="50" height="50"></div>
                          	<div class="prof-info">
                          		<ul>
                          			<li>{{user.firstName}} {{user.lastName}}</li>
                          			<li>{{user.email}}
                          		</ul>                          	
                          	</div>
                          </li>
                          <li>
                          	<a href="<c:url value='/j_spring_security_logout'/>"><i class="icon_key_alt"></i>Logout</a>
                          </li>
                      </ul>
                  </li>
                  </sec:authorize> --%>
			</ul>
			<sec:authorize access="hasRole('ROLE_USER')">
			<ul class="nav navbar-nav pull-right">
				<%-- <li>
					<div class="dropdown navbar-right">
						<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
				  		<span class="glyphicons glyphicons-user">User</span>
				  		<span class="caret"></span></button>
				  		<ul class="dropdown-menu">
						    <li><a href="#">My Portfolio</a></li>
						    <li><a href="#"></a></li>
						    <li><a href="<c:url value='/j_spring_security_logout'/>">Sign out</a></li>
				  		</ul>
					</div>
				</li> --%>
					<li class="dropdown" ng-controller="headerCtrl">
                      <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                          <span class="profile-ava">
                              <img alt="" src="icon/user.png" width="30" height="30">
                          </span>
                          <span class="username">Hello, {{user.userName}}</span>
                          <b class="caret"></b>
                      </a>
                      <ul class="dropdown-menu extended logout">
                          <div class="log-arrow-up"></div>
                          <li class="prof-info-container">
                          	<div class="profile-ava prof-big"><img alt="" src="icon/user.png" width="50" height="50"></div>
                          	<div class="prof-info">
                          		<ul>
                          			<li>{{user.firstName}} {{user.lastName}}</li>
                          			<li>{{user.email}}
                          		</ul>                          	
                          	</div>
                          </li>
                          <li>
                          	<a href="<c:url value='/j_spring_security_logout'/>"><i class="icon_key_alt"></i>Logout</a>
                          </li>
                      </ul>
                  </li>
			</ul>
			</sec:authorize>
			
			<!-- <ul class="nav navbar-nav navbar-right">
				<li>
					<a href="#cart">
						<span class="glyphicon glyphicon-shopping-cart"></span><span id="cartCount"> 0</span>
					</a>
				</li>
			</ul> -->
		</div>
	</nav>

	<div class="container-fluid" id="main" style="z-index:-1;">
		<div ng-view></div>
	</div>
	
	
	<!-- <div class="rtop_btn" id="rtop_btn">
		<a href="#0" class="toplink cd-top">
			<img src="icon/backtotop.png" class="totop" width="60" height="60">
		</a>
	</div> -->
	
	
	
	<div class="alert" style="display:none;" id="usernameAndPasswordReq">
		<p>Email and password are required</p>
	</div>
	
	<div class="alert" style="display:none;" id="usernameReq">
		<p>Email is required</p>
	</div>
	<div class="alert" style="display:none;" id="passwordReq">
		<p>Password is required</p>
	</div>
	<div class="alert" id="wrongCredentials" style="display:none;">
		<p>The email or password supplied is incorrect</p>
	</div>	
	
	<footer class="container-fluid bg-4">
		<div class="row">
		<div class="social-follow col-md-4">
			<span class="follow">Follow Us</span>
			<div class="social-icons">
				<a href="https://twitter.com" class="twitter" target="_blank"><img src="icon/twitter.png" style=" height: 66px; width: 60px;"></a>
				<a href="https://www.facebook.com"  class="facebook" target="_blank"><img src="icon/facebook.png" style=" height: 66px; width: 60px;"></a>
				<a href="https://www.instagram.com" class="instagram" target="_blank"><img src="icon/instagram.png" style=" height: 66px; width: 60px;"></a>
			</div>
		</div>
		<div class="contact-us col-md-4">
			<span class="contact">Contact Us</span>
			<div>
				<p><span class="glyphicon glyphicon-map-marker"></span> Princeton, US</p>
      			<p><span class="glyphicon glyphicon-phone"></span> Phone: +01 1234567890</p>
      			<p><span class="glyphicon glyphicon-envelope"></span> Email: mail@mail.com</p>	
			</div>
		</div>
		</div>
		<div class="row">
			<div class="text-center">
  			<p>Copyright © Your Website 2015</p> 
			</div>	
		</div>
		
	</footer>
	
</body>
</html>