<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bill</title>
</head>
<body>
<h5>Booking Information</h5>
<hr>
Booking Id:${booking.booking_id}
From: ${booking.source}   To: ${booking.destination}   Date of Journey: ${booking.journey_date}
<br>
Total Fare: (Rs.) ${booking.total_fare}     Total No. of Passengers:${booking.passenger_count}


</body>
</html>