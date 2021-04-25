<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Show All Watches</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<body>

	<button onclick="window.location.href='account.jsp';">Return to account dashboard</button>
<h3> List of all available watches.</h3>
	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String str = "select * from product;";
		ResultSet result = null;
		result = stmt.executeQuery(str);

		out.print("<table>");
		out.print("<tr>");
		out.print("<th>");
		out.print("Product ID ");
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
		out.print(" ");
		out.print("</th>");
		out.print("</tr>");

		while (result.next()) {
			out.print("<tr>");
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
			out.print(result.getString("seller"));
			out.print("</td>");
			
			
			if(result.getString("seller").equalsIgnoreCase(session.getAttribute("user").toString()))
			{
			
			out.print("<td>");
			out.print("<form action='createAuction.jsp' method='post'><button name='product_id' type='submit' value='"
			+ result.getInt("product_id") + "'>Create Auction</button></form>");
			out.print("</td>");
			}
			
			else{
			out.print("<td>");
			out.print("<form action='createAlertProduct.jsp' method='post'><button name='product_id' type='submit' value='"
			+ result.getInt("product_id") + "'> Alert Me! </button></form>");
			out.print("</td>");
			}
			

			out.print("</tr>");
		}
		out.print("</table>");

		con.close();

	} catch (Exception e) {
	}
	%>

</body>
</html>