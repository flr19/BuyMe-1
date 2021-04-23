<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Auctions</title>
</head>
<body>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	String seller = session.getAttribute("user").toString();
	ResultSet result = null;
	try {
		String str = "select * from auction a join product using (product_id) where a.seller = ? order by (auction_id) ";
		PreparedStatement ps = con.prepareStatement(str);
		ps.setString(1, seller);
		result = ps.executeQuery();
			
		out.print("<table>");
		out.print("<tr>");
		out.print("<th>");
		out.print("Auction ID ");
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
		out.print("Current Bid");
		out.print("</th>");

		out.print("<th>");
		out.print("Price");
		out.print("</th>");

		out.print("<th>");
		out.print("End Time");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Winner");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Status");
		out.print("</th>");
	
	
		while (result.next()) {
			String status1 = result.getString("status");

			out.print("<tr>");
			out.print("<td>");
			out.print(result.getInt("auction_id"));
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
			out.print(result.getFloat("current_bid"));
			out.print("</td>");

			out.print("<td>");
			out.print("$" + result.getFloat("price"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getTimestamp("end_date"));
			out.print("</td>");

		
			if (status1.equals("close")) {
		out.print("<td>");
		out.print(result.getString("winner"));
		out.print("</td>");
			}
			else
			{
				out.print("<td>");
				out.print(" ");
				out.print("</td>");
			}

			out.print("<td>");
			out.print(result.getString("status"));
			out.print("</td>");

			out.print("</tr>");
		}
		out.print("</table>");
	} catch (Exception e) {
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

