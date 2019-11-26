
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
         var fname=document.getElementById('first_name').value;
         var lname=document.getElementById('last_name').value;
         var email=document.getElementById('email_id').value;
         var password=document.getElementById('password').value;
         var dob=document.getElementById('dob').value;
         var contact=document.getElementById('ph_no').value;
        
         var flag = true;
         var fnameregex=/^[A-Za-z]{3,}$/;
         var lnameregex=/^[a-zA-Z ]{3,}$/;
         var contactregex=/^[0-9]{10,10}$/;
         var passwordregex=/^[a-zA-Z0-9$@]{8,}$/; 
         var emailregex=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})$/;
   		 id1.innerHTML='';
         id2.innerHTML='';
         id3.innerHTML='';
         id4.innerHTML='';
         id5.innerHTML='';
         id6.innerHTML='';
       
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

        if(password=='')
         {
            id4.innerHTML='please fill password';
            flag= false;
         }
       
   	 
       else
         if(passwordregex.test(password)==false)
        {
          id4.innerHTML="IMPROPER PASSWORD";
          flag=false;

        } 
      
        if(dob=='')
         {
            id5.innerHTML='please fill DOB';
           flag= false;
         }
        
   	 
        /* else{
         var date1=new Date();
         var date2=new Date(dob);
     /*     if(date1.getFullYear()-date2.getFullYear()<18)
         {   
          id5.innerHTML="AGE SHOULD BE 18 YEARS";
         
          //location.replace()
          flag=false;

        } 
        } */
        //phone
        if(contact=='')
         {
            id6.innerHTML='please fill correct mobile number';
           flag= false;
         }
        
   	 
       else
         if(contactregex.test(contact)==false)
        {
          id6.innerHTML="IMPROPER mobile number";
          flag=false;

        } 
        if(email=='')
        {
           id3.innerHTML='please fill correct email';
          
           flag=false;

        }
        else
            if(emailregex.test(email)==false)
           {
             id3.innerHTML="Incorrect format";
             flag=false;

           } 
        if (!flag) { 
            event.preventDefault();
        }
        else {
        	alert("Successfully Registered. Please Login.")
        }
        return flag;
        

     }
    </script>
    
<title>::User Register::</title>
</head>
<body  background="img/air1.png">
<div class="header">
  <h1>HawaiJahaz Airlines</h1>

</div>

<div class="topnav">
<%@include file="menu.html" %>
</div>

<div class="row">


<div class="column side2">
      <center><h5>Registration For User</h5></center>
	<form id="regForm" modelAttribute="user" action="register.do" method="post" onsubmit="valid()" >
		<table align="center">
			<tr>
			<td>
				<label><b>Title</b></label>
				<select name= "title" id="title">
				<option value= "Mr.">Mr.</option>
				<option value= "Mrs.">Mrs.</option>
				<option value= "Ms.">Ms.</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>FirstName</td>
				<td><input type="text" name="first_name"
						id="first_name" />
						<div id="id1" style="font-style: italic; color: red;"></div>
						</td>
			</tr>
			<tr>
				<td>LastName</td>
				<td><input type="text" name="last_name"
						id="last_name" />
						<div id="id2" style="font-style: italic; color: red;"></div>
						</td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="email" name="email_id" id="email_id"/><div id="id3" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password"
						id="password"/><div id="id4" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td>Date of birth</td>
				<td><input type="date" name="dob" id="dob" ><div id="id5" style="font-style: italic; color: red;"></div></td>
			</tr> 
	 	<tr>
				<td>Gender</td>
				<td><input type="radio" name="gender" id="gender1" value="male" checked/>Male
			   <input type="radio" name="gender" id="gender2" value="female" />Female
			   </td>
			</tr> 
			<tr>
				<td>Phone No.</td>
				<td><input type="text" name="ph_no" id="ph_no" /><div id="id6" style="font-style: italic; color: red;"></div></td>
			</tr>
			 
			<tr>
				<td></td>
				<td><input type="submit"  value="Register"></td>
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