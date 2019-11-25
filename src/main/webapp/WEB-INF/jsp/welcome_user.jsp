<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/mycss.css">

<title>Welcome</title>
</head>
<body  background="img/air1.png">
<div class="header">
  <h1>Header</h1>

</div>

 <div class="topnav">
   <%@include file="user_menu.html" %>
</div>
 
<div class="row">


<div class="column side2">
	<table>
		<tr>
			<td>Welcome ${first_name}</td>
		</tr>
		<tr>
		</tr>
		<tr>
		</tr>

	</table>
	</div>
	
</div>
<div class="footer">
  <p>Airline Reservation</p>
</div>


</body>
</html>