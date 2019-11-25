<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/mycss.css">

<title>Welcome</title>
</head>
<body>
<div class="header">
  <h1>Header</h1>
  
</div>

 <div class="topnav" >
   <%@include file="admin_menu.html" %>
</div>


<div class="container1">

  <h2>Welcome ${name}</h2>
</div>
  


<!-- <div class="column side1">
<div class="top-left">Welcome ${name}</div>
<img src="img/pic1.jpg" height="30%" width="30%">
<img src="img/pic2.jpg" height="30%" width="30%">
<br>
<img src="img/pic3.jpg" height="30%" width="30%">
<img src="img/pic4.jpg" height="30%" width="30%">
</div> -->

<!-- 	<table> -->
<!-- 		<tr> -->
<%-- 			<td>Welcome ${name}</td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 		</tr> -->

<!-- 	</table> -->
		
<!-- </div> -->
<div class="footer">
  <p>Footer</p>
</div>


</body>
</html>