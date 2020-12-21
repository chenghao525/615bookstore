<!DOCTYPE html>
<html>
<head>
  <title>Order Confirmation Page - Online Shopping Network</title>
      <meta charset="utf-8">
      <meta name ="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="resources/css/bootstrap.min.css">
      <link rel="stylesheet" href="resources/css/base.css"/>
      <link rel="stylesheet" href="resources/css/orderconfirm.css"/>
      <script src="resources/js/jquery-3.2.1.min.js"></script>
      <script src="resources/js/popper.js"></script>
      <script src="resources/js/bootstrap.min.js"></script>
</head>
<body>
  <#include "Navbar.ftl">
    <div class="container">
      <h2>Thank you for shopping with Online Shopping Network</h2>
      <h5>Your order number is "${orderNumber}". A tracking number will be sent to you once the order ships.</h5>
      <a href="/OnlineShoppingNetwork/home">
		<button class="btn btn-primary">Continue Shopping</button>
      </a>
    </div>
</body>
</html>
