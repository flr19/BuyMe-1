<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>View Auctions By Users</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<body>
	<button onclick="window.location.href='account.jsp';">Return to Account Page</button>
<h2> View Auctions that Other Users have participated in</h2>
<p> The auctions he has either created or bid on</p>"
	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	ResultSet result = null;

	try {

		String username = request.getParameter("username");
		String str = "select auction_id, seller from auction where seller ='" + username + "'"+ "UNION select auction_id, buyer from bid where buyer = '"+username+"'";
;
		result = stmt.executeQuery(str);
		
		out.print("<table>");

		out.print("<tr>");
		out.print("<th>");
		out.print("Username");
		out.print("</th>");

		out.print("<th>");
		out.print("Auction ID");
		out.print("</th>");

		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(username);
			out.print("</td>");

			out.print("<td>");
			out.print(result.getInt("auction_id"));
			out.print("</td>");

			out.print("</tr>");
		}

		out.print("</table>");

	}

	catch (Exception e) {
		out.print(e);
	} finally {
		if (result != null)
			result.close();
		if (stmt != null)
			stmt.close();
		if (con != null)
			con.close();
	}
	%>

</body>
</html>
