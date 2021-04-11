<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Auction</title>
</head>
<body>
	<% 
	session.setAttribute("product_id", request.getParameter("product_id"));
	if(session.getAttribute("user") == null) {
    	 	response.sendRedirect("login.jsp");
        } else {
			 %>
        
	<div class="content">
		<form action="checkCreateAuction.jsp" method="POST">	
	<table>
	 <tr> 
	 <td>
	<input type="text" name="product_id" value = <%=request.getParameter("product_id")%>>
	</td>
	</tr> 
	<tr>    
	<td>End Date: </td><td><input type="text" name="end_datetime" id="end_datetime" placeholder="yyyy-MM-dd hh:mm:ss" required></td>
	</tr> 
	<tr>    
	<td>Minimum Price: </td><td><input type="text" name="min_price" required></td>
	</tr>	
	<tr>    
	<td>Starting Price: </td><td><input type="text" name="starting_price" required></td>
	</tr>	
	</table>
	<input type="submit" value="Create Auction">
	</form>
	</div>
	<% } %>
</body>
</html>
