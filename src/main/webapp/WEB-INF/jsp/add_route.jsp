<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
 function valid()
     {
         var route_id=document.getElementById('route_id').value;
         var source=document.getElementById('source').value;
         var destination=document.getElementById('destination').value;
        
         var flag = true;
         var route_idregex=/^[R]{1}[0-9]{3}$/;
         var sourceregex=/^[a-zA-Z ]{3,}$/;
         var destinationregex=/^[a-zA-Z ]{3,}$/;
   		
   		 id1.innerHTML='';
       id2.innerHTML='';
         id3.innerHTML='';
         
       
         if(route_id=='')
         {
            id1.innerHTML='plz fill route_id';
         flag=false;

         }
         
         else
           if(route_idregex.test(route_id)==false)
        {
          id1.innerHTML="incorrect format";
          //location.replace()
          flag=false;

        } 
         
         if(source=='')
         {
            id2.innerHTML='plz fill source';
         flag=false;

         }
         
         else
           if(sourceregex.test(source)==false)
        {
          id2.innerHTML="incorrect format";
          //location.replace()
          flag=false;

        } 


        //password

        if(destination=='')
         {
            id3.innerHTML='plz fill destination';
            flag= false;
         }
       
   	 
       else
         if(destinationregex.test(destination)==false)
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

</head>
<body>
<div class="column side2">
    <center>Add New Route</center>
	<form id="addRoute" modelAttribute="rt"  action="add_route.do"	method="post" onsubmit="valid()">
		<table align="center">
			<tr>
				<td>Route Id: </td>
				<td><input name="route_id" id="route_id"><div id="id1"></div></td>
			</tr>
			<tr>
				<td>Source:</td>
				<td><input type="text" name="source" id="source"><div id="id2"></div></td>
			</tr>
			<tr>
				<td>Destination:</td>
				<td><input type="text" name="destination" id="destination"><div id="id3"></div></td>
			</tr>
			<tr>
				<td></td>
				<td align="left"><input type="submit" id="add" name="add" value="Add"></td>
			</tr>

</body>
</html>