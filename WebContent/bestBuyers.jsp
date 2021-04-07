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
//Create a SQL statement
Statement stmt = con.createStatement();
PreparedStatement ps = null;
ResultSet result = null;
try 
{
	
	out.print("<b>Best Buyer: </b>");
	//String str = "SELECT buyer FROM " +
		//	"(SELECT *, SUM(amount)FROM (select * from Auction Join Bids using (auction_id) " +
		//		"WHERE (auction_id,amount) IN (select auction_id,max(amount) FROM Auction JOIN " +
		//		"Bids using (auction_id) group by auction_id))t1 " + 
		//	    "GROUP BY buyer, winner ORDER BY SUM(amount) DESC) t2 WHERE buyer IS NOT NULL and winner <> 'None' and winner IS NOT NULL  LIMIT 1";
	String str= "SELECT sum(w.amount), w.username as buyer" +
				"FROM winners w" +
				"GROUP BY w.username" +
				"order by w.amount desc limit 5";
			
	result = stmt.executeQuery(str);
	while(result.next())
	{
		out.print(result.getString("buyer"));
	}
	out.print("<br/>");
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