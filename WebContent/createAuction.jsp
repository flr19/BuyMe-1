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
	<% if(session.getAttribute("user") == null) {
    	 	response.sendRedirect("login.jsp");
        } else { %>
        
	<div class="content">
		<form action="checkCreateAuction.jsp" method="POST">
			<label for="category">Category</label> 
			<select name="category" id="category" required>
				<option value="" disabled selected hidden="true">Select category</option>
				<option value="Analog Watches">Analog Watches</option>
				<option value="Digital Watches">Digital Watches</option>
				<option value="Touchscreen Watches">Touchscreen Watches</option>
			</select> <br>
			<!-- <label for="brand">Brand</label>
			<select name="brand" id="brand" required>
				<option value="" disabled selected hidden="true">Select brand</option>
				<option value="Rolex">Rolex</option>
				<option value="Apple">Apple</option>
				<option value="Seiko">Seiko</option>
				<option value="Patek Philippe">Patek Philippe</option>
				<option value="Chopard">Chopard</option>
				<option value="Cartier">Cartier</option>
				<option value="Fossil">Fossil</option>
				<option value="Fitbit">Fitbit</option>
				<option value="Movado">Movado</option>
				<option value="Other">Other</option>
			</select> <br> 
			<input type="radio" name="gender" value="Men's" required> Men's <br> 
			<input type="radio" name="gender" value="Women's"> Women's <br> 
			<label for="size">Size</label> 
			<br> 
			<label for="color">Color</label>
			<input type="text" name="color" id="color" placeholder="Enter color(s)" required> <br>
			<label for="start_datetime">Start Date and Time</label>
			<input type="datetime-local" name="start_datetime" id="start_datetime" placeholder="mm/dd/yyyy --:-- --" required> <br>
			
			RESTRICT HOURS TO WHOLE HOURS 
			<label for="end_datetime">End Date and Time</label>
			<input type="datetime-local" name="end_datetime" id="end_datetime" placeholder="mm/dd/yyyy --:-- --" required> <br>
			<label for="min_price">Minimum Bid Price</label>
			<input type="number" step="0.01" name="min_price" placeholder="0.00" min="0.00" required> <br>	
			<label for="starting_price">Starting Bid Price</label>
			<input type="number" step="0.01" name="starting_price" placeholder="0.00" min="0.00" required> <br>	
			<input type="submit" value="Submit"> -->
			
			
		
	<table>
	<tr>    
	<td>Brand: </td><td><input type="text" name="brand" required></td>
	</tr>
	<tr>    
	<td>Gender: </td><td><input type="text" name="gender" required></td>
	</tr>
	<tr>    
	<td>Color: </td><td><input type="text" name="color" required></td>
	</tr>
	<tr> 
	<td>Start Date: </td><td><input type="datetime-local" name="start_datetime" id="start_datetime" placeholder="mm/dd/yyyy --:-- --" required></td>
	</tr>
	<tr>    
	<td>End Date: </td><td><input type="datetime-local" name="end_datetime" id="end_datetime" placeholder="mm/dd/yyyy --:-- --" required></td>
	</tr> 
	<tr>    
	<td>Minimum Price: </td><td><input type="text" name="min_price"  placeholder="0.00" min="0.00" required></td>
	</tr>	
	<tr>    
	<td>Starting Price: </td><td><input type="text" name="starting_price" placeholder="0.00" min="0.00" required></td>
	</tr>	
	</table>
	<input type="submit" value="Create Auction">
		</form>
	</div>
	<% } %>
</body>
</html>
