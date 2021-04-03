<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Auction</title>
<!-- <link rel="stylesheet" href="style.css?v=1.0" /> -->
</head>
<body>
	<% if(session.getAttribute("user") == null) {
    	 	response.sendRedirect("login.jsp");
        } else { %>
	<%-- <%@ include file="navbar.jsp"%> --%>
	<div class="content">
		<form action="checkCreateAuction.jsp" method="POST">
			<label for="category">Category</label> <select name="category" id="category" required>
				<option value="" disabled selected hidden="true">Select category</option>
				<option value="Analog Watches">Analog Watches</option>
				<option value="Digital Watches">Digital Watches</option>
				<option value="Sandals">Sandals</option>
				<option value="Boots">Boots</option>
			</select> <br>
			<label for="brand">Brand</label>
			<select name="brand" id="brand" required>
				<option value="" disabled selected hidden="true">Select brand</option>
				<option value="Adidas">Adidas</option>
				<option value="ALDO">ALDO</option>
				<option value="Allen Edmonds">Allen Edmonds</option>
				<option value="Asics">Asics</option>
				<option value="Clarks">Clarks</option>
				<option value="Cole Haan">Cole Haan</option>
				<option value="Converse">Converse</option>
				<option value="Dr. Martens">Dr. Martens</option>
				<option value="Ecco">Ecco</option>
				<option value="Florsheim">Florsheim</option>
				<option value="J.Crew">J.Crew</option>
				<option value="Kenneth Cole">Kenneth Cole</option>
				<option value="New Balance">New Balance</option>
				<option value="Nike">Nike</option>
				<option value="Puma">Puma</option>
				<option value="Red Wing">Red Wing</option>
				<option value="Reebok">Reebok</option>
				<option value="Steve Madden">Steve Madden</option>
				<option value="Timberland">Timberland</option>
				<option value="UGG">UGG</option>
				<option value="Vans">Vans</option>
				<option value="Other">Other</option>
			</select> <br> 
			<input type="radio" name="gender" value="Men's" required> Men's <br> 
			<input type="radio" name="gender" value="Women's"> Women's <br> 
			<input type="radio" name="gender" value="Boys'"> Boys' <br> 
			<input type="radio" name="gender" value="Girls'"> Girls' <br>
			<label for="size">Size</label> 
			<select name="size" id="size" required>
				<option value="" disabled selected hidden="true">Select	size</option>
				<option value="4">4</option>
				<option value="4.5">4.5</option>
				<option value="5">5</option>
				<option value="5.5">5.5</option>
				<option value="6">6</option>
				<option value="6.5">6.5</option>
				<option value="7">7</option>
				<option value="7.5">7.5</option>
				<option value="8">8</option>
				<option value="8.5">8.5</option>
				<option value="9">9</option>
				<option value="9.5">9.5</option>
				<option value="10">10</option>
				<option value="10.5">10.5</option>
				<option value="11">11</option>
				<option value="11.5">11.5</option>
				<option value="12">12</option>
				<option value="12.5">12.5</option>
				<option value="13">13</option>
			</select> <br> 
			<label for="model">Model</label>
			<input type="text" name="model" id="model" placeholder="Enter model name" required> <br>
			<label for="color">Color</label>
			<input type="text" name="color" id="color" placeholder="Enter color(s)" required> <br>
			<label for="start_datetime">Start Date and Time</label>
			<input type="datetime-local" name="start_datetime" id="start_datetime" placeholder="mm/dd/yyyy --:-- --" required> <br>
			
			<!-- RESTRICT HOURS TO WHOLE HOURS --> 
			<label for="end_datetime">End Date and Time</label>
			<input type="datetime-local" name="end_datetime" id="end_datetime" placeholder="mm/dd/yyyy --:-- --" required> <br>
			<label for="min_price">Minimum Bid Price (hidden from bidders)</label>
			<input type="number" step="0.01" name="min_price" placeholder="0.00" min="0.00" required> <br>	
			<label for="starting_price">Starting Bid Price</label>
			<input type="number" step="0.01" name="starting_price" placeholder="0.00" min="0.00" required> <br>	
			<input type="submit" value="Submit">
		</form>
	</div>
	<% } %>
</body>
</html>
