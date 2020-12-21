<!DOCTYPE html>
<html>
<head>
  <title>Business Manager Page - Online Shopping Network</title>
      <meta charset="utf-8">
      <meta name ="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="resources/css/bootstrap.min.css">
      <link rel="stylesheet" href="resources/css/base.css"/>
      <link rel="stylesheet" href="resources/css/login.css"/>
      <script src="resources/js/jquery-3.2.1.min.js"></script>
      <script src="resources/js/popper.js"></script>
      <script src="resources/js/bootstrap.min.js"></script>
      <script src="resources/js/login.js"></script>
</head>

<body>
  <#include "Navbar.ftl">
  Welcome Manager!
    <div class="container">

      <form action="/OnlineShoppingNetwork/report" method="post" class="report">


        <label class ="control-label" for="type"></label>
	       <input class="form-control" name="input" id="input" placeholder = "Enter ISBN or Publisher" >
		<button class="btn btn-primary">Pull Report</button>

	   </form>

    </div>
</body>

</html>

