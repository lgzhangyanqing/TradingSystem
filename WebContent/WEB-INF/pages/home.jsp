<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TradingSystem</title>
<!-- for header and footer -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/extra/bootstrap-theme.css" rel="stylesheet">
<link href="css/extra/elegant-icons-style.css" rel="stylesheet" />
<link href="css/extra/font-awesome.min.css" rel="stylesheet" />    
<link href="css/extra/style.css" rel="stylesheet">
<link href="css/stylesheet.css" rel="stylesheet">
<script src="js/angular.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
var app = angular.module('mainModule', []);
</script>
</head>
<body style="height:100%" ng-app="mainModule">
	<c:import url="pageComponent/header.jsp"/>
	<session class="wrapper">
	<!--overview start-->
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header"><i class="fa fa-home"></i> Home</h3>
		</div>
	</div>
	
	
	                      <!--carousel start-->
	                      
<div style="margin-left:50px; margin-right:50px; margin-bottom:50px;">
 <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active" style="height:600px !important; width:1450px !important">
      <img src="img/stock-blue.png" alt="Sell" >
      <div class="carousel-caption">
        <h1><strong>Sell</strong></h1>
        
      </div>
    </div>

    <div class="item" style="height:600px !important; width:1450px !important">
      <img src="img/stock-red.jpg" alt="Buy">
      <div class="carousel-caption">
        <h1><strong>Buy</strong></h1>
       
      </div>
    </div>

    <div class="item" style="height:600px !important; width:1450px !important">
      <img src="img/check.jpg" alt="Check">
      <div class="carousel-caption">
        <h1><strong>Market Data</strong></h1>
        
      </div>
    </div>

  </div>
</div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
                      <!--carousel end-->
	

	</session>
	<c:import url="pageComponent/footer.jsp"/>
</body>
</html>