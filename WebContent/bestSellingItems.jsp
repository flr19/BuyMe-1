
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Best Selling Items</title>
</head>
<body>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	PreparedStatement ps = null;
	ResultSet result = null;
	try {

		out.print("<b>Top 5 Selling Items: </b>");

		String str = "SELECT p.product_id, p.category, p.brand, p.color, p.gender, count(*) FROM auction a, product p WHERE a.status='close' and a.current_bid>=a.min_price and a.product_id=p.product_id group by p.product_id order by count(*) desc limit 5";
		result = stmt.executeQuery(str);

		out.print("<table>");
		out.print("<tr>");

		out.print("<th>");
		out.print("Product ID");
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
		out.print("# Sold");
		out.print("</th>");
		out.print("</tr>");

		while (result.next()) {
			out.print("<td>");
			out.print(result.getInt("product_id"));
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
			out.print(result.getInt("count(*)"));
			out.print("</td>");
			out.print("</tr>");
		}
		out.print("</table>");

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