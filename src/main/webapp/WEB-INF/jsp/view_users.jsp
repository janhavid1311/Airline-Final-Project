
<%@page import="com.airline_reservation.model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   <%@include file="admin_menu.html" %>
</div>

<div class="row">
<!-- <div class="column side1">
<img src="img/pic1.jpg" height="30%" width="30%">
<img src="img/pic2.jpg" height="30%" width="30%">
<br>
<img src="img/pic3.jpg" height="30%" width="30%">
<img src="img/pic4.jpg" height="30%" width="30%">
</div> -->

<!-- <div class="column side2"> -->
<h3><center>User Details</center></h3>
<hr size="4" color="gray"/>
<table align="center" border="2">
<tr>
<td>Email Id</td>
<td>Title</td>
<td>First Name</td>
<td>Last Name</td>
<td>Password</td>
<td>Date of birth</td>
<td>Gender</td>
<td>Phone Number</td>
</tr>


    <c:forEach items="${userlist}" var="user">
        <tr>
            <td><c:out value="${user.email_id}"/></td>
            <td><c:out value="${user.title}"/></td>
            <td><c:out value="${user.first_name}"/></td>  
            <td><c:out value="${user.last_name}"/></td>  
            <td><c:out value="${user.password}"/></td>  
            <td><c:out value="${user.dob}"/></td>  
            <td><c:out value="${user.gender}"/></td>  
            <td><c:out value="${user.ph_no}"/></td>  
            
        </tr>
    </c:forEach> 
</table>
</div>
	
</div>
<div class="footer">
  <p>Footer</p>
</div>


</body>
</html>