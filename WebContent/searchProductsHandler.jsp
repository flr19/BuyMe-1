<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Products</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<body>
	<button onclick="window.location.href='searchProducts.jsp';">Return to Search Products Page</button>
<h3> These are the list of items based on your keyword</h3>
	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String entity = request.getParameter("search");
		System.out.println(entity);
		
		String str = "SELECT * FROM product WHERE category LIKE '%" + entity+ "%' or brand LIKE '%" +entity + "%' or color LIKE '%" +entity + "%' or gender LIKE '%" +entity +  "%'" ;
		ResultSet rs = stmt.executeQuery(str);
		
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>");
		out.print("Product ID");
		out.print("</td>");
		out.print("<td>");
		out.print("Category");
		out.print("</td>");
		out.print("<td>");
		out.print("Brand");
		out.print("</td>");
		out.print("<td>");
		out.print("Color");
		out.print("</td>");
		out.print("<td>");
		out.print("Gender");
		out.print("</td>");
		out.print("</tr>");

		while (rs.next()) {

			out.print("<tr>");
			out.print("<td>");
			out.print(rs.getInt("product_id"));
			out.print("</td>");
			out.print("<td>");
			out.print(rs.getString("category"));
			out.print("</td>");

			out.print("<td>");
			out.print(rs.getString("brand"));
			out.print("</td>");

			out.print("<td>");
			out.print(rs.getString("color"));
			out.print("</td>");

			out.print("<td>");
			out.print(rs.getString("gender"));
			out.print("</td>");
			
			out.print("<td>");
			out.print("<form action='createAlertProduct.jsp' method='post'><button name='product_id' type='submit' value='"
			+ rs.getInt("product_id") + "'> Alert Me! </button></form>");
			out.print("</td>");
			
			out.print("</tr>");
		}

		out.print("</table>");
		con.close();

	} catch (Exception e) {
	}
	%>

</body>
</html>
