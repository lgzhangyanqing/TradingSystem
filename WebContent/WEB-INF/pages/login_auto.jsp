<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TradingSystem Main Page</title>
<script	src="js/jquery.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/angular.min.js"></script>
<script>
	$(document).ready(function() {
		if ("<c:out value='${param.login_error}'/>" != "") {
		  	$('#wrongCredentials').show();
		}
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
		width: 200px;
		margin: 10;
		position: relative;
	}
</style>
</head>
<body>
<h1><font color="blue">Login with Username and Password</font></h1>
<!-- Alerts for missing form info  --> 
<div class="alert" style="display:none;" id="usernameAndPasswordReq">
	<p>Username and password are required</p>
</div>

<div class="alert" style="display:none;" id="usernameReq">
	<p>Username is required</p>
</div>
<div class="alert" style="display:none;" id="passwordReq">
	<p>Password is required</p>
</div>
<div class="alert" id="wrongCredentials" style="display:none;">
	<p>The username or password supplied is incorrect</p>
</div>	
<!-- Login Form -->	
<form name="login-form" action="<c:url value='j_spring_security_check'/>" method="POST" id="login-form">
	<table>
		<tr>
			<td>Username: </td>
			<td><input type="text" name="j_username" id="j_username"/></td>
		</tr>
		<tr>
			<td>Password: </td>
			<td><input type="password" name="j_password" id="j_password"/></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<button type="reset">Clear</button>
				<button id="signin" type="submit" name="submit1">Sign In</button>
			</td>
		</tr>
	</table>		
</form>
<h1><font color="blue">Sign up!</font></h1>
<!-- SignUp Form -->
<div class="alert" style="display:none;" id="usernameExist">
	<p>Username Exist!!</p>
</div>
<div class="alert" style="display:none;" id="emailExist">
	<p>Email Exist!!</p>
</div>
<form name="register-form" action="confirmation" method="post" id="loginForm">
	<table>
		<tr>
			<td>Username: </td>
			<td><input type="text" name="userName" id="j_userName" required/></td>
		</tr>
		<tr>
			<td>Password: </td>
			<td><input type="password" name="passWord" id="j_passWord"/></td>
		</tr>
		<tr>
			<td>Email: </td>
			<td><input type="email" name="email" id="j_email"/></td>
		</tr>
		<tr>
			<td>Firstname: </td>
			<td><input type="text" name="firstName" id="j_firstName"/></td>
		</tr>
		<tr>
			<td>Lastname: </td>
			<td><input type="text" name="lastName" id="j_lastName"/></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="reset" value="Clear" id="clear2"/>
				<input type="submit" value="Submit2" id="register"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>