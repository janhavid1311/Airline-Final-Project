
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/mycss.css">

 
<title>::Booking History::</title>

</head>
<body  background="img/air1.png">
<div class="header">

  <h1>HawaiJahaz Airlines</h1>

</div>

<div class="topnav">
<%@include file="user_menu.html" %>
</div>
<h3><center>Booking History</center></h3>
<div class="row">


<div class="column side2">
 <div>
<hr>
<table align="center" border="2">
<tr>
<td>Booking Id:</td>
<td>Booking Date:</td>
<td>Journey Date:</td>
<td>Class:</td>
<td>No. of Passengers:</td>
</tr>


 <c:forEach items="${booking_list}" var="booking">



        
       <tr>
            <td>${booking[0]}</td>
          <td>${booking[1]}</td>
           <td>${booking[2]}</td> 
            <td>${booking[3]}</td>
         <td>${booking[4]}</td> 
  
          
        </tr>
             
             
          
        </tr>
      
    </c:forEach> 
     
   
   
     </table>
       </div>
       </div>
       </div>
       

     <div class="footer">
  <p>Airline Reservation</p>
</div>
</body>
</html>