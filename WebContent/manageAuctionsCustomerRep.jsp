<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Browse Auctions Customer Rep</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
			<style>
			body {
			margin: 0;
			}
		</style>
</head>
<body>
	<button onclick="window.location.href='customerRepHomepage.jsp';">Return to Customer Rep Homepage</button>

<h3>View All Auctions</h3>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	ResultSet result = null;

	try {

		String str = "select * from auction join product using (product_id)";
		result = stmt.executeQuery(str);
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
		out.print("Seller");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Price");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Minimum Price");
		out.print("</th>");
		
		out.print("<th>");
		out.print("New Bid Increment");
		out.print("</th>");

		out.print("<th>");
		out.print("Start Date");
		out.print("</th>");

		out.print("<th>");
		out.print("End Date");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Current Bid");
		out.print("</th>");

		out.print("<th>");
		out.print("Winner/ Tentative Winner");
		out.print("</th>");

		out.print("<th>");
		out.print("Status");
		out.print("</th>");

		out.print("<th>");
		out.print("Remove Auction");
		out.print("</th>");
		
		out.print("<th>");
		out.print("Remove Bids");
		out.print("</th>");
		out.print("</tr>");

		while (result.next()) {
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
			out.print(result.getString("seller"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getFloat("price"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getFloat("min_price"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getFloat("new_bid_increment"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getTimestamp("start_date"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getTimestamp("end_date"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getFloat("current_bid"));
			out.print("</td>");

			out.print("<td>");
			String tempwinner = result.getString("winner");
			if (result.wasNull())
		tempwinner = " ";
			out.print(tempwinner);
			out.print("</td>");

			out.print("<th>");
			out.print(result.getString("status"));
			out.print("</th>");

			out.print("<td>");
			out.print("<form action='removeAuction.jsp' method='post'><button name='auction_id' type='submit' value='"
			+ result.getInt("auction_id") + "'>Remove Auction</button></form>");
			out.print("</td>");

			out.print("<td>");
			out.print("<form action='manageBids.jsp' method='post'><button name='auction_id' type='submit' value='"
			+ result.getInt("auction_id") + "'>View Bids</button></form>");
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