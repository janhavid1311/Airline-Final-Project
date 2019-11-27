
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/mycss.css">


<title>::Bill::</title>




</head>
<body  background="img/air1.png">
<div class="header">
  <h1>HawaiJahaz Airlines</h1>

</div>



<div class="row">


<div class="column side2">
      <center><h3>Passenger Form</h3></center>
	  
	  <hr> <h4>Booking Inforamtion:</h4>
<br>
Booking Id :  ${booking.booking_id} <br>
Date of Journey:${booking.journey_date}<br>
Date of Booking:${booking.booking_date}<br>
<br>
Total Fare: (Rs) ${booking.total_fare}  <br> Total No. of Passenger : ${booking.passenger_count}

<hr> <h4>Passenger Information:</h4>
<br>
<c:forEach items="${booking.passenger}" var="passenger">
Passenger First Name : ${passenger.first_name} <br>
Passenger Last Name : ${passenger.last_name} <br>
Age : ${passenger.age} <br>
Email Id : ${passenger.email} <br>
</c:forEach>

<hr> <h4>Billing Information:</h4>
<br>
Transaction Id : ${booking.payment.payment_id} <br>


	  
</div>
</div>
<div class="footer">
  <p>Airline Reservation</p>
</div>
</body>
</html>