<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe - Creating Auction Error</title>
</head>
<body>
	<% if(session.getAttribute("user") == null) {
    	 	response.sendRedirect("login.jsp");
       } else { %>
	    <div class="content">
	    	<h2>Error: Failed to create auction.</h2>
	    	<p>
	    		Be sure to fill out the fields correctly, adhering to the following guidelines: <br>
	    		Minimum Bid Price must be greater than 0 <br>
	    		Start Date must be earlier than the End Date <br>
	    	</p>	    	
	    	<a href="createAuction.jsp">Click here to try again.</a>        
	    </div>
	    
	<% } %>
</body>
</html>
