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
<title>Search result </title>
</head>
<body>

	<% 
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	//Create a SQL statement
	Statement stmt = con.createStatement();
	ResultSet result = null;
	try {
			String categoryv= request.getParameter("category");
			String brandv= request.getParameter("brand");
			String colorv= request.getParameter("color");
			String genderv = request.getParameter("gender");
			String pricev=request.getParameter("price");
/* 			String auctionID= request.getParameter("auctionID");
 */			//query 
			String str = "Select category, brand, color, gender, price from product WHERE (category ='" + categoryv + "') or (brand ='" + brandv + "') or (color ='" + colorv + "') or  (gender = '" + genderv + "') or (price ='" + pricev  + "') ;";
			//Run the query against the database.
			 result = stmt.executeQuery(str);
			
			//Make an HTML table to show the results in:
			out.print("<table>");
			//make a row
			out.print("<tr>");	
			out.print("<th>");
			out.print("category");
			out.print("</th>");	
			out.print("<th>");
			out.print("brand");
			out.print("</th>");	
			out.print("<th>");
			out.print("color");
			out.print("</th>");
			out.print("<th>");
			out.print("gender");
			out.print("</th>");
			out.print("<th>");
			out.print("price");
			out.print("</th>");
			/* out.print("<th>");
			out.print("Auction_ID");
			out.print("</th>"); */
			
			while (result.next()) 
			{
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
				out.print(result.getString("price"));
				out.print("</td>");
				
			}
			
			out.print("</table>");	
			
			
		} 
		
			
	catch (Exception e) 
	{
			out.print(e);
	}
	finally
	{
		if (result != null) result.close();
		if (stmt != null) stmt.close();
		if (con != null) con.close();
	}%>

</body>
</html>