<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Rep Account</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<body>
	<button onclick="window.location.href='adminPage.jsp';">Return to Homepage</button>
<h3> Create a New Customer Representative Account</h3>
	<form action="checkCreateRepAccount.jsp" method="POST">
		Enter name: <input type="text" name="name" /> <br /> Enter username:
		<input type="text" name="username" /> <br /> Enter password: <input
			type="password" name="password" /> <br /> Enter address: <input
			type="text" name="address" /> <br /> Enter email: <input
			type="text" name="email" /> <br /> <input type="submit"
			value="Submit" />
	</form>
</body>
</html>