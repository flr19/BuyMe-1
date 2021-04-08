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
<title>Earning Per Item Type</title>
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
	
	out.print("<b>Earning per Item Type: </b>");
	
	/* String str = "SELECT type, SUM(amount) FROM Items " +
	"LEFT JOIN Auction using (item_id) " +
	"LEFT JOIN Bids using (auction_id) " +
	"WHERE (auction_id,amount) IN (select auction_id,max(amount) " + 
	"FROM Auction JOIN Bids using (auction_id) " +
	"group by auction_id) and buyer IS NOT NULL and winner <> 'none' GROUP BY type"; */
	String str = "select p.category, sum(w.amount) as earningPerItemType from products p, winner w, auction a where a.auction_id = w.auction_id and p.product_id and a.product_id" + 
			"group by p.category";
	result = stmt.executeQuery(str);
	out.print("<table>");
	//make a row
	out.print("<tr>");
	out.print("<th>");
	out.print("Category");
	out.print("</th>");		
	
	out.print("<th>");
	out.print("Total Sales");
	out.print("</th>");
	out.print("</tr>");
	
	while (result.next()) 
	{
		out.print("<td>");
		out.print(result.getString("category"));
		out.print("</td>");
		out.print("<td>");
		out.print("$" + result.getString("earningPerItemType"));
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