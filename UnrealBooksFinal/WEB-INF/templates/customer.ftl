<!DOCTYPE html>
<html>
<head>
  <title>Home - Unreal Bookstore</title>
      <meta charset="utf-8">
      <meta name ="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="resources/css/bootstrap.min.css">
      <link rel="stylesheet" href="resources/css/base.css"/>
      <link rel="stylesheet" href="resources/css/customer.css"/>
      <script src="resources/js/jquery-3.2.1.min.js"></script>
      <script src="resources/js/popper.js"></script>
      <script src="resources/js/bootstrap.min.js"></script>
      <script src="resources/js/login.js"></script>
</head>
<body>
  <#include "Navbar.ftl">

   <div id="books">
	<h2 id="welcome">Find Best Deals of the Best Quality Items</h2>
	<form action="/OnlineShoppingNetwork/search" method="post" class="searchbar">
		<input name="input" type="text"/>
		<button class="btn btn-primary">Search</button>
	</form>
  <br>
  <div class="container">
      <div class="smallcontainer" style="max-width:400px !important;">
          <img src="https://i.ibb.co/LYRRZyY/bookcover.jpg" alt="Kit">
          <form method="post" action="/OnlineShoppingNetwork/search?input=Book"><button class="btn">Books</button></form>
      </div>
<#--  <table class="items">-->

<#--      <tr>-->
<#--          <td>-->
<#--              <div class="smallcontainer">-->
<#--                  <img src="https://i.ibb.co/LYRRZyY/bookcover.jpg" alt="Kit">-->
<#--                  <form method="post" action="/OnlineShoppingNetwork/search?input=all"><button class="btn">Books</button></form>-->
<#--              </div>-->
<#--          </td>-->
<#--          <td>-->
<#--              <div class="smallcontainer">-->
<#--                  <img src="https://i.ibb.co/6w3cCYw/coming.jpg" alt="Fur">-->
<#--                  <form method="post" action="/OnlineShoppingNetwork/search?input=Furniture"><button class="btn" disabled>Furniture</button></form></div>-->
<#--          </td>-->
<#--      </tr>-->
<#--      <tr>-->
<#--          <td>-->
<#--              <div class="smallcontainer">-->
<#--                  <img src="https://i.ibb.co/6w3cCYw/coming.jpg" alt="Bath">-->
<#--                  <form method="post" action="/OnlineShoppingNetwork/search?input=Bath"><button class="btn" disabled>Bath</button></form></div>-->
<#--          </td>-->
<#--          <td>-->
<#--              <div class="smallcontainer">-->
<#--                  <img src="https://i.ibb.co/6w3cCYw/coming.jpg" alt="Bed">-->
<#--                  <form method="post" action="/OnlineShoppingNetwork/search?input=Bedding"><button class="btn" disabled>Bedding</button></form></div>-->
<#--          </td>-->
<#--      </tr>-->
<#--  </table>-->
  </div>
</div>
</body>
</html>
