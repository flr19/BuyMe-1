<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Watch</title>
</head>
<body>
	<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("login.jsp");
	} else {
	%>

	<div class="content">
		<form action="checkCreateWatch.jsp" method="POST">
			<label for="category">Category</label> <select name="category"
				id="category" required>
				<option value="" disabled selected hidden="true">Select
					category</option>
				<option value="Analog Watches">Analog Watches</option>
				<option value="Digital Watches">Digital Watches</option>
				<option value="Touchscreen Watches">Touchscreen Watches</option>
			</select> <br>
			<table>
				<tr>
					<td>Brand:</td>
					<td><input type="text" name="brand" required></td>
				</tr>
				<tr>
					<td>Color:</td>
					<td><input type="text" name="color" required></td>
				</tr>
				<tr>
					<td>Gender:</td>
					<td><input type="text" name="gender" required></td>
				</tr>
				<tr>
			</table>
			<input type="submit" value="Create Watch">
		</form>
	</div>
	<%
	}
	%>
</body>
</html>
