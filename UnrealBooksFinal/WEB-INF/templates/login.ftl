<!DOCTYPE html>
<html>
<head>
  <title>Login Page - Online Shopping Network</title>
      <meta charset="utf-8">
      <meta name ="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="resources/css/bootstrap.min.css">
      <link rel="stylesheet" href="resources/css/base.css"/>
      <link rel="stylesheet" href="resources/css/login.css"/>
      <script src="resources/js/jquery-3.2.1.min.js"></script>
      <script src="resources/js/login.js"></script>
</head>
<body>
  <#include "Navbar.ftl">
  <div class="container">
    <p></p>
    <h3 id="login">Login - Online Shopping Network</h3>
    <#if error == true>
	<h5>Invalid email or password.</h5>
    </#if>
    <#if waiting == true>
	<h5>Please check your email to activate your account.</h5>
    <#elseif suspended == true>
	<h5>Please contact a system administrator concerning your account.</h5>
    </#if>
    <form>
      <div class="form-group">
	<label for="email">Email Address:</label>
	<input type="email" class="form-control" name="email" id="email">

	<label for="pwd">Password:</label>
	<input type="password" class="form-control" name="password" id="password">
      <div class="checkbox">
	<label><input type="checkbox"> Remember me</label>
      </div>
      <button type = "submit" class="btn btn">Submit</button>
      &nbsp;
      <button a="register" class="btn btn">New User Register</button>
      </div>
    </form>
    <a href="/OnlineShoppingNetwork/forgot"><button class="btn-link">Forgot Password?</button></a>
  </div>
</body>
</html>
