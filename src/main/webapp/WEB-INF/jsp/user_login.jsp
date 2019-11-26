
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
         var email=document.getElementById('email_id').value;
         var password=document.getElementById('password').value;
        
         var flag = true;
        
   		 id1.innerHTML='';
         id2.innerHTML='';
         

        if(password=='')
         {
            id2.innerHTML='plz fill password';
            flag= false;
         }
       
   	 
        if(email=='')
        {
           id1.innerHTML='plz fill correct email';
          
           flag=false;

        }
       
        if (!flag) { 
            event.preventDefault();
        } else {
        	
        }      
        return flag;
        

     }
    </script>

<title>::User Login::</title>
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
    <center><h3>Login For User</h3></center>
	<form id="userloginForm" modelAttribute="usr"  action="user_login.do"	method="post"  onsubmit="valid()" >
		<table align="center">
			<tr>
				<td>Email Id: </td>
				<td><input name="email_id" id="email_id" /><div id="id1" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" id="password" /><div id="id2" style="font-style: italic; color: red;"></div></td>
			</tr>
			<tr>
				<td></td>
				<td align="left"><input type="submit" id="login" name="login" value="Login"></td>
			</tr>

			
		</table>
	</form>
	<table align="center">
		<tr>
			<td style="font-style: italic; color: red;">${message}</td>
		</tr>
	</table>
</div>
</div>
<div class="footer">
  <p>Airline Reservation</p>
</div>
</body>
</html>