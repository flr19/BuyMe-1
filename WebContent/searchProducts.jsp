<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Products</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<body>
	<button onclick="window.location.href='account.jsp';">Return to home dashboard</button>

	<h3>Search Watches Based on  Keywords</h3>
	<form action = 'searchProductsHandler.jsp' method ='post'>
		<input type="text" name="search" placeholder="search watches">
		<button type="submit">Search</button>
	</form>
</body>
</html>