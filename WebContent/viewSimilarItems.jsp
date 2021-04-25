<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>View Similar Items</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
<body>
	<button onclick="window.location.href='sortAuctions.jsp';">Return to Auctions Page</button>
<h2>View Similar Items</h2>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	PreparedStatement ps = null;
	ResultSet result = null;
	String user = session.getAttribute("user").toString();
	int auction_id = Integer.parseInt(request.getParameter("auction_id"));
	String str = "SELECT * FROM auction a, product p WHERE a.product_id=p.product_id and a.auction_id=" + auction_id;
	result = stmt.executeQuery(str);
	result.next();

	String category = result.getString("category");
	String brand = result.getString("brand");
	String color = result.getString("color");
	String gender = result.getString("gender");
	java.sql.Timestamp start_date = result.getTimestamp("start_date");
	java.sql.Timestamp end_date = result.getTimestamp("end_date");

	str = "SELECT * FROM auction a, product p WHERE a.product_id=p.product_id and (p.color='" + color + "' or p.gender='"
			+ gender + "' or p.category='" + category + "' or p.brand='" + brand
			+ "') and a.start_date >= DATE_ADD(NOW(), INTERVAL -1 MONTH)";
	Statement stmt1 = con.createStatement();
	result = stmt1.executeQuery(str);

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
	out.print("Current Bid");
	out.print("</th>");
	

	out.print("<th>");
	out.print("Price");
	out.print("</th>");
	
	out.print("<th>");
	out.print("New Bid Increment");
	out.print("</th>");

	out.print("<th>");
	out.print("End Time");
	out.print("</th>");

	out.print("<th>");
	out.print("Status");
	out.print("</th>");

	out.print("<th>");
	out.print(" ");
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
		out.print(result.getFloat("current_bid"));
		out.print("</td>");

		out.print("<td>");
		out.print("$" + result.getFloat("price"));
		out.print("</td>");
		
		out.print("<td>");
		out.print("$" + result.getFloat("new_bid_increment"));
		out.print("</td>");

		out.print("<td>");
		out.print(result.getString("end_date"));
		out.print("</td>");

		out.print("<td>");
		String status = result.getString("status");
		out.print(result.getString("status"));
		out.print("</td>");
		
		String status1= result.getString("status");
		if (!status1.equals("close") && result.getString("seller").equalsIgnoreCase(user) == false) {
			out.print("<td>");
			out.print("<form action='bidOnItem.jsp' method='post'><button name='auction_id' type='submit' value='"
					+ result.getInt("auction_id") + "'> Bid on Item </button></form>");
			out.print("</td>");
				}
		
		out.print("</tr>");
	}
	out.print("</table>");
	%>

</body>
</html>