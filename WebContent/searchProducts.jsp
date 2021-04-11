<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Products</title>
</head>
<body>
	<h3>Search Items</h3>
	<form>
		<input type="text" name="search" placeholder="question">
		<button type="submit">Search</button>
	</form>

	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String entity = request.getParameter("search");
		String str = "SELECT category, brand, color, gender, seller where category like '%" + entity + "%' or brand like '%"
		+ entity + "% or color like '%" + entity + "% or gender like '%" + entity + "%";
		ResultSet rs = stmt.executeQuery(str);
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>");
		out.print("Product ID");
		out.print("</td>");
		out.print("<td>");
		out.print("Catgory");
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

		}

		out.print("</table>");
		con.close();

	} catch (Exception e) {
	}
	%>

</body>
</html>
>
