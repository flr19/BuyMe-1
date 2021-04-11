<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Delete Customer Representative</title>
</head>
<body>
	<%
	try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement st = con.createStatement();
		String user = request.getParameter("user");
		int result = st.executeUpdate("DELETE FROM customerrep WHERE username='" + user + "'");
		if (result > 0) {
			out.println("Representative deleted");
			out.println("<a href='adminPage.jsp'>Return to dashboard.</a>");
		}
	} catch (SQLException se) {
		out.println("<a href='adminPage.jsp'>Return to dashboard.</a>");
		se.printStackTrace();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>