<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<!-- <style>
/* #buttons{
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
} */
</style> -->
<meta charset="ISO-8859-1">
<title>Sort Auctions</title>
</head>
<body>
	<div id="buttons">
		<form action='sortAuctionsHandler.jsp'>
			<input name="sortAuctions" type="radio" value="Sort by Auction ID"
				checked /> Sort by Auction ID<br> <input name="sortAuctions"
				type="radio" value="Sort by Category" />Sort by Category<br> <input
				name="sortAuctions" type="radio" value="Sort by Brand" /> Sort by
			Brand<br> <input name="sortAuctions" type="radio"
				value="Sort by Gender" /> Sort by Gender <br>
			<input name="sortAuctions" type="radio" value="Sort by Color" />
			Sort by Color<br>
			<input name="sortAuctions" type="radio" value="Sort by Price" />Sort
			by Price<br>
			<input name="sortAuctions" type="radio" value="Sort by End Time" />
			Sort by End Time <input type="submit" value="Submit" />
		</form>
	</div>
	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	String seller = session.getAttribute("user").toString();
	ResultSet result = null;
	try {
		String str = "select * from auction join product using (product_id) order by (auction_id);";
		result = stmt.executeQuery(str);
			
		out.print("<table>");
		out.print("<tr>");
		out.print("<th>");
		out.print("Auction ID ");
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
		out.print("Seller");
		out.print("</th>");

		out.print("<th>");
		out.print("Current Bid");
		out.print("</th>");

		out.print("<th>");
		out.print("Price");
		out.print("</th>");

		out.print("<th>");
		out.print("End Time");
		out.print("</th>");
			
		/* if(result.next())
		{
		String status = result.getString("status");
		if (status.equals("close")) { */
			out.print("<th>");
			out.print("Winner");
			out.print("</th>");
		/* }
		}
 */
		out.print("<th>");
		out.print("Status");
		out.print("</th>");
		
/* 		result.beforeFirst(); */
		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getInt("auction_id"));
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
			out.print(result.getString("seller"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getFloat("current_bid"));
			out.print("</td>");

			out.print("<td>");
			out.print("$" + result.getFloat("price"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getTimestamp("end_date"));
			out.print("</td>");

			String status1 = result.getString("status");
			if (status1.equals("close")) {
		out.print("<td>");
		out.print(result.getString("winner"));
		out.print("</td>");
			}
			else
			{
				out.print("<td>");
				out.print(" ");
				out.print("</td>");
			}

			out.print("<td>");
			out.print(result.getString("status"));
			out.print("</td>");

			if (!status1.equals("close") && result.getString("seller").equals(seller) == false)
			{
		out.print("<td>");
		out.print("<form action='bidOnItem.jsp' method='post'><button name='auction_id' type='submit' value='"
				+ result.getInt("auction_id") + "'> Bid on Item </button></form>");
		out.print("</td>");
			}

			out.print("<td>");
			out.print("<form action='bidHistory.jsp' method='post'><button name='auction_id' type='submit' value='"
			+ result.getInt("auction_id") + "'> View Bid History </button></form>");
			out.print("</td>");

			out.print("<td>");
			out.print("<form action='viewSimilarItems.jsp' method='post'><button name='auction_id' type='submit' value='"
			+ result.getInt("auction_id") + "'> View Similar Items </button></form>");
			out.print("</td>");

			out.print("</tr>");
		}
		out.print("</table>");
	} catch (Exception e) {
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
</html>

