
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/mycss.css">

 
<title>Make Payment</title>

<script>
 function valid()
     {
         var card_number=document.getElementById('card_number').value;
         var cvv=document.getElementById('cvv').value;
         var name=document.getElementById('name').value;
        var exp=document.getElementById('exp').value;
         var flag = true;
         /* var flight_idregex=/^[F]{1}[0-9]{3}$/;
         var business_seatsregex=/^[0-9]{2,}$/;
         var economy_seatsregex=/^[0-9]{3}$/;
        var route_idregex=/^[R]{1}[0-9]{3}$/; */
   		 id1.innerHTML='';
         id2.innerHTML='';
         id3.innerHTML='';
         id4.innerHTML='';
        
         if(card_number=='')
         {
            id1.innerHTML='card number cannot be empty';
         flag=false;

         }
         
        /*  else
           if(route_idregex.test(route_id)==false)
        {
          id4.innerHTML='incorrect format';
          flag=false;

        }  */
         
         if(cvv=='')
         {
            id2.innerHTML='cvv cannot be empty';
         flag=false;

         }
         
         /* else
           if(flight_idregex.test(flight_id)==false)
        {
        	   id1.innerHTML='incorrect format';
          flag=false;

        } 
 */

        if(name=='')
         {
        	id3.innerHTML='name cannot be empty';
            flag= false;
         }
       
   	 /* 
       else
         if(business_seatsregex.test(business_seats)==false)
        {
          id2.innerHTML="incorrect format";
          flag=false;

        }  */
        
        if(exp=='')
        {
        	id4.innerHTML='expiry date cannot be empty';
           flag= false;
        }
      
  	 
      /* else
        if(economy_seatsregex.test(economy_seats)==false)
       {
        	id3.innerHTML="incorrect format";
         flag=false;

       }  */
        
       
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
<div class="row">


<div class="column side2">

<form id="regForm" modelAttribute="user" action="booking4.do" method="post" onsubmit="valid()" >
		<table align="center">
		
		<tr>
				<td>Card</td>
				<td><input type="radio" name="card_type" id="debit" value="debit" checked/>Debit Card
			   <input type="radio" name="card_type" id="credit" value="credit" />Credit Card
			   </td>
			</tr> 
			<tr>
				<td>Card Number</td>
				<td><input type="text" name="card_number"
						id="card_number" />
						<div id="id1" style="font-style: italic; color: red;"></div>
						</td>
			</tr>
			<tr>
				<td>Name of Card Holder</td>
				<td><input type="text" name="name" id="name"/><div id="id3" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td>CVV</td>
				<td><input type="password" name="cvv"
						id="cvv" />
						<div id="id2" style="font-style: italic; color: red;"></div>
						</td>
			</tr>
			
			<tr>
				<td>Expiry Date</td>
				<td><input type="date" name="exp"
						id="exp"/><div id="id4" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit"  value="Make Payment"></td>
			</tr>
			<tr></tr>
			
		</table>
	</form>
</div>
</div>


     <div class="footer">
  <p>Airline Reservation</p>
</div>
</body>
</html>