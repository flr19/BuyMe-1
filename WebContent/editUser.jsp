<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit User</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<body>
	<button onclick="window.location.href='manageUsers.jsp';">Return to Manage Users Page</button>

	<h2>Edit User Details</h2>
	<%
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	PreparedStatement ps = null;
	ResultSet result = null;
	String username = request.getParameter("username");
	String str = "select * from account where username = ?";
	ps = con.prepareStatement(str);
	ps.setString(1, username);
	result = ps.executeQuery();
	result.next();
	String name = result.getString("name");
	String email = result.getString("email");
	
	%>
	<form action="editUserHandler.jsp" method="POST">
		Previous Name: <input type="text" disabled name="oldName" value = <%=name%>>
		 <br>
		Enter New Name: <input type="text" name="newName"><br>
		Previous Email: <input type="text" disabled name="oldEmail" value = <%=email%>>
		Enter New Email: <input type="text" name="newEmail"> <br />  
		Enter New Password: <input type="text" name="newPassword">
		<input type="hidden" name="username" value=<%=username%>>
		<input
			type="submit" value="Save Changes">
	</form>

</body>
</html>