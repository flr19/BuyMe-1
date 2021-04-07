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
<title>Search result: Seller  </title>
</head>
<body>

	<% 
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	//Create a SQL statement
	Statement stmt = con.createStatement();
	ResultSet result = null;
	
	try {
		
			String username = request.getParameter("username1");
			//query 
			String str = "Select seller,start_date,end_date, auction_id, status from  auction  Where ( seller ='" + username + "')";
			
			//Run the query against the database.
			result = stmt.executeQuery(str);
			
			//Make an HTML table to show the results in:
			out.print("<table>");
			
			//make a row
			out.print("<tr>");	
			out.print("<th>");
			out.print("Username");
			out.print("</th>");	
			out.print("<th>");
			out.print("Start Date");
			out.print("</th>");	
			out.print("<th>");
			out.print("End Date");
			out.print("</th>");
			
			out.print("<th>");
			out.print("Auction ID");
			out.print("</th>");
			
		out.print("<th>");
			out.print("status");
			out.print("</th>"); 
			out.print("</tr>");
			
			while (result.next()) 
			{
				out.print("<tr>");
				out.print("<td>");
				out.print(result.getString("seller"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("start_date"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("end_date"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("auction_id"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("status"));
				out.print("</td>");
				out.print("</tr>");
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
