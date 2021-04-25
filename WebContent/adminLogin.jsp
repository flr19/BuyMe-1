<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login Page</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<body>
	<form action="checkAdminLogin.jsp" method="POST">
		Username: <input type="text" name="username" /> <br /> Password: <input
			type="password" name="password" /> <br /> <input type="submit"
			value="Submit" />
	</form>

</body>
</html>