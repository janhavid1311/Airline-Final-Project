<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
function valid()
{
    var flight_id=document.getElementById('flight_id').value;
    var flag = true;
    var flight_idregex=/^[F]{1}[0-9]{3}$/;
    id1.innerHTML='';
if(flight_id=='')
         {
            id1.innerHTML='plz fill flight id';
         flag=false;

         }
         
         else
           if(flight_idregex.test(flight_id)==false)
        {
        	   id1.innerHTML="incorrect format";
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
<div class="column side2">
    <center>Delete Flight</center>
	<form id="deleteFlt" modelAttribute="dflt"  action="delete_flight.do"	method="post" onsubmit="valid()">
		<table align="center">
			<tr>
				<td>Flight Id: </td>
				<td><input name="flight_id" id="flight_id" ><div id="id1"></div></td>
			</tr>
				<td></td>
				<td align="left"><input type="submit" id="delete" name="delete" value="Delete"></td>
			</tr>

</body>
</html>