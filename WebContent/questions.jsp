<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Frequently Asked Questions</title>
</head>
<body>

	<div class="content">
		<%
		PreparedStatement ps = null;
		ResultSet rs = null;
		ApplicationDB db = new ApplicationDB();
		Connection conn = db.getConnection();
		try {

			String username = (session.getAttribute("user")).toString();
			String questionsQuery = "SELECT * FROM questions";
			String check = "Awaiting answer from customer representative";

			ps = conn.prepareStatement(questionsQuery);
			rs = ps.executeQuery();

			if (rs.next()) {
		%>
		<h1>Question Results:</h1>
		<p style="font-size: 8pt;">**Please note that all questions may
			not be answered until a customer representative gets a chance to
			answer them**</p>
		<table>
			<tr>
				<th>Question</th>
				<th>Answer</th>
			</tr>
			<%
			do {
			%>
			<tr>
				<td><%=rs.getString("question")%></td>
				<%
				if (check.equals(rs.getString("answer")) && (session.getAttribute("customerrep")) != null) {
				%>
				<form
					action="answersHandler.jsp?questionid=<%=rs.getInt("question_id")%>"
					method="POST">
					<td><textarea type="textarea" name="answer"></textarea> <input
						type="submit" value="answer"></td>
				</form>
				<%
				} else {
				%>
				<td><%=rs.getString("answer")%></td>
				<%
				}
				%>
			</tr>
			<%
			} while (rs.next());
			%>
		</table>
		<%
		} else {
		%>
		<br>
		<h2>No questions have been asked.</h2>
		<%
		}
		%>

		<%
		} catch (SQLException e) {
		out.print("<p>Error connecting to MYSQL server.</p>");
		e.printStackTrace();
		} finally {
		try {
			rs.close();
		} catch (Exception e) {
		}
		try {
			conn.close();
		} catch (Exception e) {
		}
		}
		%>


	</div>
</body>
</html>