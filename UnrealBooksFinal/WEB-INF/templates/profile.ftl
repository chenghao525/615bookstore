<!DOCTYPE html>
<html>
<head>
    <title>Profile Page - Online Shopping Network</title>
    <meta charset="utf-8">
      <meta name ="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="resources/css/bootstrap.min.css">
      <link rel="stylesheet" href="resources/css/base.css"/>
      <link rel="stylesheet" href="resources/css/login.css"/>
      <script src="resources/js/jquery-3.2.1.min.js"></script>
      <script src="resources/js/popper.js"></script>
      <script src="resources/js/login.js"></script>
      <script src="resources/js/bootstrap.min.js"></script>
</head>

<body>
    <nav class="navbar navbar-default">
    <div class="navbar-header">
			<a href="/OnlineShoppingNetwork/home">Unreal Books</a>
	</div>
	<div class="nav navbar-nav navabar-right">
		<ul>
            <a class="btndropdown-toggle" data-toggle="dropdown">
					${user.getName()}
            </a>
                <div class="dropdown-menu">
				    <form action="/OnlineShoppingNetwork/profile" method="get">
							<button class="dropdown-item">Profile</button>
				    </form>
				    <form action="/OnlineShoppingNetwork/orders" method="get">
							<button class="dropdown-item">Orders</button>
				    </form>
				    <form action="/OnlineShoppingNetwork/cart" method="get">
							<button class="dropdown-item">Shopping Cart</button>
				    </form>

				    <form action="/OnlineShoppingNetwork/login" method="get">
						<button class="dropdown-item">Log Out</button>
					</form>
				</div>
        </ul>
	</div>
    </nav>

        <div>
            <span>Welcome ${user.getName()}!</span>

        </div>

        <div class="container">
      </br>


      <form action="/OnlineShoppingNetwork/editConfirm" method="post" class="editConfirm">
        <h4>View/Edit Profile:</h4>
	   <div class="form-group">

      <label class ="control-label" for="email">Status(View only):</label>
	  <input class="form-control" name="status" id="status" readonly="readonly" placeholder= "${user.getStatus()}" >

      <label class ="control-label" for="type">Type(View only):</label>
	  <input class="form-control" name="type" id="type" readonly="readonly" placeholder = "${user.getType()}" >

	  <label class ="control-label" for="email">Email(View only):</label>
	  <input class="form-control" name="email" id="email" readonly="readonly" placeholder= "${user.getEmail()}" >


      <label class="control-label" for="nPass">Edit Password:</label>
	  <input class="form-control" name="nPass" id="nPass" placeholder="Enter the new password" value="">

      <label>  Full Name:  </label>
	  <input class="form-control" name="name" id="name" type="text" value= "${user.getName()}" >

	  <label class="control-label" for="address">Shipping Address:</label>
	  <input class="form-control" name="address" id="address" value= "${user.getAddress()}">

        <#if user.getSubscribed().toString()=="YES">
        <label><input type="checkbox" name="sub" value="true" checked> Subscribe for Promotions</label>
        (Uncheck to unsubscribe)

        <#else>
        <label><input type="checkbox" name="sub" value="true"> Subscribe for Promotions</label>
        (Uncheck to unsubscribe)
        </#if>



	</div>

		<button class="btn btn-primary">Edit</button>

	</form>
    </div>


</body>
</html>
