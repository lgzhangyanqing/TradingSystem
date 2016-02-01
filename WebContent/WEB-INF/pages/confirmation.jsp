<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="css/stylesheet.css" rel="stylesheet">
<script src="js/angular.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/stylesheet.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href='https://fonts.googleapis.com/css?family=Dosis' rel='stylesheet' type='text/css'>
</head>
<body>
<c:import url="pageComponent/header.jsp"/>
	<div class="confirmation">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                    	<h2 style="font-family: 'Dosis', sans-serif;font-size:75px">
							${userInfo.message}
						</h2>
                        <p style="font-size:38px">Please check your email.</h2>
                    </div>
                </div>
            </div>

        </div>
    </div>

<c:import url="pageComponent/footer.jsp"/>
</body>
</html>