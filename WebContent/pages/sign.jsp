<div class="container" id="mySign" ng-controller="signController">
<section id="login_up">
        <div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
				<div class="panel-heading">
				<h4>Welcome, please fill the signup form.</h4>
				</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
	
	<form id="register-form" name="register-form" action="confirmation" method="post">
		<div class="form-group1">
			<label for="uname"> Username:</label>
	    	<input type="text" name="userName" id="j_userName" tabindex="1" class="form-control" placeholder="Enter username">
		</div>
		<div class="form-group1">
			<label for="ulname"> Lastname:</label>
	    	<input type="text" name="lastName" id="j_lastName" tabindex="1" class="form-control" placeholder="Enter lastname">
		</div>
		<div class="form-group1">
			<label for="ufname"> Firstname:</label>
	    	<input type="text" name="firstName" id="j_firstName" tabindex="1" class="form-control" placeholder="Enter firstname">
		</div>
		<div class="form-group1">
			<label for="uemail"> Email:</label>
	    	<input type="email" name="email" id="j_email" tabindex="1" class="form-control" placeholder="Enter emial address">
		</div>
		<div class="form-group1">
	 		<label for="pwd">Password:</label>        
	    	<input type="password" name="passWord" id="j_passWord" tabindex="2" class="form-control"  placeholder="Enter password">
		</div>
		<div class="form-group1">
			<label for="pwd"> Confirm your password:</label>
	    	<input type="password" name="confirm_password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm your password">
		</div>
		<div class="form-group1">
		<div class="col-sm-6 col-sm-offset-3">       
    		<input type="submit" name="submit2" id="register" tabindex="4" class="form-control btn btn-register" value="Register Now">		  	
		</div> 
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
</div>
 <script type="text/javascript" src="js/jquery.validate.min.js"></script>