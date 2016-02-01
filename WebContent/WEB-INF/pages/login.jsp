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
    <meta name="description" content="">
    <meta name="author" content="">

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>TradingSystem Main Page</title>



<script src = "js/angular.js"></script>
<script src="js/angular-route.min.js"></script>
<script src="js/angular-ui-router.min.js"></script>
<link rel="stylesheet" href="css/main.css" text="text/css"/>

	
	
	<script	src="js/jquery.min.js"></script>
	<script src="js/angular.min.js"></script>
  	<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular-messages.js"></script>
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
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
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
	
	
	
	/*
	* AngularJs for the forgot password part
	
	
	var app = angular.module("mainApp", ["ngRoute"]);
	app.config('$routeProvider', '$locationProvider', function($routeProvider, $locationProvider){
		$routeProvider.when('/confirmation', {
			templateUrl: "WEB-INF/pages/confirmation.jsp",
			controller: "mainCtrl"
		});
	});
	
	app.controller("mainCtrl", function(){
		$scope.data = {
			email : null
		}
		$scope.go = function(path) {
			$location.path(path);
		}
		$scope.recoveraccount = function(){
			$http({
				url : "/recoveraccount",
				method: "POST",
			}).then(function(response){
				$scope.stocks = response.data.email;
			})
		}
	});
	*/
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

<body id="page-top" class="index" >
	<!-- Header -->
	<div class="container-fluid">
		<div class="top headerLinks">
			<a href="#">
				<img width="130" height="60" src="icon/icon.jpg">
			</a>
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
			</ul>
            </div>
            <!-- /.navbar-collapse -->
        <!-- /.container-fluid -->
    </nav>

    <!-- Header Page -->
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
    
    <!-- service with timeline -->
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
    
    
    <!-- Login Section -->
    <a name="login_up"></a>
    <div class="banner" ng-app="validation" ng-controller="RegistrationController as registration">
    	<div class="content-section-c">
        	<div class="container">
        	<div class="row">
        	 <section style="margin-top: 30px;">
				        <div class="container">
				    	<div class="row">
       			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')?false:true">
							<div class="col-md-6 col-md-offset-3">
								<div class="panel panel-login">
									<div class="panel-heading" style="height:60px;text-align: center; font-size:18px;color: #666;font-weight: bold;">
										<div class="row">
											<div class="col-xs-6">
												<a href="#login-form"  id="login-form-link" class="active">Login</a>
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
														<label for="uname" style="color:black;"> Username:</label>
														<input type="text" name="j_username" id="j_username" tabindex="1" class="form-control" placeholder="Username">
													</div>
													<div class="form-group" style="color:black;">
														<label for="uname"> Password:</label>
														<input type="password" name="j_password" id="j_password" tabindex="2" class="form-control" placeholder="Password">
													</div>
													<div class="form-group text-center">
														<input type="checkbox" tabindex="3" class="" name="remember-me" id="remember-me">
														<label for="remember" style="color:black;"> Remember Me</label>
													</div>
													<div class="form-group">
														<div class="row">
															<div class="col-sm-6 col-sm-offset-3" style="padding-top: 10px; color:#f05f40;">
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
											
												
												 <form id="register-form" name="registerform" action="confirmation" method="post"  style="display:none;" novalidate ng-submit="registration.submit(registerform.$valid)">
													<div class="form-group" ng-class="{ 'has-error': registerform.userName.$touched && registerform.userName.$invalid }">
														<label for="uname" style="color:black;"> Username:</label>
														<input type="text" name="userName" id="j_userName" tabindex="1" class="form-control" placeholder="Enter your username"
															ng-model="userName"
													        ng-minlength="3"
													        ng-maxlength="10"
													        username-valid
													        required>
														<div class="help-block" ng-messages="registerform.userName.$error" ng-messages-multiple ng-if="registerform.userName.$dirty">
													        <p ng-message="minlength" style="color:#f05f40;">Your username is too short.</p>
													        <p ng-message="maxlength" style="color:#f05f40;">Your username is too long.</p>
													        <p ng-message="required" style="color:#f05f40;">Your username is required.</p>
													        <p ng-message="usernameValid" style="color:#f05f40;">Username Exist!</p>
												     	 </div>
												     	 <!-- <div style="display: none;color:#f05f40;" id="usernameExist">Username Exist!</div> -->
												    </div> 
													<div class="form-group" ng-class="{ 'has-error': registerform.lastName.$touched && registerform.lastName.$invalid }">
														<label for="ulname" style="color:black;"> Lastname:</label>
														<input type="text" name="lastName" id="j_lastName" tabindex="1" class="form-control" placeholder="Enter your lastname"
															ng-model="lastName"
															ng-pattern="/^[a-zA-Z]+$/"
															required>
														<div class="help-block" ng-messages="registerform.lastName.$error" ng-messages-multiple ng-if="registerform.lastName.$dirty">
												        	<p ng-message="required" style="color:#f05f40;">Your lastname is required.</p>
												        	<p ng-message="pattern" style="color:#f05f40;">This field only accept alphabet.</p>
											     	 	</div>
													</div>
													<div class="form-group" ng-class="{ 'has-error': registerform.firstName.$touched && registerform.firstName.$invalid }">
														<label for="ufname" style="color:black;"> Firstname:</label>
														<input type="text" name="firstName" id="j_firstName" tabindex="1" class="form-control" placeholder="Enter your firstname"
															ng-model="firstName"
															ng-pattern="/^[a-zA-Z]+$/"
																required>
														<div class="help-block" ng-messages="registerform.firstName.$error" ng-messages-multiple ng-if="registerform.firstName.$dirty">
												        	<p ng-message="required" style="color:#f05f40;">Your firstname is required.</p>
												        	<p ng-message="pattern" style="color:#f05f40;">This field only accept alphabet.</p>
											     	 	</div>
											     	 	
													</div>
													<div class="form-group" ng-class="{ 'has-error': registerform.email.$touched && registerform.email.$invalid }">
														<label for="uemail" style="color:black;"> Email:</label>
														<input type="email" name="email" id="j_email" tabindex="1" class="form-control" placeholder="Enter your email address"
																ng-model="email"
																email-valid
														        required>
														<div class="help-block" ng-messages="registerform.email.$error" ng-messages-multiple ng-if="registerform.email.$dirty">
																<p ng-message="required" style="color:#f05f40;">This field is required</p>
																<p ng-message="email" style="color:#f05f40;">This needs to be a valid email</p>
																<p ng-message="emailValid" style="color:#f05f40;">Email Exists!</p>
													      </div>
													     <!-- <div style="display: none;color:#f05f40;" id="emailExist">Email Exist!</div>  -->
													</div>
													<div class="form-group" ng-class="{ 'has-error': registerform.passWord.$touched && registerform.passWord.$invalid }">
														<label for="upassword" style="color:black;"> Password:</label>
														<input type="password" name="passWord" id="j_passWord" tabindex="2" class="form-control" placeholder="Enter your password"
																ng-model="passWord"
																ng-pattern="/^[a-zA-Z0-9]+$/"
																ng-minlength="6"
															    ng-maxlength="20"
																required>
															<div class="help-block" ng-messages="registerform.passWord.$error" ng-messages-multiple ng-if="registerform.passWord.$dirty">
																<p ng-message="required" style="color:#f05f40;">This field is required</p>
																<p ng-message="minlength" style="color:#f05f40;">This field is too short. Minimum: 6.</p>
																<p ng-message="maxlength" style="color:#f05f40;">This field is too long</p>
																<p ng-message="pattern" style="color:#f05f40;">This field only accept alphabet and numbers</p>
														</div>
													</div>
													<div class="form-group">
														<label for="upassword" style="color:black;"> Confirm your password:</label>
														<input type="password" name="confirmPassword" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm your password"
															ng-model="confirmPassword"
															compare-to="passWord"
															required
															>
														<div class="help-block" ng-messages="registerform.confirmPassword.$error" ng-messages-multiple ng-if="registerform.confirmPassword.$dirty">
																<p ng-message="compareTo" style="color:#f05f40;">Must match the previous entry</p>
																<p ng-message="required" style="color:#f05f40;">This field is required</p>
														</div>
															
													</div>
													<div class="form-group">
														<div class="row">
															<div class="col-sm-6 col-sm-offset-3" style="padding-top: 10px;">
																<input ng-disabled="registerform.$invalid" type="submit" name="submit2" id="register" tabindex="4" class="form-control btn btn-register"  value="Register Now">
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
 
        <!-- /.container -->

    
    <!-- team members -->  
	<a name="about us"></a>
	<div class="container">
    	<div class="row">
        	<div class="col-lg-12 text-center">
            	<h2 class="section-heading">Our Amazing Team</h2>
            </div>
        </div>
        <div class="row">
        		<div class="col-sm-4">
                    <div class="team-member">
                        <img src="img/team/2.jpg" class="img-responsive img-circle" alt="">
                        <h4>Ted Xiong</h4>
                        <p class="text-muted">Lead Developer</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="https://twitter.com"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="https://facebook.com"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="https://github.com"><i class="fa fa-github-alt"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4">
        		<div class="team-member">
        			<img src="img/team/1.jpeg" class="img-responsive img-circle" alt="">
                        <h4>Maggie Zou</h4>
                        <p class="text-muted">Lead Developer</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="https://twitter.com"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="https://facebook.com"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="https://github.com"><i class="fa fa-github-alt"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="img/team/3.jpg" class="img-responsive img-circle" alt="">
                        <h4>Hannah Han</h4>
                        <p class="text-muted">Lead Developer</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="https://twitter.com"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="https://facebook.com"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="https://github.com"><i class="fa fa-github-alt"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
    <div class="rtop_btn" id="rtop_btn" style="display:none;">
		<a href="#" class="toplink cd-top">
			<img src="icon/backtotop.png" class="totop" width="60" height="60">
		</a>
	</div> 

 
	<c:import url="pageComponent/footer.jsp"></c:import>


    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>


</body>

</html>
