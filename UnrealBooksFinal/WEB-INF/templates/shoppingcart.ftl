<!DOCTYPE html>
<html lang="en">
<head>
  <title>Shopping Cart</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="resources/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="resources/css/base.css"/>
  <link rel="stylesheet" href="resources/css/shoppingcart.css"/>
  <script src="resources/js/jquery-3.2.1.min.js"></script>
  <script src="resources/js/popper.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
</head>
<body>
<#include "Navbar.ftl">
<div class="container">
  <#if bookList??>
  <h2>Shopping Cart</h2>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Cover</th>
	<th>Title</th>
	<th>Author</th>
        <th>Price</th>
        <th>Quantity</th>
	<th>Manage</th>
      </tr>
    </thead>
    <tbody>
		<#list bookList as book>
			<tr>
				<td><img src=${book.getCover()}></td>
				<td>${book.getName()}</td>
				<td>${book.getCompany()}</td>
				<td>$${book.getPrice()}</td>
				<!--<td>${qtyList[book?index]}</td>-->
				<td>
					<form action="/OnlineShoppingNetwork/cart" method="post">
					<input type="number" name="qtyUpdate"  min="1" value="${qtyList[book?index]}"></input>
				</td>
				<td>
						<input type="hidden" name="isbn" value="${book.getID()}">
						<button class="btn btn-primary">Update</button>
					</form>
					<form action="/OnlineShoppingNetwork/cart" method="post">
						<input type="hidden" name="deleteISBN" value="${book.getID()}">
						<button class="btn btn-primary">Delete</button>
					</form>
				</td>
			</tr>
		</#list>
    </tbody>
  </table>
  <h3>Cart Total: $${cart.getPrice()}</h3>
  <a href="/OnlineShoppingNetwork/checkout"><button class="btn btn-warning">Proceed to Checkout</button></a>
	<#else>
		<h2>Your cart is currently empty.</h2>
	</#if>
</div>
</body>
</html>
