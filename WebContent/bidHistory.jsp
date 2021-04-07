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
<title>Bid History</title>
</head>
<body>
<% 
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
//Create a SQL statement
Statement stmt = con.createStatement();
ResultSet result = null;
PreparedStatement ps = null;
/* if(session.getAttribute("ACCOUNT_TYPE").equals("seller"))
{
	out.print("Logged in as: Seller");
	out.print("<br/>");
	out.print("Username: " +  session.getAttribute("USERNAME"));
	out.print("<br/>");
}
if(session.getAttribute("ACCOUNT_TYPE").equals("buyer"))
{
	out.print("Logged in as: Buyer");
	out.print("<br/>");
	out.print("Username: " +  session.getAttribute("USERNAME"));
	out.print("<br/>");
} */
try 
{
	String newAuction = (String)session.getAttribute("auction_id");
	String viewBid = "SELECT * FROM bids WHERE auction_id = ? ORDER BY amount asc";
	ps = con.prepareStatement(viewBid);
	ps.setString(1, newAuction);
	result = ps.executeQuery();
	out.print("<table>");
	out.print("<tr>");
	out.print("<th>");
	out.print("Auction ID ");
	out.print("</th>");		
	out.print("<th>");
	out.print("Buyer");
	out.print("</th>");	
	out.print("<th>");
	out.print("Amount");
	out.print("</th>");	
	out.print("</tr>");
	
	while (result.next()) 
	{
		out.print("<tr>");
		out.print("<td>");
		out.print(result.getString("auction_id"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("username"));
		out.print("</td>");
		
		out.print("<td>");
		out.print("$" + result.getString("amount"));
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
	if (ps != null) ps.close();
	if (stmt != null) stmt.close();
	if (con != null) con.close();
}%>


</body>
</html>
