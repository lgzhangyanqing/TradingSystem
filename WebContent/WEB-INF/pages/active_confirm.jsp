<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirmation page</title>
<!-- for header and footer -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/extra/bootstrap-theme.css" rel="stylesheet">
<link href="css/extra/elegant-icons-style.css" rel="stylesheet" />
<link href="css/extra/font-awesome.min.css" rel="stylesheet" />    
<link href="css/extra/style.css" rel="stylesheet">
<script src="js/angular.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
#time, p, a {
	text-align:center;
	font-family: 'Unkempt', cursive;
	letter-spacing: 2px;
	font-weight: 700;
}

</style>
</head>
<body>
	<script type="text/javascript">
		function delay() {
	   		var delay=document.getElementById("time").innerHTML;
	   		if(delay>0){
	   			delay--;
	   			document.getElementById("time").innerHTML=delay;
	   		} else {
	   			document.getElementById("signin").click();
	   		}
			setTimeout("delay()", 1000);
		}
	</script>
	<section id="main-content">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-8" style="float:none;margin:auto;text-align:center">
				 <section class="panel">
				 <div class="panel-body">
<h1><span id="time">10</span></h1>
	<h1 style="color:#0099CC">Activation succcess! ${userName}</h1>
	
	<h2 id="go_home">This page will goto Yahoo Finance page after 10 seconds, if not click this link</h2>

	<form name="login-form" action="login_auto" method="POST" id="login-form" style="display:none">
		<input type="text" name="j_username" id="j_username" value="${userName}"/>
		<input type="submit" id="signin" type="submit" name="submit1">
	</form>
	</div>
	</section>
	</div>
	</div>
	</section>
	</section>
	<script type="text/javascript">
		delay();
	</script>

</body>
</html>