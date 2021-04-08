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
<title>Earning Per End User</title>
</head>
<body>
<% 			
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
//Create a SQL statement
Statement stmt = con.createStatement();
PreparedStatement ps = null;
ResultSet result = null;
try 
{
	
out.print("<b>Earning per End-User: </b>");
	
	/* String str = "SELECT username, SUM(amount) " +
			"FROM Items LEFT JOIN Auction using (item_id) " +
			"LEFT JOIN Bids using (auction_id) WHERE buyer IS NOT NULL and winner <> 'none' and (auction_id,amount) " + 
			"IN (select auction_id,max(amount) FROM Auction JOIN " +
			"Bids using (auction_id) group by auction_id) GROUP BY username"; */
	String str = "select a.seller,sum(w.amount) as sum_amount as earning from auction a,winner w where "+
				"a.auction_id=w.auction_id " +
				"group by a.seller";
	result = stmt.executeQuery(str);
	out.print("<table>");
	//make a row
	out.print("<tr>");
	out.print("<th>");
	out.print("User");
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
		out.print("$" + result.getString("sum_amount"));
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