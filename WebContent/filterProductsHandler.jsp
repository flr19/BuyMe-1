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
	System.out.println("print");
	ArrayList<Object> parameters = new ArrayList();
	
	try {
		String categoryv, brandv,colorv, genderv, sellerv, statusv;
		//float pricev = 0;
		
		if(!request.getParameter("category").isEmpty())
		{
			categoryv = request.getParameter("category");
			parameters.add(categoryv);
		}
		else 
		{
			categoryv = null;
		} 
		
		if(!request.getParameter("brand").isEmpty())
		{
			brandv = request.getParameter("brand");
			parameters.add(brandv);
		}
		else 
		{
			brandv = null;
		} 
		
		if(!request.getParameter("color").isEmpty())
		{
			colorv= request.getParameter("color");
			parameters.add(colorv);
		}
		else 
		{
			colorv = null;
		} 
		if(!request.getParameter("gender").isEmpty())
		{
			genderv= request.getParameter("gender");
			parameters.add(genderv);
		}
		else 
		{
			genderv = null;
		}
		
		if(request.getParameter("status").isEmpty() || request.getParameter("status").equals("both"))
		{
			statusv = null;
			
		}
		else 
		{
			statusv = request.getParameter("status");
			parameters.add(statusv);
		} 
		
		if(!request.getParameter("seller").isEmpty())
		{
			sellerv= request.getParameter("seller");
			parameters.add(sellerv);
		}
		else 
		{
			sellerv= null;
		}
		String priceParameter = request.getParameter("price");
		if(priceParameter.isEmpty())
		{
			priceParameter = "0";
		}
		else
		{
			Float price = Float.parseFloat(priceParameter);
			parameters.add(price);
		}

		System.out.println("print1");
		for(Object object: parameters) {
		    System.out.println(object);
		    System.out.println("araay");// Will invoke overrided `toString()` method
		}
		StringBuilder query = new StringBuilder("SELECT * FROM product JOIN auction on product.product_id=auction.auction_id WHERE ");
		if (!request.getParameter("category").isEmpty()) {
		    query.append(" category = ?");
		}
		if (!request.getParameter("brand").isEmpty()) {
		    query.append(" AND brand = ?");
		}
		if (!request.getParameter("color").isEmpty()) {
		    query.append(" AND color = ?");
		}
		if (!request.getParameter("gender").isEmpty()) {
		    query.append(" AND gender = ?");
		}
		if (!request.getParameter("status").isEmpty() && !request.getParameter("status").equals("both")) {
		    query.append(" AND status = ?");
		}
		if (!request.getParameter("seller").isEmpty()) {
		    query.append(" AND seller = ?");
		}
		if (!request.getParameter("price").isEmpty()) {
		    query.append(" AND price < ?");
		}
		String realQuery = query.toString();
		stmt = con.prepareStatement(realQuery);
		System.out.println("reached");
		System.out.println(realQuery);
		PreparedStatement ps3 = null;
		ps3 = con.prepareStatement(realQuery);
		int i = 1;
		for (Object parameter : parameters) {
		    ps3.setObject(i++, parameter);
		}
		//I LOVE ME
		
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itsel
		//Run the query against the DB
		result=ps3.executeQuery();
		// FIX THIS KUHUUU
		
		//append the parameters
		
		//execute the dynamic query
		
	
		/*System.out.println(categoryv);
		brandv = request.getParameter("brand");
		colorv = request.getParameter("color");
		genderv = request.getParameter("gender");
		//pricev = Float.parseFloat(request.getParameter("price"));
		sellerv = request.getParameter("seller");
		statusv = request.getParameter("status");
		System.out.println(statusv);
		System.out.println("print2"); */
		
		//String str = "select *"
		//+ "from product p,auction a WHERE p.product_id = a.product_id and (p.category=? or p.brand=? or p.color=? or p.gender=?"
		//+ "or a.price=? or a.seller=? or a.status=?)";
		

		//PreparedStatement ps = con.prepareStatement(str);
		/* ps.setString(1, categoryv);
		ps.setString(2, brandv);
		ps.setString(3, colorv);
		ps.setString(4, genderv);
		ps.setFloat(5, pricev);
		ps.setString(6, sellerv);
		ps.setString(7, statusv);
		result = ps.executeQuery(); */

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