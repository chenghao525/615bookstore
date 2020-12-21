<!DOCTYPE html>
<html>
  <head>
    <title>Admin Page - Online Shopping Network</title>
    <meta charset="utf-8">
    <meta name ="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/base.css"/>
    <link rel="stylesheet" href="resources/css/login.css"/>
    <script src="resources/js/jquery-3.2.1.min.js"></script>
    <script src="resources/js/popper.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <style>
      .border {
      display: inline-block;
      width: 1150px;
      height: 20a0px;
      margin: 60px;
      }
    </style>
  </head>
  <body>
    <#include "Navbar.ftl">
      <p>&nbsp;</p>
      <h3>Customer Management:</h3>
      <#if error??>
        <p>Please fill in one of the fields</p>
      </#if>
      <span class="border">
	<div class="container">
	  <h4>Create Customer</h4>
	  <form action="/OnlineShoppingNetwork/admin" method="post">
	  <div class="form-group row">
	    <label for="ffn">Name*:</label>
	    <div class="col-2"><input type="text" class="form-control" name="name1" id="ffn"></div>
	    <label for="percc">Email*:</label>
	    <div class="col-2"><input type="email" class="form-control" name="email1" id="percc"></div>
	    <label for="startt2">Password*:</label>
	    <div class="col-2"><input type="text" class="form-control" name="password1" id="startt2"></div>
	    <label for="sel">Status*(active,waiting):</label>
	    <div class="col-2"><input class="form-control" name="sel1" id="sel"></div>
	  </div>
	  <div class="form-group row">
	    <label for="ad">Shipping Address:</label>
	    <div class="col-2"><input type="text" class="form-control" name="shipping1" id="ad"></div>
<#--	    <label for="pn">Phone #:</label>-->
<#--	    <div class="col-2"><input type="number" class="form-control" name="phone1" id="pn"></div>-->
	    <label for="cn">Card #:</label>
            <div class="col-2"><input type="text" class="form-control" name="card1" id="cn"></div>
            <label for="ba">Billing Address:</label>
            <div class="col-2"><input type="text" class="form-control" name="billing1" id="ba"></div>
	  </div>
	  <div class="form-group row">
            <label for="ct">Card Type: </label>
            <div class="col-2"><input type="text" class="form-control" name="type1" id="ct"></div>
            <label for="ced">Card Expire Date(MM/YY):</label>
            <div class="col-2"><input type="text" class="form-control" name="cardexp1" id="ced"></div>
            <label for="ccv">CCV:</label>
            <div class="col-2"><input type="number" class="form-control" name="ccv1" id="ccv"></div>
	    <div class="form-check form-check-inline">
	      <label class="form-check-label">
		<input type="checkbox" class="form-check-input" name="sub1">Subscribe to Promotion?
	      </label>
	    </div>
	    <button type="submit" class="btn btn-secondary">Confirm Create</button>

          </div>
	</div>
      </span>

      <span class="border">
	<div class="container">
	  <h4>Update Customer</h4>
	  <div class="form-group row">
	    <label for="idl">ID*:</label>
	    <div class="col-2"><input class="form-control" name="cusid1" id="idl"></div>
	    <label for="lln">Name*: </label>
	    <div class="col-3"><input type="text" class="form-control" name="name2" id="lln"></div>
	    <label for="sel2">Status*(active,waiting):</label>
	    <div class="col-2"><input class="form-control" name="sel2" id="sel2"></div>
	  </div>
	  <div class="form-group row">
	    <label for="percc">Email*:</label>
	    <div class="col-2"><input type="text" class="form-control" name="email2" id="percc"></div>
	    <label for="startt1">Password*:</label>
	    <div class="col-2"><input type="text" class="form-control" name="password2" id="startt1"></div>
	    <label for="ad">Shipping Address:</label>
	    <div class="col-2"><input type="text" class="form-control" name="shipping2" id="ad"></div>
<#--	    <label for="pn">Phone #:</label>-->
<#--	    <div class="col-2"><input type="number" class="form-control" name="phone2" id="pn"></div>-->
	  </div>
	  <div class="form-group row">
	    <label for="cn">Card #:</label>
	    <div class="col-2"><input type="text" class="form-control" name="card2" id="cn"></div>
	    <label for="ba">Billing Address:</label>
	    <div class="col-2"><input type="text" class="form-control" name="billing2" id="ba"></div>

	    <label for="ct">Card Type: </label>
	    <div class="col-2"><input type="text" class="form-control" name="type2" id="ct"></div>
	  </div>
	  <div class="form-group row">
	    <label for="ced">Card Expire Date(MM/YY):</label>
	    <div class="col-2"><input type="text" class="form-control" name="cardexp2" id="ced"></div>
	    <label for="ccv">CCV:</label>
	    <div class="col-2"><input type="number" class="form-control" name="ccv2" id="ccv"></div>
	    <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input type="checkbox" class="form-check-input" name="sub2">Subscribe to Promotion?
              </label>
            </div>
	    <button type="submit" class="btn btn-secondary">Confirm Change</button>

	  </div>
	</div>
      </span>



      <span class="border">
	<div class="container">
	  <h4>Delete Customer</h4>
	  <p>&nbsp;</p>
	  <div class="form-group row">
	    <label for="coo">Customer ID:  </label>
	    <div class="col-4"><input class="form-control" name="customerlist" id="coo"></div>
	    <button type="submit" class="btn btn-secondary">Confirm Delete</button>
	  </div>
	</div>
      </span>




      <h3>Item Management:</h3>
      <span class="border">
	<div class="container">
	  <h4>Add Item</h4>
	  <div class="form-group row">
	    <label for="name">Name:</label>
	    <div class="col-2"><input type="text" class="form-control" name="bookname" id="name"></div>
	    <label for="ID">ID: </label>
	    <div class="col-2"><input type="text" class="form-control" name="ID1" id="ID"></div>
	    <label for="category">Category:</label>
	    <div class="col-2"><input type="text" class="form-control" name="category1" id="category"></div>
	    <label for="company">Company:</label>
	    <div class="col-2"><input type="text" class="form-control" name="company1" id="company"></div>
	  </div>
	  <div class="form-group row">
	    <label for="cover">cover:</label>
	    <div class="col-2"><input type="text" class="form-control" name="cover1" id="cover"></div>
	  </div>
	  <div class="form-group row">
	    <label for="threshold">Threshold: </label>
	    <div class="col-2"><input type="text" class="form-control" name="threshold1" id="threshold"></div>
	    <label for="sellingp">Selling Price:</label>
	    <div class="col-1"><input type="text" class="form-control" name="sellingp1" id="sellingp"></div>
	    <label for="bullingp">Inventory Amount:</label>
	    <div class="col-1"><input type="text" class="form-control" name="buyingp1" id="bullingp"></div>
	    <button type="submit" class="btn btn-secondary">Confirm Add</button>

	  </div>
	</div>
      </span>


      <span class="border">
	<div class="container">
	  <h4>Restock Items</h4>
	  <div class="form-group row">
	    <label for="ID2">ID: </label>
	    <div class="col-3"><input class="form-control" name="ID2" id="ID2"></div>
	    <label for="addinv">Add to Inventory</label>
	    <div class="col-1"><input type="text" class="form-control" name="add" id="addinv"></div>
	    <button type="submit" class="btn btn-secondary">Confirm</button>
	  </div>
	</div>
      </span>


      <span class="border">
	<div class="container">
	  <h4>Edit Item</h4>


	  <div class="form-group row">
	    <label for="ID1">ID: </label>
	    <div class="col-3"><input class="form-control" name="ID3" id="ID1"></div>
	    <label for="name">Name:</label>
	    <div class="col-2"><input type="text" class="form-control" name="name2"  id="name"></div>

	    <label for="category">Category:</label>
	    <div class="col-2"><input type="text" class="form-control" name="category2" id="category"></div>
	    <label for="company">Company:</label>
	    <div class="col-2"><input type="text" class="form-control" name="company2" id="company"></div>
	  </div>
	  <div class="form-group row">
	    <label for="cover">cover:</label>
	    <div class="col-2"><input type="text" class="form-control" name="cover2" id="cover"></div>
	  </div>
	  <div class="form-group row">
	    <label for="threshold">Threshold: </label>
	    <div class="col-2"><input type="text" class="form-control" name="threshold2" id="threshold"></div>
	    <label for="sellingp">Selling Price:</label>
	    <div class="col-1"><input type="text" class="form-control" name="sellingp2" id="sellingp"></div>
	    <label for="bullingp">Inventory Amount:</label>
	    <div class="col-1"><input type="text" class="form-control" name="buyingp2" id="bullingp"></div>
	    <button type="submit" class="btn btn-secondary">Confirm Change</button>
	  </div>
	</div>
      </span>

      <span class="border">
	<div class="container">
	  <h4>Delete Item</h4>
	  <p>&nbsp;</p>
	  <div class="form-group row">
	    <label for="coo">ID of Item to delete:  </label>
	    <div class="col-4"><input class="form-control" name="booklist" id="coo"></div>
	    <button type="submit" class="btn btn-secondary">Confirm Delete</button>
	  </div>
	</div>
      </span>

      <h3>Employee Management:</h3>
      <span class="border">
        <div class="container">
	  <h4>Create Employee</h4>
	  <div class="form-group row">
	    <label for="ffn">Name:</label>
	    <div class="col-2"><input type="text" class="form-control" name="name4" id="ffn"></div>
	    <label for="percc">Email:</label>
	    <div class="col-2"><input type="text" class="form-control" name="email4" id="percc"></div>
	    <label for="startt">Password:</label>
	    <div class="col-2"><input type="text" class="form-control" name="password4" id="startt"></div>
	    <label for="type1">Type:</label>
	    <div class="col-2"><input type="text" class="form-control" name="type111" id="111"></div>
	  </div>
	  <div class="form-group row">
	    <label for="ad">Shipping Address*:</label>
	    <div class="col-2"><input type="text" class="form-control" name="shipping4" id="ad"></div>
	    <label for="pn">Phone Number:</label>
	    <div class="col-2"><input type="number" class="form-control" name="phone4" id="pn"></div>
	    <button type="submit" class="btn btn-secondary">Confirm Create</button>

	  </div>
	</div>
      </span>


      <span class="border">
	<div class="container">
	  <h4>Update Employee</h4>
	  <!-- Update Employee -->
	  <div class="form-group row">
	    <label for="coo1">Id:</label>
	    <div class="col-2"><input class="form-control" name="employeeid" id="coo1"></div>

	    <label for="fn">Name:</label>
	    <div class="col-2"><input type="text" class="form-control" name="name5" id="fn"></div>
	    <label for="perc">Email:</label>
	    <div class="col-2"><input type="text" class="form-control" name="email5" id="perc"></div>
	    <label for="start">Password:</label>
	    <div class="col-2"><input type="text" class="form-control" name="password5" id="start"></div>
	  </div>

	  <div class="form-group row">
	    <label for="add">Shipping Address*:</label>
	    <div class="col-2">
              <input type="text" class="form-control" name="shipping5" id="add">
	    </div>
	    <label for="phone">Phone Number:</label>
	    <div class="col-2">
              <input type="number" class="form-control" name="phone5" id="phone">
	    </div>
	    <label for="type222">Type:</label>
	    <div class="col-2"><input class="form-control" name="type222" id="type222"></div>
	    <button type="submit" class="btn btn-secondary">Confirm Change</button>
	  </div>
	</div>
      </span>

      <span class="border">
	<div class="container">
	  <h4>Delete Employee</h4>
	  <p>&nbsp;</p>
	  <div class="form-group row">
	    <label for="coo">Employee List:  </label>
            <div class="col-4"><input class="form-control" name="employeelist" id="coo"></div>
	    <button type="submit" class="btn btn-secondary">Confirm Delete</button>
	  </div>
	</div>
      </span>


      <h3>Promotion Management</h3>

      <span class="border">
	<div class="container">
	  <h4>Create Promotion</h4>
	  <div class="form-group row">
	    <label for="npc">Promotion Code:</label>
	    <div class="col-3"><input type="text" class="form-control" name="code1" id="npc"></div>
	    <label for="val1">Amount off:</label>
	    <div class="col-2"><input type="number" class="form-control" name="val1" id="val1"></div>
	  </div>
	  <div class="form-group row">
	    <label for="ep1">Expiration Date (MM/DD/YYYY): </label>
	    <div class="col-2"><input type="text" class="form-control" name="expire1" id="ep2"></div>
	    <button type="submit" class="btn btn-secondary">Confirm Create</button>

	  </div>
	</div>
      </span>



      <span class="border">
	<div class="container">
	  <h4>Update Promotion</h4>
	  <div class="form-group row">
	    <label for="pl">Enter Promotion Code:  </label>
	    <div class="col-3"><input class="form-control" type="text" name="code2" id="pl"></div>
	    <label for="val2">Amount off:</label>
	    <div class="col-2"><input class="form-control" type="number" name="val2" id="val2"></div>
	  </div>
	  <div class="form-group row">
	    <label for="ep1">New Expiration Date (MM/DD/YYYY): </label>
	    <div class="col-2"><input type="text" class="form-control" name="expire2" id="ep2"></div>
	    <button type="submit" class="btn btn-secondary">Confirm Change</button>

	  </div>
	</div>
      </span>

      <span class="border">
	<div class="container">
	  <h4>Delete Promotion</h4>
	  <p>&nbsp;</p>
	  <div class="form-group row">
	    <label for="co12">Enter Promo Code:</label>
	    <div class="col-4">
	      <input class="form-control" name="codelist" id="co12"></div>
	    <button type="submit" class="btn btn-secondary">Confirm Delete</button>

	  </div>

      </div>

      </span>


	  </div>
      </form>
      </div>

      </span>

  </body>
</html>
