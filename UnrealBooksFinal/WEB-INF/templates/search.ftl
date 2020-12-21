<!DOCTYPE html>
<html lang="en">
<head>
  <title>Search Result - Online Shopping Network</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="resources/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="resources/css/base.css"/>
  <link rel="stylesheet" href="resources/css/search.css"/>
  <script src="resources/js/jquery-3.2.1.min.js"></script>
  <script src="resources/js/popper.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
</head>
<body>
<#include "Navbar.ftl">
<div class="container">
  <#if bookList??>
  <h2>Search Results for "${input}"</h2>
  <#if success == true>
  	<h4>Item added to cart!</h4>
  </#if>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Cover</th>
	<th>Title</th>
	<th>Author</th>
        <th>Price</th>
        <th>Quantity</th>
	<#if user??>
		<th>Add to Cart</th>
	</#if>
      </tr>
    </thead>
    <tbody>
		<#list bookList as book>
			<tr>
				<td><img src=${book.getCover()}></td>
				<td>${book.getName()}</td>
				<td>${book.getCompany()}</td>
				<td>$${book.getPrice()}</td>
				<td>${book.getInventory_amt()}</td>
				<#if user??>
					<td>
						<form action="/OnlineShoppingNetwork/search" method="post">
							<input type="hidden" name="isbn" value="${book.getID()}">
							<input type="hidden" name="input" value="${input}">
							<button type="submit" class="btn btn-warning">Add to Cart</button>
						</form>
					</td>
				</#if>
			</tr>
		</#list>
    </tbody>
  </table>
	<#else>
		<h2>Your search for "${input}" did not match any records in our database.</h2>
	</#if>
</div>
<div class = "container">
</div>
</body>
</html>
