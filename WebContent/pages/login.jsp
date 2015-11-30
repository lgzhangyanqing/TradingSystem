<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(document).ready(function() {
		if ("<c:out value='${param.login_error}'/>" != "") {
		  	$('#wrongCredentials').show();
		}
		$("#signin").on("click", loginValidation);	
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
<div class="container" id="myLogin" ng-controller="loginController">
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
	<h4>Please Sign in.</h4>
	<h5>If you don't have an account, you can create one here! <a href="#sign"><button class="btn btn-danger">Create</button></a></h5>
	<form class="form" role="form" name="f" action="<c:url value='j_spring_security_check'/>" method="POST" id="login-form">
		<div class="form-group">
			<label for="uname"> Username:</label>
	    	<input type="text" class="form-control" name="j_username" id="j_username" placeholder="Enter username">
		</div>
		<div class="form-group">
	 		<label for="pwd">Password:</label>        
	    	<input type="password" class="form-control" name="j_password" id="j_password" placeholder="Enter password">
		</div>
		<div class="form-group">        
			<span><a href="#reset">forget your password?</a></span>		  
		</div>
		<div class="form-group">
	    	<div class="checkbox">
	      		<label><input type="checkbox"> Remember me</label>
	    	</div>	  
		</div>
		<div class="form-group">        
    		<button type="submit" id="signin" class="btn btn-default">Login</button>		  	
		</div>
	</form>
	</div>
		<!-- 	</div>
		</div>
	</div> -->
</div>
<script src="js/app.js"></script>