<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Delete Customer Rep</title>
</head>
<body>
	<a href="adminPage.jsp">Return to dashboard.</a>
	<h3>Manage Customer Representative Accounts</h3>
	<form>
		<input type="text" name="search" placeholder="username">
		<button type="submit">Search</button>
	</form>
		<%
		try {
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			Statement st = con.createStatement();
			ResultSet result;
			String name = request.getParameter("search");
			if (name != null && name.length() > 0) {
				result = st.executeQuery("SELECT * FROM account WHERE username LIKE'%" + name
				+ "%' AND username IN (SELECT username FROM customerrep)");
			} else {
				result = st.executeQuery("SELECT * FROM account WHERE username IN (SELECT username FROM customerrep)");
			}
			
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>");
			out.print("Username");
			out.print("</td>");
			out.print("<td>");
			out.print("Name");
			out.print("</td>");
			out.print("<td>");
			out.print("Email");
			out.print("</td>");
			out.print("</tr>");
			
			while (result.next()) {
				
				out.print("<tr>");
				out.print("<td>");
				out.print(result.getString("username"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("name"));
				out.print("</td>");

				out.print("<td>");
				out.print(result.getString("email"));
				out.print("</td>");
	

				out.print("<td>");
				out.print("<form action='deleteCustomerRep.jsp' method='post'> <button name = 'username' type = 'submit' value='"
						+ result.getString("username") + "'>Delete Customer Rep</button></form>");
				out.print("</td>");
				

				out.print("</tr>");

		}
			out.print("</table>");
		} catch (SQLException se) {
		se.printStackTrace();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</table>
</body>
</html>
