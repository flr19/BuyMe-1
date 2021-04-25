<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<body>
	<button onclick="window.location.href='homepage.jsp';">Return to Homepage/ landing page</button><br>

	<h2>Admin Page Options</h2>
	<a href="createRepAccount.jsp">Create Customer Representative
		Account</a>
	<br>
	<a href="manageCustomerRep.jsp">Delete Customer Representative
		account</a>
	<br>
	<a href="generateSalesReport.jsp">Generate Sales Report</a>
	<br>

	<a href="logout.jsp">Log out</a>
</body>
</html>