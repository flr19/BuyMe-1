<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit User</title>
</head>
<body>
	<%
		try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement st = con.createStatement();
			Statement st2 = con.createStatement();
			ResultSet rs1, rs2;
			String currName = request.getParameter("name");
			String currEmail = request.getParameter("email");
			String name = request.getParameter("oldName");
			String usn = request.getParameter("username");
			String email = request.getParameter("oldEmail");
			PreparedStatement update = con
					.prepareStatement("UPDATE account SET name = ?, email= ? WHERE username = ?");
			if (!currName.equals(name) || !currEmail.equals(email)) {
				update.setString(1, currName);
				update.setString(2, currEmail);
				update.setString(3, usn);
				int res = update.executeUpdate();
				System.out.println(update);
				if (res >= 1) {
					out.println("Changes have been saved.");
					out.println("<a href='customerRepHomepage.jsp'>Return to dashboard.</a>");
				} else {
					out.println("Changes failed.");
					out.println("<a href='customerRepHomepage.jsp'>Return to dashboard.</a>");
				}
			}
		} catch (SQLException se) {
			out.println("Error: Cannot Update <br>");
			out.println("<a href='manageUsers.jsp'>Return to list of users</a>");
			out.println("<a href='customerRepHomepage.jsp'>Return to dashboard.</a>");
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>