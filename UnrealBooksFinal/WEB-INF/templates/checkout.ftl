<!DOCTYPE html>
<html>
<head>
  <title>Check Out - Online Shopping Network</title>
      <meta charset="utf-8">
      <meta name ="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="resources/css/bootstrap.min.css">
      <link rel="stylesheet" href="resources/css/base.css"/>
      <link rel="stylesheet" href="resources/css/home.css"/>
      <link rel="stylesheet" href="resources/css/checkout.css"/>
      <script src="resources/js/jquery-3.2.1.min.js"></script>
      <script src="resources/js/popper.js"></script>
      <script src="resources/js/bootstrap.min.js"></script>
      <script src="resources/js/checkout.js"></script>
</head>
<body>
  <#include "Navbar.ftl">
  <h2>Checkout</h2>
  <#if invalidBook??>
	<h5>Sorry, your cart has more copies of "${invalidBook}" than we have in stock. Please reduce the amount to proceed.</h5>
  <#elseif error == true>
  	<h5 id="message">Invalid Promotion Code</h5>
  </#if>
  <div class="container">
	<h3>Shiping Address Information</h3>
	<p>
		${user.getName()}</br>
		${user.getAddress()}
	</p>
  </div>
  <div class="container">
	<h3>Payment Information</h3>
	<#if payment?? && card_num??>
		<p>
			Card Number: **** **** **** ${card_num}</br>
			Expiration Date: ${payment.getExpiration_Date()}</br>
			Billing Address: ${payment.getBilling_address()}
		<p>
	<#else>
		<h5 id="paymentMessage">No Payment records found. Please enter payment information</h5>
		<form action="/OnlineShoppingNetwork/checkout" method="post" id="payment">
			<label for="card">Card Number:</label>
			<input class="form-control" id="card" name="card" type="text" placeholder="Enter Card #">

			<label for="date">Expiration Date:</label>
			<input class="form-control" id="date" name="date" type="text" placeholder="MM/YY">

			<label for="name">Billing Address:</label>
			<input class="form-control" id="billingAddress"
				name="billingAddress" placeholder="Billing Address" type="text">

			<label for="cvv">CVV: (3 or 4 digits on the back of card)</label>
			<input type="ship" class="form-control" id="cvv" name="cvv" placeholder="Digits on the back">

			<button class="btn btn-primary" id="submitBtn">Update Payment Information</button>
		</form>
	</#if>
  </div>
  <div class="container">
  <#if bookList??>
  <h3>Review Cart Contents</h3>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Cover</th>
	<th>Title</th>
	<th>Author</th>
        <th>Price</th>
        <th>Quantity</th>
      </tr>
    </thead>
    <tbody>
		<#list bookList as book>
			<tr>
				<td><img src=${book.getCover()}></td>
				<td>${book.getName()}</td>
				<td>${book.getCompany()}</td>
				<td>$${book.getPrice()}</td>
				<td>${qtyList[book?index]}</td>
			</tr>
		</#list>
    </tbody>
  </table>
  <form id="promotion">
	<input type="text" name="promo" placeholder="Enter a Promotion Code">
	<button class="btn btn-primary">Apply Code</button>
  </form>
  <#if finalPrice??>
	<h3>Order Total: $${finalPrice}</h3>
  <#else>
  	<h3>Order Total: $${cart.getPrice()}</h3>
  </#if>
  <#if payment?? && !invalidBook??>
	  <a href="/OnlineShoppingNetwork/orderconfirm"><button class="btn btn-warning">Place your Order</button></a>
   </#if>
	<#else>
		<h2>Your cart is currently empty.</h2>
	</#if>
</div>
</body>
</html>
