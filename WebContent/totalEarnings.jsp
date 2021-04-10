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
<title>Generate Report</title>
</head>
<body>
<% 			
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();
PreparedStatement ps = null;
ResultSet result = null;
try 
{
	out.print("<b>Total earnings: </b>");
	/* String str = "SELECT SUM(amount) FROM (select * " +
			"from Auction Join Bids using (auction_id) " + 
			"WHERE (auction_id,amount) IN (select auction_id,max(amount) " +
			"FROM Auction JOIN Bids using (auction_id) group by auction_id))t1 " +
			"WHERE buyer IS NOT NULL and winner <> 'None' and winner IS NOT NULL ";  */
/* 	String str = "select sum(b.amount) from bids b, product p where p.product_id = b.product_id and p.winner not null and b.amount = (select max(price) from pr);";
 */	
/* String str_bid = "update auction a set a.winner =  (select b.username from bids b, auction a where b.amount = (select max(amount) from bids) and a.auction_id = b.auction_id); ";
 */ 
 String str = "select sum(amount) as total_earnings from winner";	
 result = stmt.executeQuery(str);
	while(result.next())
	{
		out.print(result.getFloat("total_earnings"));
	}
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