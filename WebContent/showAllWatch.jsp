<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Show  All Watches</title>
</head>
<body>
	<a href="account.jsp">Return to dashboard.</a>
   
<% 	try{
	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
    Statement stmt = con.createStatement();
		
	//Create a SQL statement
		String str = "select * from product;";
        ResultSet result = null;
					
			//Run the query against the database.
			 result = stmt.executeQuery(str);
			
			//Make an HTML table to show the results in:
			out.print("<table>");
			//make a row			
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
			out.print(" ");
			out.print("</th>");
			out.print("</tr>");
			
			while (result.next()) 
			{
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
				out.print("<form action='createAuction.jsp' method='post'><button name='product_id' type='submit' value='" + result.getInt("product_id") + "'>Create Auction</button></form>");
				out.print("</td>"); 
				out.print("</tr>");
			}
			out.print("</table>");
		
			   
//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>