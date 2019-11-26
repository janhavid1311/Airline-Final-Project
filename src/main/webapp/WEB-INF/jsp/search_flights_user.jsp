
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/mycss.css">

 
<title>Search Flights</title>
<script>
 function valid()
     {
         var source=document.getElementById('source').value;
         var destination=document.getElementById('destination').value;
         var journey_date=document.getElementById('journey_date').value;
        
         var flag = true;
         var sourceregex=/^[a-zA-Z ]{3,}$/;
         var destinationregex=/^[a-zA-Z ]{3,}$/;
   		
   		 id1.innerHTML='';
       id2.innerHTML='';
       id3.innerHTML='';
         
         if(source=='')
         {
            id1.innerHTML='please fill source';
         flag=false;

         }
         
         else
           if(sourceregex.test(source)==false)
        {
          id1.innerHTML="incorrect format";
          flag=false;

        } 

        if(destination=='')
         {
            id2.innerHTML='please fill destination';
            flag= false;
         }
       
   	 
       else
         if(destinationregex.test(destination)==false)
        {
          id2.innerHTML="incorrect format";
          flag=false;

        } 
        
        if(journey_date=='')
        {
           id3.innerHTML='please fill journey_date';
        flag=false;

        }
        
       
         if (!flag) { 
            event.preventDefault();
        } 
         else {
        }
        return flag;

     }
    </script>
</head>
<body  background="img/air1.png">
<div class="header">
  <h1>HawaiJahaz Airlines</h1>

</div>

<div class="topnav">
<%@include file="user_menu.html" %>
</div>

<div class="row">


<div class="column side2">
<center><h3>Search Flights</h3></center>
	<form id="searchFlights" modelAttribute="flt1"  action="search_flights_user.do"	method="post" onsubmit="valid()">
		<table align="center">
			<tr>
				<td>Source: </td>
				<td><input type="text" name="source" id="source" /><div id="id1" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td>Destination:</td>
				<td><input type="text" name="destination" id="destination"/><div id="id2" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td>Journey Date:</td>
				<td><input type="date" name="journey_date" id="journey_date"/><div id="id3" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td>Class:</td>
				<td><input type="radio" name="class" id="class1" value="economy" checked/>Economy
			   <input type="radio" name="class" id=class2 value="business" />Business
			   </td>
			</tr> 
			<tr>
			<td>
				<label>No. of Passengers:</label> <input type="text" name="passenger_count">
				<select name= "noOfPsg" id="title">
				<option value= "1">1</option>
				<option value= "2">2</option>
				<option value= "3">3</option>
				<option value= "4">4</option>
				<option value= "5">5</option>
				<option value= "6">6</option>
				<option value= "7">7</option>
				<option value= "8">8</option>
				<option value= "9">9</option>
				</select>
				</td>
			</tr>
			<tr>
				<td></td>
				<td align="left"><input type="submit" id="search" name="search" value="Search"></td>
			</tr>
</form>
<hr>
<table align="center" border="2">
<tr>
<td>Flight Id</td>
<td>Arrival Time</td>
<td>Departure Time</td>
<td>No. of Business class seats</td>
<td>No. of Economy class seats</td>
<td>Route Id</td>
<td>Source</td>
<td>Destination</td>
<td>Fare</td>
</tr>


 <c:forEach items="${flights_list}" var="flight">
 <form action="booking2.do" method="post">
 <input type="hidden" name="flight_id" value="${flight.flight_id}"/>
 <input type="hidden" name="base_fare_eco" value="${flight.base_fare_eco}"/>
 
 <div>

        <tr>
            <td><c:out value="${flight.flight_id}"/></td>
            <td><c:out value="${flight.arrival_time}"/></td>
            <td><c:out value="${flight.departure_time}"/></td>  
            <td><c:out value="${flight.business_seats}"/></td>  
            <td><c:out value="${flight.economy_seats}"/></td>  
             <td><c:out value="${flight.route.route_id}"/></td> 
             <td><c:out value="${flight.route.source}"/></td> 
             <td><c:out value="${flight.route.destination}"/></td> 
             <td><c:out value="${flight.base_fare_eco}"/></td>
             <td><input type="submit" value="Book"> </td>
             
        </tr>
         </div>
  </form>



        
    </c:forEach> 
   
    </div>
     </table>
     <div class="footer">
  <p>Airline Reservation</p>
</div>
</body>
</html>