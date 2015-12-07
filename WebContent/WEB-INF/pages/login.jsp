<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width-device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>TradingSystem Main Page</title>
	<script	src="js/jquery.min.js"></script>
	<script src="js/angular.min.js"></script>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/stylesheet.css" rel="stylesheet">
    <link href="css/landing-page.css" rel="stylesheet">
	<!-- <link href="css/agency.css" rel="stylesheet">  -->
	<link rel="stylesheet" href="css/animate.min.css" type="text/css">
	<link rel="stylesheet" href="css/creative.css" type="text/css">
	
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

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

            $('html, body').animate({scrollTop: 0}, 300);
        });
		if ("<c:out value='${param.login_error}'/>" != "") {
		  	$('#wrongCredentials').show();
		}
		$("#j_userName").on("click", function(){
			$("#usernameExist").hide();
		});
		$("#j_email").on("click", function(){
			$("#emailExist").hide();
		});
		$("#signin").on("click", loginValidation);	
		$("#clear2").on("click", function(){
			$("#usernameExist").hide();
			$("#emailExist").hide();
		});	
		$("#j_userName").on("blur",function(){
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
		});	
		$("#j_email").on("blur",function(){
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
		});		
		
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
	  	if($("#j_username").val().length == 0 && $("#j_password").val().length == 0) {
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
.error{
	color:#FF6600 ;
	font-weight:400;
}
</style>
</head>

<body id="page-top" class="index">
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

    <!-- Navigation -->
    <nav class="navbar navbar-default" data-spy="affix" data-offset-top="197">	
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <!-- Collect the nav links, forms, and other content for toggling -->
			<ul class="nav navbar-nav">
			    <li><a href="#" class="nav-font">Home</a></li>
			    <li>
			    	<a href="marketdata" class="nav-font">MarketData</a>
			    </li>
			   <!--  <li>
			    	<a href="#transaction" class="nav-font">Transaction</a>
			    </li> -->
			    <sec:authorize access="hasRole('ROLE_USER')">
                  <li>
                      <a class="nav-font" href="#portfolio">
                          <i class="icon_desktop"></i>
                          <span>My Portfolio</span>
                      </a>
                  </li>
                  <li>
                      <a class="nav-font" href="#history">
                          <i class="icon_document_alt"></i>
                          <span>History</span>
                      </a>
                  </li> 
                 </sec:authorize>
			</ul>
            </div>
            <!-- /.navbar-collapse -->
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <div class="intro-header">
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
   <a name="service"></a>
    <div class="content-section-a">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                <br>
                <br>
                    <h2 class="section-heading">At Your Service</h2>
                    <hr class="primary">
                </div>
            </div>
        </div>
        <div class="container section-footer">
            <div class="row">
                <div class="col-lg-4 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-exchange wow bounceIn text-primary" ></i>
                        <h3>Trade Your Way</h3>
                        <p class="text-muted">Buy or Sell stocks can never be easy like this.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-pie-chart wow bounceIn text-primary" data-wow-delay=".1s"></i>
                        <h3>Check Your Record</h3>
                        <p class="text-muted">Get your individual portfolio charting on Yahoo Finance Trading System.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-newspaper-o wow bounceIn text-primary" data-wow-delay=".2s"></i>
                        <h3>Up to Date</h3>
                        <p class="text-muted">View the real-time market data in Yahoo.com.</p>
                    </div>
                </div>
               <!--  <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-heart wow bounceIn text-primary" data-wow-delay=".3s"></i>
                        <h3>Made with Love</h3>
                        <p class="text-muted">You have to make your websites with love these days!</p>
                    </div>
                </div> -->
            </div>
        </div>
    </div>
    <!-- Contact Section -->
    <a name="login_up"></a>
    <div class="banner">
    	<div class="content-section-c">
        <div class="container">
            <div class="row">
                    <section style="margin-top: 60px;">
				        <div class="container">
				    	<div class="row">
				    	<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')?false:true">
							<div class="col-md-6 col-md-offset-3">
								<div class="panel panel-login">
									<div class="panel-heading">
										<div class="row">
											<div class="col-xs-6">
												<a href="#login-form"  id="login-form-link">Login</a>
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
												<div class="alert" style="display: none;" id="usernameAndPasswordReq">
													<p>Username and password are required</p>
												</div>
				
												<div class="alert" style="display: none;" id="usernameReq">
													<p>Username is required</p>
												</div>
												<div class="alert" style="display: none;" id="passwordReq">
													<p>Password is required</p>
												</div>
												<div class="alert" id="wrongCredentials" style="display: none;">
													<p>The username or password supplied is incorrect</p>
												</div>
												<!-- Login Form -->
												<form id="login-form" name="login-form" class="form-validate"
												action="<c:url value='j_spring_security_check'/>" method="POST" style="display: block;">
													<div class="form-group">
														<input type="text" name="j_username" id="j_username" tabindex="1" class="form-control" placeholder="Username">
													</div>
													<div class="form-group">
														<input type="password" name="j_password" id="j_password" tabindex="2" class="form-control" placeholder="Password">
													</div>
													<div class="form-group text-center">
														<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
														<label for="remember"> Remember Me</label>
													</div>
													<div class="form-group">
														<div class="row">
															<div class="col-sm-6 col-sm-offset-3">
																<input type="submit" name="submit1" id="signin" tabindex="4" class="form-control btn btn-login" value="Log In">
															</div>
														</div>
													</div>
													<div class="form-group">
														<div class="row">
															<div class="col-lg-12">
																<div class="text-center">
																	<a href="http://phpoll.com/recover" tabindex="5" class="forgot-password">Forgot Password?</a>
																</div>
															</div>
														</div>
													</div>
												</form>
												
												<!-- SignUp Form -->
												<div class="alert" style="display: none;" id="usernameExist">
													<p>Username Exist!!</p>
												</div>
												<div class="alert" style="display: none;" id="emailExist">
													<p>Email Exist!!</p>
												</div>
												<form id="register-form" name="register-form" action="confirmation" method="post" style="display: none;">
													<div class="form-group1">
														<label for="uname"> Username:</label>
														<input type="text" name="userName" id="j_userName" tabindex="1" class="form-control" placeholder="Username">
													</div>
													<div class="form-group1">
														<label for="ulname"> Lastname:</label>
														<input type="text" name="lastName" id="j_lastName" tabindex="1" class="form-control" placeholder="Lastname">
													</div>
													<div class="form-group1">
														<label for="ufname"> Firstname:</label>
														<input type="text" name="firstName" id="j_firstName" tabindex="1" class="form-control" placeholder="Firstname">
													</div>
													<div class="form-group1">
														<label for="uemail"> Email:</label>
														<input type="email" name="email" id="j_email" tabindex="1" class="form-control" placeholder="Email Address">
													</div>
													<div class="form-group1">
														<label for="upassword"> Password:</label>
														<input type="password" name="passWord" id="j_passWord" tabindex="2" class="form-control" placeholder="Password">
													</div>
													<div class="form-group1">
														<label for="upassword"> Confirm your password:</label>
														<input type="password" name="confirm_password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
													</div>
													<div class="form-group1">
														<div class="row">
															<div class="col-sm-6 col-sm-offset-3">
																<input type="submit" name="submit2" id="register" tabindex="4" class="form-control btn btn-register" value="Register Now">
															</div>
														</div>
													</div>
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
        <!-- /.container -->

    
    <div class="rtop_btn" id="rtop_btn">
		<a href="#" class="toplink cd-top">
			<img src="icon/backtotop.png" class="totop" width="60" height="60">
		</a>
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
		<div class="contact-us col-md-3">
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


    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/cbpAnimatedHeader.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/agency.js"></script>
    
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script src="js/form-validation-script.js"></script>

</body>

</html>
