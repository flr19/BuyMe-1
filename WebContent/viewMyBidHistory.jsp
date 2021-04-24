<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Bid History</title>
</head>
<body>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	ResultSet result = null;
	String username = session.getAttribute("user").toString();

	try {
		
		String str = "select * from auction join bid using (auction_id) join product using (product_id) where buyer = '" + username + "'";
;
		result = stmt.executeQuery(str);
		
		out.print("<table>");

		out.print("<tr>");

		out.print("<th>");
		out.print("Auction ID");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Bid ID");
		out.print("</th>");
		out.print("<th>");
		out.print("Category");
		out.print("</th>");
		out.print("<th>");
		out.print("Brand");
		out.print("</th>");
		out.print("<th>");
		out.print("Color");
		out.print("</th>");
		out.print("<th>");
		out.print("Gender");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Bid Amount");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Status of Auction");
		out.print("</th>");

		while (result.next()) {
			out.print("<tr>");

			out.print("<td>");
			out.print(result.getInt("auction_id"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getInt("bid_id"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("category"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("brand"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("color"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("gender"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getFloat("amount"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("status"));
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