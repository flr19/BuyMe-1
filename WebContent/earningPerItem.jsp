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
<title>Earning Per Item</title>
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
	out.print("<b>Earning per Item: </b>");

	String str = "SELECT p.product_id, p.brand, p.category, p.color, p.gender, sum(a.current_bid) FROM product p, auction a WHERE p.product_id=a.product_id and a.status = 'close' and a.current_bid >= a.min_price group by p.brand, p.category, p.gender, p.color";
	
	result = stmt.executeQuery(str);
	out.print("<table>");
	//make a row
	out.print("<tr>");
	out.print("<th>");
	out.print("Product ID");
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
	out.print("	Earning Per Item");
	out.print("</th>");
	out.print("</tr>");
	
	while (result.next()) 
	{	
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
		out.print("$" + result.getFloat("sum(a.current_bid)"));
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