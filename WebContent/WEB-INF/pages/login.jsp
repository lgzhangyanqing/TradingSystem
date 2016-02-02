f<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<html lang="en">

<head>
<!-- Basic Page Needs
    ================================================== -->
<meta charset="utf-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Yahoo Finance Trading System</title>


<!-- Favicons
    ================================================== -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="img/apple-touch-icon-114x114.png">

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome/css/font-awesome.css">

<!-- Slider
    ================================================== -->
<link href="css/owl.carousel.css" rel="stylesheet" media="screen">
<link href="css/owl.theme.css" rel="stylesheet" media="screen">

<!-- Stylesheet
    ================================================== -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/responsive.css">

<link
	href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400'
	rel='stylesheet' type='text/css'>

<script type="text/javascript" src="js/modernizr.custom.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>





<!-- ******************************************************************************************** -->

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TradingSystem Main Page</title>
<script src="js/jquery.min.js"></script>
<script src="js/angular.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular-messages.js"></script>
<script src="js/app2.js"></script>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/stylesheet.css" rel="stylesheet">
<link href="css/landing-page.css" rel="stylesheet">
<!-- <link href="css/agency.css" rel="stylesheet">  -->
<link rel="stylesheet" href="css/animate.min.css" type="text/css">
<link rel="stylesheet" href="css/creative.css" type="text/css">
<!-- 	<link rel="stylesheet" href="css/agency.css" type="text/css"> -->
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<!-- <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'> -->

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script>
	$(document).ready(function() {
		// Show or hide the sticky footer button
		$(window).scroll(function() {
			if ($(this).scrollTop() > 200) {
				$('#rtop_btn').fadeIn();
			} else {
				$('#rtop_btn').fadeOut();
			}
		});

		// Animate the scroll to top
		$('#rtop_btn').click(function(event) {
			event.preventDefault();

			$('html, body').animate({
				scrollTop : 0
			}, 300);
		});

		if ("<c:out value='${param.login_error}'/>" != "") {
			$('#wrongCredentials').show();
		}
		$("#j_userName").on("click", function() {
			$("#usernameExist").hide();
		});
		$("#j_email").on("click", function() {
			$("#emailExist").hide();
		});
		$("#signin").on("click", loginValidation);
		$("#clear2").on("click", function() {
			$("#usernameExist").hide();
			$("#emailExist").hide();
		});
		/* $("#j_userName").on("blur",function(){
		if($("#j_userName").val()){
			$.ajax({
				url: "registervalidation",
				type: "post",
				dataType: "text",
				data: {userName: $("#j_userName").val()},
				//async:false,//disable async
				success: function(response) {
					if(response=="true"){
						$("#usernameExist").show();
					}
				},
				error: function (e) {
			        alert(e);
			    }
			});
		}
		});  */
		/* $("#j_email").on("blur",function(){
			if($("#j_email").val()&&$("#j_userName").val()){
				$.ajax({
					url: "registervalidation",
					type: "post",
					dataType: "text",
					data: {email: $("#j_email").val()},
					//async:false,//disable async
					success: function(response) {
						if(response=="true"){
							$("#emailExist").show();
						}
					},
					error: function (e) {
				        alert(e);
				    }
				});
			}
		});	 */

		$("#login-form-link").click(function(e) {
			$("#login-form").delay(100).fadeIn(100);
			$("#register-form").fadeOut(100);
			$('#register-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});
		$("#register-form-link").click(function(e) {
			$("#usernameAndPasswordReq").hide();
			$("#usernameReq").hide();
			$("#passwordReq").hide();
			$("#wrongCredentials").hide();
			$("#register-form").delay(100).fadeIn(100);
			$("#login-form").fadeOut(100);
			$('#login-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});

	});

	function loginValidation() {
		$("#usernameAndPasswordReq").hide();
		$("#usernameReq").hide();
		$("#passwordReq").hide();
		$("#wrongCredentials").hide();
		if ($("#j_username").val().length == 0
				&& $("#j_password").val().length == 0) {
			$("#usernameAndPasswordReq").show();
			return false;
		} else if ($("#j_username").val().length == 0) {
			$('#usernameReq').show();
			return false;
		} else if ($("#j_password").val().length == 0) {
			$("#passwordReq").show();
			return false;
		} else {
			return true;
		}
	}
</script>
<style>
.alert {
	color: red;
	background: #fdf1e5;
	font-size: 10px;
	line-height: 16px;
	margin: 10;
	position: relative;
}

.error {
	color: #FF6600;
	font-weight: 400;
}
</style>
</head>

<body id="page-top" class="index">
	<!-- Navigation
    ==========================================-->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.1.11.1.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/SmoothScroll.js"></script>
	<script type="text/javascript" src="js/jquery.isotope.js"></script>

	<script src="js/owl.carousel.js"></script>

	<!-- Javascripts
    ================================================== -->
	<script type="text/javascript" src="js/main.js"></script>


	<nav id="tf-menu" class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href="#tf-home">YFTS</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="#tf-home" class="page-scroll">Home</a></li>
					<li><a href="#tf-services" class="page-scroll">Services</a></li>
					<li><a href="#tf-market" class="page-scroll">Market</a></li>
					<li><a href="#tf-team" class="page-scroll">Team</a></li>
					<li><a href="#tf-contact" class="page-scroll">Contact</a></li>

				</ul>
				
				<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')?false:true">
				<ul class="nav navbar-nav navbar-right col-md-2" >
			        <li style="float:right;">
	                  	<a href="#login_up">
	                  	 	<span class="glyphicon glyphicon-log-in" ></span> Sign in
	                  	</a> 	                  	
		        </li>
		    </ul>
		    </sec:authorize>
		    
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<!-- Home Page
    ==========================================-->
	<div id="tf-home" class="text-center">
		<div class="overlay">
			<div class="content">
				<h1>
					Welcome on <strong><span class="color">Yahoo
							Finance Trading System</span></strong>
				</h1>
				<p class="lead">
					<strong>We are your good Finance Assistances</strong>
				</p>
				<a href="#tf-services" class="fa fa-angle-down page-scroll"></a>
			</div>
		</div>
	</div>

	<!-- About Us Page
    ==========================================
    <div id="tf-about">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <img src="img/02.png" class="img-responsive">
                </div>
                <div class="col-md-6">
                    <div class="about-text">
                        <div class="section-title">
                            <h4>About us</h4>
                            <h2>Some words <strong>about us</strong></h2>
                            <hr>
                            <div class="clearfix"></div>
                        </div>
                        <p class="intro">We love building and rebuilding brands through our  specific skills. Using colour, fonts, and illustration, we brand companies in a way they will never forget.</p>
                        <ul class="about-list">
                            <li>
                                <span class="fa fa-dot-circle-o"></span>
                                <strong>Mission</strong> - <em>We deliver uniqueness and quality</em>
                            </li>
                            <li>
                                <span class="fa fa-dot-circle-o"></span>
                                <strong>Skills</strong> - <em>Delivering fast and excellent results</em>
                            </li>
                            <li>
                                <span class="fa fa-dot-circle-o"></span>
                                <strong>Clients</strong> - <em>Satisfied clients thanks to our experience</em>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
	-->
	
	<!-- Services Section
    ==========================================-->

	<div id="tf-services" class="section-title center">
		<div class="container-fluid">
			<div class="top headerLinks">

				
			</div>
		</div>

		<div class="text-center">
			<div class="container">
				<div class="section-title center">
					<h2>
						Take a look at <strong>our services</strong>
					</h2>
					<div class="line">
						<hr>
					</div>
					<div class="clearfix"></div>
					<small><em> </em></small>
				</div>
				<div class="space"></div>
				<div class="row">
					<div class="col-md-3 col-sm-6 service">
						<i class="glyphicon glyphicon-stats fa-3x"></i>
						<h4>
							<strong>Real time stocks</strong>
						</h4>
						<p>Get the real time stock price at first time.</p>
					</div>

					<div class="col-md-3 col-sm-6 service">
						<i class="glyphicon glyphicon-signal fa-3x"></i>
						<h4>
							<strong>Stock Exchange</strong>
						</h4>
						<p>Buy stocks by just searching and adding.</p>
					</div>

					<div class="col-md-3 col-sm-6 service">
						<i class="glyphicon glyphicon-lock fa-3x"></i>
						<h4>
							<strong>Manage your stocks</strong>
						</h4>
						<p>Manage your stocks easily sell your stocks.</p>
					</div>

					<div class="col-md-3 col-sm-6 service">
						<i class="glyphicon glyphicon-star fa-3x"></i>
						<h4>
							<strong>Lower commission</strong>
						</h4>
						<p>Get lower commission at our website.</p>
					</div>
				</div>
			</div>
		</div>

		<!-- Clients Section
    ==========================================
    <div id="tf-clients" class="text-center">
        <div class="overlay">
            <div class="container">

                <div class="section-title center">
                    <h2>Some of <strong>our Clients</strong></h2>
                    <div class="line">
                        <hr>
                    </div>
                </div>
                <div id="clients" class="owl-carousel owl-theme">
                    <div class="item">
                        <img src="img/client/01.png">
                    </div>
                    <div class="item">
                        <img src="img/client/02.png">
                    </div>
                    <div class="item">
                        <img src="img/client/03.png">
                    </div>
                    <div class="item">
                        <img src="img/client/04.png">
                    </div>
                    <div class="item">
                        <img src="img/client/05.png">
                    </div>
                    <div class="item">
                        <img src="img/client/06.png">
                    </div>
                    <div class="item">
                        <img src="img/client/07.png">
                    </div>
                </div>

            </div>
        </div>
    </div>
-->


		<!-- Portfolio Section
    ==========================================
    <div id="tf-works">
        <div class="container"> <!-- Container -->
		<!--     <div class="section-title text-center center">
                <h2>Take a look at <strong>our services</strong></h2>
                <div class="line">
                    <hr>
                </div>
                <div class="clearfix"></div>
                <small><em>Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</em></small>
            </div>
            <div class="space"></div>

            <div class="categories">
                
                <ul class="cat">
                    <li class="pull-left"><h4>Filter by Type:</h4></li>
                    <li class="pull-right">
                        <ol class="type">
                            <li><a href="#" data-filter="*" class="active">All</a></li>
                            <li><a href="#" data-filter=".web">Web Design</a></li>
                            <li><a href="#" data-filter=".photography">Photography</a></li>
                            <li><a href="#" data-filter=".app" >Mobile App</a></li>
                            <li><a href="#" data-filter=".branding" >Branding</a></li>
                        </ol>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>

            <div id="lightbox" class="row">

                <div class="col-sm-6 col-md-3 col-lg-3 branding">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#">
                                <div class="hover-text">
                                    <h4>Logo Design</h4>
                                    <small>Branding</small>
                                    <div class="clearfix"></div>
                                    <i class="fa fa-plus"></i>
                                </div>
                                <img src="img/portfolio/01.jpg" class="img-responsive" alt="...">
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 col-lg-3 photography app">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#">
                                <div class="hover-text">
                                    <h4>Logo Design</h4>
                                    <small>Branding</small>
                                    <div class="clearfix"></div>
                                    <i class="fa fa-plus"></i>
                                </div>
                                <img src="img/portfolio/02.jpg" class="img-responsive" alt="...">
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 col-lg-3 branding">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#">
                                <div class="hover-text">
                                    <h4>Logo Design</h4>
                                    <small>Branding</small>
                                    <div class="clearfix"></div>
                                    <i class="fa fa-plus"></i>
                                </div>
                                <img src="img/portfolio/03.jpg" class="img-responsive" alt="...">
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 col-lg-3 branding">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#">
                                <div class="hover-text">
                                    <h4>Logo Design</h4>
                                    <small>Branding</small>
                                    <div class="clearfix"></div>
                                    <i class="fa fa-plus"></i>
                                </div>
                                <img src="img/portfolio/04.jpg" class="img-responsive" alt="...">
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 col-lg-3 web">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#">
                                <div class="hover-text">
                                    <h4>Logo Design</h4>
                                    <small>Branding</small>
                                    <div class="clearfix"></div>
                                    <i class="fa fa-plus"></i>
                                </div>
                                <img src="img/portfolio/05.jpg" class="img-responsive" alt="...">
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 col-lg-3 app">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#">
                                <div class="hover-text">
                                    <h4>Logo Design</h4>
                                    <small>Branding</small>
                                    <div class="clearfix"></div>
                                    <i class="fa fa-plus"></i>
                                </div>
                                <img src="img/portfolio/06.jpg" class="img-responsive" alt="...">
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 col-lg-3 photography web">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#">
                                <div class="hover-text">
                                    <h4>Logo Design</h4>
                                    <small>Branding</small>
                                    <div class="clearfix"></div>
                                    <i class="fa fa-plus"></i>
                                </div>
                                <img src="img/portfolio/07.jpg" class="img-responsive" alt="...">
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 col-lg-3 web">
                    <div class="portfolio-item">
                        <div class="hover-bg">
                            <a href="#">
                                <div class="hover-text">
                                    <h4>Logo Design</h4>
                                    <small>Branding</small>
                                    <div class="clearfix"></div>
                                    <i class="fa fa-plus"></i>
                                </div>
                                <img src="img/portfolio/08.jpg" class="img-responsive" alt="...">
                            </a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>-->

		<!-- Testimonials Section
    ==========================================
    <div id="tf-testimonials" class="text-center">
        <div class="overlay">
            <div class="container">
                <div class="section-title center">
                    <h2><strong>Our clients</strong> testimonials</h2>
                    <div class="line">
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div id="testimonial" class="owl-carousel owl-theme">
                            <div class="item">
                                <h5>This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</h5>
                                <p><strong>Dean Martin</strong>, CEO Acme Inc.</p>
                            </div>

                            <div class="item">
                                <h5>This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</h5>
                                <p><strong>Dean Martin</strong>, CEO Acme Inc.</p>
                            </div>

                            <div class="item">
                                <h5>This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem 

, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</h5>
                                <p><strong>Dean Martin</strong>, CEO Acme Inc.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>-->



		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.1.11.1.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/SmoothScroll.js"></script>
		<script type="text/javascript" src="js/jquery.isotope.js"></script>

		<script src="js/owl.carousel.js"></script>

		<!-- Javascripts
    ================================================== -->
		<script type="text/javascript" src="js/main.js"></script>

		<!-- *************************************************************************************************** -->
		<!-- Header -->

		<div id="tf-market" class="section-title center">
			<div class="container-fluid">
				<div class="top headerLinks">
					<a href="#"> <img width="130" height="60" src="icon/icon.jpg">
					</a>
				
				</div>
			</div>

			<!-- Navigation -->
			<!-- <nav class="navbar navbar-default" data-spy="affix"
		data-offset-top="197">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<!-- Collect the nav links, forms, and other content for toggling -->
			<!--	<ul class="nav navbar-nav">
				<li><a href="#" class="nav-font">Home</a></li>
				<li><a href="marketdata" class="nav-font">MarketData</a></li>
				<!--  <li>
			    	<a href="#transaction" class="nav-font">Transaction</a>
			    </li> -->
			<!--		<sec:authorize access="hasRole('ROLE_USER')">
					<li><a class="nav-font" href="portfolio"> <i
							class="icon_desktop"></i> <span>My Portfolio</span>
					</a></li>
					<li><a class="nav-font" href="history"> <i
							class="icon_document_alt"></i> <span>History</span>
					</a></li>
				</sec:authorize>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
			<!-- /.container-fluid -->
			<!--</nav>   -->


			<!-- Header Page -->
			<!--  <div class="intro-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>We see your Financial Life in total</h1>
                        <h3>Upgrade your Stock Trading with Yahoo Finance Trading System</h3>
                        <hr class="intro-divider">
                        <a href="#service" class="btn btn-primary btn-xl page-scroll">Find Out More</a>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->
		</div>
		<!-- 12 month Batch start -->
		<div id="tv-miniwidget-dfa0f" class="markets_chart">
			<!-- <div id="tf-market" class="markets_chart">-->
			<div id="tradingview_690a3-wrapper"
				style="position: relative; box-sizing: content-box; width: 100%; height: 530px; margin: 0 !important; padding: 0 !important; font-family: Arial, sans-serif;">
				<div
					style="width: 100%; height: 530px; background: #fff; padding: 0 !important;">
					<iframe id="tradingview_690a3"
						src="https://dwq4do82y8xi7.cloudfront.net/miniwidgetembed/?Equities=BABA,DIA,SPY,TWITTER,FACEBOOK,GOOGLE,MICROSOFT,ORACLE&amp;Commodities=GOLD,SILVER,OIL,GAS,BASE%20METALS,URANIUM,LITHIUM,WHEAT&amp;Bonds=1-3%20YEAR,3-7%20YEAR,7-10%20YEAR,20%20YEAR,SHORT%20TERM%20US,EURO%20DEBT,GERMANY%20BOND,ASIA%20LOCAL%20DEBT&amp;Forex=FX%3AEURUSD,FX%3AGBPUSD,FX%3AUSDJPY,FX%3AUSDCHF,FX%3AAUDUSD,FX%3AUSDCAD,FX%3ANZDUSD,FX%3AEURJPY&amp;tabs=Equities%2CCommodities%2CBonds%2CForex&amp;QQQ=NASDAQ%3AQQQ&amp;DIA=AMEX%3ADIA&amp;SPY=AMEX%3ASPY&amp;TWITTER=NYSE%3ATWTR&amp;FACEBOOK=NASDAQ%3AFB&amp;GOOGLE=NASDAQ%3AGOOG&amp;MICROSOFT=NASDAQ%3AMSFT&amp;ORACLE=NYSE%3AORCL&amp;GOLD=AMEX%3AGLD&amp;SILVER=AMEX%3ASLV&amp;OIL=AMEX%3AUSO&amp;GAS=AMEX%3AUNG&amp;BASE%20METALS=AMEX%3ADBB&amp;URANIUM=AMEX%3AURA&amp;LITHIUM=AMEX%3ALIT&amp;WHEAT=AMEX%3AWEAT&amp;1-3%20YEAR=AMEX%3ASHY&amp;3-7%20YEAR=AMEX%3AIEI&amp;7-10%20YEAR=AMEX%3AIEF&amp;20%20YEAR=AMEX%3ATLT&amp;SHORT%20TERM%20US=AMEX%3ASCHO&amp;EURO%20DEBT=AMEX%3AEU&amp;GERMANY%20BOND=FX%3ABUND&amp;ASIA%20LOCAL%20DEBT=AMEX%3AALD&amp;timeAxisBackgroundColor=%23F3F2F3&amp;activeTickerBackgroundColor=%23EDF0F3&amp;trendLineColor=%23FF7965&amp;underLineColor=%23F0F0F0&amp;fontColor=%2383888D&amp;gridLineColor=%23E9E9EA&amp;large_chart_url=http%3A%2F%2Fwww.investopedia.com%2Fmarkets%2Fsymbol-redirect.aspx&amp;width=100%25&amp;height=530px&amp;utmsource=www.investopedia.com&amp;utmmedium=www.investopedia.com/"
						width="100%" height="530px" frameborder="0"
						allowtransparency="true" scrolling="no"
						style="margin: 0 !important; padding: 0 !important;"> </iframe>
				</div>
				<div
					style="position: absolute; display: block; box-sizing: content-box; height: 24px; width: 100%; bottom: 0; left: 0; margin: 0; padding: 0; font-family: Arial, sans-serif;">
					<div
						style="display: block; margin: 0 1px 1px 1px; line-height: 7px; box-sizing: content-box; height: 11px; padding: 6px 10px; text-align: right; background: #fff;">
						<a
							href="https://www.tradingview.com/?utmsource=www.investopedia.com&amp;utmmedium=www.investopedia.com/"
							target="_blank"
							style="color: #0099d4; text-decoration: none; font-size: 11px;">
						</a>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript"
			src="https://d33t3vvu2t2yu5.cloudfront.net/tv.js"></script>
		<!-- 12 month Batch end -->
	</div>
	<!-- service with timeline -->
	<!-- 12 bath delete 
    <a name="service"></a>
    
    <div class="content-section-a">
    	<div class="container">
    		<div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Our Service</h2>
                    <hr class="primary">
                </div>
            </div>
            <div class="row">
            	 <div class="col-lg-12">
            	 	<ul class="timeline">
            	 	<li>
            	 		<div class="timeline-image">
            	 			<img class="img-circle img-responsive" src="img/about/1.jpg" alt="">
                        </div>
                        <div class="timeline-panel">
                        	<div class="timeline-heading">
                        		<h4>Market Data</h4>
                        		<h4 class="subheading">Up to Date</h4>
                            </div>
                            <div class="timeline-body">
                            	<p class="text-muted">View the real-time market data in Finance.Yahoo.com.</p>
                            </div>
                         </div>
                      </li>
                      
                      <li class="timeline-inverted">
                      	<div class="timeline-image">
                      		<img class="img-circle img-responsive" src="img/about/2.jpg" alt="">
                      	</div>
                      	<div class="timeline-panel" style="padding-top:40px;">
                      		<div class="timeline-heading">
                      			<h4>Trading Online</h4>
                      			<h4 class="subheading">Trade Your Way</h4>
                            </div>
                            <div class="timeline-body">
                            	<p class="text-muted">Buy or Sell stocks can never be easy like this.</p>
                            </div>
                        </div>
                        </li>
                       <li>
                           <div class="timeline-image">
                               <img class="img-circle img-responsive" src="img/about/3.jpg" alt="">
                           </div>
                           <div class="timeline-panel">
                               <div class="timeline-heading">
                                   <h4>Own Portfolio</h4>
                                   <h4 class="subheading">Check Your Record</h4>
                               </div>
                               <div class="timeline-body">
                                   <p class="text-muted">Get your individual portfolio charting on Yahoo Finance Trading System.</p>
                               </div>
                            </div>
                        </li>
                        
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <h4>To Be
                                    <br>Continued
                                    <br>...</h4>
                            </div>
                        </li>
            	 	</ul>
            	 </div>
            </div>
            
    	</div>
    </div>
    -->
<!-- /.container -->
<!-- Team Page
    ==========================================-->
     <div id="tf-team" class="text-center">
        <div class="overlay">
            <div class="container">
                <div class="section-title center">
                    <h2>Meet <strong>our team</strong></h2>
                    <div class="line">
                        <hr>
                    </div>
                </div>

<div class="col-sm-4">
				<div class="team-member">
					<img src="icon/user.png" class="img-responsive img-circle" alt=""
						style="width: 68px; height: 68px;">
					<h4>Rui Wang</h4>
					<p class="text-muted">Lead Developer</p>
					<ul class="list-inline social-buttons">
						<li><a href="https://twitter.com"><i
								class="fa fa-twitter"></i></a></li>
						<li><a href="https://facebook.com"><i
								class="fa fa-facebook"></i></a></li>
						<li><a href="https://github.com"><i
								class="fa fa-github-alt"></i></a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="team-member">
					<img src="icon/user.png" class="img-responsive img-circle" alt=""
						style="width: 68px; height: 68px;">
					<h4>Yang Shao</h4>
					<p class="text-muted">Lead Developer</p>
					<ul class="list-inline social-buttons">
						<li><a href="https://www.google.com"><i
								class="fa fa-twitter"></i></a></li>
						<li><a href="https://facebook.com"><i
								class="fa fa-facebook"></i></a></li>
						<li><a href="https://github.com"><i
								class="fa fa-github-alt"></i></a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="team-member">
					<img src="icon/user.png" class="img-responsive img-circle" alt=""
						style="width: 68px; height: 68px;">
					<h4>Yanqing Zhang</h4>
					<p class="text-muted">Lead Developer</p>
					<ul class="list-inline social-buttons">
						<li><a href="https://twitter.com"><i
								class="fa fa-twitter"></i></a></li>
						<li><a href="https://facebook.com"><i
								class="fa fa-facebook"></i></a></li>
						<li><a href="https://github.com"><i
								class="fa fa-github-alt"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
		
                <div id="team" class="owl-carousel owl-theme row">
                    <div class="item">
                        <div class="thumbnail">
                            <img src="img/team/01.jpg" alt="..." class="img-circle team-img">
                            <div class="caption">
                                <h3>Jenn Gwapa</h3>
                                <p>CEO / Founder</p>
                                <p>Do not seek to change what has come before. Seek to create that which has not.</p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="thumbnail">
                            <img src="img/team/02.jpg" alt="..." class="img-circle team-img">
                            <div class="caption">
                                <h3>Jenn Gwapa</h3>
                                <p>CEO / Founder</p>
                                <p>Do not seek to change what has come before. Seek to create that which has not.</p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="thumbnail">
                            <img src="img/team/03.jpg" alt="..." class="img-circle team-img">
                            <div class="caption">
                                <h3>Jenn Gwapa</h3>
                                <p>CEO / Founder</p>
                                <p>Do not seek to change what has come before. Seek to create that which has not.</p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="thumbnail">
                            <img src="img/team/04.jpg" alt="..." class="img-circle team-img">
                            <div class="caption">
                                <h3>Jenn Gwapa</h3>
                                <p>CEO / Founder</p>
                                <p>Do not seek to change what has come before. Seek to create that which has not.</p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="thumbnail">
                            <img src="img/team/04.jpg" alt="..." class="img-circle team-img">
                            <div class="caption">
                                <h3>Jenn Gwapa</h3>
                                <p>CEO / Founder</p>
                                <p>Do not seek to change what has come before. Seek to create that which has not.</p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="thumbnail">
                            <img src="img/team/01.jpg" alt="..." class="img-circle team-img">
                            <div class="caption">
                                <h3>Jenn Gwapa</h3>
                                <p>CEO / Founder</p>
                                <p>Do not seek to change what has come before. Seek to create that which has not.</p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="thumbnail">
                            <img src="img/team/02.jpg" alt="..." class="img-circle team-img">
                            <div class="caption">
                                <h3>Jenn Gwapa</h3>
                                <p>CEO / Founder</p>
                                <p>Do not seek to change what has come before. Seek to create that which has not.</p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="thumbnail">
                            <img src="img/team/03.jpg" alt="..." class="img-circle team-img">
                            <div class="caption">
                                <h3>Jenn Gwapa</h3>
                                <p>CEO / Founder</p>
                                <p>Do not seek to change what has come before. Seek to create that which has not.</p>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div> 



	<!-- Login Section -->
	<a name="login_up"></a>
	<div id="tf-login" class="banner" ng-app="validation"
		ng-controller="RegistrationController as registration">
		<div class="content-section-c">
			<div class="container">
				<div class="row">
					<section style="margin-top: 30px;">
						<div class="container">
							<div class="row">
								<sec:authorize
									access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')?false:true">
									<div class="col-md-6 col-md-offset-3">
										<div class="panel panel-login">
											<div class="panel-heading"
												style="height: 60px; text-align: center; font-size: 18px; color: #666; font-weight: bold;">
												<div class="row">
													<div class="col-xs-6">
														<a href="#login-form" id="login-form-link" class="active">Login</a>
													</div>
													<div class="col-xs-6">
														<a href="#register-form" id="register-form-link">Register</a>
													</div>
												</div>
												<hr>
											</div>
											<div class="panel-body">
												<div class="row">
													<div class="col-lg-12">
														<!-- Alerts for missing form info  -->
														<div class="alert" style="display: none;"
															id="usernameAndPasswordReq">
															<p>Username and password are required</p>
														</div>

														<div class="alert" style="display: none;" id="usernameReq">
															<p>Username is required</p>
														</div>
														<div class="alert" style="display: none;" id="passwordReq">
															<p>Password is required</p>
														</div>
														<div class="alert" id="wrongCredentials"
															style="display: none;">
															<p>The username or password supplied is incorrect</p>
														</div>
														<!-- Login Form -->
														<form id="login-form" name="login-form"
															class="form-validate"
															action="<c:url value='j_spring_security_check'/>"
															method="POST" style="display: block;">
															<div class="form-group">
																<label for="uname" style="color: black;">
																	Username:</label> <input type="text" name="j_username"
																	id="j_username" tabindex="1" class="form-control"
																	placeholder="Username">
															</div>
															<div class="form-group" style="color: black;">
																<label for="uname"> Password:</label> <input
																	type="password" name="j_password" id="j_password"
																	tabindex="2" class="form-control"
																	placeholder="Password">
															</div>
															<div class="form-group text-center">
																<input type="checkbox" tabindex="3" class=""
																	name="_spring_security_remember_me" id="remember-me"> <label
																	for="remember" style="color: black;"> Remember
																	Me</label>
															</div>
															<div class="form-group">
																<div class="row">
																	<div class="col-sm-6 col-sm-offset-3"
																		style="padding-top: 10px; color: #f05f40;">
																		<input type="submit" name="submit1" id="signin"
																			tabindex="4" class="form-control btn btn-login"
																			value="Log In">
																	</div>
																</div>
															</div>
															<div class="form-group">
																<div class="row">
																	<div class="col-lg-12">
																		<div class="text-center">
																			<a href="forgotpassword.jsp" tabindex="5"
																				class="forgot-password">Forgot Password?</a>
																		</div>
																	</div>
																</div>
															</div>
														</form>

														<!-- SignUp Form -->
														<!-- <div class="alert" style="display: none;" id="usernameExist">
													<p>Username Exist!!</p>
												</div>
												<div class="alert" style="display: none;" id="emailExist">
													<p style="color:#f05f40;">Email Exist!!</p>
												</div> -->
														<!-- <form id="register-form" name="register-form" action="confirmation" method="post" style="display: none;">
													<div class="form-group1">
														<label for="uname" style="color:black;"> Username:</label>
														<input type="text" name="userName" id="j_userName" tabindex="1" class="form-control" placeholder="Username">
													</div>
													<div class="form-group1">
														<label for="ulname" style="color:black;"> Lastname:</label>
														<input type="text" name="lastName" id="j_lastName" tabindex="1" class="form-control" placeholder="Lastname">
													</div>
													<div class="form-group1">
														<label for="ufname" style="color:black;"> Firstname:</label>
														<input type="text" name="firstName" id="j_firstName" tabindex="1" class="form-control" placeholder="Firstname">
													</div>
													<div class="form-group1">
														<label for="uemail" style="color:black;"> Email:</label>
														<input type="email" name="email" id="j_email" tabindex="1" class="form-control" placeholder="Email Address">
													</div>
													<div class="form-group1">
														<label for="upassword" style="color:black;"> Password:</label>
														<input type="password" name="passWord" id="j_passWord" tabindex="2" class="form-control" placeholder="Password">
													</div>
													<div class="form-group1">
														<label for="upassword" style="color:black;"> Confirm your password:</label>
														<input type="password" name="confirm_password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
													</div>
													<div class="form-group1">
														<div class="row">
															<div class="col-sm-6 col-sm-offset-3" style="padding-top: 10px;">
																<input type="submit" name="submit2" id="register" tabindex="4" class="form-control btn btn-register"  value="Register Now">
															</div>
														</div>
													</div>
													<br>
												</form> -->

														<form id="register-form" name="registerform"
															action="confirmation" method="post"
															style="display: none;" novalidate
															ng-submit="registration.submit(registerform.$valid)">
															<div class="form-group"
																ng-class="{ 'has-error': registerform.userName.$touched && registerform.userName.$invalid }">
																<label for="uname" style="color: black;">
																	Username:</label> <input type="text" name="userName"
																	id="j_userName" tabindex="1" class="form-control"
																	placeholder="Enter your username" ng-model="userName"
																	ng-minlength="3" ng-maxlength="10" username-valid
																	required>
																<div class="help-block"
																	ng-messages="registerform.userName.$error"
																	ng-messages-multiple
																	ng-if="registerform.userName.$dirty">
																	<p ng-message="minlength" style="color: #f05f40;">Your
																		username is too short.</p>
																	<p ng-message="maxlength" style="color: #f05f40;">Your
																		username is too long.</p>
																	<p ng-message="required" style="color: #f05f40;">Your
																		username is required.</p>
																	<p ng-message="usernameValid" style="color: #f05f40;">Username
																		Exist!</p>
																</div>
																<!-- <div style="display: none;color:#f05f40;" id="usernameExist">Username Exist!</div> -->
															</div>
															<div class="form-group"
																ng-class="{ 'has-error': registerform.lastName.$touched && registerform.lastName.$invalid }">
																<label for="ulname" style="color: black;">
																	Lastname:</label> <input type="text" name="lastName"
																	id="j_lastName" tabindex="1" class="form-control"
																	placeholder="Enter your lastname" ng-model="lastName"
																	ng-pattern="/^[a-zA-Z]+$/" required>
																<div class="help-block"
																	ng-messages="registerform.lastName.$error"
																	ng-messages-multiple
																	ng-if="registerform.lastName.$dirty">
																	<p ng-message="required" style="color: #f05f40;">Your
																		lastname is required.</p>
																	<p ng-message="pattern" style="color: #f05f40;">This
																		field only accept alphabet.</p>
																</div>
															</div>
															<div class="form-group"
																ng-class="{ 'has-error': registerform.firstName.$touched && registerform.firstName.$invalid }">
																<label for="ufname" style="color: black;">
																	Firstname:</label> <input type="text" name="firstName"
																	id="j_firstName" tabindex="1" class="form-control"
																	placeholder="Enter your firstname" ng-model="firstName"
																	ng-pattern="/^[a-zA-Z]+$/" required>
																<div class="help-block"
																	ng-messages="registerform.firstName.$error"
																	ng-messages-multiple
																	ng-if="registerform.firstName.$dirty">
																	<p ng-message="required" style="color: #f05f40;">Your
																		firstname is required.</p>
																	<p ng-message="pattern" style="color: #f05f40;">This
																		field only accept alphabet.</p>
																</div>

															</div>
															<div class="form-group"
																ng-class="{ 'has-error': registerform.email.$touched && registerform.email.$invalid }">
																<label for="uemail" style="color: black;">
																	Email:</label> <input type="email" name="email" id="j_email"
																	tabindex="1" class="form-control"
																	placeholder="Enter your email address" ng-model="email"
																	email-valid required>
																<div class="help-block"
																	ng-messages="registerform.email.$error"
																	ng-messages-multiple ng-if="registerform.email.$dirty">
																	<p ng-message="required" style="color: #f05f40;">This
																		field is required</p>
																	<p ng-message="email" style="color: #f05f40;">This
																		needs to be a valid email</p>
																	<p ng-message="emailValid" style="color: #f05f40;">Email
																		Exists!</p>
																</div>
																<!-- <div style="display: none;color:#f05f40;" id="emailExist">Email Exist!</div>  -->
															</div>
															<div class="form-group"
																ng-class="{ 'has-error': registerform.passWord.$touched && registerform.passWord.$invalid }">
																<label for="upassword" style="color: black;">
																	Password:</label> <input type="password" name="passWord"
																	id="j_passWord" tabindex="2" class="form-control"
																	placeholder="Enter your password" ng-model="passWord"
																	ng-pattern="/^[a-zA-Z0-9]+$/" ng-minlength="6"
																	ng-maxlength="20" required>
																<div class="help-block"
																	ng-messages="registerform.passWord.$error"
																	ng-messages-multiple
																	ng-if="registerform.passWord.$dirty">
																	<p ng-message="required" style="color: #f05f40;">This
																		field is required</p>
																	<p ng-message="minlength" style="color: #f05f40;">This
																		field is too short. Minimum: 6.</p>
																	<p ng-message="maxlength" style="color: #f05f40;">This
																		field is too long</p>
																	<p ng-message="pattern" style="color: #f05f40;">This
																		field only accept alphabet and numbers</p>
																</div>
															</div>
															<div class="form-group">
																<label for="upassword" style="color: black;">
																	Confirm your password:</label> <input type="password"
																	name="confirmPassword" id="confirm-password"
																	tabindex="2" class="form-control"
																	placeholder="Confirm your password"
																	ng-model="confirmPassword" compare-to="passWord"
																	required>
																<div class="help-block"
																	ng-messages="registerform.confirmPassword.$error"
																	ng-messages-multiple
																	ng-if="registerform.confirmPassword.$dirty">
																	<p ng-message="compareTo" style="color: #f05f40;">Must
																		match the previous entry</p>
																	<p ng-message="required" style="color: #f05f40;">This
																		field is required</p>
																</div>

															</div>
															<div class="form-group">
																<div class="row">
																	<div class="col-sm-6 col-sm-offset-3"
																		style="padding-top: 10px;">
																		<input ng-disabled="registerform.$invalid"
																			type="submit" name="submit2" id="register"
																			tabindex="4" class="form-control btn btn-register"
																			value="Register Now">
																	</div>
																</div>
															</div>
															<br>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</sec:authorize>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>

	
		<!-- team members -->
	<!--  <a id="tf-team" name="about us"></a>
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="section-heading">Our Amazing Team</h2>
			</div>
		</div>
		<div class="row">
			
		<!--  <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <p class="large text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p>
                </div>
            </div> 
	</div>-->

	<div class="rtop_btn" id="rtop_btn" style="display: none;">
		<a href="#" class="toplink cd-top"> <img src="icon/backtotop.png"
			class="totop" width="60" height="60">
		</a>
	</div> 
	
<!--  
	<nav id="footer">
		<div class="container">
			<!--  <div class="pull-left fnav">
				<p>
					ALL RIGHTS RESERVED. COPYRIGHT � 2014. Designed by <a
						href="https://dribbble.com/shots/1817781--FREEBIE-Spirit8-Digital-agency-one-page-template">Robert
						Berki</a> and Coded by <a href="https://dribbble.com/jennpereira">Jenn
						Pereira</a>
				</p>
			</div>
			<div class="pull-right fnav">
				<ul class="footer-social">
					<li><a href="#"><i class="fa fa-facebook"></i></a></li>
					<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
					<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
					<li><a href="#"><i class="fa fa-twitter"></i></a></li>
				</ul>
			</div>
		</div>
	</nav>

-->
	<c:import url="pageComponent/footer.jsp"></c:import>


	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!--   Plugin JavaScript 
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/cbpAnimatedHeader.js"></script>

    Contact Form JavaScript
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script> -->

	<!-- Custom Theme JavaScript -->
	<!-- <script src="js/agency.js"></script> -->

	<!--  <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script src="js/form-validation-script.js"></script>  -->

</body>

</html>
