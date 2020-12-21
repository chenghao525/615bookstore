<!DOCTYPE html>
<html>
<head>
  <title>Business Manager Page - Online Shopping Network</title>
      <meta charset="utf-8">
      <meta name ="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="resources/css/bootstrap.min.css">
      <link rel="stylesheet" href="resources/css/base.css"/>
      <link rel="stylesheet" href="resources/css/.css"/>
      <script src="resources/js/jquery-3.2.1.min.js"></script>
      <script src="resources/js/popper.js"></script>
      <script src="resources/js/bootstrap.min.js"></script>
      <script src="resources/js/login.js"></script>
</head>

<body>
  <#include "Navbar.ftl">
  Report:
    <div class="container">

    Total Sales: ${revenue} dollars<br/>



<#if bookList??>
Low inventory notice:
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Quantity</th>
        <th>Threshold</th>
      </tr>
    </thead>
    <tbody>
		<#list bookList as book>
			<tr>
				<td>${book.getID()}</td>
				<td>${book.getName()}</td>
				<td>${book.getInventory_amt()}</td>
        <td>${book.getThreshold()}</td>
			</tr>
		</#list>
    </tbody>
  </table>

  <#else>No low-inventory notice now.
  </#if>

  <#if sales!=0>
  Sales for ${input}: ${sales} dollars.  <br/>
  <#else>
  No Sales Record Found.
  </#if>



    </div>
</body>

</html>

