<%@page import="com.airline_reservation.model.Booking"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div>
<hr>
<table align="center" border="2">
<tr>
<td>Booking Id</td>
<td>Booking Date</td>
<td>Journey Date</td>
<td>Class</td>
<td>No. of Passengers</td>
</tr>


 <c:forEach items="${booking_list}" var="booking">


        <tr>
            <td><c:out value="${booking.booking_id}"/></td>
            <td><c:out value="${booking.booking_date}"/></td>
            <td><c:out value="${booking.journey_date}"/></td>  
            <td><c:out value="${booking.b_class}"/></td>  
            <td><c:out value="${booking.passenger_count}"/></td>  
            
             
          
        </tr>
      
    </c:forEach> 
     
   
   
     </table>
       </div>
</body>
</html>