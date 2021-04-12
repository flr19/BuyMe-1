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
<title>search the list of items by various criteria</title>
</head>
<body>

	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	ResultSet result = null;
	try {
		String categoryv, brandv,colorv, genderv, seller, status;
		float pricev = 0;
		if(!request.getParameter("category").isEmpty())
		{
		categoryv = request.getParameter("category");
		}
		else 
		{
			categoryv = null;
		} 
		
		if(!request.getParameter("brand").isEmpty())
		{
		brandv = request.getParameter("brand");
		}
		else 
		{
			brandv = null;
		} 
		
		if(!request.getParameter("color").isEmpty())
		{
		colorv= request.getParameter("color");
		}
		else 
		{
			colorv = null;
		} 
		
		if(!request.getParameter("price").isEmpty())
		{
		categoryv = request.getParameter("category");
		} 
		else 
		{
			categoryv = null;
		} 
		
		if(!request.getParameter("category").isEmpty())
		{
		categoryv = request.getParameter("category");
		}
		else 
		{
			categoryv = null;
		} 
		
		brandv = request.getParameter("brand");
		colorv = request.getParameter("color");
		genderv = request.getParameter("gender");
		pricev = Float.parseFloat(request.getParameter("price"));
		seller = request.getParameter("seller");
		status = request.getParameter("status");
		String str = "select *"
		+ "from product p,auction a WHERE p.product_id = a.product_id and (p.category=? or p.brand=? or p.color=? or p.gender=?"
		+ "or a.price=? or a.seller=? or a.status=?)";

		PreparedStatement ps = con.prepareStatement(str);
		ps.setString(1, categoryv);
		ps.setString(2, brandv);
		ps.setString(3, colorv);
		ps.setString(4, genderv);
		ps.setFloat(5, pricev);
		ps.setString(6, seller);
		ps.setString(7, status);
		result = ps.executeQuery();

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