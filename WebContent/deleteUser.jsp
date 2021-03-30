<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Delete User</title>
</head>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsystem", "root", "aDriTa@123");
	Statement st = con.createStatement();
	String usn=request.getParameter("usn");
	int res=st.executeUpdate("DELETE FROM user WHERE username='"+usn+"'");
	if(res>0){
		out.println("User deleted.");
	}
	else{
		out.println("Error deleting user.");
		out.println("<a href='customerRepHomepage.jsp'>Return to dashboard.</a>");
	}
}
catch (SQLException se){
	out.println("Error.");
	out.println("<a href='customerRepHomepage.jsp'>Return to dashboard.</a>");
	se.printStackTrace();
}
catch (Exception e){
	e.printStackTrace();
}
%>
<body>
	<p>User deleted.</p>
	<a href="customerRepHomepage.jsp">Homepage</a>
</body>
</html>