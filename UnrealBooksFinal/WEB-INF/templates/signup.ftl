<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Register - Online Shopping Network</title>
    <meta charset="utf-8">
    <meta name ="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/base.css"/>
    <link rel="stylesheet" href="resources/css/signup.css">
    <script src="resources/js/jquery-3.2.1.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/signup.js"></script>
  </head>
  <body>
    <#include "Navbar.ftl">
    <div class="container">
      </br>
      <h2 id="title">New User Registration</h2>
      <h6 id="note">* Indicates a mandatory field.</h6>
      <h5 id="message"></h5>
      <#if error == true>
	<h5>Error when creating user account. Please use a different email.</h5>
      </#if>
      <form action="/OnlineShoppingNetwork/signup" method="post">
	<h4>Personal Information:</h4>
	<div class="form-group">
	  <label>  Full Name*:  </label>
	  <input class="form-control" name="name" id="name" type="text" placeholder="Enter Full Name">

	  <label class ="control-label" for="email">Email*:</label>
	  <input class="form-control" name="email" id="email" placeholder="Enter email">

          <label class="control-label" for="password">Password*:</label>
          <input class="form-control" type="password" name="password" id="password" placeholder="Enter Password">

          <label for="confirmation" class="control-label">Confirm Password*:</label>
	  <input class="form-control" type="password" name="confirmation" id="confirmation" placeholder="Confirm Password">

	  <label class="control-label" for="address">Shipping Address*:</label>
	  <input class="form-control" name="address" id="address" placeholder="Enter an Address">

	  <label for="phoneNumber">Phone Number:</label>
	  <input class="form-control" name="phone" placeholder="Enter a Phone Number">
      </br>
      <h4>Payment Information (Optional):</h4>
          <label for="card">Card Number:</label>
          <input class="form-control" name="card" type="text" placeholder="Enter Card #">

          <label for="date">Expiration Date:</label>
          <input class="form-control" name="date" type="text" placeholder="MM/YY">

          <label for="name">Billing Address:</label>
          <input class="form-control" name="billingAddress" placeholder="Billing Address" type="text">

          <label for="cvv">CVV: (3 or 4 digits on the back of card)</label>
          <input type="ship" class="form-control" name="cvv" placeholder="Digits on the back">
	</div>
	<div class="checkbox">
	  <label><input type="checkbox" name="promo"> Subscribe for Promotions</label>
	</div>
	<button type="submit" id="submitBtn" class="btn btn">Submit</button>
      </form>
    </div>
  </body>
</html>

