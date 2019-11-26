<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/mycss.css">
<link rel="img" href="img">

<title>::Cancel Booking::</title>


  <script>

     function valid()
     {
         var b_id=document.getElementById('booking_id').value;
         var email=document.getElementById('email_id').value;
        
         
         var flag = true;
   		 id1.innerHTML='';
         id2.innerHTML='';
       
         if(b_id=='')
         {
            id1.innerHTML='please fill your booking id';
         flag=false;

         }
         
        if(email=='')
        {
           id2.innerHTML='please fill correct email';
          
           flag=false;

        }
        
        if (!flag) { 
            event.preventDefault();
        } 
        else {
        	alert('Booking Cancelled Successfully !!')
        }
        return flag;
        

     }
    </script>
 
</head>
<body background="img/air1.png">
<div class="header">
  <h1>HawaiJahaz Airlines</h1>
</div>

<div class="topnav">
  <%@include file="menu.html" %>
</div>
 
<div class="row">

<div class="column side2">
    <center><h5>Cancel Booking</h5></center>
	<form id="cancelForm" modelAttribute="user" action="cancel_booking.do" method="post" onsubmit="valid()" >
		<table align="center">
			<tr>
			<td>
				<label>Booking ID:</label>
			<input type="text" name="booking_id"
						id="booking_id" /><div id="id1" style="font-style: italic; color: red;"></div>
				</td>
			</tr>
			<tr>
			<td>
				<label>email ID:</label>
			<input type="text" name="email_id"
						id="email_id" /><div id="id2" style="font-style: italic; color: red;"></div>
				</td>
			</tr>
	
				<tr>
				<td><input type="submit"  value="submit"></td>
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
