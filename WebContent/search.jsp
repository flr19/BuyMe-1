<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BuyMe - Search Results</title>
<!-- 	<link rel="stylesheet" href="style.css?v=1.0"/> -->
</head>
<body>
    <% if(session.getAttribute("user") == null) { 
    		response.sendRedirect("login.jsp");
       } else { %>
<%--     	<%@ include file="navbar.jsp" %>
 --%>    	<div class="content">
    		<h2>Select at least one search parameter</h2>
			<form action="searchHandler.jsp" method="GET">
				<label for="category">Category</label> <select name="category" id="category">
					<option value="" disabled selected hidden="true">Select category</option>
					<option value="Dress Shoes">Dress Shoes</option>
					<option value="Sneakers">Sneakers</option>
					<option value="Sandals">Sandals</option>
					<option value="Boots">Boots</option>
				</select> <br>

				<label for="brand">Brand</label>
				<select name="brand" id="brand">
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

				<input type="radio" name="gender" value="Men's" id="mens">
				<label for="mens">Men's</label> <br> 
				<input type="radio" name="gender" value="Women's" id="womens"> 
				<label for="womens">Women's</label> <br> 
				<input type="radio" name="gender" value="Boys'" id="boys">
				<label for="boys">Boys'</label> <br> 
				<input type="radio" name="gender" value="Girls'" id="girls">
				<label for="girls">Girls'</label> <br>
				
				<label for="size">Size</label>
				<select name="size" id="size">
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
				<input type="text" name="model" id="model" placeholder="Enter model name"> <br>

				<label for="color">Color</label>
				<input type="text" name="color" id="color" placeholder="Enter color(s)"> <br>

				<input type="submit" value="Search">
			</form>      
	    </div>
    <% } %>
</body>
</html>