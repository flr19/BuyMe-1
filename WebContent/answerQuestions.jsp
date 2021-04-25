<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Answers Questions</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<html>
<body>
	<button onclick="window.location.href='customerRepHomepage.jsp';">Return to homepage</button>

<h2>View Questions</h2>
<p> Answer any unanswered questions</p>

	<%
	PreparedStatement ps = null;
	ResultSet result = null;
	ApplicationDB db = new ApplicationDB();
	Connection conn = db.getConnection();
	try {

		String username = (session.getAttribute("user")).toString();
		String questionsQuery = "SELECT * FROM questions";
		String check = "Customer rep hasn't answered yet";

		ps = conn.prepareStatement(questionsQuery);
		result = ps.executeQuery();
		out.print("<table>");
		out.print("<tr>");
		out.print("<th>");
		out.print("Question ID");
		out.print("</th>");
		out.print("<th>");
		out.print("Question");
		out.print("</th>");
		out.print("<th>");
		out.print("Answer");
		out.print("</th>");

		out.print("<th>");
		out.print("Answered By Customer Rep Username");
		out.print("</th>");

		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getInt("question_id"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getString("question"));
			out.print("</td>");

			if (result.getString("answer").equals("Customer rep hasn't answered yet")) {
	%>

	<form
		action="answersHandler.jsp?question_id=<%=result.getInt("question_id")%>"
		method="POST">
		<td><textarea type="textarea" name="answer"></textarea> <input
			type="submit" value="answer"></td>
	</form>
	<%
	} else {

	out.print("<td>");
	out.print(result.getString("answer"));
	out.print("</td>");

	out.print("<td>");
	out.print(result.getString("customerrep_username"));
	out.print("</td>");
	}
	}
	out.print("</tr>");

	out.print("</table>");

	} catch (SQLException e) {
	out.print("<p>Error</p>");
	e.printStackTrace();
	} finally {
	try {
	result.close();
	} catch (Exception e) {
	}
	try {
	conn.close();
	} catch (Exception e) {
	}
	}
	%>

</body>
</html>