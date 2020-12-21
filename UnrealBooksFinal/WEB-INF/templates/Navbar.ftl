
<nav class="navbar navbar-default">
	<div class="navbar-header">
		<#if user??>
			<a href="/OnlineShoppingNetwork/home">Online Shopping Network</a>
		<#else>
			<a href="/OnlineShoppingNetwork">Online Shopping Network</a>
		</#if>
	</div>
	<div class="nav navbar-nav navabar-right">
		<ul>
			<#if user??>
				<a class="btndropdown-toggle" data-toggle="dropdown">
					${user.getName()}
				</a>
				<div class="dropdown-menu">
					<#if user.getType() == "CUSTOMER">
						<form action="/OnlineShoppingNetwork/profile" method="get">
							<button class="dropdown-item">Profile</button>
						</form>
						<form action="/OnlineShoppingNetwork/orders" method="get">
							<button class="dropdown-item">Orders</button>
						</form>
						<form action="/OnlineShoppingNetwork/cart" method="get">
							<button class="dropdown-item">Shopping Cart</button>
						</form>
					</#if>
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
