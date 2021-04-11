<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User History Search</title>
</head>
<b> Buyer search</b>
<form method="post" action="viewAuctionsBuyers.jsp">
	<table>

		<tr>
			<td>Username:</td>
			<td><input type="text" name="username"></td>
		</tr>
	</table>
	<input type="submit" value="Search">
</form>
<b> Seller Search</b>
<form method="post" action="viewAuctionsSellers.jsp">
	<table>

		<tr>
			<td>Username:</td>
			<td><input type="text" name="username1"></td>
		</tr>
	</table>
	<input type="submit" value="Search">
</form>

<body>

</body>
</html>