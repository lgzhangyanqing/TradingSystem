<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <link href="css/landing-page.css" rel="stylesheet"> -->
<link href="css/stylesheet.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

<title></title>
<script src="js/header.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="top headerLinks">
			<a href="#">
				<img width="130" height="60" src="icon/icon.jpg">
			</a>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<h2>ADMIN PAGE</h2></sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')?false:true">
				<ul class="nav navbar-nav navbar-right col-md-2" >
			        <li style="float:right;">
	                  	<a href="#login_up">
	                  	 	<span class="glyphicon glyphicon-log-in" ></span> Sign in
	                  	</a> 
	                  	<!-- <span class="glyphicon glyphicon-log-in" data-toggle="modal" data-target="#login_up"></span> Sign in -->
	                  	
		        </li>
		    </ul>
		    </sec:authorize>
		</div>
		</div>
	
	<nav class="navbar navbar-default" data-spy="affix" data-offset-top="197">	
        <div class="container-fluid">
              <!-- sidebar menu start-->
              <ul class="nav navbar-nav">             
                  <li class="active">
                      <a class="" href="home">
                          <i class="icon_house_alt"></i>
                          <span>Home</span>
                      </a>
                  </li>
                  <li>
                      <a class="" href="marketdata">
                          <i class="icon_globe-2"></i>
                          <span>MarketData</span>
                      </a>
                  </li>
				  <sec:authorize access="hasRole('ROLE_USER')">
                  <li>
                      <a class="" href="portfolio">
                          <i class="icon_desktop"></i>
                          <span>My Portfolio</span>
                      </a>
                  </li>
                  <li>
                      <a class="" href="history">
                          <i class="icon_document_alt"></i>
                          <span>History</span>
                      </a>
                  </li> 
                  </sec:authorize>
                  <sec:authorize access="hasRole('ROLE_ADMIN')">
                  <li>
                      <a class="" href="pending">
                          <i class="icon_pens"></i>
                          <span>Pending Process</span>
                      </a>
                  </li>
                  <li>
                      <a class="" href="stock">
                          <i class="icon_currency"></i>
                          <span>Stock Process</span>
                      </a>
                  </li> 
                  </sec:authorize>
              </ul>
          
                  <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
                  <ul class="nav navbar-nav pull-right">
                  <!-- user login dropdown start-->
                  <li class="dropdown" ng-controller="headerCtrl">
                      <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                          <span class="profile-ava">
                              <img alt="" src="icon/user.png" width="30" height="30">
                          </span>
                          <span class="username">Hello, {{user.userName}}</span>
                          <b class="caret"></b>
                      </a>
                      <ul class="dropdown-menu extended logout">
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
                  <!-- user login dropdown end -->                
              <!-- sidebar menu end-->
          </div>   
      <!--header end-->
      </nav>
</body>
</html>