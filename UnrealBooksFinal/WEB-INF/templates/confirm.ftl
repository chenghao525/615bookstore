<!doctype html>
<html>
	<head>
		<title>Confirmation - Online Shopping Network</title>
		<link rel="stylesheet" href="resources/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="resources/css/base.css"/>
		<link rel="stylesheet" href="resources/css/confirm.css">
		<script src="resources/js/jquery-3.2.1.min.js"></script>
		<script src="resources/js/popper.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
	</head>
	<body>
	      <#include "Navbar.ftl">
	      </br>
	      <h2>Registration Confirmation</h2>
	      <h5>A confirmation email has also been sent to the provided email address</h5>
	      <p></p>
	      <label class="control-label" for="email">Email:</label>
	      <div class="col-sm-10">
		  <p class="form-control-static">${user.getEmail()}</p>
	      </div>
	      <label class="control-label" for="a">Name:</label>
	      <div class="col-sm-10">
		  <p class="form-control-static">${user.getName()}</p>
	      </div>
	      <label class="control-label" for="email">Shipping Address:</label>
	      <div class="col-sm-10">
		  <p class="form-control-static">${user.getAddress()}</p>
	      </div>
		<p></p>
	      <a href="/OnlineShoppingNetwork/activate">Click to Activate Account</a>
	    </div>
	</body>
</html>
