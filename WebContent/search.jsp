<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BuyMe - Search Results</title>
</head>
<body>
    <% if(session.getAttribute("user") == null) { 
    		response.sendRedirect("login.jsp");
       } else { %>
 --%>    	<div class="content">
    		<h2>Select at least one search parameter</h2>
			<form action="searchHandler.jsp" method="GET">
				<label for="category">Category</label> 
				<select name="category" id="category" required>
				<option value="" disabled selected hidden="true">Select category</option>
				<option value="Analog Watches">Analog Watches</option>
				<option value="Digital Watches">Digital Watches</option>
				<option value="Touchscreen Watches">Touchscreen Watches</option>
			</select> <br>
			<label for="brand">Brand</label>
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

			   <input type="radio" name="gender" value="Men's" id="mens"> 
				<label for="mens">Men's</label> <br> 
				<input type="radio" name="gender" value="Women's" id="womens"> 
				<label for="womens">Women's</label> <br>  -->
				 <br> 
				<label for="color">Color</label>
				<input type="text" name="color" id="color" placeholder="Enter color(s)"> <br>

				<input type="submit" value="Search">
			</form>      
	    </div>
    <% } %>
</body>
</html>