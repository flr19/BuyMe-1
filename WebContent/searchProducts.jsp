<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Products</title>
</head>
<body>
	<h3>Search Watches</h3>
	<form action = 'searchProductsHandler.jsp' method ='post'>
		<input type="text" name="search" placeholder="search watches">
		<button type="submit">Search</button>
	</form>
</body>
</html>