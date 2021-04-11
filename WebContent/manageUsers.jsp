<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Manage Users</title>
</head>
<body>
	<a href="customerRepHomepage.jsp">Return to dashboard.</a>
	<h3>Manage Customer Accounts</h3>
	<form>
		<input type="text" name="search" placeholder="username">
		<button type="submit">Search</button>
	</form>

	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String entity = request.getParameter("search");
		String str = "SELECT * FROM account WHERE username LIKE'%" + entity
		+ "%' AND username NOT IN (SELECT username FROM admin) AND username NOT IN(SELECT username FROM customerrep)";
		ResultSet rs = stmt.executeQuery(str);

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
		while (rs.next()) {
	%>
	<%-- 	<tr>
		<td><%=rs.getString("username")%></td>
		<td><%=rs.getString("name")%></td>
		<td><%=rs.getString("email")%></td>
		<td>
			<form action="editUser.jsp" method="POST">
				<input type="submit" value="Edit"> <input type="hidden"
					value=<%=rs.getString("username")%> name="username"> <input
					type="hidden" value=<%=rs.getString("name")%> name="name">
				<input type="hidden" value=<%=rs.getString("email")%> name="email">
			</form>
		</td>
		<td>
			<form method="POST">
				<input type="submit" value="Delete"
					onclick="if(confirm('Are you sure? This action cannot be undone.')){form.action='deleteUser.jsp'}">
				<input type="hidden" name="usn" value=<%=rs.getString("username")%>>
			</form>
		</td>

	</tr> --%>
	<%
	}

	out.print("</table>");
	con.close();

	} catch (Exception e) {
	}
	%>

</body>
</html>