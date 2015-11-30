<div class="container" id="mySign" ng-controller="signController">
	<h4>Please fill the signup form.</h4>
	<form class="form" role="form" name="f" action="<c:url value='j_spring_security_check'/>" method="POST" id="login-form">
		<div class="form-group">
			<label for="uname"> Username:</label>
	    	<input type="text" class="form-control" name="j_username" id="j_username" placeholder="Enter username">
		</div>
		<div class="form-group">
			<label for="ulname"> Lastname:</label>
	    	<input type="text" class="form-control" name="j_username" id="j_username" placeholder="Enter username">
		</div>
		<div class="form-group">
			<label for="ufname"> Firstname:</label>
	    	<input type="text" class="form-control" name="j_username" id="j_username" placeholder="Enter username">
		</div>
		<div class="form-group">
			<label for="uemail"> Email:</label>
	    	<input type="text" class="form-control" name="j_username" id="j_username" placeholder="Enter username">
		</div>
		<div class="form-group">
	 		<label for="pwd">Password:</label>        
	    	<input type="password" class="form-control" name="j_password" id="j_password" placeholder="Enter password">
		</div>
		<div class="form-group">
			<label for="pwd"> Confirm your password:</label>
	    	<input type="password" class="form-control" name="j_password" id="j_password" placeholder="Confirm your password">
		</div>
		<div class="form-group">        
    		<button type="submit" id="login" class="btn btn-default">Submit</button>		  	
		</div>
	</form>
</div>