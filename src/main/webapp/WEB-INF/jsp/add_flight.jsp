
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/mycss.css">

<script>
 function valid()
     {
         var flight_id=document.getElementById('flight_id').value;
         var business_seats=document.getElementById('business_seats').value;
         var economy_seats=document.getElementById('economy_seats').value;
        var route_id=document.getElementById('route_id').value;
         var flag = true;
         var flight_idregex=/^[F]{1}[0-9]{3}$/;
         var business_seatsregex=/^[0-9]{2,}$/;
         var economy_seatsregex=/^[0-9]{3}$/;
        var route_idregex=/^[R]{1}[0-9]{3}$/;
   		 id1.innerHTML='';
         id2.innerHTML='';
         id3.innerHTML='';
         id4.innerHTML='';
       
         if(route_id=='')
         {
            id4.innerHTML='plz fill route_id';
         flag=false;

         }
         
         else
           if(route_idregex.test(route_id)==false)
        {
          id4.innerHTML='incorrect format';
          //location.replace()
          flag=false;

        } 
         
         if(flight_id=='')
         {
            id1.innerHTML='plz fill flight id';
         flag=false;

         }
         
         else
           if(flight_idregex.test(flight_id)==false)
        {
        	   id1.innerHTML='incorrect format';
          //location.replace()
          flag=false;

        } 


        //password

        if(business_seats=='')
         {
        	id2.innerHTML='plz fill no. of business class seats';
            flag= false;
         }
       
   	 
       else
         if(business_seatsregex.test(business_seats)==false)
        {
          id2.innerHTML="incorrect format";
          //location.replace()
          flag=false;

        } 
        
        if(economy_seats=='')
        {
        	id3.innerHTML='plz fill no. of economy class seats';
           flag= false;
        }
      
  	 
      else
        if(economy_seatsregex.test(economy_seats)==false)
       {
        	id3.innerHTML="incorrect format";
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

<title>Login</title>
</head>
<body  background="img/air1.png">
<div class="header">
  <h1>Hawai Jahaz</h1>

</div>

<div class="topnav">
<%@include file="admin_menu.html" %>
</div>

<div class="row">


<div class="column side2">
    <center>Add New Flight</center>
	<form id="addFlight" modelAttribute="flt"  action="add_flight.do"	method="post" onsubmit="valid()">
		<table align="center">
			<tr>
				<td>Flight Id: </td>
				<td><input name="flight_id" id="flight_id" ><div id="id1"></div></td>
			</tr>
			<tr>
				<td>Arrival Time:</td>
				<td><input type="text" name="arrival_time" id="arrival_time"/></td>
			</tr>
			<tr>
				<td>Departure Time:</td>
				<td><input type="text" name="departure_time" id="departure_time" ></td>
			</tr>
			<tr>
				<td>No. of Business Class seats</td>
				<td><input type="text" name="business_seats" id="business_seats" ><div id="id2"></div></td>
			</tr>
			<tr>
				<td>No. of Economy Business Class seats</td>
				<td><input type="text" name="economy_seats" id="economy_seats" ><div id="id3"></div></td>
			</tr>
			<tr>
				<td>Route Id:</td>
				<td><input type="text" name="route_id" id="route_id" ><div id="id4"></div></td>
			</tr>
			<tr>
				<td></td>
				<td align="left"><input type="submit" id="add" name="add" value="Add"></td>
			</tr>
			</table>
			</form>
</div>
</div>
<div class="footer">
  <p>Airline Reservation</p>
</div>
</body>
</html>