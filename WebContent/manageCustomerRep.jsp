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
	<table>
		<tr>
			<th>Username</th>
			<th>Full Name</th>
			<th>Email</th>
		</tr>
		<%
		try {
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			Statement st = con.createStatement();
			ResultSet rs;
			String name = request.getParameter("search");
			if (name != null && name.length() > 0) {
				rs = st.executeQuery("SELECT * FROM account WHERE username LIKE'%" + name
				+ "%' AND username IN (SELECT username FROM customerrep)");
			} else {
				rs = st.executeQuery("SELECT * FROM account WHERE username IN (SELECT username FROM customerrep)");
			}
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("username")%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("email")%></td>
			<td>
				<form method="POST">
					<input type="submit" value="Delete"
						onclick="if(confirm('Are you sure? This action cannot be undone.')){form.action='deleteCustomerRep.jsp'}">
					<input type="hidden" name="user"
						value=<%=rs.getString("username")%>>
				</form>
			</td>
		</tr>
		<%
		}
		} catch (SQLException se) {
		se.printStackTrace();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</table>
</body>
</html>
