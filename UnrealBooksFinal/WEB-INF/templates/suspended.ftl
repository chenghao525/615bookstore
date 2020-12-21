<!DOCTYPE html>
<html>
<head>
  <title>Suspended Account Page - Unreal Bookstore</title>
      <meta charset="utf-8">
      <meta name ="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="resources/css/bootstrap.min.css">
      <link rel="stylesheet" href="resources/css/base.css"/>
      <link rel="stylesheet" href="resources/css/suspended.css"/>
      <script src="resources/js/jquery-3.2.1.min.js"></script>
      <script src="resources/js/login.js"></script>
</head>
<body>
  <#include "Navbar.ftl">
    <div class="container">
      <h2>Your account has been suspended!</h2>
      <h4>Contact the administrator if you have any question</h4>
     <#if sent == true>
        <h5 id="sent">Message Sent.</h5>
    </#if>
      <div class="form-group">
	<label for="em">Your email:</label>
	<input type="email" name="email" id="em" class="form-control">
	<label for="comment">Message:</label>
	<textarea class="form-control" rows="5" name="message" id="comment"></textarea>
      </div>
      <button type="button" class="btn btn-default">Send Message</button>
    </div>
</body>
</html>
