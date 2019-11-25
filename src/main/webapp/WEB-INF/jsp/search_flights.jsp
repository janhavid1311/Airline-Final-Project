<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
 function valid()
     {
         var source=document.getElementById('source').value;
         var destination=document.getElementById('destination').value;
         
        
         var flag = true;
         var sourceregex=/^[a-zA-Z ]{3,}$/;
         var destinationregex=/^[a-zA-Z ]{3,}$/;
   		
   		 id1.innerHTML='';
       id2.innerHTML='';
         
         
         if(source=='')
         {
            id1.innerHTML='plz fill source';
         flag=false;

         }
         
         else
           if(sourceregex.test(source)==false)
        {
          id1.innerHTML="incorrect format";
          //location.replace()
          flag=false;

        } 


        //password

        if(destination=='')
         {
            id2.innerHTML='plz fill destination';
            flag= false;
         }
       
   	 
       else
         if(destinationregex.test(destination)==false)
        {
          id2.innerHTML="incorrect format";
          //location.replace()
          flag=false;

        } 
       
         if (!flag) { 
            event.preventDefault();
        } else {
        }
        return flag;

     }
    </script>
</head>
<body>
<center>Search Flights</center>
	<form id="searchFlight" modelAttribute="flt"  action="search_flights.do"	method="post" onsubmit="valid()">
		<table align="center">
			<tr>
				<td>Source: </td>
				<td><input type="text" name="source" id="source" /><div id="id1"></div></td>
			</tr>
			<tr>
				<td>Destination:</td>
				<td><input type="text" name="destination" id="destination"/><div id="id2"></div></td>
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
</tr>


 <c:forEach items="${flightslist}" var="flight">
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
          
        </tr>
    </c:forEach> 
   
    </div>
     </table>
</body>
</html>