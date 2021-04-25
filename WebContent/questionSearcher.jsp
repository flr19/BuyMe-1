<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Questions</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<body>
	<a href="askQuestion.jsp">Return to questions dashboard.</a>
	<h3>Search Questions based on Keywords</h3>
	<form>
		<input type="text" name="search" placeholder="question">
		<button type="submit">Search</button>
	</form>

	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String entity = request.getParameter("search");
		String str = "SELECT question,answer FROM questions WHERE question LIKE'%" + entity + "%'";
		ResultSet result = stmt.executeQuery(str);
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>");
		out.print("Question");
		out.print("</td>");
		out.print("<td>");
		out.print("Answer");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Answered By Customer Rep Username");
		out.print("</td>");
		
		out.print("</tr>");

		while (result.next()) {
			out.print("<tr>");

			out.print("<td>");
			out.print(result.getString("question"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getString("answer"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("customerrep_username"));
			out.print("</td>");

			out.print("</tr>");

		}

		out.print("</table>");
		con.close();

	} catch (Exception e) {
	}
	%>

</body>
</html>