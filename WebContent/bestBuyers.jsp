
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Best Buyers</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<body>
	<button onclick="window.location.href='generateSalesReport.jsp';">Return to Generate Sales Report Page</button>
<h2>List of Best Buyers</h2>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	PreparedStatement ps = null;
	ResultSet result = null;
	try {

		out.print("<b>Best Buyers</b>");
		out.print("<br/>");
		String str = "SELECT a.winner, sum(a.current_bid) FROM auction a WHERE a.status='close' and a.current_bid>=a.min_price group by a.winner order by a.current_bid desc limit 5";
		result = stmt.executeQuery(str);
		out.print("<table>");
		out.print("<tr>");

		out.print("<th>");
		out.print("Buyer Username");
		out.print("</th>");

		out.print("<th>");
		out.print("Total Bid");
		out.print("</th>");

		out.print("</tr>");
		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("a.winner"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getFloat("sum(a.current_bid)"));
			out.print("</td>");
			
			out.print("</tr>");
			
		}
		out.print("</table>");
		out.print("<br/>");
	} catch (Exception e) {
		out.print(e);
	} finally {
		if (result != null)
			result.close();
		if (ps != null)
			ps.close();
		if (stmt != null)
			stmt.close();
		if (con != null)
			con.close();
	}
	%>


</body>
</html>