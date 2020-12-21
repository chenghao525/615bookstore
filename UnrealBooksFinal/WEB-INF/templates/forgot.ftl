<!DOCTYPE html>
<html>
<head>
  <title>Forget Password Page - Online Shopping Network</title>
      <meta charset="utf-8">
      <meta name ="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="resources/css/bootstrap.min.css">
      <link rel="stylesheet" href="resources/css/base.css"/>
      <link rel="stylesheet" href="resources/css/forgot.css"/>
      <script src="resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>
  <#include "Navbar.ftl">
    <div class="container">
      <form>
      <h3>Forgot your password?</h3>
      <#if error == true>
      	<h5>Please enter a valid email address.</h5>
      <#elseif success == true>
	<h5 id="success">Temporary password emailed!</h5>
      </#if>
      <div class="form-group">
	      <label>Type in the email associated with your account: </label>
	      <input type="text" class="form-control" name="email" id="email">
	      <button type="submit" class="btn">Reset Password</button>
      </div>
     </form>
    </div>
</body>
</html>
