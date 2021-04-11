<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ask Question</title>
</head>
<body>
	<div class="frontend">
		<h1>Submit a new question:</h1>
		<form action="questionsHandler.jsp" method="post">
			<textarea style="font-size: 18pt" rows="1" cols="90" maxlength="125"
				name="question"></textarea>
			<br> <input type="submit" value="Submit">
		</form>
	</div>
	<h1>
		<a href="questionSearcher.jsp"> Search for questions</a>
	</h1>
</body>
</html>