<!DOCTYPE html>
<html>
<head>
  <title>Orders - Unreal Bookstore</title>
      <meta charset="utf-8">
      <meta name ="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="resources/css/bootstrap.min.css">
      <link rel="stylesheet" href="resources/css/base.css"/>
      <link rel="stylesheet" href="resources/css/orders.css"/>
      <script src="resources/js/jquery-3.2.1.min.js"></script>
      <script src="resources/js/popper.js"></script>
      <script src="resources/js/bootstrap.min.js"></script>
</head>
<body>
	<#include "Navbar.ftl">
	<h2>Orders</h2>
	<#if ordersList??>
		<#list ordersList as order>
			<div class="section">
				<h3>Order ID: ${order.getTransaction_number()}</h3>
				<h4>
					Checkout Time: ${order.getTime()}</br>
					Final Price: $${order.getFinalPrice()}
				</h4>
				<h4 class="items">Order Items:</h4>
				<table class="table table-bordered">
					<thead>
						<tr>
							<td>Cover</td>
							<td>Title</td>
							<td>Qty</td>
						</tr>
					</thead>
					<tbody>
						<#assign listOfBooks = bookList[order?index]>
						<#list listOfBooks as book>
							<tr>
								<td><img src="${book.getCover()}"></td>
								<td>${book.getName()}</td>
								<td>${qtyList[order?index]}</td>
							</tr>
						</#list>
					</tbody>
				</table>
			</div>
		</#list>
	<#else>
		<h4>You have not placed any orders.</h4>
	</#if>

</body>
</html>
