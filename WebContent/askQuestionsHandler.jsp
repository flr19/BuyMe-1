<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ask Question</title>
</head>
<body>

<%	if (request.getParameter("submit") != null && (request.getParameter("submit")).toString().equals("success")) { %>
			<h1>Your question has been submitted successfully.</h1>
	<%	} %>
	
	<h1><a href="questionSearcher.jsp"> Search for questions</a> </h1>
</body>
</html>