<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Delete User</title>
</head>
<%
try {
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	String user = request.getParameter("user");
	int res = st.executeUpdate("DELETE FROM users WHERE username='" + user + "'");
	if (res > 0) {
		out.println("User deleted.");
	} else {
		out.println("Error deleting user.");
		out.println("<a href='customerRepHomepage.jsp'>Return to dashboard.</a>");
	}

} catch (SQLException se) {
	out.println("Error.");
	out.println("<a href='customerRepHomepage.jsp'>Return to dashboard.</a>");
	se.printStackTrace();
} catch (Exception e) {
	e.printStackTrace();
}
%>
<body>
	<p>User deleted.</p>
	<a href="customerRepHomepage.jsp">Homepage</a>
</body>
</html>