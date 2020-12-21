<!DOCTYPE html>
<html>
  <head>
    <title>Shipping Employee Page - Online Shopping Network</title>
    <meta charset="utf-8">
    <meta name ="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/base.css"/>
    <script src="resources/js/jquery-3.2.1.min.js"></script>
    <script src="resources/js/popper.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
  </head>
  <body>
    <nav class="navbar navbar-default">
      <div class="navbar-header">
        <#if user??>
          <a href="/OnlineShoppingNetwork/home">Unreal Books</a>
          <#else>
            <a href="/OnlineShoppingNetwork">Unreal Books</a>
          </#if>
      </div>
      <div class="nav navbar-nav navabar-right">
        <ul>
          <#if user??>
            <a class="btndropdown-toggle" data-toggle="dropdown">
              ${user.getName()}
            </a>
            <div class="dropdown-menu">
              <form action="/OnlineShoppingNetwork/login" method="get">
                <button class="dropdown-item">Log Out</button>
              </form>
            </div>
            <#else>
              <li><a href="/OnlineShoppingNetwork/login">Login</a></li>
              <li><a href="/OnlineShoppingNetwork/signup">Sign Up</a></li>
            </#if>
        </ul>
      </div>
    </nav>

    <div class="container">
      <p>&nbsp;</p>
      <h1>Welcome, Shipment Employee</h1>
      <p>&nbsp;</p>
      <h4>Change order shipping status:</h4>
	<p>&nbsp;</p>
	<form action="/OnlineShoppingNetwork/shipping" method="post">
	  <div class="form-group row">
	    <label for="instuff">Order Number</label>
	    <div class="col-3"><input class="form-control" name="ordernum" id="instuff"></div>
	    <label for="change">Updated Status</label>
	    <div class="col-2">
	      <select class="form-control" name="change" id="change">
		<option>Processing</option>
		<option>Shipped</option>
		<option>Delivered</option>
	      </select>
	    </div>
	  </div>
	  <div class="form-group row">
	    <label for="trac">Tracking number (If shipped):</label>
	    <div class="col-3"><input class="form-control" name="trackingnum" id="trac"></div>
	    <label for="shippingagency">Shipping Agency ID:</label>
	    <div class="col-1"><input class="form-control" name="shippingagency" id="shippingagency"></div>
	    <button type="submit" class="btn btn-secondary">Submit Change</button>
	  </div>
	</form>
      </div>

  </body>
</html>
