<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Auction</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<body>  
	<button onclick="window.location.href='account.jsp';">Return to Homepage</button>

<h3> Start an Auction</h3>
	<div class="content">
		<form action="checkCreateAuction.jsp" method="POST">	
	<table>
	 <tr> 
	 <td>
	<input type="hidden" name="product_id" value = <%=request.getParameter("product_id")%>>
	</td>
	</tr> 
	<tr>    
	<td>End Date: <br><p>Enter the end date of the auction in the specified format (yyyy-MM-dd hh:mm:ss)</p> </td><td><input type="text" name="end_datetime" id="end_datetime" placeholder="yyyy-MM-dd hh:mm:ss" required></td>
	</tr> 
	<tr>    
	<td>Secret Minimum Price: <br><p>Enter the minimum price that you want to sell this item for</p><br> <p>Minimum Price has to be greater than 0 </p> </td><td><input type="number" name="min_price" placeholder="0" required></td>
	</tr>	
	<tr>    
	<td>Initial Starting Price: <br><p>Enter the starting price of this auction</p><br> <p> Note: Starting Price has to be less than the minimum price </p> </td><td><input type="number" name="starting_price" placeholder="0" required></td>
	</tr>	
	<tr>    
	<td>New Bid Increment: <br><p>Enter the Bid Increment for the next valid bid</p> </td><td><input type="number" name="new_bid_increment" placeholder="0" required></td>
	</tr>	
	</table>
	<input type="submit" value="Create Auction">
	</form>
	</div>
</body>
</html>
