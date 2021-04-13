<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Alerts</title>
</head>
<body>

<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String str = "select * from alerts;";
		ResultSet result = null;
		result = stmt.executeQuery(str);

		out.print("<table>");
		out.print("<tr>");
		out.print("<th>");
		out.print("Alert ID ");
		out.print("</th>");
		out.print("<th>");
		out.print("Alert Message");
		out.print("</th>");
		out.print("<th>");
		out.print("Product ID");
		out.print("</th>");
		out.print("<th>");
		out.print("Auction ID");
		out.print("</th>");
		out.print("</tr>");

		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getInt("alert_id"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("alert_message"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getString("product_id"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getString("auction_id"));
			out.print("</td>");

		/* 	out.print("<td>");
			out.print(result.getString("gender"));
			out.print("</td>"); */

			out.print("</tr>");
		}
		out.print("</table>");

		con.close();

	} catch (Exception e) {
	}
	%>
	
</body>
</html>