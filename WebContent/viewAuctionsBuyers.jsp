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
<title>Search result: buyer</title>
</head>
<body>

	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	ResultSet result = null;

	try {

		String username = request.getParameter("username");
		String str = "select b.auction_id,b.amount, a.product_id from bid b,auction a WHERE (b.username ='" + username
		+ "' and b.auction_id=a.auction_id";
		result = stmt.executeQuery(str);
		out.print("<table>");
		out.print("<tr>");
		out.print("<th>");
		out.print("Auction ID");
		out.print("</th>");
		out.print("<th>");
		out.print("Item ID");
		out.print("</th>");
		out.print("<th>");
		out.print("Amount bid");
		out.print("</th>");
		out.print("</tr>");

		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getInt("auction_id"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getInt("product_id"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getFloat("amount"));
			out.print("</td>");

			out.print("</tr>");
		}

		out.print("</table>");

	}

	catch (Exception e) {
		out.print(e);
	} finally {
		if (result != null)
			result.close();
		if (stmt != null)
			stmt.close();
		if (con != null)
			con.close();
	}
	%>

</body>