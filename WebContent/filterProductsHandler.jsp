<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<!-- <style>
#buttons{
    display:flex;
}
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}
td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}
tr:nth-child(even) {
    background-color: #dddddd;
}
</style> -->
<meta charset="ISO-8859-1">
<title>search the list of items by various criteria
</title>
</head>
<body>

	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	ResultSet result = null;
	try {
		String categoryv = request.getParameter("category");
		String brandv = request.getParameter("brand");
		String colorv = request.getParameter("color");
		String genderv = request.getParameter("gender");
		String pricev = request.getParameter("price");
		String seller = request.getParameter("seller");
		String str = "Select p.category, p.brand, p.color, p.gender, a.price, a.seller, a.status from product p, auction a WHERE p.product_id = a.product_id and (category ='"
		+ categoryv + "') or (brand ='" + brandv + "') or (color ='" + colorv + "') or  (gender = '" + genderv
		+ "') or (price ='" + pricev + "') ;";
		result = stmt.executeQuery(str);

		out.print("<table>");
		out.print("<tr>");
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
		out.print("Price");
		out.print("</th>");
		out.print("<th>");
		out.print("Seller");
		out.print("</th>");
		out.print("<th>");
		out.print("Status of auction");
		out.print("</th>");

		while (result.next()) {
			out.print("<tr>");
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
			out.print(result.getFloat("price"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getString("seller"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getString("status"));
			out.print("</td>");

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