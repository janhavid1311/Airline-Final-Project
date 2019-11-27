
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
        var arr_time=document.getElementById('arrival_time').value;
        var dep_time=document.getElementById('departure_time').value;
        
        var base_fare_eco=document.getElementById('base_fare_eco').value;
        var base_fare_busi=document.getElementById('base_fare_busi').value;
        var fuel_charge=document.getElementById('fuel_charge').value;
        var dev_fee=document.getElementById('dev_fee').value;
        var sec_fee=document.getElementById('sec_fee').value;

         var flag = true;
         var flight_idregex=/^[F]{1}[0-9]{3}$/;
         var business_seatsregex=/^[0-9]{2,}$/;
         var economy_seatsregex=/^[0-9]{3}$/;
        var route_idregex=/^[R]{1}[0-9]{3}$/;
        
        var base_fare_ecoregex=/^[0-9]{4}$/;
        var base_fare_busiregex=/^[0-9]{4}$/;
        var fuel_chargerregex=/^[0-9]{3}$/;
        var dev_feeregex=/^[0-9]{3}$/;
        var sec_feeregex=/^[0-9]{3}$/;
   		 id1.innerHTML='';
         id2.innerHTML='';
         id3.innerHTML='';
         id4.innerHTML='';
         id5.innerHTML='';
         id6.innerHTML='';
         id7.innerHTML='';
         id8.innerHTML='';
         id9.innerHTML='';
         id10.innerHTML='';
         id11.innerHTML='';
       
         if(route_id=='')
         {
            id4.innerHTML='please fill route_id';
         flag=false;

         }
         
         else
           if(route_idregex.test(route_id)==false)
        {
          id4.innerHTML='incorrect format';
          flag=false;

        } 
         
         if(flight_id=='')
         {
            id1.innerHTML='please fill flight id';
         flag=false;

         }
         
         else
           if(flight_idregex.test(flight_id)==false)
        {
        	   id1.innerHTML='incorrect format';
          flag=false;

        } 


        if(business_seats=='')
         {
        	id2.innerHTML='please fill no. of business class seats';
            flag= false;
         }
       
   	 
       else
         if(business_seatsregex.test(business_seats)==false)
        {
          id2.innerHTML="incorrect format";
          flag=false;

        } 
        
        if(economy_seats=='')
        {
        	id3.innerHTML='please fill no. of economy class seats';
           flag= false;
        }
      
  	 
      else
        if(economy_seatsregex.test(economy_seats)==false)
       {
        	id3.innerHTML="incorrect format";
         flag=false;

       } 
        
        if(arr_time=='')
        {
        	id5.innerHTML="please fill arrival time";
           flag= false;
        }
        
        if(dep_time=='')
        {
        	id6.innerHTML="please fill departure time";
           flag= false;
        }
        
        
        
        
        if(base_fare_eco=='')
        {
        	id7.innerHTML='please fill economy class fare';
           flag= false;
        }
      
  	 
      else
        if(base_fare_ecoregex.test(base_fare_eco)==false)
       {
        	id7.innerHTML="incorrect format";
         flag=false;

       } 
        
        if(base_fare_busi=='')
        {
        	id8.innerHTML='please fill business class fare';
           flag= false;
        }
      
  	 
      else
        if(base_fare_busiregex.test(base_fare_busi)==false)
       {
        	id8.innerHTML="incorrect format";
         flag=false;

       } 
        
        if(fuel_charge=='')
        {
        	id9.innerHTML='please fill fuel charge';
           flag= false;
        }
      
  	 
      else
        if(fuel_chargeregex.test(fuel_charge)==false)
       {
        	id9.innerHTML="incorrect format";
         flag=false;

       } 
        if(sec_fee=='')
        {
        	id10.innerHTML='please fill Security Fee';
           flag= false;
        }
      
  	 
      else
        if(sec_feeregex.test(sec_fee)==false)
       {
        	id10.innerHTML="incorrect format";
         flag=false;

       } 
        
        if(dev_fee=='')
        {
        	id11.innerHTML='please fill Development Fee';
           flag= false;
        }
      
  	 
      else
        if(dev_feeregex.test(dev_fee)==false)
       {
        	id11.innerHTML="incorrect format";
         flag=false;

       } 
       
        if (!flag) { 
            event.preventDefault();
        } else {
        	alert('New Flight added successfully!!!')
        }
        return flag;


     }
    </script>

<title>::Add FLIGHT::</title>
</head>
<body  background="img/air1.png">
<div class="header">
  <h1>HawaiJahaz Airlines</h1>

</div>

<div class="topnav">
<%@include file="admin_menu.html" %>
</div>

<div class="row">


<div class="column side2">
    <center><h3>Add New Flight</h3></center>
	<form id="addFlight" modelAttribute="flt"  action="add_flight.do"	method="post" onsubmit="valid()">
		<table align="center">
			<tr>
				<td>Flight Id: </td>
				<td><input name="flight_id" id="flight_id" ><div id="id1" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td>Arrival Time:</td>
				<td><input type="text" name="arrival_time" id="arrival_time"/><div id="id5" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td>Departure Time:</td>
				<td><input type="text" name="departure_time" id="departure_time" ><div id="id6" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td>No. of Business Class seats</td>
				<td><input type="text" name="business_seats" id="business_seats" ><div id="id2" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td>No. of Economy Business Class seats</td>
				<td><input type="text" name="economy_seats" id="economy_seats" ><div id="id3" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td>Base Fare (Economy Class)</td>
				<td><input type="text" name="base_fare_eco" id="base_fare_eco" ><div id="id7" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td>Base Fare (Business Class)</td>
				<td><input type="text" name="base_fare_busi" id="base_fare_busi" ><div id="id8" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td>Fuel Charge</td>
				<td><input type="text" name="fuel_charge" id="fuel_charge" ><div id="id9" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td>Security Fee</td>
				<td><input type="text" name="sec_fee" id="sec_fee" ><div id="id10" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td>Development Fee</td>
				<td><input type="text" name="dev_fee" id="dev_fee" ><div id="id11" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td>Route Id:</td>
				<td><input type="text" name="route_id" id="route_id" ><div id="id4" style="font-style: italic; color: red;"></div></td>
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