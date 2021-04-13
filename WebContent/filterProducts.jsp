<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Filter Items</title>
</head>
<body>
	<b> Search the list of items by various criteria </b>
	<b> Items in * are required </b>
	<form method="post" action="filterProductsHandler.jsp">
	<label for="category">Category</label> <select name="category"
				id="category" required>
				<option value="" disabled selected hidden="true">Select
					category</option>
				<option value="Analog Watches">Analog Watches</option>
				<option value="Digital Watches">Digital Watches</option>
				<option value="Touchscreen Watches">Touchscreen Watches</option>
			</select> <br>
		<table>
				<td>Brand:</td>
				<td><input type="text" name="brand"></td>
			</tr>
			<tr>
				<td>Color:</td>
				<td><input type="text" name="color"></td>
			</tr>
			<tr>
				<td>Gender:</td>
				<td><input type="text" name="gender"></td>
			</tr>
			<tr>
				<td>Seller:</td>
				<td><input type="text" name="seller"></td>
			</tr>
			<tr>
				<td>Price less than:</td>
				<td><input type="text" name="price"></td>
			</tr>
		</table>
		<p>*Close or Open Auctions</p>
		<input type="radio" name="status" value='open' required> Open<br>
		<input type="radio" name="status" value='close'required> Closed <br>
		<input type="submit" value="Search">
	</form>
</body>
</html>