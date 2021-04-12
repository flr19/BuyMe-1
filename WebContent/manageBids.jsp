<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Bids</title>
</head>
<body>
<% 
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();
Statement stmt = con.createStatement();
ResultSet result = null;
PreparedStatement ps = null;
try 
{
	String viewBid = "SELECT * FROM bid WHERE buyer IS NOT NULL";
	ps = con.prepareStatement(viewBid);
	result = ps.executeQuery();
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<th>");
	out.print("Bid ID ");
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
		out.print(result.getString("bid_id"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("buyer"));
		out.print("</td>");
		
		out.print("<td>");
		out.print("$" + result.getString("amount"));
		out.print("</td>");
		out.print("</tr>");
		
		out.print("<td>");
		out.print("<form action='removeBids.jsp' method='post'><button name='bid_id' type='submit' value='" + result.getString("bid_id") + "'>Remove Bid</button></form>");
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
	if (ps != null) ps.close();
	if (stmt != null) stmt.close();
	if (con != null) con.close();
}%>

</body>
</html>