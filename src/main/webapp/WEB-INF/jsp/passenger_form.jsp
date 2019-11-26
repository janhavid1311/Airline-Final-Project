
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/mycss.css">


<title>::Passenger Form::</title>

<script>


     function valid()
     {
         var fname=document.getElementById('first_name').value;
         var lname=document.getElementById('last_name').value;
         var age=document.getElementById('age').value;
         var email=document.getElementById('email').value;
        
         var flag = true;
         var fnameregex=/^[A-Za-z]{3,}$/;
         var lnameregex=/^[a-zA-Z ]{3,}$/;
         var ageregex=/^[0-9]{1,3}$/;
         var emailregex=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})$/;
   		 id1.innerHTML='';
         id2.innerHTML='';
         id3.innerHTML='';
         id4.innerHTML='';
       
         if(fname=='')
         {
            id1.innerHTML='please fill your First name';
         flag=false;

         }
         
         else
           if(fnameregex.test(fname)==false)
        {
          id1.innerHTML="name must be in alphabets";
          flag=false;

        } 
         
         if(lname=='')
         {
            id2.innerHTML='please fill your last name';
         flag=false;

         }
         
         else
           if(lnameregex.test(lname)==false)
        {
          id2.innerHTML="name must be in alphabets";
          flag=false;

        } 
         
         if(age=='')
         {
            id3.innerHTML='please fill your age';
         flag=false;

         }
         else
             if(ageregex.test(age)==false)
          {
            id3.innerHTML="age must be in number";
            flag=false;

          } 

       
        if(email=='')
        {
           id4.innerHTML='please fill correct email';
          
           flag=false;

        }
        else
            if(emailregex.test(email)==false)
           {
             id4.innerHTML="Incorrect format";
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
      <center><h5>Passenger Form</h5></center>
	   <form id="passForm"  action="booking3.do" method="post" onsubmit="valid()">
        <table>
        <tr>
        <td>First Name:
          <input type="text"  name="first_name" id="first_name" placeholder="First Name"/><div id="id1" style="color: red"></div></td></tr>
   <tr><td> </td>
          </tr>
         <tr><td>Last Name: <input type="text"  name="last_name"  id="last_name" placeholder="Last Name" /><div id="id2" style="color: red"></div></td></tr>
          <tr> <td></td>
           </tr>
           
           <tr><td>Age: <input  type="text" name="age"  id="age" placeholder="Age"/><div id="id3" style="color: red"></div></td></tr>
         <tr> <td></td>
         
          <tr>
				
				<td>Gender:<input type="radio" name="gender" id="gender1" value="male" checked/>Male
			   <input type="radio" name="gender" id="gender2" value="female" />Female
			   </td>
			</tr> 
         <tr> <td></td>
         
         <tr><td>Email Id:<input  type="text" name="email"  id="email" placeholder="Email Id"/><div id="id4" style="color: red"></div></td></tr>
         <tr> <td></td>
         

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