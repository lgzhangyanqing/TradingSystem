<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(document).ready(function() {
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
	});
</script>
<div class="container" id="myLogin" ng-controller="loginController" style="background-img:url(icon/back.jpg);">
	<section id="login_up">
        <div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
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
								
								<h4>Please Sign in.</h4>
								<h5>If you don't have an account, you can create one here! <a href="#/sign"><button class="btn btn-danger">Create</button></a></h5>
								<form class="login-form" role="login-form" name="f" action="<c:url value='j_spring_security_check'/>" method="POST" id="login-form">
									<div class="form-group">
										<label for="uname"> Username:</label>
								    	<input type="text" class="form-control" name="j_username" id="j_username" placeholder="Enter username">
									</div>
									<div class="form-group">
								 		<label for="pwd">Password:</label>        
								    	<input type="password" class="form-control" name="j_password" id="j_password" placeholder="Enter password">
									</div>
									<div class="form-group">        
										<span><a href="reset">forget your password?</a></span>		  
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
						</div>
					</div>
				</div>
			</div>
		
		</div>
	</div>
    </section>
<%-- <!-- Alerts for missing form info  --> 
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
	<form class="login-form" role="login-form" name="f" action="<c:url value='j_spring_security_check'/>" method="POST" id="login-form">
		<div class="form-group">
			<label for="uname"> Username:</label>
	    	<input type="text" class="form-control" name="j_username" id="j_username" placeholder="Enter username">
		</div>
		<div class="form-group">
	 		<label for="pwd">Password:</label>        
	    	<input type="password" class="form-control" name="j_password" id="j_password" placeholder="Enter password">
		</div>
		<div class="form-group">        
			<span><a href="reset">forget your password?</a></span>		  
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
	</div> --%>
		<!-- 	</div>
		</div>
	</div> -->
</div>
<script src="js/app.js"></script>