
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
<body background="img/air1.png">
<div class="header">
  <h1>HawaiJahaz Airlines</h1>

</div>

<div class="topnav">
<%@include file="admin_menu.html" %>
</div>

<div class="row">


<div class="column side2">
 <h3><center>Route Details</center></h3>
<hr size="4" color="gray"/>

<table align="center" border="2">
<tr>
<td>Route Id</td>
<td>Source</td>
<td>Destination</td>
</tr>

    <c:forEach items="${routelist}" var="route">
        <tr>
             <td><c:out value="${route.route_id}"/></td> 
             <td><c:out value="${route.source}"/></td> 
             <td><c:out value="${route.destination}"/></td> 
          
        </tr>
    </c:forEach> 
</table>
</div>
</div>
<div class="footer">
  <p>Airline Reservation</p>
</div>
</body>
</html>