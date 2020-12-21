<!DOCTYPE html>
<html>
<head>
  <title>Details - Online Shopping Network</title>
      <meta charset="utf-8">
      <meta name ="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="resources/css/bootstrap.min.css">
      <link rel="stylesheet" href="resources/css/base.css"/>
      <!--<link rel="stylesheet" href="resources/css/activate.css"/>-->
      <script src="resources/js/jquery-3.2.1.min.js"></script>
      <script src="resources/js/activate.js"></script>
</head>
<body>
  <#include "Navbar.ftl">
    <div class="container">
      <h2>Activate Your Account</h2>
      <h5 id="message"></h5>
      <#if invalidUser == true>
	<h5>Please enter a correct email or password.</h5>
      <#elseif incorrectCode == true>
	<h5>Please enter a valid verification code</h5>
      <#elseif success == true>
	<h5 id="success">Account activated successsfully!</h5>
      </#if>
      <form action="/OnlineShoppingNetwork/activate" method="post">
	      <div class="form-group">
		<label for="email">Email: </label>
		<input id="email" name="email" class="form-control">
		<label for="password">Password: </label>
		<input id="name" name="password" type="password" class="form-control">
		<label for="code">Verification Code: </label>
		<input id="verificaiton" name="verification" class="form-control">
	      </div>
	<button type="submit" id="submitBtn" class="btn">Submit</button>
      </form>
      <div class="form-group">
	<label for="res">Did not receive a code? </label>
	<button type="button" class="btn">Click to resend code</button>
      </div>
    </div>
</body>
</html>

