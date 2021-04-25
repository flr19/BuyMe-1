<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Earning Per End User</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<body>
	<button onclick="window.location.href='generateSalesReport.jsp';">Return to Generate Sales Report Page</button>

	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	PreparedStatement ps = null;
	ResultSet result = null;
	try {

		out.print("<b>Earning per End-User: </b>");

		String str = "SELECT a.seller, sum(a.current_bid) FROM product p, auction a WHERE p.product_id=a.product_id and a.status = 'close' and a.current_bid >= a.min_price group by a.seller";
		result = stmt.executeQuery(str);
		out.print("<table>");
		out.print("<tr>");
		out.print("<th>");
		out.print("Seller");
		out.print("</th>");

		out.print("<th>");
		out.print("Total Sales");
		out.print("</th>");
		out.print("</tr>");

		while (result.next()) {
			out.print("<td>");
			out.print(result.getString("seller"));
			out.print("</td>");
			out.print("<td>");
			out.print("$" + result.getFloat("sum(a.current_bid)"));
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