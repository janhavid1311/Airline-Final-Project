
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/mycss.css">


<title>Login</title>
</head>
<body  background="img/air1.png">
<div class="header">
  <h1>Hawai Jahaz</h1>

</div>

<div class="topnav">
<%@include file="user_menu.html" %>
</div>

<div class="row">


<div class="column side2">
      <center>Passenger Form</center>
	   <form id="passForm"  action="booking3.do" method="post" >
        <table>
        <tr>
        <td>
          <input type="text"  name="first_name" id="first_name" placeholder="First Name"  class="input1"/></td></tr>
   <tr><td> <div id="id1" style="color: red"></div></td>
          </tr>
         <tr><td>  <input type="text"  name="last_name"  id="last_name" placeholder="Last Number"  class="input1"/></td></tr>
          <tr> <td><div id="id2" style="color: red"></div></td>
           </tr>
           
           <tr><td> <input  type="text" name="age"  id="age" placeholder="Age"  class="input1"/></td></tr>
         <tr> <td><div id="id3" style="color: red"></div></td>
         
          <tr><td> <input  type="text" name="gender"  id="gender" placeholder="Gender"  class="input1"/></td></tr>
         <tr> <td><div id="id4" style="color: red"></div></td>
         
         <tr><td> <input  type="text" name="email"  id="email" placeholder="Email Id"  class="input1"/></td></tr>
         <tr> <td><div id="id5" style="color: red"></div></td>
         

          <tr><td> <button type="submit" id="add_passenger"  class="btn btn-primary btn-block btn-large">Add Passenger</button></td></tr>
         
          </table>
        </form>
</div>
</div>
<div class="footer">
  <p>Airline Reservation</p>
</div>
</body>
</html>