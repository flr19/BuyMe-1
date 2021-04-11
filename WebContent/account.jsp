<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BuyMe - Account Options</title>
<!--  <link rel="stylesheet" href="style.css?v=1.0"/> -->
</head>
<body>
	<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("login.jsp");
	} else {
	%>
	<div class="content">
		<h1>Account Options</h1>
		<ul>
			<li><a href="filterProducts.jsp">Search Auction</a></li>
			<li><a href="askQuestion.jsp">Ask Question</a></li>
			<li><a href="getAuctions.jsp">View Auctions</a></li>
			<li><a href="sortAuctions.jsp">Sort Auctions</a></li>
			<li><a href="createWatch.jsp">Create a new watch</a></li>
			<li><a href="showAllWatch.jsp">Show Watches</a></li>
		</ul>
	</div>
	<%
	}
	%>
</body>
</html>
