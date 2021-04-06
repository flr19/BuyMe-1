<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
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
</style>
<meta charset="ISO-8859-1">
<title>Generate Report</title>
</head>
<body>
<% 			
String url = "jdbc:mysql://cs336db.ceppltipnhmk.us-east-1.rds.amazonaws.com:3306/cs336Project";
//Load JDBC driver
Class.forName("com.mysql.jdbc.Driver");
//Get the database connection
Connection con = DriverManager.getConnection(url, "cs336", "gamer5221");
//Create a SQL statement
Statement stmt = con.createStatement();
PreparedStatement ps = null;
ResultSet result = null;
try 
{
	out.print("<b>Total earnings: </b>");
	String str = "SELECT SUM(amount) FROM (select * " +
			"from Auction Join Bids using (auction_id) " + 
			"WHERE (auction_id,amount) IN (select auction_id,max(amount) " +
			"FROM Auction JOIN Bids using (auction_id) group by auction_id))t1 " +
			"WHERE buyer IS NOT NULL and winner <> 'None' and winner IS NOT NULL "; 
	result = stmt.executeQuery(str);
	while(result.next())
	{
		out.print(result.getString("SUM(amount)"));
	}
	out.print("<br/>");
	
	out.print("<b>Best Buyer: </b>");
	str = "SELECT buyer FROM " +
			"(SELECT *, SUM(amount)FROM (select * from Auction Join Bids using (auction_id) " +
				"WHERE (auction_id,amount) IN (select auction_id,max(amount) FROM Auction JOIN " +
				"Bids using (auction_id) group by auction_id))t1 " + 
			    "GROUP BY buyer, winner ORDER BY SUM(amount) DESC) t2 WHERE buyer IS NOT NULL and winner <> 'None' and winner IS NOT NULL  LIMIT 1";
	result = stmt.executeQuery(str);
	while(result.next())
	{
		out.print(result.getString("buyer"));
	}
	out.print("<br/>");
	out.print("<br/>");
	out.print("<b>Earning per Item: </b>");
	
	str = "SELECT maker, type, model, SUM(amount) " +
			"FROM Items LEFT JOIN Auction using (item_id) " + 
			"LEFT JOIN Bids using (auction_id) " +
			"WHERE buyer IS NOT NULL and winner <> 'none' and (auction_id,amount) IN (select auction_id,max(amount) " + 
			"FROM Auction JOIN Bids using (auction_id) " +
			"group by auction_id) GROUP BY maker, type, model";
	result = stmt.executeQuery(str);
	out.print("<table>");
	//make a row
	out.print("<tr>");
	out.print("<th>");
	out.print("Type ");
	out.print("</th>");		
	out.print("<th>");
	out.print("Manufac.");
	out.print("</th>");	
	out.print("<th>");
	out.print("Model");
	out.print("</th>");
	
	out.print("<th>");
	out.print("Total Sales");
	out.print("</th>");
	out.print("</tr>");
	
	while (result.next()) 
	{
		out.print("<td>");
		out.print(result.getString("type"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("maker"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("model"));
		out.print("</td>");
		
		out.print("<td>");
		out.print("$" + result.getString("SUM(amount)"));
		out.print("</td>");
		out.print("</tr>");
	}
	out.print("</table>");	
	out.print("<br/>");
	
	out.print("<b>Earning per Item Type: </b>");
	
	str = "SELECT type, SUM(amount) FROM Items " +
	"LEFT JOIN Auction using (item_id) " +
	"LEFT JOIN Bids using (auction_id) " +
	"WHERE (auction_id,amount) IN (select auction_id,max(amount) " + 
	"FROM Auction JOIN Bids using (auction_id) " +
	"group by auction_id) and buyer IS NOT NULL and winner <> 'none' GROUP BY type";
	result = stmt.executeQuery(str);
	out.print("<table>");
	//make a row
	out.print("<tr>");
	out.print("<th>");
	out.print("Type ");
	out.print("</th>");		
	
	out.print("<th>");
	out.print("Total Sales");
	out.print("</th>");
	out.print("</tr>");
	
	while (result.next()) 
	{
		out.print("<td>");
		out.print(result.getString("type"));
		out.print("</td>");
		out.print("<td>");
		out.print("$" + result.getString("SUM(amount)"));
		out.print("</td>");
		out.print("</tr>");
	}
	out.print("</table>");	
	out.print("<br/>");
	
out.print("<b>Earning per End-User: </b>");
	
	str = "SELECT username, SUM(amount) " +
			"FROM Items LEFT JOIN Auction using (item_id) " +
			"LEFT JOIN Bids using (auction_id) WHERE buyer IS NOT NULL and winner <> 'none' and (auction_id,amount) " + 
			"IN (select auction_id,max(amount) FROM Auction JOIN " +
			"Bids using (auction_id) group by auction_id) GROUP BY username";
	result = stmt.executeQuery(str);
	out.print("<table>");
	//make a row
	out.print("<tr>");
	out.print("<th>");
	out.print("User ");
	out.print("</th>");		
	
	out.print("<th>");
	out.print("Total Sales");
	out.print("</th>");
	out.print("</tr>");
	
	while (result.next()) 
	{
		out.print("<td>");
		out.print(result.getString("username"));
		out.print("</td>");
		out.print("<td>");
		out.print("$" + result.getString("SUM(amount)"));
		out.print("</td>");
		out.print("</tr>");
	}
	out.print("</table>");	
	out.print("<br/>");
	
	out.print("<b>Top 5 Selling Items: </b>");
	
	str = "SELECT maker, type, model ,COUNT(*)FROM " +
		  "(SELECT maker, type, model FROM Items LEFT JOIN Auction using (item_id) " + 
		  "LEFT JOIN Bids using (auction_id) WHERE buyer IS NOT NULL and winner <> 'none' and (auction_id,amount) " + 
		  "IN (select auction_id,max(amount) FROM Auction JOIN " + 
		  "Bids using (auction_id) group by auction_id) )t2 " +
		  "GROUP BY maker, type, model ORDER BY COUNT(*) DESC LIMIT 5";
	result = stmt.executeQuery(str);
	
	out.print("<table>");
	//make a row
	out.print("<tr>");
	out.print("<th>");
	out.print("Type ");
	out.print("</th>");		
	
	out.print("<th>");
	out.print("Manufac.");
	out.print("</th>");
	
	out.print("<th>");
	out.print("Model");
	out.print("</th>");
	
	out.print("<th>");
	out.print("# Sold");
	out.print("</th>");
	out.print("</tr>");
	
	
	while (result.next()) 
	{
		out.print("<td>");
		out.print(result.getString("type"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("maker"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("model"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("COUNT(*)"));
		out.print("</td>");
		out.print("</tr>");
	}
	out.print("</table>");	
	out.print("<br/>");
}		
catch (Exception e) 
{
		out.print(e);
}
finally
{
	if (result != null) result.close();
	if (ps != null) ps.close();
	if (stmt != null) stmt.close();
	if (con != null) con.close();
}%>


</body>
</html>