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
	<!-- <a href="askQuestion.jsp">Return to questions dashboard.</a> -->
	<h3>Search Items</h3>
	<form>
      <input type="text" name="search" placeholder="question">
      <button type="submit">Search</button>
    </form>
   
<% 	try{
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
		
	//Create a SQL statement
	Statement stmt = con.createStatement();
	//Get the selected radio button from the index.jsp
	String entity = request.getParameter("search");
	//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
	String str = "SELECT category, brand, color, gender, seller where category like '%"+entity+"%' or brand like '%"+entity+"% or color like '%"+entity+"% or gender like '%"+entity+"%";
	//Run the query against the database.
	
	ResultSet rs = stmt.executeQuery(str);
	 //Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Product");
			out.print("</td>");
			
			out.print("<td>");
			//print out column header
			out.print("Sold or not");
			out.print("</td>");
			
			out.print("<td>");
			//print out column header
			out.print("Current Bid");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("User with Current Bid");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (rs.next()) {
				
				
				out.print("<tr>");
				out.print("<td>");
				out.print(rs.getString("product_id"));
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
		
			   
//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>>